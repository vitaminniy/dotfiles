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
    $HOME/.cargo/bin
    $HOME/.poetry/bin
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

# bindings
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/history

source $ZSH/oh-my-zsh.sh
