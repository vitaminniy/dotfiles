#!env bash

./configure --with-features=huge \
			--enable-multibyte --enable-cscope \
			--enable-python3interp=yes \
			--with-python3-config-dir=$(python3-config --configdir) \
			--enable-luainterp=yes-enable-luainterp=yes

