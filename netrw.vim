" remove <C-L> mapping from Netrw (where I don't use it)
" as it conflicts with vim-tmux-navigator (where I _do_ use it !)
augroup vimrc
  autocmd!
  autocmd FileType netrw call s:RemoveNetrwMap()
augroup END

function s:RemoveNetrwMap()
  if hasmapto('<Plug>NetrwRefresh')
    unmap <buffer> <C-l>
  endif
endfunction
