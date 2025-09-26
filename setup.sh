#!/bin/bash

#Fail fast on errors, Don't crash on missing opional var, catch hidden pipeline failures.
set -euo pipefail

# List of dotfiles. Follow the pattern to add files/folders.
declare -A DOTFILES
DOTFILES=(
    [".bash_aliases"]="$HOME/"  		#Aliases
    [".bashrc"]="$HOME/"  			#Bash File
    [".vimrc"]="$HOME/" 			#Vim
    [".gitconfig"]="$HOME/" 			#Git
    [".hushlogin"]="$HOME/" 			#Silence Term MOTD
    ["config.conf"]="$HOME/.config/neofetch/" 	#You gotta have a cool terminal
    [".vim"]="$HOME/" 				#You gotta have a cool terminal
    [".inputrc"]="$HOME/" 			
)

# Make backup directory if not already made
backup_dir="backup"
if [ ! -f $backup_dir ]; then
    mkdir -p $backup_dir
    echo "Created backup directory"
fi

# Main Script - Create Symbolic Links
for file in "${!DOTFILES[@]}"; do
    # Wait so the user thinks the program does something
	sleep 0.2

    target_dir="${DOTFILES[$file]}"
    target_file="$target_dir/$(basename $file)"

    # Create target directory if it doesn't exist
    mkdir -p $target_dir

    # If a symlink already exists at target, report and skip
    if [ -L "$target_file" ]; then
        echo "Skip: ${target_file} is already a symlink -> $(readlink "$target_file")"
        continue
    fi

    # If a backup already exists, do not backup, then report and skip
    if [ -f "$backup_dir/$target_file.backup" ]; then
        echo "Skip: ${target_file} is already backed up -> $(readlink "$target_file")"
        continue
    fi

    # Check for existing file and backup if necessary
    if [ -f $target_file ]; then
        echo "Backing up existing $(basename $file) to $(basename $file).backup"
        mv $target_file "${backup_dir}/${file}.backup"
    fi

    # Create the symlink
    ln -s -f ~/dotfiles/$file $target_file
    echo "Created symlink for $file in $target_dir"
done

#Exit 
echo "Dotfiles have been symlinked. please bind or source any files needed."
echo "Have a great day :)"

# Wait so the user thinks the program does something
sleep 0.2
