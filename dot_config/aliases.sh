# Append this to .zshrc to source aliases:
# source $HOME/.config/aliases.sh

# go to config directory
alias cdc='cd ~/.config'

# open vim config
alias nvimconf='cdc && cd ./nvim && nvim init.lua'

# directory shortcuts
alias cdp='cd ~/projects'
alias cdpk='cd ~/projects/elastic/kibana'
alias cdpt='cd ~/projects/elastic/kibana/x-pack/plugins/threat_intelligence'

# devservers
alias kibanadev='cdpk && concurrently -n "kibana,search" "yarn start" "yarn es snapshot -E path.data=/home/luke/projects/elastic/esdata"'
alias kbd='kibanadev'

# show all git changes (staged and not)
alias gdh="git diff HEAD"

# general programs
alias vim="nvim"
alias vi="nvim"
alias cal="cal -m -3"
alias nnn="nnn -dex"
alias wttr="curl wttr.in"

alias alacritty="~/.config/scripts/alacritty"

