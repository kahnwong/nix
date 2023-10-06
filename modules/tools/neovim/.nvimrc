runtime! plug.vim
call plug#begin()

"diff
Plug 'mhinz/vim-signify'

"integrations
Plug 'wakatime/vim-wakatime'

"syntax highlighting
Plug 'chrisbra/csv.vim'
Plug 'jvirtanen/vim-hcl'
Plug 'LnL7/vim-nix'
Plug 'cweagans/vim-taskpaper'
"Plug 'preservim/vim-markdown'

"utilities
Plug 'windwp/nvim-autopairs'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"ui
Plug 'stevearc/dressing.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"""" config
set number
set expandtab

filetype plugin on

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
