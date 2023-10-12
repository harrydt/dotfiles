local M = {}

-------------------- HELPERS --------------------

M.root_patterns = { ".git", "lua" }
function M.get_clients(...)
  local fn = vim.lsp.get_clients or vim.lsp.get_active_clients
  return fn(...)
end

-- Local files

-- mappings wrapper, extracted from
-- https://github.com/ojroques/dotfiles/blob/master/nvim/init.lua#L8-L12
M.map = function(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- For autocommands, extracted from
-- https://github.com/norcalli/nvim_utils
M.create_augroups = function(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command("augroup END")
	end
end

-- Check if string is empty or if it's nil
-- @return bool
M.is_empty = function(str)
	return str == "" or str == nil
end

-- Search if a table have the value we are looking for,
-- useful for plugins management
M.has_value = function(tabl, val)
	for _, value in ipairs(tabl) do
		if value == val then
			return true
		end
	end

	return false
end

-- Get current OS, returns 'Other' if the current OS is not recognized
M.get_os = function()
	--[[
	--	 Target OS names:
	--	 	- Windows
	--	 	- Linux
	--	 	- OSX
	--	 	- BSD
	--	 	- POSIX
	--	 	- Other
	--]]
	-- We make use of JIT because LuaJIT is bundled in Neovim
	return jit.os
end

-- read_file returns the content of the given file
-- @tparam string path The path of the file
-- @return string
M.read_file = function(path)
	local fd = vim.loop.fs_open(path, "r", 438)
	local stat = vim.loop.fs_fstat(fd)
	local data = vim.loop.fs_read(fd, stat.size, 0)
	vim.loop.fs_close(fd)

	return data
end

-- write_file writes the given string into given file
-- @tparam string path The path of the file
-- @tparam string content The content to be written in the file
-- @tparam string mode The mode for opening the file, e.g. 'w+'
M.write_file = function(path, content, mode)
	-- 644 sets read and write permissions for the owner, and it sets read-only
	-- mode for the group and others.
	vim.loop.fs_open(path, mode, tonumber("644", 8), function(err, fd)
		if not err then
			local fpipe = vim.loop.new_pipe(false)
			vim.loop.pipe_open(fpipe, fd)
			vim.loop.write(fpipe, content)
		end
	end)
end

-- Os
M.os = {
	home = os.getenv("HOME"),
	data = vim.fn.stdpath("data"),
	cache = vim.fn.stdpath("cache"),
	config = vim.fn.stdpath("config"),
	name = vim.loop.os_uname().sysname,
	is_git_dir = os.execute("git rev-parse --is-inside-work-tree >> /dev/null 2>&1"),
}
-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
function M.get_root()
	---@type string?
	local path = vim.api.nvim_buf_get_name(0)
	path = path ~= "" and vim.loop.fs_realpath(path) or nil
	---@type string[]
	local roots = {}
	if path then
		for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			local workspace = client.config.workspace_folders
			local paths = workspace
					and vim.tbl_map(function(ws)
						return vim.uri_to_fname(ws.uri)
					end, workspace)
				or client.config.root_dir and { client.config.root_dir }
				or {}
			for _, p in ipairs(paths) do
				local r = vim.loop.fs_realpath(p)
				if path:find(r, 1, true) then
					roots[#roots + 1] = r
				end
			end
		end
	end
	table.sort(roots, function(a, b)
		return #a > #b
	end)
	---@type string?
	local root = roots[1]
	if not root then
		path = path and vim.fs.dirname(path) or vim.loop.cwd()
		---@type string?
		root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
		root = root and vim.fs.dirname(root) or vim.loop.cwd()
	end
	---@cast root string
	return root
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

---@param plugin string
function M.has(plugin)
	return require("lazy.core.config").plugins[plugin] ~= nil
end

---@param name string
function M.opts(name)
	local plugin = require("lazy.core.config").plugins[name]
	if not plugin then
		return {}
	end
	local Plugin = require("lazy.core.plugin")
	return Plugin.values(plugin, "opts", false)
end

function M.lsp_get_config(server)
	local configs = require("lspconfig.configs")
	return rawget(configs, server)
end

return M
