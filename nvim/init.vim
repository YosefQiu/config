set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"支持使用鼠标
"set mouse=a
"按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
"按下Tab键后，vim显示的空格数
set tabstop=4
"normal模式下，>>增加一级缩进、<<取消一级缩进、==取消全部缩进时，每一级缩进的空格数
set shiftwidth=4
"自动将Tab转为空格(防止Tab键在不同编辑器缩进不一致导致问题)
set expandtab
"Tab转为多少个空格
set softtabstop=4
"行首退格键退回上一行行尾
set backspace=indent,eol,start
"光标位置显示一条线
set cursorline
set scrolloff=10
set foldmethod=marker
set foldlevel=99
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

set textwidth=80
set cindent
set comments=sl:/*,mb:**,elx:*

let curpwd = getcwd()

" 不产生.swp文件
set noswapfile

" 快速切换C H源文件
nmap <LEADER>a :A<CR>

"花括号自动格式化，首行一个tab
autocmd FileType md,cpp,java inoremap { {<CR>}<ESC>kA<CR>

set laststatus=2

"光标回到上次关闭的文档位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"打开高亮
syntax on
"设定序号
set number
set relativenumber
"字不要超出去
set wrap
"可视模式下补全
set wildmenu
"高亮搜索结果
set hlsearch
exec "nohlsearch"
"边输边搜索
set incsearch
"忽视大小写搜索
set ignorecase
set smartcase

if exists('$TMUX')
    "set term=xterm-256color
endif

let mapleader=","
"更改键盘上下左右按键方向，J左K下L右I上，H插入（全小写）
noremap k j
noremap i k
noremap j h
noremap h i
noremap <LEADER><CR> :nohlsearch<CR>
inoremap jk <ESC>

"补全括号和花括号（换行四次）
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i


function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on

"使用tab自动补全的设定
function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                return "\<C-N>"
        endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"插件管理"
call plug#begin('~/.vim/plugged')
""Plug 'ervandew/supertab'
"vim 底下的状态栏"
Plug 'vim-airline/vim-airline'
"vim 的配色 snazzy"
Plug 'connorholyday/vim-snazzy'
"文件导航"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"错误检测"
""Plug 'w0rp/ale'
"代码补全"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"OpenGL"
Plug 'tikhomirov/vim-glsl'
"Taglist"
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
"显示历史修改"
Plug 'mbbill/undotree/'
"括号对称
Plug 'nathanaelkane/vim-indent-guides'
"显示当前单词"
Plug 'itchyny/vim-cursorword'
"Markdown"
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'L04DB4L4NC3R/texgroff.vim'
""Plug 'suan/vim-instant-markdown'
Plug 'hashrocket/vim-macdown'
Plug 'mracos/mermaid.vim'
Plug 'instant-markdown/vim-instant-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/mathjax-support-for-mkdp'
""Plug 'iamcco/markdown-preview.vim'
Plug 'ferrine/md-img-paste.vim'
"插入书签"
Plug 'kshenoy/vim-signature'
"goyo"
Plug 'junegunn/goyo.vim'
"快速注释"
Plug 'scrooloose/nerdcommenter'
Plug 'beyondmarc/opengl.vim'
Plug 'Kryptocron/glfw.vim'
" vim 多光标
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-commentary'
"vulkan"
Plug 'LiamHz/vim-vulkan'
" emmet
Plug 'mattn/emmet-vim',{'for':['html','css','scss']}
" python 自动缩进
Plug 'vim-scripts/indentpython.vim'
" .h 和.cpp 互换
Plug 'vim-scripts/a.vim'
" c++17 hightlight
Plug 'bfrg/vim-cpp-modern'
" 代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" tmux and vim"
Plug 'christoomey/vim-tmux-navigator'
" glsl"
Plug 'petrbroz/vim-glsl'
" Debugger"
Plug 'puremourning/vimspector'
""Plug 'szw/vim-maximizer'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install -all'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'wsdjeg/vim-todo'
Plug 'shanzi/autoHEADER'
call plug#end()

"========================插件配置==================="

" ==
" == autoHEADER
" ==
let g:autoHEADER_auto_enable = 1

" ==
" == vim_cpp_modern
" ==
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

let g:cpp_typename_highlight = 1
let g:cpp_template_highlight = 1
let g:cpp_namespace_highlight = 1
let g:c_struct_highlight = 1

" ==
" == fzf
" ==
nnoremap <LEADER>fzf :GFiles<CR>
nnoremap <LEADER>ff :Rg<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \"find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))
if has('nvim')
    au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au! FileType fzf tunmap <buffer> <Esc>
endif

" ==
" == vimspector
" ==
let g:vimspector_enable_mappings = 'HUMAN'
nmap <LEADER>dd :call vimspector#Launch()<CR>
nmap <LEADER>dx :VimspectorReset<CR>
nmap <LEADER>de :VimspectorEval
nmap <LEADER>dw :VimspectorWatch
nmap <LEADER>do :VimspectorShowOutput
nmap <LEADER>dj <Plug>VimspectorStepInto
nmap <LEADER>do <Plug>VimspectorStepOut
nmap <LEADER>dn <Plug>VimspectorContinue
nmap <LEADER>di <Plug>VimspectorBalloonEval
nmap <LEADER>db <Plug>VimspectorToggleBreakpoint
let g:vimspector_base_dir='/Users/yosef/.vim/plugged/vimspector'

" ==
" == snazzy
" ==
"更改配色"
""color snazzy
"透明配色"
""let g:lightline = {
""\ 'colorscheme': 'snazzy',
""\ }

" ==
" == GLSL
" ==
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
set omnifunc=glsl#CompleteFunc


" ==
" == UltiSnips
" ==
let g:UltiSnipsExpandTrigger = "<c-x>"
let g:UltiSnipsJumpForwardTrigger = "<c-x>"
let g:UltiSnipsJumpBackwardTrigger = "<c-s>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
" ==
" == NERDTree
" ==
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === md-img-paste.vim
" ===
autocmd FileType markdown nmap <buffer><silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>


" ===
" === Macdown.vim
" ===
""autocmd BufWritePost *.md exec :MacDownPreview

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_autoscroll = 1
"Uncomment to override defaults:
""let g:instant_markdown_slow = 1
""let g:instant_markdown_autostart = 1
""let g:instant_markdown_open_to_the_world = 1
""let g:instant_markdown_allow_unsafe_content = 1
""let g:instant_markdown_allow_external_content = 1
""let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
""let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
""let g:instant_markdown_autoscroll = 1
""let g:instant_markdown_port = 8888
""let g:instant_markdown_python = 0

" ===
" === MarkdownPreview
" ===
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
" 如果设置了该参数, g:mkdp_browserfunc 将被忽略

""let g:mkdp_browserfunc = 'Applications/Safari'
" vim 回调函数, 参数为要打开的 url

let g:mkdp_auto_start = 1
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

let g:mkdp_auto_open = 1
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令


" ===
" === vim-visual-multi
" ===
let g:VM_custom_motions  = {'j': 'h', 'k': 'j','i': 'k'}
let g:VM_maps = {}
let g:VM_maps['i'] = 'h'
let g:VM_maps['I'] = 'H' 
" ===
" === Markdown
" ===

autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,u <div align="center"><img src="<++><Esc>" width = "<++>"<Esc> height = "<++><Esc>" alt="<++><Esc>" align=center /></div><++><Esc>F
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,6 ######<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>

autocmd Filetype markdown inoremap <Tab> <C-R>=CleverTab()<CR>
let g:vim_markdown_math = 1

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-vimlsp',
    \'coc-tsserver']
set hidden
set updatetime=100
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <<silent><<expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TaB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use h to show documentation in preview window.
nnoremap <silent> <LEADER> h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
