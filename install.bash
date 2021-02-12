#!/usr/bin/env bash

install_nvim() {
    NVIM_PLUG_FILE=$HOME/.config/nvim/autoload/plug.vim
    if [ ! -f $NVIM_PLUG_FILE ]; then
        echo "installing neovim plug"
        sh -c "curl -fLo $NVIM_PLUG_FILE --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    fi
}

main() {
    stow -v -t $HOME \
        alacritty \
        git \
        nvim \
        tmux \
        zshrc

    install_nvim
}

main || exit 1
