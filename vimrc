call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'atom/fuzzy-finder'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'scrooloose/nerdtree'
" React syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
set autoindent
set number
set rnu
set shiftwidth=4
set tabstop=4
set term=screen-256color
set expandtab
syntax on
filetype plugin indent on
function! Js_fixer()
  "set autoread
  ""exec ":silent!$HOME/bin/prettier-eslint %"
  "normal :edit
endfunction
function! Shell_file()
    set syn=sh
endfunction

function! FoldIndent()
  set foldmethod=indent
  normal zM
endfunction

function! StartUp()
  call FoldIndent()
endfunction
function! Jsx_file()
  set filetype=jsx

endfunction

function! Javascript_file()
  set filetype=javascript
  let g:ale_javascript_eslint_executable = '$HOME/bin/eslint'
  let g:ale_javascript_eslint_options = '-c $HOME/bin/.eslintrc.js'
  let g:ale_javascript_eslint_suppress_eslintignore = 0
  let g:ale_javascript_eslint_use_global = 0

  let g:ale_echo_cursor = 1
  let g:ale_echo_msg_error_str = 'Error'
  let g:ale_echo_msg_format = '%s'
  let g:ale_echo_msg_warning_str = 'Warning'
  let g:ale_enabled = 1
  let g:ale_fix_on_save = 0
  let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
  let g:ale_keep_list_window_open = 0
  let g:ale_lint_delay = 200
  let g:ale_lint_on_enter = 1
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 'always'
  let g:ale_linter_aliases = {}
  let g:ale_linters = {'javascript': ['eslint']}
  let g:ale_open_list = 0
  let g:ale_set_highlights = 1
  let g:ale_set_loclist = 1
  let g:ale_set_quickfix = 0
  let g:ale_set_signs = 1
  let g:ale_sign_column_always = 0
  let g:ale_sign_error = '>>'
  let g:ale_sign_offset = 1000000
  let g:ale_sign_warning = '--'
  let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
  let g:ale_warn_about_trailing_whitespace = 1
  call TabStopDeuce()
  set expandtab
  set tags=$WEBROOT/javascript-ctags
endfunction

function! Javascript_ctags()
  exec ":silent!$HOME/bin/ctags -o $WEBROOT/javascript-ctags $WEBROOT 2>&1 > /dev/null &"
endfunction

function! Color_Reset()
    color alduin
endfunction
function! Quit_Window()
  call Color_Reset()
  exec ":q"
endfunction
function! Git_Diff()
  color github
  exec ":Gdiff"
endfunction
function! Git_Blame()
  color github
  exec ":Git blame"
endfunction
function! Git_Status()
  color github
  exec ":Gstatus"
endfunction

function! Gen_tags()
    exec ":Prettier"
endfunction

autocmd! BufRead,BufNewFile,BufWritePost *.sh :call Shell_file()
autocmd! BufWritePost *.vimrc :so ~/.vimrc
autocmd! BufWritePost *.js :call Gen_tags()
autocmd! BufWritePost *.jsx :call Gen_tags()
au BufRead,BufNewFile *.js :call Javascript_file()
au BufRead,BufNewFile *.jsx :call Jsx_file()

function! Lint()
  exec ":!clear ; node -l %"
endfunction
function! Unit_tests()
  tabnew $WEBROOT/tests/unit
endfunction
function! Mix_js_config()
  tabnew $WEBROOT/webpack.mix.js
endfunction
function! FP475()
  source ~/vim-fp-475-third-and-sixth-day-email-reminders.vim
endfunction
function! TabStopDeuce()
  set tabstop=2 shiftwidth=2 expandtab
endfunction
function! TabStopQuatro()
  set tabstop=4 shiftwidth=4 expandtab
endfunction

map <leader>l :call Lint()<cr>
map <leader>e :edit %<cr>
map <leader>w :w<cr>
map <c-h> :tabprevious<cr>
map <c-l> :tabnext<cr>
map <leader><leader>s :so ~/.vimrc<cr>
map V :tabnew ~/.vimrc<cr>
map <leader>snp :set nopaste<cr>
map <leader>sp :set paste<cr>
map <leader><leader>tdd :tabnew ~/bin/tdd.sh<cr>
map <leader>. :tabnew<cr>:Ex<cr>
map <leader>gd :call Git_Diff()<cr>
map <leader>gb :Git Blame<cr>
map <leader>gs :call Git_Status()<cr>
map <leader>cr :call Color_Reset()<cr>
map <leader>qa :qa<cr>
set incsearch
set background=dark
set updatecount=0 updatetime=0

function! Js_Linter(a)
  set autoread
  exec ":!$HOME/bin/eslint -c $HOME/bin/.eslintrc.js %"
  normal :edit
endfunction
set foldmethod=manual
set secure
set exrc
set background=dark
call Color_Reset()
set rtp+=~/.fzf
map <leader>z :FZF<cr>
"let g:ale_linters = {'javascript':['Js_Linter']}
"map <leader>0 :ALEFix<cr>
"map <leader>9 :ALEDetail<cr>

cabbr <expr> %% expand('%:p:h')
map <leader>. :tabnew %%/<cr>
call StartUp()
"let g:rainbow_active = 1

function! FoldSyntax()
  set foldmethod=syntax
  normal zM
endfunction


map <leader><leader>fi :call FoldIndent()<CR>
map <leader><leader>fs :call FoldSyntax()<CR>

function! ToDate()
    exec ":normal! o"
    exec ":. ! echo '/** TODO: as of' $(date -I) ' */'"
    exec ':normal! k'
    exec ':normal! J'
    exec ':normal! A'
    exec ':normal! 2h'
    exec ':startinsert'
endfunction
map <leader>di :call ToDate()<CR>

color alduin
map - :tabm -1<CR>
map = :tabm +1<CR>
color orbital
map <leader>s :source ~/.vimrc<CR>


nmap <Leader>f <Plug>(Prettier)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
