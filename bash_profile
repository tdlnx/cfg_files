source ~/.profile
# This is specifically for MacOS

# Colors
BLUE="\[$(tput setaf 4)\]"
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

export PS1="\d - \@ [${BLUE}\w${RESET}]\n${YELLOW}>${RESET} "
export CLICOLOR=1

# Aliases

alias ls='ls -pFh'
alias web='lynx https://lite.duckduckgo.com/lite/'
alias edit='nano'
