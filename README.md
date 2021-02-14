Neovim config

Install dependencies:
1. python[2,3]
2. python[2,3]-pip
3. python[2,3] -m pip install --user pynvim
4. nodejs
5. npm install -g neovim
6. npm install -g typescript (optionally)
7. [pkgmng] install xsel, ccls, powerline-fonts, nerd-fonts, fzf, ripgrep, universal-ctags-git, the_silver_searcher, fd, bat

More usefull standart key bindings for Vim

Go to file from import or required!!!
<g-f> - press under cursor
<Ctrl-w-g-f> - open file in the new tab
<Ctrl-w-f> - open file in the vertical split (cause I map It)

Recording in VIM!!!
<q-[char]> - start recording. In this case all you type will be saved in
register (with commands you do). E.g. <q-p> or <q-o>
<@ - [char]> - repeat this record. E.g. <@-p> or <@-q>
<q> - turn off recording

Center screen on the current string
<zz>

To upper/lower case. Mark frase and press
You must do it in the visual mode
<U> - touppercase
<u> - tolowercase

SCROLL SCREEN
<Ctrl-e> - 1 string down
<Ctrl-d> - 1/2 screen down
<Ctrl-y> - 1 string up
<Ctrl-u> - 1/2 screen up

<Ctrl-w-n> - create new window
<Ctrl-w-hjklw> - windows navigation
<Ctrl-w-s> or :split - create window`s split, i.e. open same file on the another window

<cc> - delete whole string and start insert mode
<cw> - delete word and start insert mode

<v> - enter to the visual mode (select a character)
<Shift-v> - select whole string
existing selection
<gv> - repeat previous selection!!!
<vip> - select current paragraph (function is a paragraph too!!!)

</> - search a string
<n> - go to next found word
<Shift-n> - go to previous found word
<f-[char]> - forward finding a letter starts with [char] in the same string
<F-[char]> - backward finding a letter in the same string
<t-[char]> and <T-[char]> - the same action, but include [char] character
<;> - go to the next/previous letter in the same string

<%> - go to pair character, i.e. (), {}, [] etc.

<*> - mark all words like word under cursor
<n> - go to the next comparison
:noh - light out all marked words

<dw> - delete word
<d-^> - delete from current to start of string
<d-$> - delete from current to end of string
<d-t-[char]> - delete from character under cursor to [char] (not include)
<d-f-[char]> - same action but include [char]
<y-t-[char]> and <y-f-[char]> - same but copy instead delete

Marks
<m-[char in low case]> - create you own local mark
<m-[char in up case]> - create you own GLOBAL mark
<`-[char]> - go to the mark [char]
<`-.> - go to the place that you edited last time

<g-t> - go to the next Vim tab
<g-T> - go to the previous Vim tab

Actions with Vim REGISTERS!!!!!
<"-[reg_name]-y> - copy data to the [reg_name] register
<Ctrl-r>[reg_name] - insert data from [reg_name] register in INSERT MODE
<">[reg_name][pP] - insert data from [reg_name] register in EX MODE
after[p]/before[P] cursor. For example: "ap
:reg [reg_name] - show content of [reg_name] register

BUFFERS
:ls - show all existing buffers
:bdelete <buff_number> | <buff_name> - delete buffer

IMPORTANT!!!!!
To support 256 colors in Vim you should set up variable in .bashrc:
export TERM=xterm-256color
