
" Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set number
set nuw=2
set ts=4
set list lcs=trail:·,tab:├─
set cursorline
set hls
"set ic
"set clipboard=unnamedplus
set t_RV=ttymouse=xterm2
set splitbelow
set splitright
set tags +=../tags,tags
set background=dark
filetype on
set encoding=utf-8

colorscheme one
hi search ctermbg=130
hi CursorLine cterm=NONE ctermbg=235
hi CursorLineNR cterm=bold ctermbg=235
hi VertSplit ctermfg=black ctermbg=black
hi StatusLine ctermfg=black
hi StatusLineNC ctermfg=black
hi SignColumn ctermbg=NONE

let g:loaded_matchparen = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_x = '%{ScrollStatus()}'
let g:buffet_show_index = 1
let g:webdevicons_conceal_nerdtree_brackets = 0
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:scrollstatus_symbol_track = '─'
let g:scrollstatus_symbol_bar = '━'
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]

" 자동 완성 목록의 배경색과 텍스트 색상 설정
highlight Pmenu ctermfg=black ctermbg=LightGray guifg=black guibg=LightGray
highlight PmenuSel ctermfg=white ctermbg=Blue gui=reverse

filetype plugin indent off

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermfg=darkgreen ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=darkgreen ctermbg=237
autocmd FileType * RainbowParentheses

function! g:BuffetSetCustomColors()
	hi! BuffetTab ctermfg=190 ctermbg=234
	hi! BuffetBuffer ctermfg=85 ctermbg=234
	hi! BuffetCurrentBuffer cterm=bold ctermfg=17 ctermbg=190
	hi! BuffetActiveBuffer cterm=bold ctermfg=white ctermbg=234
endfunction

function! Term(...)
	if a:0 == 0
		term ++rows=10
	else
		execute "term ++rows=".a:1
	endif
endfunction

function! VTerm(...)
	if a:0 == 0
		vert term
	else
		execute "vert term ++cols=".a:1
	endif
endfunction

command! -nargs=? Term call Term(<f-args>)
command! -nargs=? VTerm call VTerm(<f-args>)

command! Hnw set number list cursorline | IndentGuidesDisable | GitGutterDisable
command! Snw set number list cursorline | IndentGuidesEnable | GitGutterEnable

map <F9> <Esc>:NERDTreeToggle<CR>
map <C-F9> <Esc>:NERDTreeFocus<CR>
map <S-F9> <Esc>:NERDTree<CR>
imap <F9> <Esc>:NERDTreeToggle<CR>
imap <C-F9> <Esc>:NERDTreeFocus<CR>
imap <S-F9> <Esc>:NERDTree<CR>
nmap <F8> <Esc>:TagbarToggle<CR>

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> "*c<Esc>"+p
imap <C-v> <Esc>"+pi
