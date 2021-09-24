#!/usr/bin/env bash

install_nvim() {
    NVIM_PLUG_PATH=$HOME/.config/nvim/autoload
    NVIM_PLUG_FILE=$NVIM_PLUG_PATH/plug.vim

    if [[ ! -d "$NVIM_PLUG_PATH" ]]; then
        mkdir -p $HOME/.config/nvim/autoload
    fi

    if [[ ! -f "$NVIM_PLUG_FILE" ]]; then
        echo "installing neovim plug"
        sh -c "curl -fLo $NVIM_PLUG_FILE --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    fi
}

main() {
    stow -v -t $HOME \
        alacritty \
        emacs \
        git \
        nvim \
        tmux \
        zshrc

    install_nvim
}

main || exit 1
