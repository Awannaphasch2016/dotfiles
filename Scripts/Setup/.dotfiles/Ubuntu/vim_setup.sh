#!/bin/bash

# set -e 

sudo add-apt-repository ppa:jonathonf/vim
apt-get update && apt-get upgrade
sudo apt install vim

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim
# vim/plugin/coc.nvim
## install yarn (nodejs will automatically downloaded)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn # (nodejs is downloaded at this step)

echo 'done'

