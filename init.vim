call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'

call plug#end()

set number
set relativenumber
let mapleader = "\<Space>"

" map <C-o> :NERDTreeToggle<CR>
nnoremap <silent> <C-r> :NERDTreeFind<CR>
map ; :Files<CR>
nmap <leader>d <Plug>(ale_fix)
map <leader>r :NERDTreeFind<cr>
" autocmd! VimEnter * command! -nargs=* -complete=file AgC :call fzf#vim#ag(<q-args> {dir: '~/workspace/DataRobot/client'})

set path=.,client
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction
" set includeexpr=LoadMainNodeModule(v:fname)

syntax on
colorscheme nova

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'less': ['eslint', 'stylelint', 'prettier']
  \ }
let g:ale_lint_on_save = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent", "--no-port-file"]

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ================EASYMOTION==============

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
