# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

random_prompt_color() {
	r=$[$RANDOM%7+1]
	if [[ "$r" == "$last_term_color" ]]; then
		r="$(random_prompt_color)"
		if [[ "$r" == "$last_term_color" ]]; then
			r="$(random_prompt_color)"
		fi
    else
		last_term_color="$r"
		echo "$r"
    fi
}

bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=25
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
	case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac

	# unsets color to term's fg color
	local NONE="\[\033[0m\]"    
	
	# regular colors
	local K="\[\033[0;30m\]"    # black
	local R="\[\033[0;31m\]"    # red
	local G="\[\033[0;32m\]"    # green
	local Y="\[\033[0;33m\]"    # yellow
	local B="\[\033[0;34m\]"    # blue
	local M="\[\033[0;35m\]"    # magenta
	local C="\[\033[0;36m\]"    # cyan
	local W="\[\033[0;37m\]"    # white
	local OR="\[\033[38;2;255;165;0m"    # Orange
	local X1="\[\033[38;2;238;229;233m\]"
	local X2="\[\033[38;2;128;237;153m\]"
	local X3="\[\033[38;2;70;99;101m\]"


	# emphasized (bolded) colors
	local EMK="\[\033[1;30m\]"
	local EMR="\[\033[1;31m\]"
	local EMG="\[\033[1;32m\]"
	local EMY="\[\033[1;33m\]"
	local EMB="\[\033[1;34m\]"
	local EMM="\[\033[1;35m\]"
	local EMC="\[\033[1;36m\]"
	local EMW="\[\033[1;37m\]"

	# background colors
	local BGK="\[\033[40m\]"
	local BGR="\[\033[41m\]"
	local BGG="\[\033[42m\]"
	local BGY="\[\033[43m\]"
	local BGB="\[\033[44m\]"
	local BGM="\[\033[45m\]"
	local BGC="\[\033[46m\]"
	local BGW="\[\033[47m\]"

	#Quick-change colors:
	local C1=$EMW 				# Primary color
	local C2=$G 				# Secondary color
	local C3=$G 				# Secondary color
	local UC=$G                 # user's color
	[ $UID -eq "0" ] && UC=$R   # root's color
	
	#Prompt Options:
	#1 - Orange 50/50
    #PS1='\[\033[38;5;208m\]╭─\[\033[38;5;215m\]\u\[\033[38;5;208m\]@\[\033[38;5;215m\]\h\[\033[38;5;208m\]╮\[\033[38;5;215m\] \[\033[38;5;226m\]\w\[\033[38;5;215m\]\n\[\033[38;5;208m\]╰─\[\033[38;5;15m\]$\[\033[0m\] '
	#2 - Orange 40/60
    #PS1='\[\033[38;5;214m\]╭─\[\033[38;5;208m\]\u\[\033[0m\]@\[\033[38;5;208m\]\h\[\033[38;5;214m\]─\[\033[38;5;220m\][\[\033[38;5;117m\]\w\[\033[38;5;220m\]]\n\[\033[38;5;214m\]╰─\[\033[0m\]» '
	#3 - Rainbow puke
	#PS1='\[$(tput setaf $(random_prompt_color))\]${debian_chroot:+($debian_chroot)}\u\[$(tput setaf $(random_prompt_color))\]@\[$(tput setaf $(random_prompt_color))\]\h\[$(tput setaf $(random_prompt_color))\]\[$(tput rev)\]:\w\$\[$(tput sgr0)\] '
	#4 - ??????????
    #PS1='\[\033[38;5;214m\]╭─\[\033[0m\]\u\[\033[38;5;208m\]@\[\033[0m\]\h\[\033[38;5;214m\]─\[\033[38;5;220m\][\[\033[38;5;117m\]\w\[\033[38;5;220m\]]\n\[\033[38;5;214m\]╰─> \[\033[0m\]'
	#Else make it like super boring...
	#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	#5 - The original
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	#6 - My Personal favorite, but has a strange buffer bug when using up and down keys?
	PS1="$TITLEBAR${EMK}[${UC}\u${EMK}@${UC}apollo ${EMB}\w${EMK}]${UC}\\$ ${NONE}"
	#7 - White timothy, blue timothyportnoff.com
	# PS1="$TITLEBAR${EMK}[${W}timothy${EMK}@${EMB}timothyportnoff.com ${EMB}\w${EMK}]${UC}\\$ ${NONE}"

	#This promptis 
    # PS1='\[\033[38;5;214m\]\[\033[0m\]\u\[\033[38;5;208m\]@\[\033[0m\]\h\[\033[38;5;214m\] \[\033[38;5;220m\][\[\033[38;5;117m\]\w\[\033[38;5;220m\]]\[\033[38;5;214m\]$ \[\033[0m\]'
    # PS1='${B}\u${EMB}@\h\[─[\w]\n > '
	# PS1='${X1}<${X3}\u${X1}@${X3}\h${X1}> ${X1}${X2}\w ${X1}\$ '
	#PS1='\u@\h:\w\$ '
}

#PROMPT_COMMAND=
bash_prompt_command; unset bash_prompt_command;
bash_prompt; unset bash_prompt;

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable automatic color support by adding handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions stored in # ~/.bash_aliases
# You may want to put all your additions into a separate file like
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#The Binding of Input
export INPUTRC="$HOME/.inputrc"

#Editor settings
#set -o vi 		#Sets Vi Mode (Vim) in the terminal
set nocaseglob 		#Matches filenames in a case-insensitive fashion when globbing.
set -o noclobber 	#Prevents overwriting files via redirection.
set -o nounset 		#Treats unset variables as an error when substituting.

#Set neofetch for terminal 
#clear #clear the screen for neo
#neofetch --ascii "$(fortune | cowsay -W 30 -s)"
#Do the neofetch super minimal and then run a cowsay.
~/./neofetch_minimal && ~/./.cow-nfig

# List important services 
echo -e "\n\e[1;34m[ Service Status Overview ]\e[0m"

# List of services to check
services=(
  "cvin.service"
  "cvin-dev.service"
  "home.service"
  "dev.service"
  "nginx"
  "perlite"
)

for service in "${services[@]}"; do
  # Check if it's a systemd unit or a process
  if systemctl list-units --type=service --all | grep -q "$service"; then
    status=$(systemctl is-active "$service")
    if [ "$status" = "active" ]; then
      echo -e " \e[32m✔  $service is running\e[0m"
    else
      echo -e " \e[31m✖  $service is $status\e[0m"
    fi
  else
    # fallback to pgrep for non-systemd services
    if pgrep -x "$service" >/dev/null 2>&1; then
      echo -e " \e[32m✔  $service process found\e[0m"
    else
      echo -e " \e[31m✖  $service not found\e[0m"
    fi
  fi
done

# Show the directory, this is an alias from .bash_aliases
#ls
echo -e "\n\e[1;34m[ Directory ]\e[0m"
ls
echo
