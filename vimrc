set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'wakatime/vim-wakatime'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wesQ3/vim-windowswap'
Plugin 'vim-scripts/ZoomWin'

"" VIM
Plugin 'vim-scripts/Tabmerge'
Plugin 'tpope/vim-surround'

" THeme
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rakr/vim-one'
Plugin 'gosukiwi/vim-atom-dark'

" NerdFonts
" Plugin 'ryanoasis/vim-devicons'

" Snippets
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
 
" Javascript
Plugin 'isRuslan/vim-es6'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'claco/jasmine.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lfilho/cosco.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'leshill/vim-json'
Plugin 'eduardosanzb/tagman.vim'
Plugin 'prettier/vim-prettier'
Plugin 'Galooshi/vim-import-js'

" React
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'

" Typescript
Plugin 'leafgarland/typescript-vim'


" new eslinter async
Plugin 'w0rp/ale'

"bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'chemzqm/vim-jsx-improve'

Plugin 'airblade/vim-gitgutter'

" tab to autocompletehssuggestion
Plugin 'ervandew/supertab'

" Plugin 'vim-syntastic/syntastic'

" ctrl-d of vscode
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'yegappan/mru'
call vundle#end()

filetype plugin indent on


if (has("termguicolors"))
  set termguicolors
endif

" show existing tab with 4 spaces width
set tabstop=2
" " when indenting with '>', use 4 spaces width
set shiftwidth=2
" " On pressing tab, insert 4 spaces
set expandtab
set autoindent
set smartindent
"" ctrl c to add indent automatic with delimit
imap <C-c> <CR><Esc>O

"" YCM config
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

" SnippetsConfig
" let g:UltiSnipsExpandTrigger="<c-l>"
set completeopt-=preview

set cursorline
syntax enable
set background=dark

let g:solarizaed_termicolors = 256 " New line!!
set t_Co=256
syntax on
" colorscheme PaperColor
let g:one_allow_italics = 1 " I love italic for comments
silent! colorscheme one

let NERDTreeShowLineNumbers=1

" eslint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" prettier
let g:prettier#config#bracket_spacing = 'true'

let g:ale_sign_column_always = 1

let g:syntastic_error_symbol = '❌'
let g:ale_sign_error = '❌'
let g:syntastic_style_error_symbol = '⁉️  '
let g:syntastic_warning_symbol = '⚠️  '
let g:ale_sign_warning = '⚠️ '
let g:syntastic_style_warning_symbol = '💩 '
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" vim-javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" For shrinking the code using the indentation
set foldmethod=indent
set foldlevelstart=20


" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" react
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" highlight search
set hls
nnoremap <CR> :nohlsearch<CR><CR>

" finding files
set path+=**
set wildmenu
autocmd StdinReadPre * let s:std_in=1
silent! autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | silent NERDTree | endif

let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'



" jsBeautify
map <c-f> :call JsBeautify()<cr>

" Mapping ESC in insert mode and command mode to double i
imap ii <C-[>
cmap ii <C-[>

set mouse=a


" for the bar set the eslint pedos
set laststatus=2
function! LinterStatus() 
    let l:counts = ale#statusline#Count()

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

   return l:counts.total == 0 ? 'OK' : printf(
   \   '%dW %dE',
   \   all_non_errors,
   \   all_errors
   \)
endfunction

silent! set statusline=%{LinterStatus()}


nmap <silent> <C-w> <Plug>(ale_previous_wrap)
nmap <silent> <C-s> <Plug>(ale_next_wrap)

" Remap of zoomWin
nnoremap <silent> <leader>w :ZoomWin<CR>

" Open NERDTree in the directory of the current file (or /home if no files open)
nmap <silent> <C-i> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
   " If NERDTree is open in the current buffer
   if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
   else
    exe ":NERDTreeFind"
   endif
endfunction

set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

nnoremap <leader>n :call NumberToggle()<cr>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
set backspace=indent,eol,start
