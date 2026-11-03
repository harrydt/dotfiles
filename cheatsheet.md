# tmux + workmux cheatsheet

kitty → tmux → nvim / Claude Code, with one tmux **session per git worktree** (workmux session mode).

## Setup on a new machine

```sh
brew install tmux raine/workmux/workmux   # or: cargo install workmux
cd ~/dotfiles && stow tmux workmux nvim
workmux setup                              # installs the Claude Code status hooks
# manual alternative:
#   claude plugin marketplace add raine/workmux
#   claude plugin install workmux-status
tmux new -A -s main                        # home session; workmux returns here
git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux new -A -s main                        # then press prefix I once to install plugins
```

Open nvim once so lazy installs `vim-tmux-navigator`.

Files:
- `tmux/.config/tmux/tmux.conf`
- `workmux/.config/workmux/config.yaml` (global). Per-repo overrides go in `.workmux.yaml`.
- Hyprland: `Super+Shift+Return` opens kitty attached to `main`.

## tmux keys (prefix = `Ctrl-b`)

| Key | Action |
|---|---|
| `Ctrl-h/j/k/l` | Move between panes **and** nvim splits (no prefix) |
| `prefix Ctrl-l` / `prefix Ctrl-k` | Send clear-screen / kill-line to the shell (the navigator takes them) |
| `prefix -` / `prefix v` | Split down / right, in the current dir |
| `prefix c` | New window, in the current dir |
| `prefix ←↑↓→` | Resize pane (repeatable) |
| `prefix z` | Zoom pane |
| `prefix x` | Kill pane |
| `prefix 1..9` | Go to window N |
| `prefix Ctrl-n` / `prefix Ctrl-p` | Next / previous window (hold prefix, tap) |
| `prefix Ctrl-b` | Send a real `Ctrl-b` to the pane (nested tmux etc.) |
| `prefix s` | Session/window tree picker |
| `prefix (` / `prefix )` | Previous / next session |
| `prefix d` | Detach |
| `prefix [` | Copy mode (vi movement, `Space` select, `Enter` copy, `y` yank, `q` quit) |
| `prefix r` | Reload tmux.conf |
| `prefix $` | Rename session |
| `prefix ,` | Rename window |

### plugin keys (TPM)

| Key | Action |
|---|---|
| `prefix I` | Install/update plugins (TPM) |
| `prefix S` | Save tmux environment (resurrect; also auto-saved every 15 min) |
| `prefix Ctrl-r` | Restore tmux environment after reboot/crash |
| status bar | Mauve `^B` badge while prefix is held, `Copy` badge in copy mode |

After a reboot: `tmux new -A -s main`, `prefix Ctrl-r`, then `workmux resurrect`.

Plugins: tmux-resurrect, tmux-continuum, tmux-yank, tmux-prefix-highlight.
Add a plugin with a `set -g @plugin '...'` line, `prefix r`, then `prefix I`.
The TPM `run-shell` line stays at the bottom of tmux.conf.

### workmux keys

| Key | Action |
|---|---|
| `prefix Ctrl-s` | Dashboard popup (all agents, status, diffs) |
| `prefix l` | Jump to the last agent that finished or is waiting |
| `prefix Tab` | Toggle between the two most recent agents |

## workmux commands

```sh
workmux add feat/x                       # worktree + branch + session (agent and nvim windows)
workmux add feat/x -p "implement ..."    # same, with a prompt sent to the agent
workmux add feat/x -e                    # write the prompt in $EDITOR
workmux add feat/x -w -u                 # move uncommitted and untracked changes into it
workmux add --pr 123                     # check out a GitHub PR
workmux add feat/x --base main
workmux add feat/x -b                    # create it without switching to it

workmux list                             # worktrees + status
workmux open feat/x                      # reopen the session for an existing worktree
workmux close feat/x                     # close the session, keep the worktree
workmux merge                            # from inside the worktree: merge into main, clean up
workmux remove feat/x                    # delete the worktree without merging (--keep-branch to keep the branch)
workmux resurrect                        # restore sessions after a crash or reboot
workmux config edit
workmux docs
```

## Gotchas

- kitty's own `alt+hjkl`, `alt+-`/`alt+v` and `cmd+1..9` still act on **kitty** splits and tabs. Inside tmux, use `Ctrl-hjkl` and `prefix` keys instead.
- kitty-scrollback.nvim only sees what's on screen in tmux. Use `prefix [` for tmux scrollback.
- Session mode works only with the tmux backend. Each worktree gets one session.
- If true color or undercurl looks wrong, check `echo $TERM` inside tmux. It should be `tmux-256color`, and the outer terminal should be kitty.
- tmux-256color terminfo has no `Ss`/`Se`; the cursor-shape fix is the `terminal-overrides` line in tmux.conf. It only applies to panes created after it loads, so restart the tmux server (or respawn panes) when it changes.
- tmux-resurrect would steal `prefix Ctrl-s` (the dashboard key); it's rebound to `prefix S` in tmux.conf.
