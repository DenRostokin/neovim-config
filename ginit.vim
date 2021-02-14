" =============================================================
"                 GENERAL SETTINGS
" =============================================================

set guifont=DejaVu\ Sans\ Mono:h13

" Disable external tablines
call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)

" =============================================================
"                      COLORSCHEMES SETTINGS
" =============================================================

colorscheme material
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'

if (has('termguicolors'))
  set termguicolors
endif
