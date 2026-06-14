" ============================================================
"  .obsidian.vimrc — close match to your vscode-neovim init.lua
" ============================================================

" ---------- 1. Basic search / editing behavior ----------

set hlsearch
set incsearch
set ignorecase
set smartcase

" Obsidian usually uses the system clipboard already, but this is the
" closest equivalent to your Neovim clipboard setting.
set clipboard=unnamed


" ---------- 2. Leader key ----------

" Required before using Space as a leader in Obsidian Vimrc Support.
unmap <Space>
let mapleader = " "


" ---------- 3. Custom movement mappings ----------

" H / L → beginning / end of line
nmap H ^
vmap H ^

nmap L $
vmap L $

" J / K → 5 lines down / up
nmap J 5j
vmap J 5j

nmap K 5k
vmap K 5k


" ---------- 4. Clear search highlights ----------

" Your Neovim mapping:
" <leader>cl → :nohlsearch
"
" In Obsidian Vim, :nohl is the safer equivalent.
nmap <leader>cl :nohl<CR>


" ---------- 5. Delete / change without yanking ----------

" Normal mode
nmap <leader>d "_d
nmap <leader>c "_c

" Visual mode
vmap <leader>d "_d
vmap <leader>c "_c


" ---------- 6. Optional: jk to escape insert mode ----------

" You had this commented out in init.lua, so I leave it commented here too.
" If you want it, uncomment it.
" imap jk <Esc>


" ---------- 7. Optional: nvim-surround-like behavior ----------

" Obsidian cannot load nvim-surround directly.
" Vimrc Support provides a custom :surround command.
" These mappings give you a practical surround workflow:
"
" Visual mode: select text, then press s"
" Normal mode: cursor on word, then press s"

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_parens surround ( )
exmap surround_square surround [ ]
exmap surround_curly surround { }

" The plugin docs recommend using map, not nmap, for these.
nunmap s
vunmap s

map s" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map s` :surround_backticks<CR>
map sb :surround_parens<CR>
map s( :surround_parens<CR>
map s) :surround_parens<CR>
map s[ :surround_square<CR>
map s] :surround_square<CR>
map s{ :surround_curly<CR>
map s} :surround_curly<CR>
map [[ :surround_wiki<CR>
