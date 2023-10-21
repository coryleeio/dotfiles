#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias work='cd ~/Workspace/coryleeio/Scratch'
alias docker='sudo docker'
alias kind='sudo kind'
alias kubectl='sudo kubectl'
alias linkerd='sudo linkerd'
alias x='git add --all && ( git commit -am "Iterating..." || git status --porcelain ) && git fetch && git rebase && git push'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/coryl/.linkerd2/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
. "$HOME/.cargo/env"
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

exec zsh
