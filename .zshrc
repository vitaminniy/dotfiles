export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

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

plugins=(
    git
    docker
    docker-compose
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

source $ZSH/oh-my-zsh.sh
