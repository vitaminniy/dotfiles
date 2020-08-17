#!/bin/sh

# add components
rustup component add rust-src

# install tools
cargo install rusty-tags # for ctags generation
