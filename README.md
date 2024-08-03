# dotfiles
## How to do it:
Run the following:
```bash
./start.sh
```

## How to change it:
The BEST dotfiles are alwways dotfiles that have your own personal touch - just replace any of the files in here with your own .dotfiles.
Edit the file in your favorite text editor:
```bash
vim setup.sh
```
At the top of the file, edit/add the name at the top of your .dotfile:
```bash
DOTFILES=(
    [".bash_aliases"]="$HOME/"
    [".bashrc"]="$HOME/"
    [".vimrc"]="$HOME/"                    
    ...
    ...*more .dotfiles*
    ...
    )

```
Folders can be added as well. Just specify the name of the folder.

## What else?
You may need to add color schemes in the `dotfile/.vim/` direcory for Vim to recognize your colors.

You may also want to specify which Vim plugins you're young to be using. I currently use autocompletion and AI.

## Why it's so good:
Having a folder like this is crucial to own for anyone that uses any of these dotfiles.
By editing symbolic links to a centralized repo, you can back up your config at any time and deploy it on another system.
