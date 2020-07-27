" Neovim config

" Install dependencies:
" 1. python[2,3]
" 2. python[2,3]-pip
" 3. python[2,3] -m pip install --user pynvim
" 4. nodejs
" 5. npm install -g neovim
" 6. npm install -g typescript (optionally)
" 7. [pkgmng] install xsel, ack-grep, ccls, powerline-fonts, nerd-fonts

"More usefull standart key bindings for Vim

" Go to file from import or required!!!
" <g-f> - press under cursor
" <Ctrl-w-g-f> - open file in the new tab
" <Ctrl-w-f> - open file in the vertical split (cause I map It)
"
" Recording in VIM!!!
" <q-[char]> - start recording. In this case all you type will be saved in
" register (with commands you do). E.g. <q-p> or <q-o>
" <@ - [char]> - repeat this record. E.g. <@-p> or <@-q>
" <q> - turn off recording
"
" Center screen on the current string
" <zz>
"
" To upper/lower case. Mark frase and press
" You must do it in the visual mode
" <U> - touppercase
" <u> - tolowercase
"
" SCROLL SCREEN
" <Ctrl-e> - 1 string down
" <Ctrl-d> - 1/2 screen down
" <Ctrl-f> - 1 screen down
" <Ctrl-y> - 1 string up
" <Ctrl-u> - 1/2 screen up
" <Ctrl-b> - 1 string up
"
" <Ctrl-w-n> - create new window
" <Ctrl-w-hjklw> - windows navigation
" <Ctrl-w-s> or :split - create window`s split, i.e. open same file on the another window
"
" <cc> - delete whole string and start insert mode
" <cw> - delete word and start insert mode
"
" <v> - enter to the visual mode (select a character)
" <Shift-v> - select whole string
" <o> after selecting strings by <Shift-v> - start selection on top of
" existing selection
" <gv> - repeat previous selection!!!
" <vip> - select current paragraph (function is a paragraph too!!!)
"
" </> - search a string
" <n> - go to next found word
" <Shift-n> - go to previous found word
" <f-[char]> - forward finding a letter starts with [char] in the same string
" <F-[char]> - backward finding a letter in the same string
" <t-[char]> and <T-[char]> - the same action, but include [char] character
" <;> - go to the next/previous letter in the same string
"
" <%> - go to pair character, i.e. (), {}, [] etc.
"
" <*> - mark all words like word under cursor
" <n> - go to the next comparison
" :noh - light out all marked words
"
" <dw> - delete word
" <d-^> - delete from current to start of string
" <d-$> - delete from current to end of string
" <d-t-[char]> - delete from character under cursor to [char] (not include)
" <d-f-[char]> - same action but include [char]
" <y-t-[char]> and <y-f-[char]> - same but copy instead delete
"
" Marks
" <m-[char in low case]> - create you own local mark
" <m-[char in up case]> - create you own GLOBAL mark
" <`-[char]> - go to the mark [char]
" <`-.> - go to the place that you edited last time
"
" <g-f> - go to the file under cursor (if the file exists)
"
" <g-t> - go to the next Vim tab
" <g-T> - go to the previous Vim tab
"
" Actions with Vim REGISTERS!!!!!
" <"-[reg_name]-y> - copy data to the [reg_name] register
" <Ctrl-r>[reg_name] - insert data from [reg_name] register in INSERT MODE
" <">[reg_name][pP] - insert data from [reg_name] register in EX MODE
" after[p]/before[P] cursor. For example: "ap
" :reg [reg_name] - show content of [reg_name] register
"
" Create new files and folders in NERDTree!!!!
" You need press <m-[admc]> to add, delete, move and copy

" BUFFERS
" :ls - show all existing buffers
" :bdelete <buff_number> | <buff_name> - delete buffer

" IMPORTANT!!!!!
" To support 256 colors in Vim you should set up variable in .bashrc:
" export TERM=xterm-256color

set nocompatible              " be iMproved, required
filetype off                  " required

" specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Type <Ctrl>ww to focus on nerdtree and document
" And type <leader>q to toggle nerdtree
" Inside of opened NERDTree type:
" <m-[char you see in the show list]> to create, remove and etc.
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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

" Fast search in project`s files
" IMPORTANT!!! To use the plugin you need to install 'ack-grep' package
"You need to type :Ack [options] {pattern} [{directories}]
Plug 'mileszs/ack.vim'

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
"
" Gcommit -m [commit_name] to commit added data
" Gpull origin master to pull branch to your comp
" Gpush origin master to push your repository to the remove server
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Ctrlp.vim Plugin
" You need press <Ctrl-p>
" <C-v> to open file in vertical split
Plug 'ctrlpvim/ctrlp.vim'

" Auto complete code
" You will need a global install of the neovim client:
" $ npm install -g neovim
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

syntax on


" =============================================================
"                 GENERAL SETTINGS
" =============================================================

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

" NERDTree toggler
" nmap <leader>q :NERDTreeToggle<cr>
" NERDTree focus on the current buffer
" nnoremap <leader>f :NERDTreeFind<CR>

" Show list of all existing buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" Go to next/previous buffer even there are any unsaved changes
" nnoremap <leader>a :bp!<CR>
" nnoremap <leader>f :bn!<CR>

" Fix problems with ALEFix fommand by typing Shift-Alt-i
" nnoremap <S-A-i> :ALEFix<CR>
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
" Show files explorer
nmap <leader>q :CocCommand explorer<CR>

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
  \ 'coc-explorer'
  \ ]

" NERDTree
" let g:NERDTreeWinSize=30
" let g:NERDTreeShowIgnoredStatus = 1

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*

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

"Onedark Theme options
" let g:onedark_termcolors = 256
" let g:onedark_terminal_italics = 1
" colorscheme onedark
colorscheme material
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'

if (has('termguicolors'))
  set termguicolors
endif

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

" Disable external tablines
call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
