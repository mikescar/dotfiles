" Modeline and Notes
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" Parts taken from https://github.com/spf13/spf13-vim/

" GUI preferences
set nocompatible	" do not use vi compatibility mode; must be first line
set background=dark	" Assume a dark background
"color solarized	" Color Scheme
set showmatch		" show matching brackets and parenthesis
set nu				" show line numbers (:set nonu to turn off)
set showmode		" display current mode
set ruler			" show the ruler

" Filetypes
scriptencoding utf-8
syntax on					" syntax highlighting
filetype plugin indent on	" Automatically detect file types.

" Backup and undo
set backup			" enable backups
set undofile		" enable persistent undo
set undolevels=1000	" maximum number of changes that can be undone
set undoreload=10000	" maximum number lines to save for undo on a buffer reload

" Search options
set incsearch		" find as you type search
set hlsearch		" highlight search terms
set ignorecase		" case insensitive search
set smartcase		" case sensitive search when uppercase present

" Formatting
set autoindent		" indent at the same level of the previous line
set shiftwidth=4	" use indents of 4 spaces
set tabstop=4		" an indentation every four columns
set softtabstop=4 	" let backspace delete indent
"set expandtab 	 	" tabs are spaces, not tabs

" Editing
" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" ctags: look in the current directory for 'tags', and work up the tree towards root until one is found.
set tags=./tags;/,$HOME/.vimtags
" C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Autocmd actions
autocmd BufWritePre * :%s/\s\+$//e	" remove trailing whitespace on save

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
