if status is-interactive
  # commands to run in interactive sessions can go here

  # aliases
  alias nv='nvim'
  alias ls='eza --icons=always'
  alias grep='grep --color=auto'
  alias scsh='grim -g "$(slurp)" - | wl-copy'
  alias ff='fastfetch'
  alias dark='sudo ddcutil setvcp 10 5 --display 2 & sudo ddcutil setvcp 10 5 --display 1;'
  alias bright='sudo ddcutil setvcp 10 100 --display 2 & sudo ddcutil setvcp 10 100 --display 1;'
  alias kys='exit'
end



# yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi --cwd-file="$tmp" $argv
    if test -s "$tmp"
        if test -n (cat -- "$tmp") -a (cat -- "$tmp") != (pwd)
            cd -- (cat -- "$tmp")
        end
    end
    rm -f -- "$tmp"
end
