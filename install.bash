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

install_brew() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        return 0
    fi

    if hash brew 2> /dev/null; then
        return 0;
    fi

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

stow_linux() {
    if [[ "$OSTYPE" != "linux"* ]]; then
        return 0;
    fi

    echo "Stowing linux";
}

main() {
    mkdir -p $HOME/.ssh

    install_brew
    install_nvim
    stow_linux

    stow -v -t $HOME    \
        ghostty         \
        git             \
        gnupg           \
        nvim            \
        opencode        \
        psql            \
        ssh             \
        tmux            \
        zshrc
}

main || exit 1
