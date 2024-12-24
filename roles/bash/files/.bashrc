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

alias emacs="emacsclientw"
alias em=emacs

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
#
eval "$(direnv hook bash)"

