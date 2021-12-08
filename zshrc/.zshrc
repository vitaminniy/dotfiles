export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='nvim'
export PAGER=less

export GOPATH=$HOME/go
export GOROOT=/usr/local/go

# disable Micorsoft telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export PYENV_ROOT=$HOME/.pyenv

path=(
    $path
    /usr/local/bin
    $GOPATH/bin
    $GOROOT/bin
    $HOME/bin
    $HOME/.cargo/bin
    $PYENV_ROOT/bin
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

# The next line enabled shell completion for yql.
if [ -f $HOME/.yql/shell_completion ]; then source $HOME/.yql/shell_completion; fi

# Export rust sources directory
# If not exists than call `rustup add component rust-src`
if type "$rustc" > /dev/null; then
    RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
    if [[ -d $RUST_SRC_PATH ]]; then
        export RUST_SRC_PATH=$RUST_SRC_PATH
    fi
fi

# Enable pyenv shims and autocompletion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Enable ccahe
# /usr/local/opt/ccache/libexec
CCACHE_LIBEXEC=/usr/local/opt/ccache/libexec
if [ -d $CCACHE_LIBEXEC ]; then
  path=(
    $CCACHE_LIBEXEC
    $path
  )
fi

# bindings
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green
