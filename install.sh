#!/bin/sh

# zsh
mkdir -p $HOME/.config/zsh
mkdir -p $HOME/.cache/zsh

ln -sf $(pwd)/zprofile $HOME/.zprofile
ln -sf $(pwd)/zshrc $HOME/.config/zsh/.zshrc

# vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

ln -sf $(pwd)/vimrc $HOME/.vimrc
ln -sf $(pwd)/vimrc.plugins $HOME/.vimrc.plugins

# git
cat >> $HOME/.gitconfig <<EOF
[include]
	path = $(pwd)/gitconfig
EOF
