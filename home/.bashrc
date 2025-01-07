export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type file --color=always --exclude .git'
export FZF_DEFAULT_OPTS=--ansi
export PATH=$HOME/.local/bin:$PATH
unset MAILCHECK
# If not running interactively, don't do anything
[[ $- == *i* ]] || return
# configure vi mode
set -o vi
bind '"jj":"\e"'
tabs -4
bind 'set completion-ignore-case on'
# source /nix/store/1syl5xzjlyld9sa8h29d5nlz6pnqabb1-complete-alias-1.18.0/bin/complete_alias
source "$HOME/.dotfiles/bashscripts/.bashrc"
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return
HISTCONTROL=ignoreboth
HISTFILE="$HOME/.bash_history2"
HISTFILESIZE=-1
HISTSIZE=-1

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias add='git add'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e ";\";";s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//";\";";)"'
alias cd-='cd -'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cdr='cd `git rev-parse --show-toplevel 2> /dev/null || echo '\''.'\''`'
alias ci='git commit'
alias cls=clear
alias co='git checkout'
alias dif='git diff'
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fixup='git fixup'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='eza --long --group --all --all --group-directories-first --hyperlink'
alias log='git log'
alias ls='ls --color=auto'
alias pull='git pull'
alias push='git push'
alias pushf='git push --force-with-lease'
alias pushsync='git push --set-upstream origin `git rev-parse --abbrev-ref HEAD`'
alias st='git status'
alias toyaml='bat --language yaml'

# if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
#   . "/nix/store/jci43piznjvglwnvnsv61a3a9zkxvjn0-bash-completion-2.15.0/etc/profile.d/bash_completion.sh"
# fi

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
eval "`zoxide init bash`"
# source /nix/store/qb76l3bdjlld3xdvr2clbqwsi8l1rh5j-fzf-0.57.0/share/fzf/key-bindings.bash
# source /nix/store/qb76l3bdjlld3xdvr2clbqwsi8l1rh5j-fzf-0.57.0/share/fzf/completion.bash
# auto complete all aliases
# complete -F _complete_alias "${!BASH_ALIASES[@]}"

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init bash --print-full-init)"
fi

