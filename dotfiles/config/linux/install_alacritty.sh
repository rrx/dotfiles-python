#!/usr/bin/env bash

# install alacritty on linux
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install --force alacritty
sudo curl -so /usr/share/pixmaps/Alacritty.svg https://raw.githubusercontent.com/alacritty/alacritty/master/extra/logo/alacritty-term.svg
curl -so /tmp/Alacritty.desktop https://raw.githubusercontent.com/alacritty/alacritty/master/extra/linux/Alacritty.desktop
sudo desktop-file-install /tmp/Alacritty.desktop
sudo update-desktop-database

