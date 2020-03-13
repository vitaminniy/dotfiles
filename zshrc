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

function delete_gone_branches() {
    git branch -vv | awk '{if ($4 == "gone]") print $1}' | xargs git branch -d
}

source $ZSH/oh-my-zsh.sh

echo "\\e[1mOS: \\e[0;32m\"$(uname -rs)\"\\e[0m"
echo "$(uptime | sed 's/^ //' | sed 's/^up //' | awk '{print "\\e[1mUptime: \\e[0;32m"$0"\\e[0m"}')"
echo "\\e[1mHostname: \\e[0;32m$(uname -n)\\e[0m"
