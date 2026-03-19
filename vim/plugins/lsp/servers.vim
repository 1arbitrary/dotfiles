augroup lsp_servers
    autocmd!

    if executable('clangd')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd']},
            \ 'allowlist': ['c', 'cpp'],
            \ })
    endif

    if executable('gopls')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'gopls',
            \ 'cmd': {server_info->['gopls']},
            \ 'allowlist': ['go'],
            \ })
    endif

    if executable('rust-analyzer')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'rust-analyzer',
            \ 'cmd': {server_info->['rust-analyzer']},
            \ 'allowlist': ['rust'],
            \ })
    endif

    if executable('typescript-language-server')
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'typescript-language-server',
            \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
            \ 'allowlist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
            \ })
    endif

augroup END
