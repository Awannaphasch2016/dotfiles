#!/bin/bash

# tmux 
sudo apt install tmux

# fzf 
## ref: https://github.com/junegunn/fzf/issues/1232#issuecomment-496684040
sudo apt install fd-find

if [ ! -d $HOME/.fzf ]
then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

 
