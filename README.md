Personal dotfiles managed by GNU Stow

# Using GNU stow to manage dotfiles

- Install GNU stow
  `sudo pacman -S stow`
- Create `~/dotfiles`
- Move config files to `~/dotfiles,` keeping the same dir structure
  For example:
  `~/.config/nvim/init.vim` ==> `~/dotfiles/nvim/.config/nvim/init.vim`
- `cd` to `~/dotfiles`
- Run GNU stow on each config 
  For example:
  `stow nvim`
