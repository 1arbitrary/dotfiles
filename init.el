; Main Emacs configuration
(scroll-bar-mode -1) ; hides scrollbar
(tool-bar-mode -1) ; hides toolbar
(menu-bar-mode -1) ; Disable menu Bar
(set-fringe-mode 10)

(set-frame-font "JetBrainsMono Nerd Font 14" nil t)

					; Turns on displaying numbers 
(global-display-line-numbers-mode 1)

					; Sets the number-display-type to relative numbers
(setq display-line-numbers-type 'relative)

					; Keeps electric mode on by default and away from that bullshit paredit
(electric-pair-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!="
				       "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
				       "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
				       "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
				       "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
				       "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
				       "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
				       "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
				       "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
				       "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
				       "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
				       ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
				       "<:<" ";;;"))
  (global-ligature-mode t))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

; LSP-Mode configuration 
(use-package lsp-mode
  :init
  (setq gc-cons-threshold 100000000)
  (setq lsp-auto-configure t)
  :hook (
         (js-ts-mode . lsp-deferred)
	 (rust-mode . lsp-deferred)
	 (web-mode . lsp-deferred)
	 (tsx-ts-mode . lsp-deferred)
	 ;; for which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs
  :init (lsp-treemacs-sync-mode 1)
  :commands lsp-treemacs-errors-list)

(use-package which-key
    :config
    (which-key-mode))

(use-package company
  :init (setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
  :config (global-company-mode))

(use-package web-mode
  :ensure t
  :mode
  (
   ("\\.html?\\'" . web-mode)
   ("\\.css\\'" . web-mode)
   ("\\.jsx\\'". web-mode)
   ("\\.js\\'". web-mode)
   ("\\.ts\\'". web-mode)
   ("\\.tsx\\'". web-mode)
   ))

(use-package magit)

(require 'rust-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(kanagawa-dragon))
 '(custom-safe-themes
   '("c20728f5c0cb50972b50c929b004a7496d3f2e2ded387bf870f89da25793bb44"
     "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6"
     "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     "bb8587d7e8ba2a39fcd293498140598188c7bd0c8be0360cca36f08c2b7bf5d9"
     "fc5c5ec472d1a97e99bf294efdae866827ff78692530038e4df7b6dfe633263d"
     "28b9703810da2df6fb8667b681cea47d6fbfa5df6a7f23d5dee41d25acca38ba"
     "922f930fc5aeec220517dbf74af9cd2601d08f8250e4a15c385d509e22629cac"
     default))
 '(package-selected-packages
   '(Magit company company-box kanagawa-themes ligature lsp-mode
	   lsp-treemacs magit multiple-cursors rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
