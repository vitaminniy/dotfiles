#!/bin/sh

# create config directory
mkdir -p $HOME/.config/nvim

ln -sf $(pwd)/init.vim $HOME/.config/nvim/init.vim
ln -sf $(pwd)/coc-settings.json $HOME/.config/nvim/coc-settings.json

# install plug
sh -c 'curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
	 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

