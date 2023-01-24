# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias clone='git clone'
alias status='git status'
alias commit='git commit -a -m'
alias addall='git add .'
alias fetch='git fetch'
alias pull='git pull'
alias push='git push'
alias gitsend='git add . && git commit -m "automated commit" && git push'

# power
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot'

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias cdown='cd $HOME/Downloads'
alias cdocs='cd $HOME/Documents'
alias cdp='cd $HOME/projects'
alias cdla='cd $HOME/aufgaben/lineare-algebra-1/'
alias cdan='cd $HOME/aufgaben/analysis-1/'
alias cdpi='cd $HOME/aufgaben/praktische-informatik/'

# vim
alias :q='exit'
alias :wq='exit'

# emacs
alias nem='emacs -nw'

# scripts
alias keysh='$HOME/.config/scripts/keymaps'
alias updots='$HOME/.config/scripts/update_dotfiles.sh'
alias pushdots='$HOME/.config/scripts/push_dotfiles.sh'
alias apdate='sudo apt update && sudo apt upgrade && sudo apt autoremove'
