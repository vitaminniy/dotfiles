export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export EDITOR='vim'

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec


path=(
    $path
    /usr/local/bin
    $GOPATH/bin
    $GOROOT/bin
    $HOME/bin
)

ZSH_THEME="robbyrussell"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    colorize
    docker
    docker-compose
    git
)

# aliases

kubectl () {
    command kubectl $*
    if [[ -z $KUBECTL_COMPLETE ]]
    then
        source <(command kubectl completion zsh)
        KUBECTL_COMPLETE=1 
    fi
}

# bindings

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

if [ -f /usr/local/bin/vin ]; then
    export EDITOR=/usr/local/bin/vim
fi

source $ZSH/oh-my-zsh.sh
