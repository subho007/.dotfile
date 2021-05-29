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
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
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

# use default mouse scroll as pager
export BAT_PAGER="less -RF"
export BAT_THEME="dracula"
alias cat="bat"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

alias reload="exec zsh"

alias androidndk-reinstall=androidndk-install
alias androidsdk-reinstall=androidsdk-install