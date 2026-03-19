hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "dot"

" =========================
" Core (transparent editor)
" =========================
highlight Normal       guibg=NONE guifg=#c0caf5
highlight NonText      guibg=NONE guifg=#565f89
highlight LineNr       guibg=NONE guifg=#565f89
highlight SignColumn   guibg=NONE
highlight CursorLine   guibg=#2a2a2a
highlight Visual       guibg=#3a3a3a

" =========================
" Syntax (muted Tokyo Night style)
" =========================
highlight Comment    guifg=#565f89 gui=italic

highlight Keyword    guifg=#7aa2f7
highlight Statement  guifg=#7aa2f7
highlight PreProc    guifg=#7aa2f7

highlight Type       guifg=#7dcfff
highlight Identifier guifg=#c0caf5

highlight Function   guifg=#73daca

highlight String     guifg=#9ece6a
highlight Constant   guifg=#ff9e64
highlight Number     guifg=#ff9e64

highlight Operator   guifg=#89ddff

" =========================
" Diagnostics (inline with stronger bg)
" =========================
highlight DiagnosticError guifg=#db4b4b
highlight DiagnosticWarn  guifg=#e0af68
highlight DiagnosticInfo  guifg=#0db9d7
highlight DiagnosticHint  guifg=#10b981

highlight DiagnosticVirtualTextError guifg=#ff6c6b guibg=#2a1a1a
highlight DiagnosticVirtualTextWarn  guifg=#e0af68 guibg=#2a2415
highlight DiagnosticVirtualTextInfo  guifg=#0db9d7 guibg=#13252f
highlight DiagnosticVirtualTextHint  guifg=#10b981 guibg=#132a24

" =========================
" Completion Menu
" =========================

" main items (function names)
highlight Pmenu      guibg=NONE guifg=#c0caf5

" SELECTED (stronger blue bar)
highlight PmenuSel   guibg=#3b4261 guifg=#7aa2f7

" scrollbar
highlight PmenuSbar  guibg=#1f1f28
highlight PmenuThumb guibg=#565f89

" extra info (docs in completion)
highlight PmenuExtra guifg=#565f89

" =========================
" LSP Floating Docs (strong background)
" =========================

highlight NormalFloat guibg=#1f1f28 guifg=#7aa2f7
highlight FloatBorder guibg=#1f1f28 guifg=#3b4261

" =========================
" Splits (no pink)
" =========================
highlight VertSplit    guibg=NONE guifg=#444444
highlight WinSeparator guibg=NONE guifg=#444444
