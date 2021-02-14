" MUST be at the beginning of the file!!!
set nocompatible              " be iMproved, required
filetype off                  " required

" specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neomake/neomake'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'ryanoasis/vim-devicons'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Brackets surrounding
" The plugin lets to surround with brackets etc. words and whole strings
" Some keys:
" cs'" to change ' into " in 'Hello, world'
" cs'<q> to change ' into <q>Hello, world</q>
" cst' to change back into 'Hello, world'
" ds' to remove ' into 'Hello, world'
" ysiw] with cursor on Hello to convert into [Hello] world
" yssb or yss) to surround whole string into ()
" IN VISUAL MODE mark string and press S( to surround into (). Or other
" brackets
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Comment code
" To comment one string of code you need type gcc in EX MODE
" To comment few strings of code you need mark this string by
" typing <V-[motion]> and then press gc
Plug 'tomtom/tcomment_vim'

" Highlight for more languagies
Plug 'sheerun/vim-polyglot'

" Emmet plugin
" You need to press <Ctrl-y-,>
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'typescriptreact', 'html', 'css'] }

" Multiple cursor
" You need to press <Ctrl-n> to create new cursor on the word under cursor
" As you mark all words you can go to Normal mode by pressing v!!!!
" Also you can MARK FEW STRINGS and press <Ctrl-n> and you get cursor by str
" You can set multiple cursors by REGEXP!!!!
" You need in NORMAL MODE type :MultipleCursorsFind [regexp]
Plug 'terryma/vim-multiple-cursors'

" Easymotion plugin for fast navigation on file like browser vimfx
" You need to press <leader-s-[letter you find]> and then letter that appears
Plug 'easymotion/vim-easymotion'

" For work with Git
" :help fugitive to view all available commands
" Gstatus to show repository status
" Gdiff to look at the difference of commits
" Gcommit -m [commit_name] to commit added data
" Gpull origin master to pull branch to your comp
" Gpush origin master to push your repository to the remove server
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Auto complete code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Auto-pairs
Plug 'jiangmiao/auto-pairs'

" IndentLine
Plug 'yggdroot/indentline'

"Color Themes
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required


" =============================================================
"                 GENERAL SETTINGS
" =============================================================

syntax on

set colorcolumn=0
set hlsearch
set incsearch
set mouse=a
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set number
" When you copying by yank data automaticaly go to the *-register
set clipboard=unnamed

" Coc.Vim settings

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

set diffopt+=vertical

" =============================================================
"                      AUTOCOMMANDS
" =============================================================

if has("autocmd")

autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" close coc-explorer if there arent other windows
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

endif


" =============================================================
"                      MAPPINGS
" =============================================================

" Set up key <Leader>
let mapleader=","

map <Leader> <Plug>(easymotion-prefix)

" Vertical split if you open file from other file by <C-w-f>
map <C-w>f :vertical wincmd f<CR>

" Move tab to the right/left
nnoremap tm :tabm+1<CR>
nnoremap tM :tabm-1<CR>

" Copy to a system clipboard
vmap <leader>y "+y<CR>
nmap <leader>p "+p<CR>

" Format file by prettier
nnoremap <S-A-i> :CocCommand prettier.formatFile <CR>

"Vertical split
nnoremap <leader>v :vsplit<CR>

" Horizontal split
nnoremap <leader>h :split<CR>

"Tern off the search highlight
nnoremap <leader>n :noh<CR>

"Show git status using fugitive plugin command :Gstatus
nnoremap <leader>gs :Gstatus<CR>

"Show file difference using fugitive plugin command :Gvdiff
nnoremap <leader>gd :Gdiffsplit!<CR>

"Apply changes from 2-nd (h) or 3-rd (l) buffers during solving merge
"conflicts
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"Create new tab
nnoremap <leader>t :tabnew<CR>

map <C-t> :CocCommand terminal.Toggle <CR>

" Coc.Vim mappings

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Show marketplace
nnoremap <silent> <space>m  :<C-u>CocList marketplace<cr>

" Coc-explorer
nmap <leader>q :CocCommand explorer<CR>
nmap <leader>f :CocCommand explorer --preset floating<CR>

" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" coc config
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-terminal',
  \ 'coc-stylelintplus',
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-ccls',
  \ 'coc-snippets',
  \ 'coc-json',
  \ 'coc-explorer',
  \ 'coc-rls',
  \ 'coc-pyright',
  \ 'coc-yaml'
  \ ]

" coc-explorer config
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" =============================================================
"                      COLORSCHEMES SETTINGS
" =============================================================

colorscheme material
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

"
" =============================================================
"                      CUSTOM FUNCTIONS
" =============================================================

" Create folders on file save
" ===========================
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

" Remove whitespaces on save
" saving cursor position
" =================================================
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
