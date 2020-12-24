#!/bin/sh

# zsh
mkdir -p $HOME/.cache/zsh
ln -sf $(pwd)/zshrc $HOME/.zshrc

# tmux
ln -sf $(pwd)/tmux.conf $HOME/.tmux.conf

# git
cat >> $HOME/.gitconfig <<EOF
[include]
	path = $(pwd)/gitconfig
EOF

