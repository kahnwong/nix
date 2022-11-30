set number

call plug#begin()

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'wakatime/vim-wakatime'
Plug 'jvirtanen/vim-hcl'

call plug#end()
