#!/usr/bin/env bash

echo "Setting up mirrorlist and base-devel"
sudo echo -e "Server = http://mirror.es.its.nyu.edu/archlinux/$repo/os/\$arch\n$(cat /etc/pacman.d/mirrorlist)" > /etc/pacman.d/mirrorlist
sudo pacman -Syu --noconfirm base-devel git emacs cmake fish sd fd lsd tmux fzf ripgrep tree
chmod +x install_extra.sh

#begin yay
if ! command -v yay >/dev/null; then
    tmp=$(mktemp -d)
    function finish { rm -rf "$tmp"; }  # clean up after yourself...
    trap finish EXIT                    # ...no matter how you exist

    git clone https://aur.archlinux.org/yay.git "$tmp"
    pushd "$tmp"
    makepkg -sri --noconfirm --needed
    popd

    if ! command -v yay >/dev/null; then
        >&2 echo "yay failed to install"
        exit 1
    fi
fi
#end yay

#begin fish
echo "Setting up fish shell"
sudo chsh -s $(which fish) $(whoami)
#end fish
