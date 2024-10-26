##########################################################
#timothyportnoff .bash_aliases
#This one doesn't have a cool figlet/toilet like my .vimrc... ToT
##########################################################

#Frequently vimmed/sourced configuration files
alias sbc='source ~/.bashrc'
alias sba='source ~/.bash_aliases'
alias vvc='vim ~/.vimrc'
alias vbc='vim ~/.bashrc'
alias vba='vim ~/.bash_aliases'
alias vnc='vim ~/.config/neofetch/config.conf'

# Unix Aliases  
alias htop='htop -H --tree'
alias top='htop'
alias ls='ls --color=auto -CF --group-directories-first'
alias ll='ls -lF --almost-all'
# alias la='ls -A' #Don't show the implied .. and .
alias lsd='lsd --total-size --sort size --blocks permission,size,git,name --group-directories-first --icon-theme unicode'
alias ls='lsd'
alias la='lsd --almost-all'
alias lsa='lsd --almost-all'
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean'
#eval handles filenames correctly if they contain characters that might trigger an expansion, such as spaces.
alias vv='eval $(history -p !vi)'
alias bb='eval $(history -p !vi)'
alias pp='eval $(history -p !p)'
alias cls='clear'
alias cd..='cd ..'
alias m..='man'

#Github aliasing
alias ga='git add'
alias gd='git diff'
alias gf='git fetch'
alias gc='git commit'
alias gs='git status'
alias gsp='git status --porcelain'
alias gcl='git clone'
alias gpl='git pull'
alias gcm='git commit -m'
alias gps='git push'
alias gch='git checkout'
alias gch='git checkout'

#Branches
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gbv='git branch -v'
alias gbd='git diff $1:main.py $2:main.py'
alias gbav='git branch -av'
alias gbva='git branch -va'

#C++/Makefile aliases
# I use the -j8 flag to use all cores on my Raspberry Pi
alias mk='make -j8'
alias make='make -j8'
alias makew='mk' #fucked up hot dog finger aliases
alias makee='mk'
alias amke='mk'
alias maek='mk'
alias amek='mk'
alias amke='mk'
alias gg='eval $(history -p !g++)'
alias 'g++'='g++ -std=c++20'
alias a='./a.out'

#Python aliases 
alias py='python3'
alias act='source $(find . -type d -name "venv" | head -n 1)/bin/activate'
alias act='source $(find . -type d -name "venv" -o -name ".venv" | head -n 1)/bin/activate'
alias dact='deactivate'
alias deact='deactivate'
alias mkvenv='python3 -m venv venv/'

#Cronjobs
alias ct='crontab -e'

#Miscellaneous 
alias print='lpadmin --help'
alias ding='tput bel'
