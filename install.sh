#!/bin/bash

insPath=/usr/local/bin

sudo apt-get install cscope ctags git

sudo cp ccscope-ctags $insPath
sudo cp git-create-repo $insPath
sudo cp git-quick-commit-push $insPath

mv vimrc ~/.vimrc
mv tmux.conf ~/.tmux.conf

