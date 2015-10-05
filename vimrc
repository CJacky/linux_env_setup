
set number 
set autoindent 
set cindent
syntax on
set tabstop=4
set shiftwidth=4
set hlsearch
set ignorecase
set cursorline 

hi CursorLine term=none cterm=none ctermbg=Black

set tags=tags;/
set cscopetag

" 0 cscope first
" 1 ctags first
set cscopetagorder=0


function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
"		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
"		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()

" cscope key map
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


" maximum current window and restore
nmap <C-W>o :call MaxCurrentWindow()<CR>

function! MaxCurrentWindow()
	exec "wincmd _"
	exec "wincmd |"
endfunction

