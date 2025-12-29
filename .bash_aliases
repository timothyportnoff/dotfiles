#timothyportnoff .bash_aliases

# +-----------------------------------------------------------+
# |                       Quick Access                        |
# +-----------------------------------------------------------+
#Frequently vimmed/sourced configuration files
alias sbc='source ~/.bashrc'
alias sba='source ~/.bash_aliases'
alias vvc='vim ~/.vimrc'
alias vbc='vim ~/.bashrc'
alias vba='vim ~/.bash_aliases'
alias vnc='vim ~/.config/neofetch/config.conf'

# +-----------------------------------------------------------+
# |                        Unix Aliases                       |
# +-----------------------------------------------------------+
alias htop='htop -H --tree'
alias top='htop'
#alias ls='ls --color=auto -CF --group-directories-first'
alias ll='ls -lF --almost-all'
# alias la='ls -A' #Don't show the implied .. and .
alias lsd='lsd --icon-theme unicode --group-directories-first'
alias ls='lsd --icon-theme unicode'
alias lsa='lsd --almost-all'
alias la='lsd --almost-all '

alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean'
#eval handles filenames correctly if they contain characters that might trigger an expansion, such as spaces.
alias vv='eval $(history -p !vi)'
alias bb='eval $(history -p !vi)'
alias pp='eval $(history -p !p)'
alias cls='clear'
alias cd..='cd ..'
alias m..='man'
# Makes diff readable
alias diff='diff --color=auto -u'
alias m..='man'
alias ding='tput bel'
alias ct='crontab -e'

# +-----------------------------------------------------------+
# |                       Github Aliases                      |
# +-----------------------------------------------------------+
# Regular stuff
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

# +-----------------------------------------------------------+
# |                    C++ Make Aliases                       |
# +-----------------------------------------------------------+
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

# +-----------------------------------------------------------+
# |                      Python  Aliases                      |
# +-----------------------------------------------------------+
alias py='python3'
alias act='source $(find . -type d -name "venv" | head -n 1)/bin/activate'
alias act='source $(find . -type d -name "venv" -o -name ".venv" | head -n 1)/bin/activate'
alias dact='deactivate'
alias deact='deactivate'
alias mkvenv='python3 -m venv venv/'

# +-----------------------------------------------------------+
# |                       Figlet Aliases                      |
# +-----------------------------------------------------------+
alias fire='toilet -F metal -f pagga "🔥"'
alias ice='toilet -f future --gay "❄️ ICE ❄️"'
alias hacker='toilet -f term -F border --gay "ACCESS GRANTED"'
alias doom='toilet -f smmono9 -F metal "DOOM MODE"'
alias chill='toilet -f future --gay "CHILL OUT"'
alias warp='toilet -f pagga -F border "🚀 WARP"'
alias boom='toilet -f smblock -F metal "💥 BOOM 💥"'
alias neon='toilet -f future -F border --gay "NEON"'
alias matrix='toilet -f term -F border --gay "MATRIX"'
alias boss='toilet -f bigascii9 -F metal "👑 BOSS MODE 👑"'
alias glitch='toilet -f future -F crop,rotate90 --gay "GL1TCH"'
alias fade='toilet -f pagga -F metal,crop "FADE IN"'
alias echoecho='toilet -f term -F border --filter border "ECHO"'
alias warpzone='toilet -f future -F border,metal --gay "WARP ZONE"'
alias night='toilet -f pagga -F crop,metal "🌙 NIGHT MODE 🌙"'
alias cyber='toilet -f term -F metal,crop --gay "CYBER RUN"'
alias overdrive='toilet -f smmono12 -F border,metal "OVERDRIVE"'
alias stealth='toilet -f future -F crop --filter crop "STEALTH"'
alias meltdown='toilet -f smblock -F metal,border --gay "MELTDOWN"'
alias victory='toilet -f pagga -F metal,border --gay "=== VICTORY ==="'

# +-----------------------------------------------------------+
# |                    Systemctl Aliases                      |
# +-----------------------------------------------------------+
alias jctl='sudo journalctl -u'
alias sctl='sudo systemctl'
alias sctlstart='sudo systemctl start'
alias sctlstat='sudo systemctl status'
alias sctlstop='sudo systemctl stop'
alias sctldr='sudo systemctl daemon-reload'
alias ctlstats='sudo systemctl status'
alias ctlstart='sudo systemctl start'
alias ctlreload='sudo systemctl restart'
alias ctlrestart='sudo systemctl restart'
alias ctlstop='sudo systemctl stop'
alias ctlkill='sudo systemctl stop'
alias dr='daemon-reload'

# +-----------------------------------------------------------+
# |                      NextJS Aliases                       |
# +-----------------------------------------------------------+
# Next.js scaffold
nextapp() {
  npm create next-app@latest "$1" --ts -- --tailwind --react-compiler --eslint --app --src-dir --turbopack --import-alias "@/*"
}
