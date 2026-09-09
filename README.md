# Linux Dotfiles

## Hyprland+Noctalia ecosystem guide
### Installation guide (FULL)
- Install **git**
- Get dotfiles
```
git clone https://github.com/fistos3rr/dotfiles.git
```
- Copy *dotfiles/.config/* to *~/.config/*
- Install **vim**
    - cp `.vimrc` and `.vim` from *dotfiles/vim* to ~
    - run `:PlugInstall` in vim
- Install **zsh**
    - cp `.zshrc` from *dotfiles/zsh* to *~*
    - use `chsh -s /usr/bin/zsh` to change shell
    - reboot
- Install **Fira Code Nerd Font**
    - Download archive from official site
    - Unzip it to ~/.local/share/fonts/FiraCode folder
    - Run `fc-cache -f -v` in terminal
- Install **kitty** terminal
- Install **noctalia**
    - Install and setup NetworkManager
    - Install noctalia
    - Install `noctalia-greeter` (enable greeter, check official documentation)
- Install **yazi** (cli file manager)
- Install **neovim**
    - Install nodejs and npm (for plugins)
    - Install neovim (from source prebuild)
- Install **hyprland**

