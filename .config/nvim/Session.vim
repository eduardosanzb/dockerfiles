let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +32 lua/plugins/codecompanion.lua
badd +504 ~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim/lua/packer_init.lua
badd +0 ~/.local/state/nvim/render-markdown.log
badd +168 lua/plugins/nvim-cmp.lua
argglobal
%argdel
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit lua/plugins/nvim-cmp.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 30 + 32) / 64)
exe '2resize ' . ((&lines * 31 + 32) / 64)
argglobal
balt ~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim/lua/packer_init.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 154 - ((11 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 154
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim/lua/packer_init.lua", ":p")) | buffer ~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim/lua/packer_init.lua | else | edit ~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim/lua/packer_init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim/lua/packer_init.lua
endif
balt lua/plugins/nvim-cmp.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
503
normal! zo
503
normal! zo
503
normal! zo
503
normal! zo
let s:l = 504 - ((17 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 504
normal! 020|
wincmd w
exe '1resize ' . ((&lines * 30 + 32) / 64)
exe '2resize ' . ((&lines * 31 + 32) / 64)
tabnext
edit lua/plugins/codecompanion.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/repos/github.com/eduardosanzb/dockerfiles/.config/nvim/lua/packer_init.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=8
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
10
normal! zo
21
normal! zo
26
normal! zo
27
normal! zo
32
normal! zo
37
normal! zo
45
normal! zo
43
normal! zo
54
normal! zo
55
normal! zo
67
normal! zo
79
normal! zo
let s:l = 32 - ((30 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 32
normal! 010|
tabnext 2
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
