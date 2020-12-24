#!/bin/sh

# zsh
mkdir -p $HOME/.cache/zsh
ln -sf $(pwd)/zshrc $HOME/.zshrc

# vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -sf $(pwd)/vimrc $HOME/.vimrc
ln -sf $(pwd)/vimrc.plugins $HOME/.vimrc.plugins
ln -sf $(pwd)/coc-settings.json $HOME/.vim/coc-settings.json

# tmux
ln -sf $(pwd)/tmux.conf $HOME/.tmux.conf

# git
cat >> $HOME/.gitconfig <<EOF
[include]
	path = $(pwd)/gitconfig
EOF

