#!/bin/sh

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

ln -sf $(pwd)/zshrc $HOME/.zshrc
ln -sf $(pwd)/vimrc $HOME/.vimrc
ln -sf $(pwd)/vimrc.plugins $HOME/.vimrc.plugins
ln -sf $(pwd)/alacritty.yml $HOME/.alacritty.yml

cat >> $HOME/.gitconfig <<EOF
[include]
    path = $(pwd)/gitconfig
EOF
