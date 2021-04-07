alias git=hub
alias g=git

alias external_ip="curl -s icanhazip.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# On the rare occasions I don't want to continue an interrupted download
# I can always delete the incomplete fragment explicitly. I usually just
# want to complete it.
alias wget="wget -c"