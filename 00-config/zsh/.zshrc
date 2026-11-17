eval "$(/opt/homebrew/bin/brew shellenv)"

setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

autoload -Uz compinit
compinit

alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias cat='bat'
alias lg='lazygit'

lt() {
  local level=2
  if [[ "$1" == <-> ]]; then
    level="$1"
    shift
  fi
  eza --tree --level="$level" "$@"
}

export BAT_PAGING=never

source <(fzf --zsh)
eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
