function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc')
        setlocal tagfunc=lsp#tagfunc
    endif

    " navigation
    nnoremap <buffer> <silent> gd <plug>(lsp-definition)
    nnoremap <buffer> <silent> gr <plug>(lsp-references)
    nnoremap <buffer> <silent> gi <plug>(lsp-implementation)
    nnoremap <buffer> <silent> gt <plug>(lsp-type-definition)

    " symbols
    nnoremap <buffer> <silent> gs <plug>(lsp-document-symbol-search)
    nnoremap <buffer> <silent> gS <plug>(lsp-workspace-symbol-search)

    " actions
    nnoremap <buffer> <silent> <leader>rn <plug>(lsp-rename)
    nnoremap <buffer> <silent> K <plug>(lsp-hover)

    " diagnostics
    nnoremap <buffer> <silent> [g <plug>(lsp-previous-diagnostic)
    nnoremap <buffer> <silent> ]g <plug>(lsp-next-diagnostic)

    " scrolling hover (optional safer keys)
    nnoremap <buffer> <expr> <C-j> lsp#scroll(+4)
    nnoremap <buffer> <expr> <C-k> lsp#scroll(-4)
endfunction

augroup lsp_attach
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
