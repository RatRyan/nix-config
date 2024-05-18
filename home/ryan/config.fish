if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    set o (set_color blue)
    set m (set_color magenta)
    set i (set_color cyan)

    set user (whoami)
    set host (prompt_hostname)

    echo '                 '$o'___
  ___======____='$m'-'$i'-'$m'-='$o')
/T            \_'$i'--='$m'=='$o')    '$user(set_color normal)'@'$o$host'
'\[' \ '$m'('$i'O'$m')   '$o'\~    \_'$i'-='$m'='$o')'$m'    Women fear me, Fish fear me,
 \      / )J'$m'~~    '$o'\\'$i'-='$o')'$m'    Men turn their eyes away from me
  \\\\___/  )JJ'$m'~'$i'~~   '$o'\)     
   \_____/JJJ'$m'~~'$i'~~    '$o'\\
   '$m'/ '$o'\  '$i', \\'$o'J'$m'~~~'$i'~~     '$m'\\
  (-'$i'\)'$o'\='$m'|'$i'\\\\\\'$m'~~'$i'~~       '$m'L_'$i'_
  '$m'('$o'\\'$m'\\)  ('$i'\\'$m'\\\)'$o'_           '$i'\=='$m'__
   '$o'\V    '$m'\\\\'$o'\) =='$m'=_____   '$i'\\\\\\\\'$m'\\\\
          '$o'\V)     \_) '$m'\\\\'$i'\\\\JJ\\'$m'J\)
                      '$o'/'$m'J'$i'\\'$m'J'$o'T\\'$m'JJJ'$o'J)
                      (J'$m'JJ'$o'| \UUU)
                       (UU)'(set_color normal)
end

# Alias
alias ls="exa -l --icons"
alias ga="git add ."
alias gp="git push"
alias gg="lazygit"
alias neofetch="neofetch --source ~/.config/neofetch/forthehorde.txt"

bind \cz 'fg 2>/dev/null; commandline -f repaint'

# Constants
set -gx EDITOR nvim
set --universal FZF_DEFAULT_COMMAND 'fd'

# Init bruv bo'oh'o'wa'er
starship init fish | source
zoxide init fish | source
direnv hook fish | source

# Binaries
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
