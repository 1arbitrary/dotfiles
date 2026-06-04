#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

parse_git_branch() {
    branch=$(git branch --show-current 2>/dev/null)
    [ -n "$branch" ] && printf " (%s)" "$branch"
}

PS1='\[\e[38;5;245m\][\w]\[\e[0m\]\[\e[38;5;240m\]$(parse_git_branch)\[\e[0m\]\n\[\e[38;5;255m\]  λ\[\e[0m\] '

export EDITOR="emacs"
eval "$(fzf --bash)"
