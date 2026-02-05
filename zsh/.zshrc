EDITOR='emacs'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

autoload -Uz compinit promptinit
compinit
promptinit

prompt redhat

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'


source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source <(sk --shell zsh)
source ~/key-bindings.zsh
source ~/completion.zsh 

# bun completions
[ -s "/home/dot/.bun/_bun" ] && source "/home/dot/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
