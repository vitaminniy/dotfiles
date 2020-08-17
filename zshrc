export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'

export GOPATH=$HOME/go
export GOROOT=/usr/local/go

# disable Micorsoft telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

path=(
    $path
    /usr/local/bin
    $GOPATH/bin
    $GOROOT/bin
    $HOME/bin
    $HOME/.cargo/bin
)

plugins=(
    colorize
    docker
    docker-compose
    git
    tmux
    rust
)

ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/history

function delete_gone_branches() {
    git branch -vv | awk '{if ($4 == "gone]") print $1}' | xargs git branch -d
}

source $ZSH/oh-my-zsh.sh

echo "\\e[1mOS: \\e[0;32m\"$(uname -rs)\"\\e[0m"
echo "$(uptime | sed 's/^ //' | sed 's/^up //' | awk '{print "\\e[1mUptime: \\e[0;32m"$0"\\e[0m"}')"
echo "\\e[1mHostname: \\e[0;32m$(uname -n)\\e[0m"

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/google-cloud-sdk/path.zsh.inc ]; then . $HOME/google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME/google-cloud-sdk/completion.zsh.inc ]; then . $HOME/google-cloud-sdk/completion.zsh.inc; fi

# The next line updates PATH for Yandex Cloud CLI.
if [ -f $HOME/yandex-cloud/path.bash.inc ]; then source $HOME/yandex-cloud/path.bash.inc; fi

# The next line enables shell command completion for yc.
if [ -f $HOME/yandex-cloud/completion.zsh.inc ]; then source $HOME/yandex-cloud/completion.zsh.inc; fi

export CC='clang'
export CXX=$CC++

# Enable mainline llvm on darwin if installed
if [ -d /usr/local/opt/llvm ]; then
    path=(
        $path
        /usr/local/opt/llvm/bin
    )

    export CC='/usr/local/opt/llvm/bin/clang'
    export CXX=$CC++

    LDFLAGS+='-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
    export LDFLAGS=$LDFLAGS

    CPPFLAGS+='-I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/'
    export CPPFLAGS=$CPPFLAGS
fi

# Export rust sources directory
# If not exists than call `rustup add component rust-src`
if rustc_loc='$(type -p rustc)' || [[ -z $rustc_loc ]]; then
    RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
    if [[ -d $RUST_SRC_PATH ]]; then
        export RUST_SRC_PATH=$RUST_SRC_PATH
    fi
fi

# bindings
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
