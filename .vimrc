"    __      __              __                           __                                     
"   |  \    |  \            |  \                         |  \                                    
"  _| $$_    \$$ ______ ____| $$_______        __     __  \$$ ______ ____    ______    _______   
" |   $$ \  |  \|      \    \\$/       \      |  \   /  \|  \|      \    \  /      \  /       \  
"  \$$$$$$  | $$| $$$$$$\$$$$\|  $$$$$$$       \$$\ /  $$| $$| $$$$$$\$$$$\|  $$$$$$\|  $$$$$$$  
"   | $$ __ | $$| $$ | $$ | $$ \$$    \         \$$\  $$ | $$| $$ | $$ | $$| $$   \$$| $$        
"   | $$|  \| $$| $$ | $$ | $$ _\$$$$$$\       __\$$ $$  | $$| $$ | $$ | $$| $$      | $$_____   
"    \$$  $$| $$| $$ | $$ | $$|       $$      |  \\$$$   | $$| $$ | $$ | $$| $$       \$$     \  
"     \$$$$  \$$ \$$  \$$  \$$ \$$$$$$$        \$$ \$     \$$ \$$  \$$  \$$ \$$        \$$$$$$$  
"                                                                                                
"CONTROLS ====================================================================================================   
set mouse=a 			" Enables mouse mode. Elite vim wizards do not use this. Though it may make things faster lol ┑(￣Д ￣)┍
set nocompatible 		" makes Vim behave more like the traditional Vi editor
set ai 					" Enables autoindent for when you press \<CR>

"Options for how Vim displays text: ====================================================================================================   
set cursorline! cursorcolumn! 	" Allow crosshair cursor highlighting. Press leader and c (\+c) to enable/disable
" hi CursorLine   cterm=NONE ctermbg=0 					" ^
" hi CursorColumn cterm=NONE ctermbg=0 					" ^
" hi CursorLine   cterm=NONE ctermbg=0 ctermfg=white 		" ^
" hi CursorColumn cterm=NONE ctermbg=0 ctermfg=white 		" ^

" This will make the highlighted line and column stand out more by changing the text color to white. You can also adjust the background color (ctermbg) to a darker shade to make the highlight more prominent. 
set nowrap 				" Set wraparound. Easier to read long lines of code.
set nolinebreak 		" Set linebreak. If enabled, words will not be cut off at the end of the buffer.
set bs=2 				" Enables the backspace to behave like most modern text editors. Lets you delete characters across line breaks.

"Searching
set ignorecase 					" Ignores case sensitivity when pattern searching.
set smartcase
set hls 				" Enables the highlight search feature, for visual identification.
set incsearch 	  		" Highlights incremental search matches as you type.

"Tabs
set ts=4 				" Set tab spacing.
set tabpagemax=20 		" Limits the number of maximum tabs for performance.
set sw=4 				" Set shift width for '>>' and '<<'.
set magic 				" simplifies regular expression usage by reducing the need for excessive backslashes.
set matchtime=0 		" Time in milliseconds to show matching parentheses or brackets.
set noerrorbells 		" Disable error bells.
set belloff=all 		" Turn off all bell notifications.
set vb t_vb="" 			" Disables visual bell and sets visualbell character to empty.
syntax on 				" Syntax settings.
set noscrollbind 		" Synchronizes scrolling behavior between split windows. We want this off so we can scroll windows side-by-side indepentently.
""set relativenumber 	" Jumpy line strats, show lines as [4 3 2 1 [0] 1 2 3 4].
""set nonumber 			" Set number. Show number on left side of screen.
""set expandtab 		" Changes tab to spaces.
""set undolevels=0 		" Unlimited undo levels if set to offs. If 0, Allows for undo/redo.
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"Leader keys ==================================================================================================== 
nnoremap <return> :noh<CR> 								" turns off the highlighting of the most recent search pattern
nnoremap <leader>t ^i{/* <Esc>$a */}<Esc>
noremap <Leader>c :set cursorline! cursorcolumn!<CR> 	" Allow crosshair cursor highlighting. Press leader and c (\+c) to enable/disable
" hi CursorLine   cterm=NONE ctermbg=0 					" ^
" hi CursorColumn cterm=NONE ctermbg=0 					" ^
noremap <Leader>s :wqa<CR> 								" Quick write quit all. TODO: Useless
noremap <Leader>sn :set number!<CR> 					" Show line numbers numerically
noremap <Leader>rn :set relativenumber!<CR> 			" Show lune numbers as distances from current line.
noremap <Leader>w :set linebreak! wrap!<CR>   			" Set/Unset line wraparound. linebreak! causes words to not be sliced, and !wrap causes the words to be sliced in half
"Python for loop
nnoremap <leader>pf o
			\ for i in each:<CR>
"C++ for loop
nnoremap <leader>cf o
			\ for (size_t i = 0; i < count; i++) { <CR><CR>
			\<Esc>i}<Esc>==ki
"Python main function
nnoremap <leader>pm o
			\#Execute if not imported as module<CR>
			\if __name__ == "__main__":<Esc>
"C++ main function
nnoremap <leader>cm o
			\#include <iostream><CR>
			\#include <cstdlib><CR>
			\int main(int argc, char* argv[]) {<CR>
			\const int num_arguments = 2;<CR>
			\if (argc < num_arguments or argc > num_arguments) {<CR>
			\std::cout << "Insufficient command-line arguments provided." << std::endl;<CR>
			\exit(1);<CR>
			\}<CR>
			\int argument_to_integer = std::atoi(argv[1]); //Will convert a string to 0<CR>
			\std::cout << "Argument: " << argument_to_integer << std::endl;<CR>
			\return 0;<CR>
			\}<Esc>

"Let numpad work with PuTTY
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -

" Vim mods for Auto-Completion ====================================================================================================
"execute pathogen#infect()
""hi Pmenu guibg=#27272 " TODO this might be for for Conqueror of completion, highlights a popupmenu to be black
" Enables Supertab.
let g:SuperTabDefaultCompletionTypeDiscovery = [
			\ "&completefunc:<c-x><c-u>",
			\ "&omnifunc:<c-x><c-o>",
			\ ]
let g:SuperTabLongestHighlight = 1

" Vim mods ====================================================================================================
" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END
	au FileType c,cpp setlocal comments-=:// comments+=f://
	au BufRead,BufNewFile *.s set filetype=nasm
endif " has("autocmd")

"Colors ==================================================================================================== 

"PHase one: Choose the color scheme beforehand and enables colors
"set termguicolors "Turns on 24-bit colors, 
" set background=dark " /light

"Phase 2: Choose Colorscheme Most commonly uses colorschemes:
" colorscheme hemisu
" colorscheme ayu
" colorscheme one 
" colorscheme jellybeans 
" colorscheme paramount 
"colorscheme molokai
" colorscheme onehalfdark
" colorscheme gruvbox
" colorscheme nord
" colorscheme seoul256
" colorscheme desert
" colorscheme hybrid
" colorscheme lucius

" Phase 3: Force Delete GUI and CTERM background of Normal group for a dark terminal
hi Normal guibg=NONE ctermbg=NONE ctermfg=NONE 

" Phase 4: Create function to clear background and call it
let t:is_transparent = 1
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <Leader>b : call Toggle_transparent()<CR>
call Toggle_transparent()
autocmd VimEnter * call Toggle_transparent()
"End ==================================================================================================== 

runtime! ftplugin/man.vim

"Allows for OpenAI integration with :AI in Vim
let g:vim_ai_token_file_path = '~/.config/openai.token'

"Vim Plug mod manager
"call plug#begin()

" List your plugins here
"Plug 'tpope/vim-sensible'
"Plug 'madox2/vim-ai'
" Plug 'mattn/emmet-vim'

"call plug#end()

"" Set leader key (if not already)
let mapleader = "\\"

" Leader-c: wrap current line in JSX comment {/* */}
nnoremap <leader>t ^i{/* <Esc>$a */}<Esc>

" Leader-y: remove JSX comment
nnoremap <leader>y :s/^\s*{\/*\s*\(.*\)\s*\*\/}$/\1/<CR>
inoremap jk <Esc>
