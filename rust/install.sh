#!/bin/sh

main() {
    # install rustup
    if ! command -v rustup; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi

    if [ ! -d $HOME/.cargo/bin ]; then
        mkdir -p $HOME/.cargo/bin
    fi

    # add components
    rustup component add rust-src

    # install tools
    cargo install rusty-tags # ctags generation
}

main || exit 1
