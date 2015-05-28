" Vundle                               
set nocompatible              " be iMproved, required 
filetype off                  " required 
                                 
" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim                              
call vundle#begin() 

" plugins
Plugin 'gmarik/Vundle.vim' 
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'                                     
Plugin 'tpope/vim-sensible'
Plugin 'slim-template/vim-slim'                   
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized' 
Plugin 'taylor/vim-zoomwin'

filetype on
call vundle#end()
" /Vundle

syntax on
filetype plugin indent on  
syntax enable   
"let base16colorspace=256
colorscheme base16-default
set background=dark
call togglebg#map("<F5>")
set tabstop=2                                                  
set shiftwidth=2                                               
set expandtab                                  
set clipboard=unnamed
set ttyfast
let mapleader = "," 
map <C-l> 5<C-w>>
map <C-h> 5<C-w><                                              
map <C-j> 3<C-w>+                                              
map <C-k> 3<C-w>-                                              
map <leader><leader> :ZoomWin<cr>
set t_Co=256

" Strip trailing whitespace                                                                                                    
function! <SID>StripTrailingWhitespaces()                                                                                      
    " Preparation: save last search, and cursor position.                                                                      
    let _s=@/                                                                                                                  
    let l = line(".")                                                                                                          
    let c = col(".")                                                                                                           
    " Do the business:                                                                                                         
    %s/\s\+$//e                                                                                                                
    " Clean up: restore previous search history, and cursor position                                                           
    let @/=_s                                                                                                                  
    call cursor(l, c)                                                                                                          
endfunction                                                                                                                    
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()                                                                    
                                                                                                                               
" show tabs                                                                                                                    
set list                                                                                                                       
set listchars=tab:>-,trail:~,extends:>,precedes:<                                                                              
                                                                                                                               
set number                                                                                                                     
