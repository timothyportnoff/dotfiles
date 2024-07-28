#!/bin/bash

# List of dotfiles
DOTFILES=".bash_aliases .bashrc .vimrc .gitconfig .hushlogin"

for file in $DOTFILES; do
    if [ -f ~/$file ]; then #Checks for existing file
        echo "Backing up existing $file to $file.backup"
        mv ~/$file ~/$file.backup
    fi
    echo "Creating symlink for $file"
    ln -s ~/dotfiles/$file ~/$file
done

echo "All dotfiles have been symlinked."

#Link .vim folder for colorschemes, code complete, and more
ln -s -i ~/dotfiles/.vim/ ~/
echo "Vim folder has been symlinked."


echo "IT IS RECOMMENDED THAT YOU CHECK YOUR BACKUP FILES AND DELETE AS NECESSARY."
echo ""
