#!/bin/bash

# List of dotfiles. Follow the pattern to add files/folders.
declare -A DOTFILES
DOTFILES=(
    [".bash_aliases"]="$HOME/"  					#Aliases
    [".bashrc"]="$HOME/"  						#Bash File
    [".vimrc"]="$HOME/" 							#Vim
    [".gitconfig"]="$HOME/" 						#Git
    [".hushlogin"]="$HOME/.hushlogin" 						#Silence Term MOTD
    ["config.conf"]="$HOME/.config/neofetch/" 	#You gotta have a cool terminal
    [".vim"]="$HOME/" 	#You gotta have a cool terminal
)

# Main Script - Create Symbolic Links
for file in "${!DOTFILES[@]}"; do
    target_dir="${DOTFILES[$file]}"
    target_file="$target_dir/$(basename $file)"

    # Create target directory if it doesn't exist
    mkdir -p $target_dir

    # Check for existing file and backup if necessary
    if [ -f $target_file ]; then
        echo "Backing up existing $(basename $file) to $(basename $file).backup"
        mv $target_file $target_file.backup
    fi

    # Create the symlink
    echo "Creating symlink for $file in $target_dir"
    ln -s -f ~/dotfiles/$file $target_file
done
echo "All dotfiles have been symlinked."

#Exit 
echo "IT IS RECOMMENDED THAT YOU CHECK YOUR BACKUP FILES AND DELETE AS NECESSARY."
echo "Have a great day :)"
