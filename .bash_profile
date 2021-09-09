############################################################
#                                                          #
#               Custom bash configuration                  #
#   Note: .bash_profile for MacOS, .bashrc for GNU/Linux   #
#                                                          #
############################################################

# Set VIM as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Custom Prompt
CYAN="\[$(tput setaf 6)\]"
GRAY="\[$(tput setaf 8)\]"
RESET="\[$(tput sgr0)\]"
export PS1="\d - \@ [${CYAN}\w${RESET}]\n${GRAY}>>${RESET} "

# Custom Alias
alias web="lynx https://lite.duckduckgo.com/lite/"
alias mail="mutt"
alias news="newsboat"
alias info="screenfetch -tL"
alias chat="irssi"
alias untar="tar -xvzf"
