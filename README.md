![image](https://github.com/user-attachments/assets/12f625b0-8c55-4183-be14-acaf82870f70)

# Stow
These dotfiles are managed by [GNU stow](https://www.gnu.org/software/stow/)
- Clone the repo
- Change directory to `dotfiles`\
  `cd ~/dotfiles`
- Run GNU stow on each config, for example:\
  `stow nvim`

# dotfiles/nvim/.config/nvim

<a href="https://dotfyle.com/harrydt/dotfiles-nvim-config-nvim"><img src="https://dotfyle.com/harrydt/dotfiles-nvim-config-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/harrydt/dotfiles-nvim-config-nvim"><img src="https://dotfyle.com/harrydt/dotfiles-nvim-config-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/harrydt/dotfiles-nvim-config-nvim"><img src="https://dotfyle.com/harrydt/dotfiles-nvim-config-nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:harrydt/dotfiles ~/.config/harrydt/dotfiles
```

Open Neovim with this config:

```sh
NVIM_APPNAME=harrydt/dotfiles/nvim/.config/nvim nvim
```

## Plugins

### ai

+ [olimorris/codecompanion.nvim](https://dotfyle.com/plugins/olimorris/codecompanion.nvim)
### bars-and-lines

+ [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
### colorscheme

+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
### completion

+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
+ [fang2hou/blink-copilot](https://dotfyle.com/plugins/fang2hou/blink-copilot)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [shortcuts/no-neck-pain.nvim](https://dotfyle.com/plugins/shortcuts/no-neck-pain.nvim)
+ [echasnovski/mini.ai](https://dotfyle.com/plugins/echasnovski/mini.ai)
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
### file-explorer

+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [NeogitOrg/neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)
+ [aaronhallaert/advanced-git-search.nvim](https://dotfyle.com/plugins/aaronhallaert/advanced-git-search.nvim)
### golang

+ [ray-x/go.nvim](https://dotfyle.com/plugins/ray-x/go.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### indent

+ [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)
+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [zeioth/garbage-day.nvim](https://dotfyle.com/plugins/zeioth/garbage-day.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)
+ [mrcjkb/rustaceanvim](https://dotfyle.com/plugins/mrcjkb/rustaceanvim)
### marks

+ [chentoast/marks.nvim](https://dotfyle.com/plugins/chentoast/marks.nvim)
### motion

+ [phaazon/hop.nvim](https://dotfyle.com/plugins/phaazon/hop.nvim)
### note-taking

+ [nvim-neorg/neorg](https://dotfyle.com/plugins/nvim-neorg/neorg)
+ [nvim-neorg/neorg-telescope](https://dotfyle.com/plugins/nvim-neorg/neorg-telescope)
### nvim-dev

+ [ray-x/guihua.lua](https://dotfyle.com/plugins/ray-x/guihua.lua)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### quickfix

+ [kevinhwang91/nvim-bqf](https://dotfyle.com/plugins/kevinhwang91/nvim-bqf)
### scrolling

+ [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)
### session

+ [olimorris/persisted.nvim](https://dotfyle.com/plugins/olimorris/persisted.nvim)
### snippet

+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
### split-and-window

+ [sindrets/winshift.nvim](https://dotfyle.com/plugins/sindrets/winshift.nvim)
### statusline

+ [NTBBloodbath/galaxyline.nvim](https://dotfyle.com/plugins/NTBBloodbath/galaxyline.nvim)
### syntax

+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
### terminal-integration

+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
### test

+ [nvim-neotest/neotest](https://dotfyle.com/plugins/nvim-neotest/neotest)
+ [fredrikaverpil/neotest-golang](https://dotfyle.com/plugins/fredrikaverpil/neotest-golang)
### utility

+ [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
## Language Servers

+ gopls
+ jsonls
+ lua_ls
+ yamlls


 This readme was generated by [Dotfyle](https://dotfyle.com)
