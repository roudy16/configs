# My Personal Configs

## Note

The automation portions of this repo are severly out-of-date. I've been cherry-picking
the config stuff that I want for a while now. Cherry-picking configs seems to work fine
but it would be nice to have some setup automation for when I move to different machines.

## Things to Automate

- Install tools I use everywhere
  - neovim
    - currently using the LazyVim distro
  - tmux + oh my tmux
  - zsh + oh my zsh
  - shell completions (git, etc)
- Stage configs where they should go. (originally what this repo did)

## Other must-haves but maybe not automated install

- docker
- kubectl
- vscode
- alacritty
- Postman
- Beyond Compare
- Obsidian
- All Jetbrains things

## Annoying Hacks

- I was having trouble getting alacritty + wsl2 + tmux to render fonts correctly.
  Specifically, some symbols had the wrong width. I eventually resolved this by
  finding a patched/updated versions of conpty.dll and OpenConsole.exe and
  putting them in the same directory as alacritty.exe. I obtained these artifacts
  from the WezTerm project. I didn't track this problem down myself, I stumbled
  across this solution on Reddit and the neovim github issues, it worked for me.
