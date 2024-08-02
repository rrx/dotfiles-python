#!/usr/bin/env bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install -y neovim
