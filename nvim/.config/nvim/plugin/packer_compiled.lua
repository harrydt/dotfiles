-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/harrydt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/harrydt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/harrydt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/harrydt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/harrydt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["cmd-parser.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/cmd-parser.nvim"
  },
  ["darkplus.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/darkplus.nvim"
  },
  ["format.nvim"] = {
    config = { "\27LJ\2\nN\0\1\5\1\1\0\4-\1\0\0'\3\0\0\18\4\0\0D\1\3\0\0¿9stylua --config-path ~/.config/stylua/stylua.toml %sN\0\1\5\1\1\0\4-\1\0\0'\3\0\0\18\4\0\0D\1\3\0\0¿9stylua --config-path ~/.config/stylua/stylua.toml %s$\0\1\5\1\1\0\4-\1\0\0'\3\0\0\18\4\0\0D\1\3\0\0¿\15yapf -i %s¢\t\1\0\b\0005\0n6\0\0\0009\0\1\0006\1\2\0'\3\1\0B\1\2\0029\1\3\0015\3\a\0004\4\3\0005\5\5\0005\6\4\0=\6\6\5>\5\1\4=\4\b\0034\4\3\0005\5\n\0004\6\3\0003\a\t\0>\a\1\6=\6\6\5>\5\1\4=\4\v\0034\4\3\0005\5\r\0005\6\f\0=\6\6\5>\5\1\4=\4\14\0034\4\3\0005\5\16\0004\6\3\0003\a\15\0>\a\1\6=\6\6\5>\5\1\4=\4\17\0034\4\3\0005\5\19\0004\6\3\0003\a\18\0>\a\1\6=\6\6\5>\5\1\4=\4\20\0034\4\3\0005\5\22\0005\6\21\0=\6\6\5>\5\1\4=\4\23\0034\4\3\0005\5\25\0005\6\24\0=\6\6\5>\5\1\4=\4\26\0034\4\3\0005\5\28\0005\6\27\0=\6\6\5>\5\1\4=\4\29\0034\4\3\0005\5\31\0005\6\30\0=\6\6\5>\5\1\4=\4 \0034\4\3\0005\5\"\0005\6!\0=\6\6\5>\5\1\0045\5$\0005\6#\0=\6\6\5>\5\2\4=\4%\0034\4\3\0005\5'\0005\6&\0=\6\6\5>\5\1\4=\4(\0034\4\3\0005\5*\0005\6)\0=\6\6\5>\5\1\4=\4+\0034\4\3\0005\5-\0005\6,\0=\6\6\5>\5\1\4=\4.\0034\4\3\0005\0050\0005\6/\0=\6\6\5>\5\1\4=\0041\0034\4\3\0005\0053\0005\0062\0=\6\6\5>\5\1\4=\0044\3B\1\2\0012\0\0ÄK\0\1\0\tyaml\1\0\0\1\2\0\0\30prettier -w --parser yaml\ttoml\1\0\0\1\2\0\0\30prettier -w --parser toml\tjson\1\0\0\1\2\0\0\30prettier -w --parser json\tscss\1\0\0\1\2\0\0\30prettier -w --parser scss\bcss\1\0\0\1\2\0\0\29prettier -w --parser css\rmarkdown\1\0\3\16end_pattern\n^```$\vtarget\fcurrent\18start_pattern\16^```python$\1\2\0\0\fyapf -i\1\0\0\1\2\0\0\"prettier -w --parser markdown\thtml\1\0\0\1\2\0\0\30prettier -w --parser html\15typescript\1\0\0\1\2\0\0$prettier -w --parser typescript\15javascript\1\0\0\1\3\0\0\16prettier -w%./node_modules/.bin/eslint --fix\ago\1\0\1\21tempfile_postfix\t.tmp\1\3\0\0\rgofmt -w\17goimports -w\vpython\1\0\0\0\blua\1\0\0\0\fvimwiki\1\0\2\16end_pattern\n^}}}$\18start_pattern\20^{{{javascript$\1\2\0\0\31prettier -w --parser babel\bvim\1\0\2\16end_pattern\n^EOF$\18start_pattern\17^lua << EOF$\0\6*\1\0\0\bcmd\1\0\0\1\2\0\0\24sed -i 's/[ \t]*$//'\nsetup\frequire\vformat\vstring\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/format.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n‡\4\0\0\5\1\r\0\0295\0\0\0006\1\1\0009\1\2\0019\1\3\1\a\1\4\0X\1\nÄ6\1\1\0009\1\5\0019\1\6\1\18\3\1\0009\1\a\1B\1\2\2\a\1\b\0X\1\2Ä5\0\t\0X\1\nÄ6\1\1\0009\1\2\0019\1\3\1\18\3\1\0009\1\n\1'\4\v\0B\1\3\2\15\0\1\0X\2\1Ä5\0\f\0-\1\0\0008\1\1\0L\1\2\0\0¿\1\0\n\bred\f#ea6962\vyellow\f#d8a657\afg\f#d4be98\tblue\f#7daea3\abg\f#32302f\fmagenta\f#d3869b\vorange\f#e78a4e\ngreen\f#a9b665\vfg_alt\f#ddc7a1\tcyan\f#89b482\fgruvbox\tfind\1\0\n\bred\f#e45649\vyellow\f#986801\afg\f#383a42\tblue\f#4078f2\abg\f#c6c7c7\fmagenta\f#a626a4\vorange\f#da8548\ngreen\f#50a14f\vfg_alt\f#9ca0a4\tcyan\f#0184bc\nlight\bget\15background\bopt\rdoom-one\16colors_name\6g\bvim\1\0\n\bred\f#ff6c6b\vyellow\f#ECBE7B\15section_bg\f#5B6268\afg\f#bbc2cf\tblue\f#51afef\abg\f#23272e\fmagenta\f#c678dd\vorange\f#da8548\ngreen\f#98be65\tcyan\f#46D9FF\20\1\1\2\0\1\0\0033\1\0\0002\0\0ÄL\1\2\0\0G\0\0\2\1\2\0\b-\0\0\0009\0\0\0B\0\1\2\a\0\1\0X\1\2Ä+\1\2\0L\1\2\0K\0\1\0\3¿\14DASHBOARD\24get_buffer_filetypeG\0\0\2\1\2\0\b-\0\0\0009\0\0\0B\0\1\2\6\0\1\0X\1\2Ä+\1\2\0L\1\2\0K\0\1\0\3¿\14DASHBOARD\24get_buffer_filetype\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t‚ñä Á\4\0\0\6\1#\0r5\0\1\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\2\0-\1\0\0'\3\3\0B\1\2\2B\1\1\2=\1\4\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\6\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\a\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\b\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\n\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\v\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\r\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\14\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\15\0-\1\0\0'\3\16\0B\1\2\2B\1\1\2=\1\17\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\18\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\19\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\20\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\21\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\23\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\24\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\25\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\26\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\27\0006\1\28\0009\1\29\0019\1\30\1'\3\31\0006\4\28\0009\4 \0049\4!\4B\4\1\0028\4\4\0&\3\4\3B\1\2\1'\1\"\0L\1\2\0\6¿\nÔåå  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\breds\0\0\a\0\b\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\0026\2\5\0009\2\6\2'\4\a\0\18\5\0\0\18\6\1\0D\2\4\0\16%3d : %2d  \vformat\vstring\bcol\6.\tline\afn\bvim“\1\0\0\6\1\v\0\31-\0\0\0009\0\0\0B\0\1\2\6\0\1\0X\0\rÄ'\0\2\0-\1\0\0009\1\0\1B\1\1\2\18\3\1\0009\1\3\1'\4\4\0006\5\5\0009\5\6\5B\1\4\2&\0\1\0L\0\2\0X\0\fÄ'\0\a\0006\1\b\0009\1\t\0019\1\n\1\18\3\1\0009\1\3\1'\4\4\0006\5\5\0009\5\6\5B\1\4\2&\0\1\0L\0\2\0K\0\1\0\2¿\rfiletype\abo\bvim\tÔêç \nupper\vstring\b^%l\tgsub\tÓòÅ \18No Active Lsp\19get_lsp_clientJ\0\0\2\1\2\0\n5\0\0\0-\1\0\0009\1\1\0018\1\1\0\15\0\1\0X\2\2Ä+\1\1\0L\1\2\0+\1\2\0L\1\2\0\0¿\rfiletype\1\0\2\14dashboard\2\5\2\21\0\0\1\0\1\0\2'\0\0\0L\0\2\0\n Ôû° \19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b   \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ‚ñä\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t‚ñä \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ‚ñä˝\26\1\0\16\0w\1ç\0046\0\0\0009\0\1\0006\1\2\0'\3\3\0B\1\2\0026\2\2\0'\4\4\0B\2\2\0026\3\2\0'\5\5\0B\3\2\0026\4\2\0'\6\6\0B\4\2\0029\5\a\0015\6\t\0=\6\b\0013\6\n\0003\a\v\0003\b\f\0009\t\r\0055\n\20\0005\v\15\0003\f\14\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v\21\n>\n\1\t9\t\r\0055\n\26\0005\v\23\0003\f\22\0=\f\16\v5\f\25\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v=\v\27\n>\n\2\t9\t\r\0055\n!\0005\v\28\0009\f\29\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v\"\n>\n\3\t9\t\r\0055\n&\0005\v#\0009\f\29\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v4\f\3\0006\r\2\0'\15$\0B\r\2\0029\r%\r>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v'\n>\n\4\t9\t\r\0055\n*\0005\v(\0009\f\29\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v5\f)\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v+\n>\n\5\t9\t\r\0055\n/\0005\v-\0003\f,\0=\f\16\v=\b\30\v4\f\3\0\18\r\6\0'\15.\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v0\n>\n\6\t9\t\r\0055\n2\0005\v1\0=\b\30\v4\f\3\0\18\r\6\0'\15.\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v3\n>\n\a\t9\t\r\0055\n5\0005\v4\0=\b\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v6\n>\n\b\t9\t\r\0055\n9\0005\v7\0=\b\30\v4\f\3\0\18\r\6\0'\0158\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v:\n>\n\t\t9\t\r\0055\n<\0005\v;\0=\b\30\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v=\n>\n\n\t9\t>\0055\nA\0005\v?\0009\f@\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vB\n>\n\1\t9\t>\0055\nD\0005\vC\0009\f@\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vE\n>\n\2\t9\t>\0055\nI\0005\vG\0003\fF\0=\f\16\v3\fH\0=\f\30\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vJ\n>\n\3\t9\t>\0055\nN\0005\vL\0003\fK\0=\f\16\v9\fM\4=\f\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vO\n>\n\4\t9\t>\0055\nS\0005\vP\0009\fM\4=\f\30\v5\fR\0\18\r\6\0'\15Q\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v=\vT\n>\n\5\t9\t>\0055\nW\0005\vV\0003\fU\0=\f\16\v=\b\30\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vX\n>\n\6\t9\t>\0055\nZ\0005\vY\0009\f@\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15Q\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v[\n>\n\a\t9\t>\0055\n]\0005\v\\\0009\f@\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\0158\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v^\n>\n\b\t9\t>\0055\n`\0005\v_\0009\f@\4\15\0\f\0X\r\1Ä\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\va\n>\n\t\t9\t>\0055\nd\0005\vc\0003\fb\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\ve\n>\n\v\t9\tf\0055\ni\0005\vh\0003\fg\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vj\n>\n\1\t9\tf\0055\nl\0005\vk\0=\b\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vm\n>\n\2\t9\tn\0055\nq\0005\vo\0=\b\30\v4\f\3\0\18\r\6\0'\15p\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vr\n>\n\1\t9\tn\0055\nu\0005\vt\0003\fs\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vv\n>\n\2\t2\0\0ÄK\0\1\0\22ShortRainbowRight\1\0\0\1\0\0\0\15BufferIcon\1\0\0\vyellow\1\0\1\rprovider\15BufferIcon\21short_line_right\15BufferType\1\0\0\1\0\1\rprovider\17FileTypeName\21ShortRainbowLeft\1\0\0\1\0\0\0\20short_line_left\17RainbowRight\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\rprovider\15DiffRemove\ticon\tÔëò \17DiffModified\1\0\0\1\0\2\rprovider\17DiffModified\ticon\tÔëô \fDiffAdd\1\0\0\1\0\2\rprovider\fDiffAdd\ticon\tÔëó \18DiffSeparator\1\0\0\1\0\0\0\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\ngreen\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\24check_git_workspace\1\0\1\14separator\6 \0\28ShowLspClientOrFileType\1\0\0\0\1\0\1\14separator\a  \0\15FileEncode\1\0\0\1\0\2\14separator\6 \rprovider\15FileEncode\15FileFormat\1\0\0\18hide_in_width\1\0\2\14separator\a  \rprovider\15FileFormat\nright\19DiagnosticInfo\1\0\0\1\0\2\rprovider\19DiagnosticInfo\ticon\bÔÅö\19DiagnosticWarn\1\0\0\vorange\1\0\2\rprovider\19DiagnosticWarn\ticon\bÔÅ±\20DiagnosticError\1\0\0\1\0\2\rprovider\20DiagnosticError\ticon\bÔÅó\16LinePercent\1\0\0\1\0\2\14separator\a  \rprovider\16LinePercent\rLineInfo\1\0\0\vfg_alt\1\0\0\0\rFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\2\14separator\6 \rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\24separator_highlight\afg\14condition\21buffer_not_empty\1\0\2\14separator\6 \rprovider\rFileSize\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\16RainbowLeft\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\0\0\0\1\6\0\0\rNvimTree\vpacker\fminimap\fOutline\15toggleterm\20short_line_list\fsection\25galaxyline.condition\31galaxyline.provider_buffer\28galaxyline.provider_lsp\15galaxyline\frequire\abo\bvim\5ÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nù\n\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3Ë\a\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\n\17n <leader>gb0<cmd>lua require\"gitsigns\".blame_line()<CR>\17n <leader>gh2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\vbuffer\2\17n <leader>gR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\tx ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\17n <leader>gr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>gu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gS0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\to ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\fnoremap\2\nsigns\1\0\6\20update_debounce\3d\22use_internal_diff\2\23use_decoration_api\2\18sign_priority\3\6\vlinehl\1\nnumhl\1\17changedelete\1\0\4\vlinehl\21GitSignsChangeLn\ttext\6~\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\vlinehl\21GitSignsDeleteLn\ttext\b‚Äæ\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\vlinehl\21GitSignsDeleteLn\ttext\6_\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\vlinehl\18GitSignsAddLn\ttext\b‚îÇ\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n›\2\0\0\2\0\v\0\0256\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0K\0\1\0\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\2\0\0\14dashboard&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level$indent_blankline_use_treesitter\1\5\0\0\6|\a¬¶\b‚îÜ\b‚îä\31indent_blankline_char_list\29indent_blankline_enabled\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  kommentary = {
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14on_attach\18lsp_signature\frequire\0" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["minimap.vim"] = {
    commands = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/minimap.vim"
  },
  neogit = {
    loaded = true,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nç\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\rcheck_ts\2\30enable_check_bracket_line\2\21enable_moveright\2\22enable_afterquote\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nÄ\1\0\4\14\0\a\0\21'\4\0\0006\5\1\0\18\a\2\0B\5\2\4H\b\rÄ\a\b\2\0X\n\2Ä'\n\3\0X\v\5Ä\a\b\4\0X\n\2Ä'\n\5\0X\v\1Ä'\n\6\0\18\v\4\0\18\f\t\0\18\r\n\0&\4\r\vF\b\3\3R\bÒL\4\2\0\t Ô†µ\t ÔÅ±\fwarning\t ÔÅó\nerror\npairs\6 E\0\1\2\0\4\0\t6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\1\2Ä+\1\2\0L\1\2\0K\0\1\0\14dashboard\rfiletype\abo\bvimù\3\0\0\b\0\17\1>4\0\0\0006\1\0\0009\1\1\0019\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\0\0009\2\1\0029\2\2\0029\2\3\2)\4\0\0'\5\5\0B\2\3\0026\3\0\0009\3\1\0039\3\2\0039\3\3\3)\5\0\0'\6\6\0B\3\3\0026\4\0\0009\4\1\0049\4\2\0049\4\3\4)\6\0\0'\a\a\0B\4\3\2\b\1\0\0X\5\6Ä5\5\t\0'\6\b\0\18\a\1\0&\6\a\6=\6\n\5>\5\1\0\b\2\0\0X\5\6Ä5\5\f\0'\6\v\0\18\a\2\0&\6\a\6=\6\n\5>\5\2\0\b\4\0\0X\5\6Ä5\5\14\0'\6\r\0\18\a\4\0&\6\a\6=\6\n\5>\5\3\0\b\3\0\0X\5\6Ä5\5\16\0'\6\15\0\18\a\3\0&\6\a\6=\6\n\5>\5\4\0L\0\2\0\1\0\1\nguifg\f#51afef\n Ô†µ \1\0\1\nguifg\f#98be65\n ÔÅô \1\0\1\nguifg\f#ECBE7B\n ÔÅ± \ttext\1\0\1\nguifg\f#ff6c6b\n ÔÅó \tHint\16Information\fWarning\nError\14get_count\15diagnostic\blsp\bvim\0·\6\1\0\6\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\17\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\0034\4\5\0005\5\b\0>\5\1\0045\5\t\0>\5\2\0045\5\n\0>\5\3\0045\5\v\0>\5\4\4=\4\f\0035\4\14\0003\5\r\0=\5\15\4=\4\16\3=\3\18\2B\0\2\1K\0\1\0\foptions\1\0\0\17custom_areas\nright\1\0\0\0\foffsets\1\0\3\ttext\20Plugins manager\15text_align\vcenter\rfiletype\vpacker\1\0\3\ttext\fSymbols\15text_align\vcenter\rfiletype\fOutline\1\0\3\ttext\fMinimap\15text_align\vcenter\rfiletype\fminimap\1\0\3\ttext\18File Explorer\15text_align\vcenter\rfiletype\rNvimTree\18custom_filter\0\26diagnostics_indicator\0\1\0\22\22show_buffer_icons\2\20show_close_icon\1\24persist_buffer_sort\2\20separator_style\nthick\25enforce_regular_tabs\2\27always_show_bufferline\2\16diagnostics\rnvim_lsp\rtab_size\3\25\22max_prefix_length\3\15\20max_name_length\3\20\fsort_by\14directory\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\18modified_icon\b‚óè\28show_buffer_close_icons\2\22buffer_close_icon\bÔôï\19indicator_icon\b‚ñé\rmappings\1\24show_tab_indicators\2\17number_style\tnone\fnumbers\14buffer_id\nsetup\15bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    after = { "lsp_signature.nvim" },
    after_files = { "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim£\1\0\0\6\0\b\2\0306\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\15\0\1\0X\2\3Ä+\1\2\0L\1\2\0X\1\2Ä+\1\1\0L\1\2\0K\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0ï\1\0\0\3\2\6\1\0236\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4Ä-\0\0\0'\2\3\0D\0\2\0X\0\fÄ-\0\1\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0'\2\4\0D\0\2\0X\0\4Ä6\0\0\0009\0\1\0009\0\5\0D\0\1\0K\0\1\0\0¿\1¿\19compe#complete\n<Tab>\n<C-n>\15pumvisible\afn\bvim\2b\0\0\3\1\5\1\0146\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4Ä-\0\0\0'\2\3\0D\0\2\0X\0\3Ä-\0\0\0'\2\4\0D\0\2\0K\0\1\0\0¿\f<S-Tab>\n<C-p>\15pumvisible\afn\bvim\2®\5\1\0\b\0\26\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0013\0\6\0003\1\a\0006\2\b\0003\3\n\0=\3\t\0026\2\b\0003\3\f\0=\3\v\0026\2\r\0009\2\14\0029\2\15\2'\4\16\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0016\2\r\0009\2\14\0029\2\15\2'\4\20\0'\5\17\0'\6\18\0005\a\21\0B\2\5\0016\2\r\0009\2\14\0029\2\15\2'\4\16\0'\5\22\0'\6\23\0005\a\24\0B\2\5\0016\2\r\0009\2\14\0029\2\15\2'\4\20\0'\5\22\0'\6\23\0005\a\25\0B\2\5\0012\0\0ÄK\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2\27v:lua.s_tab_complete()\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2\25v:lua.tab_complete()\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0\19s_tab_complete\0\17tab_complete\a_G\0\0\vsource\1\0\f\ttags\2\rnvim_lsp\2\vbuffer\2\18snippets_nvim\1\nneorg\2\fluasnip\2\rnvim_lua\2\nvsnip\1\tcalc\1\15treesitter\2\tpath\2\nspell\1\1\0\f\18throttle_time\3P\14preselect\venable\15min_length\3\4\17autocomplete\2\fenabled\2\19max_abbr_width\3d\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\ndebug\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\nsetup\ncompe\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-compe", "lspsaga.nvim", "nvim-lspinstall" },
    config = { "\27LJ\2\n¸\t\0\0\a\0\28\00076\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0016\1\0\0009\1\b\0019\1\t\1'\3\n\0005\4\v\0B\1\3\0016\1\0\0009\1\b\0019\1\t\1'\3\f\0005\4\r\0B\1\3\0016\1\0\0009\1\b\0019\1\t\1'\3\14\0005\4\15\0B\1\3\0016\1\0\0009\1\b\0019\1\t\1'\3\16\0005\4\17\0B\1\3\0016\1\0\0009\1\1\0019\1\18\0016\2\0\0009\2\1\0029\2\20\0026\4\0\0009\4\1\0049\4\21\0049\4\22\0045\5\24\0005\6\23\0=\6\25\5B\2\3\2=\2\19\0016\1\0\0009\1\1\0019\1\2\0015\2\27\0=\2\26\1K\0\1\0\1\26\0\0\18 Ôíû  (Text) \19 Ôö¶  (Method)\21 Ôûî  (Function)\24 Ôê•  (Constructor)\18 Ô¥≤  (Field)\21[Óúñ] (Variable)\18 Ô†ñ  (Class)\22 Ô∞Æ  (Interface)\19 Ôô®  (Module)\20 Ô™∂ (Property)\17 Ôëµ  (Unit)\18 Ô¢ü  (Value)\16 Ô©ó (Enum)\20 Ô†ä  (Keyword)\20 ÔÉÑ  (Snippet)\18 Ô£ó  (Color)\17 Ôúì  (File)\22 Ôúú  (Reference)\19 Ôùä  (Folder)\23 ÔÖù  (EnumMember)\21 Ô≤Ä  (Constant)\19 Ô≥§  (Struct)\18 ÔÉß  (Event)\21 Ôó´  (Operator)\26 ÔûÉ  (TypeParameter)\23CompletionItemKind\17virtual_text\1\0\0\1\0\1\vprefix\tÔåå \27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\1\0\3\vtexthl\"LspDiagnosticsSignInformation\nnumhl\"LspDiagnosticsSignInformation\ttext\bÔÅö\"LspDiagnosticsSignInformation\1\0\3\vtexthl\27LspDiagnosticsSignHint\nnumhl\27LspDiagnosticsSignHint\ttext\bÔÅ™\27LspDiagnosticsSignHint\1\0\3\vtexthl\30LspDiagnosticsSignWarning\nnumhl\30LspDiagnosticsSignWarning\ttext\bÔÅ±\30LspDiagnosticsSignWarning\1\0\3\vtexthl\28LspDiagnosticsSignError\nnumhl\28LspDiagnosticsSignError\ttext\bÔÅó\28LspDiagnosticsSignError\16sign_define\afn\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\n¨\4\0\0\14\1!\0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\0026\1\4\0\18\3\0\0B\1\2\4H\0040Ä\a\5\5\0X\6)Ä6\6\6\0009\6\a\0066\b\b\0009\b\t\b'\t\n\0B\6\3\0026\a\v\0009\a\f\a\18\t\6\0'\n\r\0B\a\3\0016\a\v\0009\a\f\a\18\t\6\0'\n\14\0B\a\3\1-\a\0\0008\a\5\a9\a\2\a5\t\31\0005\n\29\0005\v\16\0005\f\15\0=\f\17\v5\f\18\0=\6\t\f=\f\19\v5\f\21\0005\r\20\0=\r\22\f=\f\23\v5\f\24\0004\r\0\0=\r\25\f=\f\26\v5\f\27\0=\f\28\v=\v\30\n=\n \tB\a\2\1X\6\5Ä-\6\0\0008\6\5\0069\6\2\0064\b\0\0B\6\2\1F\4\3\3R\4ŒK\0\1\0\0¿\rsettings\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\2\20preloadFileSize\3ñ\1\15maxPreload\3–\15\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\1\fversion\vLuaJIT\rawakened\1\0\0\1\0\1\bcat\2\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvim\blua\npairs\22installed_servers\nsetup\15lspinstall\frequire5\0\0\3\1\3\0\a-\0\0\0B\0\1\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\1¿\fbufdo e\bcmd\bviml\1\0\5\0\6\0\r6\0\0\0'\2\1\0B\0\2\0023\1\2\0\18\2\1\0B\2\1\0016\2\0\0'\4\3\0B\2\2\0023\3\5\0=\3\4\0022\0\0ÄK\0\1\0\0\22post_install_hook\15lspinstall\0\14lspconfig\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-toggleterm.lua"] = {
    commands = { "ToggleTerm", "TermExec" },
    config = { "\27LJ\2\n…\2\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0005\4\6\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\vNormal\vborder\fSpecial\1\0\4\nwidth\3F\vborder\vcurved\rwinblend\3\0\vheight\3\20\20shade_filetypes\1\0\b\18close_on_exit\2\14direction\15horizontal\17persist_size\2\20start_in_insert\2\20shade_terminals\2\17hide_numbers\2\17open_mapping\t<F4>\tsize\3\20\nsetup\15toggleterm\frequire\0" },
    keys = { { "", "n" }, { "", "<F4>" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeClipboard", "NvimTreeClose", "NvimTreeFindFile", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeToggle" },
    config = { "\27LJ\2\nØ\16\0\0\a\0O\0Î\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\0015\2\6\0=\2\5\0016\1\3\0009\1\4\1)\2\0\0=\2\a\0016\1\3\0009\1\4\1)\2\0\0=\2\b\0016\1\3\0009\1\4\1)\2\1\0=\2\t\0016\1\3\0009\1\4\1)\2\1\0=\2\n\0016\1\3\0009\1\4\1)\2\1\0=\2\v\0016\1\3\0009\1\4\1)\2\0\0=\2\f\0016\1\3\0009\1\4\1)\2\25\0=\2\r\0016\1\3\0009\1\4\1)\2\1\0=\2\14\0016\1\3\0009\1\4\1'\2\16\0=\2\15\0016\1\3\0009\1\4\1)\2\1\0=\2\17\0016\1\3\0009\1\4\1)\2\1\0=\2\18\0016\1\3\0009\1\4\1)\2\1\0=\2\19\0016\1\3\0009\1\4\1)\2\1\0=\2\20\0016\1\3\0009\1\4\0015\2\22\0=\2\21\0016\1\3\0009\1\4\0014\2\26\0005\3\24\0\18\4\0\0'\6\25\0B\4\2\2=\4\26\3>\3\1\0025\3\27\0\18\4\0\0'\6\25\0B\4\2\2=\4\26\3>\3\2\0025\3\28\0\18\4\0\0'\6\29\0B\4\2\2=\4\26\3>\3\3\0025\3\30\0\18\4\0\0'\6\29\0B\4\2\2=\4\26\3>\3\4\0025\3\31\0\18\4\0\0'\6\29\0B\4\2\2=\4\26\3>\3\5\0025\3 \0\18\4\0\0'\6!\0B\4\2\2=\4\26\3>\3\6\0025\3\"\0\18\4\0\0'\6#\0B\4\2\2=\4\26\3>\3\a\0025\3$\0\18\4\0\0'\6%\0B\4\2\2=\4\26\3>\3\b\0025\3&\0\18\4\0\0'\6'\0B\4\2\2=\4\26\3>\3\t\0025\3(\0\18\4\0\0'\6'\0B\4\2\2=\4\26\3>\3\n\0025\3)\0\18\4\0\0'\6*\0B\4\2\2=\4\26\3>\3\v\0025\3+\0\18\4\0\0'\6,\0B\4\2\2=\4\26\3>\3\f\0025\3-\0\18\4\0\0'\6.\0B\4\2\2=\4\26\3>\3\r\0025\3/\0\18\4\0\0'\0060\0B\4\2\2=\4\26\3>\3\14\0025\0031\0\18\4\0\0'\0062\0B\4\2\2=\4\26\3>\3\15\0025\0033\0\18\4\0\0'\0064\0B\4\2\2=\4\26\3>\3\16\0025\0035\0\18\4\0\0'\0066\0B\4\2\2=\4\26\3>\3\17\0025\0037\0\18\4\0\0'\0068\0B\4\2\2=\4\26\3>\3\18\0025\0039\0\18\4\0\0'\6:\0B\4\2\2=\4\26\3>\3\19\0025\3;\0\18\4\0\0'\6<\0B\4\2\2=\4\26\3>\3\20\0025\3=\0\18\4\0\0'\6>\0B\4\2\2=\4\26\3>\3\21\0025\3?\0\18\4\0\0'\6@\0B\4\2\2=\4\26\3>\3\22\0025\3A\0\18\4\0\0'\6B\0B\4\2\2=\4\26\3>\3\23\0025\3C\0\18\4\0\0'\6D\0B\4\2\2=\4\26\3>\3\24\0025\3E\0\18\4\0\0'\6F\0B\4\2\2=\4\26\3>\3\25\2=\2\23\0016\1\3\0009\1\4\0015\2H\0005\3I\0=\3J\0025\3K\0=\3L\2=\2G\0016\1\3\0009\1M\0016\3\0\0'\5N\0B\3\2\0029\0030\3)\4\25\0B\1\3\1K\0\1\0\14nvim-tree\rdefer_fn\vfolder\1\0\6\topen\bÓóæ\17symlink_open\bÓóæ\nempty\bÔÑî\fsymlink\bÔíÇ\fdefault\bÓóø\15empty_open\bÔÑï\bgit\1\0\5\runmerged\bÓúß\vstaged\b‚úì\runstaged\b‚úó\14untracked\b‚òÖ\frenamed\b‚ûú\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\20nvim_tree_icons\nclose\1\0\1\bkey\6q\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\1\0\1\bkey\n<C-]>\1\0\1\bkey\19<2-RightMouse>\acd\1\0\1\bkey\t<CR>\1\0\1\bkey\18<2-LeftMouse>\acb\tedit\1\0\1\bkey\6o\23nvim_tree_bindings\1\0\3\nfiles\3\1\bgit\3\1\ffolders\3\1\25nvim_tree_show_icons\26nvim_tree_group_empty\27nvim_tree_add_trailing!nvim_tree_width_allow_resize\23nvim_tree_tab_open\a:~#nvim_tree_root_folder_modifier\21nvim_tree_git_hl\20nvim_tree_width\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\25nvim_tree_auto_close\24nvim_tree_auto_open\1\5\0\0\t.git\17node_modules\v.cache\16__pycache__\21nvim_tree_ignore\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nü\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["range-highlight.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20range-highlight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/range-highlight.nvim"
  },
  ["suda.vim"] = {
    commands = { "SudaRead", "SudaWrite" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    config = { "\27LJ\2\n˜\1\0\0\3\0\a\0\t6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\0014\2\0\0=\2\6\1=\1\2\0K\0\1\0\18lsp_blacklist\fkeymaps\1\0\6\17code_actions\6a\18rename_symbol\6r\nclose\n<Esc>\17hover_symbol\14<C-space>\19focus_location\6o\18goto_location\t<CR>\1\0\3\rposition\nright\16show_guides\2\27highlight_hovered_item\2\20symbols_outline\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nÎ\t\0\0\n\0003\0W6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\0041\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0005\a\b\0=\a\t\6=\6\n\0056\6\0\0'\b\v\0B\6\2\0029\6\f\6=\6\r\0054\6\0\0=\6\14\0056\6\0\0'\b\v\0B\6\2\0029\6\15\6=\6\16\0054\6\0\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\0056\6\0\0'\b\22\0B\6\2\0029\6\23\0069\6\24\6=\6\25\0056\6\0\0'\b\22\0B\6\2\0029\6\26\0069\6\24\6=\6\27\0056\6\0\0'\b\22\0B\6\2\0029\6\28\0069\6\24\6=\6\29\0056\6\0\0'\b\22\0B\6\2\0029\6\30\6=\6\30\0055\6,\0005\a \0009\b\31\1=\b!\a9\b\"\1=\b#\a9\b$\0019\t%\1 \b\t\b=\b&\a9\b'\1=\b(\a9\b)\0019\t*\1 \b\t\b=\b+\a=\a-\0065\a.\0009\b\31\1=\b!\a9\b\"\1=\b#\a9\b$\0019\t%\1 \b\t\b=\b&\a=\a/\6=\0060\5=\0052\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\t<CR>\vcenter\19select_default\14<Leader>f\nclose\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\15horizontal\1\0\2\vmirror\1\18preview_width\4≥ÊÃô\3≥Êåˇ\3\1\0\1\20prompt_position\vbottom\17find_command\1\0\t\rwinblend\3\0\23selection_strategy\nreset\18prompt_prefix\a> \20layout_strategy\15horizontal\21sorting_strategy\15descending\17initial_mode\vinsert\ruse_less\2\19color_devicons\2\20scroll_strategy\ncycle\1\a\0\0\arg\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  vimwiki = {
    config = { "\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\3\bext\b.md\vsyntax\rmarkdown\tpath\14~/vimwiki\17vimwiki_list\6g\bvim\0" },
    loaded = true,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nª\26\0\0\a\0°\1\0⁄\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1+\3\0\0=\3\4\0029\2\5\0005\4\t\0005\5\6\0005\6\a\0=\6\b\5=\5\n\0045\5\v\0=\5\3\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\17\0005\6\16\0=\6\18\5=\5\19\0045\5\21\0005\6\20\0=\6\22\5=\5\23\0045\5\24\0=\5\25\4B\2\2\0015\2\27\0005\3\26\0=\3\28\0025\3\29\0=\3\30\0025\3\31\0=\3 \0025\3!\0=\3\"\0025\3#\0=\3$\0025\3%\0=\3&\0025\3'\0005\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\0035\4.\0=\4/\0035\0040\0=\0041\0035\0042\0=\0043\0035\0044\0=\0045\0035\0046\0=\0047\3=\3-\0025\0038\0005\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4-\0035\4>\0=\4)\0035\4?\0=\4@\0035\4A\0005\5B\0=\5C\0045\5D\0=\5:\0045\5E\0=\5F\0045\5G\0=\5H\0045\5I\0=\5J\4=\4H\3=\3)\0025\3K\0005\4L\0=\4)\0035\4M\0=\0041\0035\4N\0=\4+\0035\4O\0=\4P\0035\4Q\0=\4<\0035\4R\0=\4S\0035\4T\0=\4U\3=\3+\0025\3V\0005\4W\0=\4X\0035\4Y\0=\4H\0035\4Z\0=\0047\0035\4[\0=\4\\\0035\4]\0=\4^\0035\4_\0=\4`\0035\4a\0=\4U\0035\4b\0=\4<\0035\4c\0=\4@\0035\4d\0=\4-\0035\4e\0=\4f\0035\4g\0=\4)\3=\0033\0025\3h\0005\4i\0=\4)\0035\4j\0=\4k\0035\4l\0=\4:\0035\4m\0=\0047\0035\4n\0=\4^\0035\4o\0=\4\\\3=\0037\0025\3p\0005\4q\0=\4r\0035\4s\0=\4S\0035\4t\0=\4^\0035\4u\0=\4<\0035\4v\0=\4H\3=\3r\0025\3w\0005\4x\0=\0043\0035\4y\0=\4-\0035\4z\0=\4^\0035\4{\0=\4@\0035\4|\0=\4}\3=\3^\0025\3~\0005\4\0=\4S\0035\4Ä\0=\4F\0035\4Å\0=\4Ç\0035\4É\0=\4Ñ\0035\4Ö\0=\4Ü\0035\4á\0=\4@\0035\4à\0=\4â\0035\4ä\0=\4H\0035\4ã\0=\4å\0035\4ç\0=\4é\0035\4è\0=\4ê\0035\4ë\0=\4J\0035\4í\0=\4ì\0035\4î\0=\4ï\0035\4ñ\0=\4^\0035\4ó\0=\4ò\3=\3S\0025\3ô\0005\4ö\0=\4:\0035\4õ\0005\5ú\0=\0051\0045\5ù\0=\5:\0045\5û\0=\0053\4=\4F\3=\3X\0029\3ü\0\18\5\2\0005\6†\0B\3\3\1K\0\1\0\1\0\1\vprefix\r<leader>\rregister\1\2\0\0\19Generate links\1\2\0\0\nIndex\1\2\0\0\bNew\1\0\1\tname\v+diary\1\2\0\0\nIndex\1\0\1\tname\t+org\6v\1\2\0\0\23Split window right\1\2\0\0\23Split window below\6=\1\2\0\0\19Balance window\6K\1\2\0\0\21Expand window up\1\2\0\0\24Expand window right\6J\1\2\0\0\24Expand window below\6H\1\2\0\0\23Expand window left\6k\1\2\0\0\14Window up\1\2\0\0\17Window right\6j\1\2\0\0\17Window below\1\2\0\0\16Window left\0062\1\2\0\0\26Layout double columns\6|\1\2\0\0\23Split window right\6-\1\2\0\0\23Split window below\1\2\0\0\18Delete window\1\2\0\0\17Other window\1\0\1\tname\r+windows\6m\1\2\0\0\17Jump to mark\1\2\0\0\20Command history\1\2\0\0\16Goto symbol\1\2\0\0\vBuffer\1\2\0\0\tGrep\1\0\1\tname\f+search\1\2\0\0\21Session switcher\1\2\0\0%Restore previously saved session\1\2\0\0\25Save current session\1\2\0\0\18Save and quit\6q\1\2\0\0\tQuit\1\0\1\tname\19+quit/sessions\1\2\0\0\19Plugins status\1\2\0\0\22Sync your plugins\1\2\0\0000Profile the time taken loading your plugins\1\2\0\0\28Install missing plugins\6C\1\2\0\0!Compile your plugins changes\1\2\0\0%Clean disabled or unused plugins\1\0\1\tname\r+plugins\1\2\0\0\fCommits\6B\1\2\0\0\rBranches\1\2\0\0\15Blame line\1\2\0\0\17Preview hunk\1\2\0\0\15Reset hunk\1\2\0\0\17Reset buffer\6u\1\2\0\0\20Undo stage hunk\6s\1\2\0\0\vStatus\6S\1\2\0\0\15Stage hunk\1\2\0\0\tPush\1\2\0\0\tPull\6o\1\2\0\0\16Open Neogit\1\0\1\tname\t+git\6R\1\2\0\0'Re-open file with sudo permissions\6w\1\2\0\0%Write file with sudo permissions\1\2\0\0\26Recently opened files\6t\1\2\0\0\14Help tags\1\2\0\0\15Find files\1\2\0\0 Create a new unnamed buffer\1\2\0\0\30Edit Neovim configuration\1\0\1\tname\n+file\6L\1\2\0\0#Diagnostics into location list\6l\1\2\0\0\26Show line diagnostics\6d\1\2\0\0\25Show type definition\1\2\0\0\rLsp info\6a\1\2\0\0\17Code actions\1\0\1\tname\t+lsp\6h\1\2\0\0?Run restclient on the line that the cursor is currently on\1\2\0\0\28Compile and run project\1\2\0\0\20Compile project\6r\1\2\0\0\21Run current file\6i\1\2\0\0\17Start a REPL\1\0\1\tname\n+code\6p\1\2\0\0\20Previous buffer\6[\1\2\0\0\20Previous buffer\6g\1\2\0\0\16Goto buffer\6n\1\2\0\0\16Next buffer\6]\1\2\0\0\16Next buffer\6b\1\2\0\0\27Switch to other buffer\6f\1\2\0\0\18Format buffer\6c\1\2\0\0\25Close current buffer\1\0\1\tname\r+buffers\6:\1\2\0\0\20Command history\6/\1\2\0\0\18Search a word\6,\1\2\0\0\18Switch buffer\6.\1\2\0\0\17Browse files\6 \1\2\0\0\14Find file\6`\1\0\0\1\2\0\0\18Switch buffer\vhidden\1\t\0\0\r<silent>\n<Cmd>\n<cmd>\v<Plug>\tcall\blua\a^:\a^ \vlayout\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmax\3\n\bmin\3\1\vwindow\fpadding\1\0\0\1\5\0\0\3\0\3\0\3\0\3\0\15key_labels\1\0\3\n<tab>\bTAB\t<cr>\bRET\f<space>\bSPC\nicons\1\0\3\15breadcrumb\a¬ª\ngroup\6+\14separator\b‚ûú\1\0\n\azf\16Create fold\6>\17Indent right\6d\vDelete\t<lt>\16Indent left\agU\14Uppercase\6y\16Yank (copy)\agu\14Lowercase\6!#Filter though external program\ag~\16Toggle case\6c\vChange\fplugins\1\0\3\14show_help\2\rtriggers\tauto\19ignore_missing\2\fpresets\1\0\a\17text_objects\2\fmotions\2\6z\2\6g\2\14operators\1\bnav\2\fwindows\2\1\0\2\14registers\1\nmarks\1\nsetup\agc\14operators\30which-key.plugins.presets\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/harrydt/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmd%-parser"] = "cmd-parser.nvim",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim",
  ["^telescope"] = "telescope.nvim",
  ["^toggleterm"] = "nvim-toggleterm.lua",
  ["^toggleterm%.terminal"] = "nvim-toggleterm.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\3\bext\b.md\vsyntax\rmarkdown\tpath\14~/vimwiki\17vimwiki_list\6g\bvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":ToggleTerm") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'nvim-toggleterm.lua'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TermExec") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TermExec lua require("packer.load")({'nvim-toggleterm.lua'}, { cmd = "TermExec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SudaRead") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SudaRead lua require("packer.load")({'suda.vim'}, { cmd = "SudaRead", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SudaWrite") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SymbolsOutline") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SymbolsOutlineOpen") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SymbolsOutlineClose") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Minimap") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Minimap lua require("packer.load")({'minimap.vim'}, { cmd = "Minimap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":MinimapClose") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file MinimapClose lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":MinimapToggle") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":MinimapRefresh") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file MinimapRefresh lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":MinimapUpdateHighlight") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file MinimapUpdateHighlight lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapUpdateHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeClipboard") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeClipboard lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClipboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeClose") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeFindFile") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeOpen") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeRefresh") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeToggle") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Telescope") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <F4> <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>F4>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'kommentary'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'range-highlight.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'format.nvim', 'LuaSnip', 'neoscroll.nvim', 'which-key.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au ColorScheme * ++once lua require("packer.load")({'indent-blankline.nvim', 'nvim-lspconfig', 'galaxyline.nvim', 'nvim-bufferline.lua'}, { event = "ColorScheme *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au ColorSchemePre * ++once lua require("packer.load")({'darkplus.nvim'}, { event = "ColorSchemePre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
