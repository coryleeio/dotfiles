#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ranger='. ranger'
alias work='cd ~/Workspace/coryleeio/scratch && git status'
alias dot='cd ~/Workspace/coryleeio/dotfiles && git status'
alias x='git add --all && ( git commit -am "Iterating..." || git status --porcelain ) && git fetch && git rebase && git push'
alias ws='cd ~/Workspace/coryleeio/scratch/ && x && ../scripts/upload-files-state && ../scripts/reset-files-state'
alias codex='a'

# Function for amp with meta prompt
a() {
  if [ $# -eq 0 ]; then
    echo "Usage: a \"your input here\""
    return 1
  fi
  (
    cat "/Users/coryl/Workspace/coryleeio/scratch/3-resources/prompts/meta prompt.md"
    echo "$*"
  ) | amp visibility private
}

# Function for claude with meta prompt
c() {
    local META_PROMPT="/Users/coryl/Workspace/coryleeio/scratch/3-resources/prompts/meta prompt.md"
    if [ $# -eq 0 ]; then
        claude --append-system-prompt "$(cat "$META_PROMPT")" --dangerously-skip-permissions
    else
        claude --append-system-prompt "$(cat "$META_PROMPT")" --dangerously-skip-permissions "$*"
    fi
}

# Function for safe claude (prompts for permissions)
cs() {
    local META_PROMPT="/Users/coryl/Workspace/coryleeio/scratch/3-resources/prompts/meta prompt.md"
    if [[ "$(uname)" == "Linux" ]]; then
        if [ $# -eq 0 ]; then
            opencode --agent codex
        else
            opencode run --agent codex "$*"
        fi
    else
        if [ $# -eq 0 ]; then
            claude --append-system-prompt "$(cat "$META_PROMPT")"
        else
            claude --append-system-prompt "$(cat "$META_PROMPT")" "$*"
        fi
    fi
}

export PATH=${PATH}:~/Workspace/coryleeio/scripts/
export PATH=${PATH}:~/.local/bin/

eval "$(direnv hook bash)"

# BEGIN env Setup -- Managed by Ansible DO NOT EDIT.

# Setup INDEED_ENV_DIR earlier.
if [ -z "${INDEED_ENV_DIR}" ]; then
    export INDEED_ENV_DIR="/Users/coryl/env"
fi

# Single-brace syntax because this is required in bash and sh alike
if [ -e "${INDEED_ENV_DIR}/etc/indeedrc" ]; then
    . "${INDEED_ENV_DIR}/etc/indeedrc"
fi
# END env Setup -- Managed by Ansible DO NOT EDIT.

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/coryl/.lmstudio/bin"
# End of LM Studio CLI section

. "$HOME/.cargo/env"

# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_BASH_SETUP_PATH=/Users/coryl/Library/Caches/@asyncapi/cli/autocomplete/bash_setup && test -f $ASYNCAPI_AC_BASH_SETUP_PATH && source $ASYNCAPI_AC_BASH_SETUP_PATH # asyncapi autocomplete setup
