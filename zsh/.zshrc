# aliases
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias l='ls -lah --color=auto'
alias grep='grep --color=auto'
alias em='emacsclient -t '
alias emg='emacsclient -c '
alias time='/usr/bin/time'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias screencast='~/.files/scripts/screencast.sh'

# prompt
PROMPT='%F{red}%#%f '

# history
setopt histignorealldups sharehistory
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# autocomplete
autoload -Uz compinit
compinit

# autocomplete: navigable list of options
zstyle ':completion:*' menu select

# autocomplete: also aliases
setopt COMPLETE_ALIASES

# autocomplete: up/down arrow
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# ctrl-left/ctrl-right arrow goes back/forward one word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
