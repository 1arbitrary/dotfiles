#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias tp-off='hyprctl keyword device[pnp0c50:00-04f3:30aa-touchpad]:enabled false'
alias tp-on='hyprctl keyword device[pnp0c50:00-04f3:30aa-touchpad]:enabled true'

eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS_FILE=~/.fzfrc
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_CTRL_T_OPTS='
  --walker-skip .git,node_modules,target
  --preview "file --mime {} | grep -q binary && echo \"Binary file\" || bat -n --color=always {}"
  --bind "ctrl-/:change-preview-window(down|hidden|)"
  --bind "ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up"
'

export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

export FZF_ALT_C_OPTS='
  --preview "tree -C {} | head -200"
'

