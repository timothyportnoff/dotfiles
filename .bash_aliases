################################################################
#
#timothyportnoff
#
################################################################

#Some ls aliases
alias ll='ls -alF'
alias la='ls -A' #Don't show the implied .. and .
# alias ls='ls --color=auto -CF'
alias ll='ls -lAh'

#LSD aliases
alias lsd='lsd --icon-theme unicode --total-size -A --gitsort --long --git --blocks permission,size,git,name'
alias ls=lsd

#Quick sourcing for configuration files
alias sbc='source ~/.bashrc'
alias sba='source ~/.bash_aliases'

#Quick vimming to configuration files
alias vvc='vim ~/.vimrc'
alias vbc='vim ~/.bashrc'
alias vba='vim ~/.bash_aliases'
alias vnc='vim ~/.config/neofetch/config.conf'

#Running things
alias a='./a.out'

#Unix aliases
#alias vv='!v?'
#Why's this shit gotta be so difficult?? 
#eval handles filenames correctly if they contain characters that might trigger an expansion, such as spaces.
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean'
alias vv='eval $(history -p !vi)'
alias bb='eval $(history -p !vi)'
alias pp='eval $(history -p !p)'
alias cls='clear'
alias cd..='cd ..'
alias m..='man'


#Github aliases
alias ga='git add'
alias gf='git fetch'
alias gc='git commit'
alias gs='git status'
alias gsp='git status --porcelain'
alias gcl='git clone'
alias gcm='git commit -m'
alias gps='git push'
alias gch='git checkout'
alias gch='git checkout'
# complete -F _git_checkout gch
# _git_checkout() {
#     COMPREPLY=()
#     local cur=${COMP_WORDS[COMP_CWORD]}
#     local branches

#     # Use git branch to fetch a list of branches
#     branches=$(git branch 2>/dev/null)

#     # Remove the asterisks and leading spaces from the branch names
#     branches=${branches//\* /}

#     # Generate completion options from the list of branches
#     COMPREPLY=($(compgen -W "$branches" -- $cur))

#     return 0
# }
#Branches
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gbv='git branch -v'
alias gbd='git diff $1:main.py $2:main.py'
alias gbav='git branch -av'
alias gbva='git branch -va'

#Make aliases
alias mk='make -j8'
alias make='make -j8'
#I don't know how many times I've fucked up make, so these aliases are for my hot dog fingers
alias makew='make -j8'
alias amke='make -j8'
alias maek='make -j8'

#Python aliases 
alias py='python3'
alias act='source $(find . -type d -name "venv" | head -n 1)/bin/activate'
alias act='source $(find . -type d -name "venv" -o -name ".venv" | head -n 1)/bin/activate'
alias dact='deactivate'
alias deact='deactivate'
alias mkvenv='python3 -m venv venv/'


#Cronjobs
alias ct='crontab -e'

#C++ Compiler aliases
alias gg='eval $(history -p !g++)'
alias g++='g++ -std=c++20'

#Miscellaneous 
alias print='lpadmin --help'
alias ding='tput bel'
