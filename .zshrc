############################################################
#                                                          #
#                Custom ZSH configuration                  #
#   Note: .bash_profile for MacOS, .bashrc for GNU/Linux   #
#                                                          #
############################################################

# Set VIM as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Prompt
NEWLINE=$'\n'
PS1="%D{%a %b %d} - %D{%I:%M %p} [%F{038}%~%f]${NEWLINE}>> "

# Custom Alias
# alias web="lynx https://lite.duckduckgo.com/lite/"
alias web="w3m duckduckgo.com"
alias mail="mutt"
alias news="newsboat"
alias info="screenfetch -tL && fortune"
alias chat="irssi"
alias untar="tar -xvzf"
alias todo="todo.sh -tNA"
alias done="vim ~/Dropbox/todo/done.txt"
alias find="fzf --border=sharp --margin=1,2,1,2"
alias calsync="vdirsyncer -v ERROR  sync"
alias cal="calsync && khal calendar"
alias fullcal="calsync && khal interactive"
alias contacts="khard"
alias source="cd ~/Documents/Source"
alias wikiupdate="cd ~/.vimwiki && git add . && git commit -m \"update\" && git push -u && cd"

# Auto start tmux if it isn't running
if ! pgrep -u $USER tmux >/dev/null 2>&1; then
  exec tmux
fi

