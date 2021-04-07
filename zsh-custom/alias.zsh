alias git=hub
alias g=git

alias external_ip="curl -s icanhazip.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# On the rare occasions I don't want to continue an interrupted download
# I can always delete the incomplete fragment explicitly. I usually just
# want to complete it.
alias wget="wget -c"
alias cd="z"

# macOS aliasses
alias flush='dscacheutil -flushcache'
# Apps
alias browse="open -a /Applications/Google\ Chrome.app"

# Alias ls commands
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'
alias lsR='ls -lhRG'

# A quick way to get out of current directory
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias home='cd ~'

alias e=$EDITOR

alias cat="bat"