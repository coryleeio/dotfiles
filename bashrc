#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias work='cd ~/Workspace/coryleeio/Scratch && git status'
alias dot='cd ~/Workspace/coryleeio/dotfiles && git status'
alias x='git add --all && ( git commit -am "Iterating..." || git status --porcelain ) && git fetch && git rebase && git push'
alias ws='work && x && ./Scripts/upload-files-state && ./Scripts/reset-files-state'
alias vim="nvim"

#
eval "$(direnv hook bash)"

# BEGIN env Setup -- Managed by Ansible DO NOT EDIT.

# Setup INDEED_ENV_DIR earlier.
if [ -z "${INDEED_ENV_DIR}" ]; then
    export INDEED_ENV_DIR="/opt/indeed/env"
fi

# Single-brace syntax because this is required in bash and sh alike
if [ -e "${INDEED_ENV_DIR}/etc/indeedrc" ]; then
    . "${INDEED_ENV_DIR}/etc/indeedrc"
fi
# END env Setup -- Managed by Ansible DO NOT EDIT.
