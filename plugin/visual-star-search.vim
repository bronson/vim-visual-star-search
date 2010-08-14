" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vmap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vmap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" recursively vimgrep if you hit leader-star
nmap <leader>* :execute "noautocmd grep -rw " . expand("<cword>") . " ."<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute "noautocmd vimgrep /" . @/ . "/ **"<CR>
