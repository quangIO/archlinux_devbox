#!/usr/bin/env bash

#begin system-lang
echo "Installing system programming languages"
sudo pacman -Syu julia rustup ghc ponyc radare2 pwndbg --needed --noconfirm
sudo echo "source /usr/share/pwndbg/gdbinit.py" >> /etc/gdb/gdbinit
#end system-lang

#begin doom-emacs
echo "Setting up doom emacs"
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d -b develop --depth 1
~/.emacs.d/bin/doom install
#end doom-emacs

#begin remote-tty
echo "Setting up remote tools"
yay -Syu --noconfirm neovim-symlinks ttyd cloudflared-bin yadm-git starship-bin
#end remote-tty

#begin tmux-plugin
echo "Setting up some tmux goodies"
rm -rf .tmux
git clone https://github.com/gpakosz/.tmux
#end tmux-plugin
