" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved
endif

" --------------------------------------------------------
" Plugins
" --------------------------------------------------------
call plug#begin('~/.vim/bundle')
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-sensible'
" Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
" Plug 'vim-scripts/xoria256.vim'
Plug 'itchyny/landscape.vim'
" Plug 'kien/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'shawncplus/phpcomplete.vim'
Plug 'tpope/vim-dispatch'

Plug 'kovisoft/slimv'

Plug 'tpope/vim-abolish'

" --------------------------------------------------------
" File Manager
" --------------------------------------------------------
" Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'wakatime/vim-wakatime'
Plug 'ervandew/supertab'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rstacruz/sparkup'
Plug 'Shougo/neocomplete.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-haml'
Plug 'flazz/vim-colorschemes'
Plug 'matchit.zip'
Plug 'elzr/vim-json'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'svermeulen/vim-easyclip'

Plug 'gregsexton/gitv'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'

Plug 'ap/vim-buftabline'

Plug 'christoomey/vim-tmux-navigator'


call plug#end()


" --------------------------------------------------------
" Basic Vim Configuration
" --------------------------------------------------------
" Required:
filetype plugin indent on

" Remove trailing whitespace
autocmd BufWritePre <buffer> :%s/\s\+$//e

" colorscheme xoria256
colorscheme hybrid
" set mouse=a
syntax on
set backspace=2
set tabstop=4 shiftwidth=4 expandtab
" set number relativenumber
set hidden " Move buffer without save current buffer

set showtabline=2
set laststatus=2
" let g:airline_powerline_fonts = 1
" let g:airline_theme='molokai'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'





set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8
set nowrap
map <S-Tab> >gv

map <F4> :set relativenumber!<CR>

set wildmode=longest:full,list:full


" --------------------------------------------------------
" CtrlP
" --------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" CtrlP extension
let g:ctrlp_extensions = ['funky']

" Vim EasyClip
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipAutoFormat = 1

"" --------------------------------------------------------
"" NerdTree Toggle
"" -------------------------------------------------------
" map <F2> :NERDTreeToggle<CR>
" nmap <F2> :NERDTreeTabsToggle<CR>
" imap <F2> :NERDTreeTabsToggle<CR>
" let NERDTreeQuitOnOpen = 1
" let NERDTreeStatusline = 0

"" Don't show nerdtree on macvim/gvim
" let g:nerdtree_tabs_open_on_gui_startup = 0


" --------------------------------------------------------
" VimFiler
" --------------------------------------------------------
nmap <F2> :VimFilerExplorer<CR>
imap <F2> :VimFilerExplorer<CR>

" --------------------------------------------------------
" SparkUp
" --------------------------------------------------------
" let g:sparkupExecuteMapping = <S-Space>

" --------------------------------------------------------
" SuperTab
" --------------------------------------------------------
" let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"


""""" vimbuftabline
nnoremap <C-x> :bnext<CR>
nnoremap <C-s> :bprev<CR>

"" --------------------------------------------------------
"" JSON VIM - Fix indentLine problem
"" --------------------------------------------------------
let g:indentLine_noConcealCursor="nc"



"" --------------------------------------------------------
"" Indent
"" --------------------------------------------------------
let g:indentLine_enabled = 0
nmap <F3> :IndentLinesToggle<CR>



"" --------------------------------------------------------
"" LightLine START
"" --------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"" --------------------------------------------------------
"" LightLine END
"" --------------------------------------------------------


"" --------------------------------------------------------
"" php.vim
"" --------------------------------------------------------
" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


"" --------------------------------------------------------
"" REPEAT.vim
"" --------------------------------------------------------
" Harus ada diakhir baris untuk memastikan semua sudah di-load key map-nya
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
