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
alias kibanadev='cdpk && concurrently -n "kibana,search" "yarn start --no-base-path" "yarn es snapshot --license trial -E path.data=/home/luke/projects/elastic/esdata"'
alias kbd='kibanadev'

COVERAGE_OPTIONS="'[\"x-pack/plugins/threat_intelligence/public/**/*.ts*\"]'"

# run threat intel plugin unit tests
alias testti='cdpk && yarn test:jest x-pack/plugins/threat_intelligence --watchAll --coverage --collectCoverageFrom ${COVERAGE_OPTIONS}'

# show all git changes (staged and not)
alias gdh="git diff HEAD"
# show conflicts only
alias gsc="git diff --name-only --diff-filter=U --relative"

# general programs
alias vim="nvim"
alias vi="nvim"
alias cal="cal -m -3"
alias wttr="curl wttr.in/Katowice"

alias nnn="n"

alias alacritty="~/.config/scripts/alacritty"
