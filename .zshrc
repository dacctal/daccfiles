# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dacc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

EDITOR=nvim

PROMPT='%F{yellow}%~%f > '

fastfetch
echo ""

# my aliases
alias nv='nvim'
alias ls='eza --icons=always'
alias grep='grep --color=auto'
alias scsh='grim -g "$(slurp)" - | wl-copy'
alias ff='fastfetch'
alias dark='sudo ddcutil setvcp 10 5 --display 2 & sudo ddcutil setvcp 10 5 --display 1;'
alias bright='sudo ddcutil setvcp 10 100 --display 2 & sudo ddcutil setvcp 10 100 --display 1;'
alias kys='exit'

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
