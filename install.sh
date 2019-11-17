#!/bin/sh

mkdir -p $HOME/.cache/zsh

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/vimrc $HOME/.vimrc
ln -sf $(pwd)/vimrc.plugins $HOME/.vimrc.plugins

cat >> $HOME/.gitconfig <<EOF
[include]
	path = $(pwd)/gitconfig
EOF
