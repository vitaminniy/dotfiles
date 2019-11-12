export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'

export GOPATH=$HOME/go
export GOROOT=/usr/local/go

path=(
    $path
    /usr/local/bin
    $GOPATH/bin
    $GOROOT/bin
    $HOME/bin
)

plugins=(
    colorize
    docker
    docker-compose
    git
    tmux
)

ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# tmux plugin
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOSTART_ONCE="true"

# bindings

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

source $ZSH/oh-my-zsh.sh
