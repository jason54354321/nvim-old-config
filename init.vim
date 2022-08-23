:set number
:set relativenumber
:set cursorline
:set ignorecase
:set smartcase
:set mouse=a
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set timeoutlen=1000
:set ttimeoutlen=0
:set nowrap
:set encoding=UTF-8

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
Plug 'ghifarit53/tokyonight-vim'            " Theme
Plug 'ful1e5/onedark.nvim'                  " Theme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'pi314/ime.vim'                         " 讓Vim可以輸入中文
Plug 'pi314/ime-phonetic.vim'                " 注音輸入法
Plug 'voldikss/vim-floaterm'                " Floating terminal
Plug 'cohama/lexima.vim'                    " Auto close parenthesesPairing
Plug 'alvan/vim-closetag'                   " close html tag
Plug 'pangloss/vim-javascript'              " javascript highlight & indentation
Plug 'dart-lang/dart-vim-plugin'            " dart plugin
Plug 'matze/vim-move'                       " move line

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

call plug#end()

" fuzzy finder settings
nnoremap <C-p> :Files<Cr>
let g:fzf_preview_window = ['right:60%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6} }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-s': 'vsplit' }

" preventing win10 from frezzing
let s:is_win = has('win32') || has('win64')
if s:is_win
    " ... other Windows specific settings

    nmap <C-z> <Nop>
endif

" horizontal scroll
map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left

" ----flutter shortcut----
let g:dart_format_on_save = 1
nnoremap <leader>fr :CocCommand flutter.run <CR>
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :CocCommand flutter.devices <CR>
nnoremap <leader>ft :CocCommand flutter.dev.hotRestart <CR>
nnoremap <leader>ff :below new output:///flutter-dev <CR>
  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" 注音輸入法
let g:ime_toggle_english = '<leader><Space>'
let g:ime_select_mode = '<leader><Space>0'
let g:ime_switch_2nd = '<leader><Space>9'
" nvim-data\plugged\ime.vim\plugin\ime.vim 中的第64行要改 否則佔用了";;"
let g:ime_plugins = ['zhuyin']
"set statusline=%<%{ime#mode()}%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P " not working, idk why

" tokyonight Theme
" set termguicolors
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_current_word =	'grey background'
" colorscheme tokyonight

" Atom One Dark
let g:onedark_transparent = "true"
let g:onedark_function_style = "NONE"
colorscheme onedark


autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd VimEnter * TSEnable highlight " Enable highlight 

"cancel search highlighting
nnoremap  <esc> :noh <CR>

nmap <F12> :TagbarToggle<CR>

" move to the previous/next tabpage.
nnoremap <C-k> gT
nnoremap <C-j> gt

" vim-floaterm
let g:floaterm_shell = 'pwsh.exe'
let g:floaterm_title = 'PowerShell $1/$2'
let g:floaterm_wintype = 'split'
let g:floaterm_height = 0.33
let g:floaterm_wintype = 'split'
let g:floaterm_keymap_new = '<Leader>nt'
let g:floaterm_keymap_toggle = '<Leader>t'

" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" --------------Coc setting-------------
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Press Tab and Shift+Tab and navigate around completion selections
function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<S-Tab>" :
  \ coc#refresh()

" Press Enter to select completion items or expand snippets
inoremap <silent><expr> <CR>
  \ pumvisible() ? "\<C-y>" :
  \ "\<C-g>u\<CR>"

let g:coc_snippet_next = '<Tab>'              " Use Tab to jump to next snippet placeholder
let g:coc_snippet_prev = '<S-Tab>'            " Use Shift+Tab to jump to previous snippet placeholder

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
