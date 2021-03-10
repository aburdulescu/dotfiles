# aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias em='emacsclient -t '
alias emg='emacsclient -c '
alias time='/usr/bin/time'

# prompt
PROMPT='%F{magenta}%n%f%F{red}@%f%F{cyan}%M%f:%F{green}%~%f%# '

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
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
