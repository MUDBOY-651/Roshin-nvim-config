set nocompatible
"set clipboard=unnamed
"set mouse=nicr
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set expandtab
set tw=0
set indentexpr=
set backspace=indent,eol,start
set laststatus=2
set autochdir
set autoread
set autoindent
set scrolloff=5

syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
"set relativenumber
set nowrap
"set hlsearch
"exec "nohlsearch"
set incsearch



vnoremap <C-c> "+y
vnoremap <C-v> "+p
let mapleader = "\<Space>"
" map W :update<CR>
map Q :q<CR>
" copy and paste
map cp <ESC>gg0vG$"+y<ESC>gg0 
map zt <ESC>gg0vG$"+p<ESC>gg0
map R :source $MYVIMRC<CR>
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>t :Toc<CR>



" open bracket match
set showmatch

" define cpp bracket match rules
augroup cplusplus
    autocmd!
    autocmd FileType cpp setlocal matchpairs+=<:>
augroup END

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"------------------------------------------------------------------------------------------------------------------------------
" NERDTree
map tt :NERDTree<CR>



"coc 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
set signcolumn=no

"" plug.vim
"if empty(glob('~/.vim/autoload/plug.vim'))
    "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "augroup vim-plug_
        "autocmd!
        "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    "augroup END
"endif



call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline' 
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
Plug 'tanvirtin/monokai.nvim'
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }


call plug#end()
"------------------------------------------------------------------------------------------------------------------------------
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1
let g:syntastic_loc_list_height = 2
"------------------------------------------------------------------------------------------------------------------------------
" colorscheme
"colorscheme molokai
colorscheme monokai
"colorscheme monokai_pro
"colorscheme monokai_soda
"colorscheme monokai_ristretto

"------------------------------------------------------------------------------------------------------------------------------
" markdown-preview

let g:mkdp_browser = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'relative',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:true,
    \ 'disable_filename': 1,
    \ 'toc': {}
    \ }

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'

let g:mkdp_auto_start = 0

nmap <F8> <Plug>MarkdownPreview
nmap <T> <Plug>MarkdownPreviewToggle

"------------------------------------------------------------------------------------------------------------------------------
"
"" vim-markdwon
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1


"------------------------------------------------------------------------------------------------------------------------------
"
" clangd
"let g:coc_global_extensions = ['coc-clangd']
"let g:coc_clangd_jump = 1
"set conceallevel=2
"set concealcursor=nv
"let g:clangd_arguments = ["-std=c++20"]
"

set tags=./tags,tags;$HOME


let g:coc_global_extensions=['coc-clangd', 'coc-vimlsp', 'coc-json',
      \ 'coc-marketplace', 'coc-markdownlint',
      \ ]

" 配置coc-clangd
call coc#config('clangd', {
      \ 'suggest': {
      \   'detailedLabel': 1,
      \   'completionItem': {
      \     'snippetSupport': v:true
      \   }
      \ },
      \ 'completion': {
      \   'autocomplete': v:true
      \ },
      \ 'clangd.arguments': ['--header-insertion=iwyu'],
      \ 'clangd.semanticHighlighting': v:true,
      \ 'clangd.path': '/opt/homebrew/opt/llvm/bin/clangd'  
      \ })


" coc config
 
set hidden
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=100   

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics，找到下一个或上一个报错 
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

"------------------------------------------------------------------------------------------------------------------------------

:lua << EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF


"------------------------------------------------------------------------------------------------------------------------------

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>


"------------------------------------------------------------------------------------------------------------------------------

