#!/bin/sh

NVIM_CONFIG_DIR=$HOME/.config/nvim

main() {
    if [ ! -d $NVIM_CONFIG_DIR ]; then
        mkdir -p $NVIM_CONFIG_DIR
    fi

    ln -sf $(PWD)/init.vim $NVIM_CONFIG_DIR/init.vim
    ln -sf $(PWD)/coc-settings.json $NVIM_CONFIG_DIR/coc-settings.json

    # install plug
    sh -c 'curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

main || exit 1
