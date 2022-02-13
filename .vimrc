
"PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'farmergreg/vim-lastplace'
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }



set number
set relativenumber

set nocompatible

if has('filetype')
  filetype indent plugin on
endif

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

if has('syntax')
  syntax on
endif

set spelllang=en,sl

"Uncomment following lines to set tab as 4x space:
"set tabstop=4
"set shiftwidth=4
"set expandtab

set ic
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
"set t_vb=

set mouse=a
noremap <ScrollWheelUp> <C-Y>
"noremap <ScrollWheelDown><C-E>

set cmdheight=2

set notimeout ttimeout ttimeoutlen=200

set pastetoggle=<F11>

"map Y y$

nnoremap <silent> ,<space> :nohl<CR>
inoremap :<< (<>)
inoremap :>> (<>)
inoremap :en \<Enter>
nnoremap :bang i#!/bin/sh<Esc>:wq<CR>
nnoremap S :%s///g<Left><Left><Left>
nnoremap :pis :PlugInstall<CR>
inoremap :ytrss https://www.youtube.com/feeds/videos.xml?channel_id=
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i


""""""LATEX""""""
"General
autocmd FileType tex nnoremap <silent> -- :set spell!<CR>
autocmd FileType tex nnoremap <silent> ,, :!pdflatex %<CR>
autocmd FileType tex nnoremap <silent> :cent i\centering<Esc>
autocmd FileType tex inoremap <silent> :cent \centering<Esc>
autocmd FileType tex inoremap <silent> <Space><Space> <Esc>k:/(<>)<CR>kcgn<Esc>:nohl<CR>li
autocmd FileType tex inoremap :mm $  $(<>)<Esc>bhhi 
autocmd FileType tex inoremap :ss _{(<>)}<Esc>bbi 
autocmd FileType tex inoremap :SS ^{(<>)}<Esc>bbi 
autocmd FileType tex inoremap :Ss ^{(<>)}_{(<>)} (<>)<Esc>3b7hi 
autocmd FileType tex inoremap :sS ^{(<>)}_{(<>)} (<>)<Esc>3b7hi 
autocmd FileType tex inoremap :ms $_{(<>)}$ (<>) <Esc>3bi 
autocmd FileType tex inoremap :MS $^{(<>)}$ (<>) <Esc>F^i 
autocmd FileType tex inoremap :vs $_{(<>)}=(<>)\;(<>)$ (<>) <Esc>bbbi
autocmd FileType tex inoremap :vS $_{(<>)}^{(<>)}=(<>)\;(<>)$ (<>) <Esc>bbbi
autocmd FileType tex inoremap :bo \textbf{}(<>) <Esc>bli
autocmd FileType tex inoremap :ita \textit{}(<>) <Esc>bli
autocmd FileType tex inoremap :br \break
autocmd FileType tex inoremap :bs \bigskip

"General formating
autocmd FileType tex nnoremap :hh A[H]<Esc>
autocmd FileType tex inoremap :sec \section{}<Enter><Enter>(<>)<Esc>2kf}i
autocmd FileType tex inoremap :subs \subsection{}<Enter><Enter>(<>)<Esc>2kf}i
autocmd FileType tex inoremap :list \begin{enumerate}<Enter><Enter><Enter>\end{enumerate}<Esc>kki<Tab>
autocmd FileType tex inoremap :it \item 
autocmd FileType tex inoremap :fig \begin{figure}[H]<Enter><Tab>\includegraphics[width=]{(<>)}<Enter>\centering<Enter>\caption{(<>)}<Enter>\label{fig:(<>)}<Enter><Backspace><Backspace>\end{figure}<Enter><Enter>(<>)<Esc>6kf]i
autocmd FileType tex inoremap :fis \begin{figure}[H]<Enter><Tab><Enter>\caption{(<>)}<Enter>\label{fig:{(<>)}<Enter><Backspace>\eld{figure}<Esc>3ka
autocmd FileType tex inoremap :subf \begin{subfigure}{.5\textwidth}<Enter><Tab>\centering<Enter>\includegraphics[width=\linewidth]{(<>)}<Enter>\caption{(<>)}<Enter>\label{(<>)}<Enter><Backspace>\end{subfigure}<Enter>
autocmd FileType tex nnoremap <silent> :fir k:/slik<CR>knf i~\ref{}(<>)<Esc>:nohl<CR>bli
autocmd FileType tex nnoremap <silent> :tar k:/tabe<CR>knf i~\ref{}(<>)<Esc>:nohl<CR>bli
autocmd FileType tex inoremap :cap \caption{}<Esc>i
autocmd FileType tex inoremap :lab \label{}<Esc>i

"Math commands
autocmd FileType tex inoremap :frm $\frac{}{(<>)}$ (<>) <Esc>bbli
autocmd FileType tex inoremap :fra \frac{}{(<>)} (<>) <Esc>bbli
autocmd FileType tex inoremap :fre $\frac{}{(<>)}=(<>)$ (<>) <Esc>bbli
autocmd FileType tex inoremap :abs \|\|(<>)<Esc>bli
autocmd FileType tex inoremap :sqrt \sqrt[]{}<Esc>i
autocmd FileType tex inoremap :sum \sum_{}^{(<>)} (<>)<Esc>2bli







""""""PYTHON""""""
autocmd FileType python nnoremap <silent> ,, :!python3 %<CR>
autocmd FileType python inoremap <silent> ++   <Esc>k:/(<>)<CR>kcgn<Esc>:nohl<CR>li
autocmd FileType python inoremap ;arr np.array([])<Esc>
autocmd FileType python inoremap ;app np.append(, (<>))<Esc>2bli
autocmd FileType python inoremap ;prt print()<Esc>i
autocmd FileType python inoremap ;fdec print(f'{(<>):.2f}')<Esc>3bli

autocmd FileType python nnoremap :hed iimport numpy as np<Enter>#import scipy as sc<Enter>import matplotlib.pyplot as plt<Enter>plt.rcParams['figure.figsize'] = [9, 6]<Enter>plt.rc('font', size=14)<Enter>#from ipywidgets import interact<Enter><Enter>
autocmd FileType python nnoremap :wf if = open("", "w")<Enter>f.write((<>))<Enter>f.close()<Enter><Enter>(<>)<Esc>04k2e3li
autocmd FileType python nnoremap :plt iplt.figure()<Enter>plt.plot(, (<>))<Enter>plt.title("(<>)")<Enter>plt.xlabel("(<>)")<Enter>plt.ylabel("(<>)")<Enter>plt.grid()<Enter>#plt.savefig("./(<>)")<Esc>05k4ei
autocmd FileType python nnoremap :rf iwith open("", "r") as file:<Enter><Tab>lines = [line.split() for line in file]<Enter><Backspace><Enter>values = np.array([])<Enter>for i in lines:<Enter><Tab>values = np.append(values, float(i[0]))<Enter><Backspace><Enter>(<>)<Esc>7k03ehi
autocmd FileType python inoremap ;cool cool.PropsSI("", "(<>)", (<>), "(<>)", (<>), "(<>)")<Esc>6blli


