(fido-vertical-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(set-frame-font "IosevkaNerdFont 14" nil t)

					; Turns on displaying numbers 
(global-display-line-numbers-mode 1)
					; Sets the number-display-type to relative numbers
(setq display-line-numbers-type 'relative)
(setq ispell-program-name "/usr/bin/hunspell")
;; Enable ido mode

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package savehist
  :init
  (savehist-mode))

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  (global-ligature-mode t))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) 
  (global-set-key (kbd "C->") 'mc/mark-next-like-this) 
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this) 
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)) 

(use-package eglot
  :init
  (electric-pair-mode t)
  :hook (
 (c-mode . eglot-ensure)
 (c++-mode . eglot-ensure)
 (js-ts-mode . eglot-ensure)
 (rust-mode . eglot-ensure)
 (go-mode . eglot-ensure)
 (elixir-ts-mode . eglot-ensure)
 (python-mode . eglot-ensure)
 (css-mode . eglot-ensure)
 (web-mode . eglot-ensure)
 (tsx-ts-mode . eglot-ensure)
 )
:ensure t)

(use-package which-key
  :config
  (which-key-mode))

(use-package go-mode)
(use-package elixir-ts-mode)

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


(use-package rust-mode
  :ensure t)

(setq dictionary-server "dict.org")

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(almost-mono-black))
 '(custom-safe-themes
   '("cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2"
     "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c"
     "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7"
     "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae"
     "0da9f48243b77c83719c569efd88a7e47c1d8a3f2887838408745d2d52fad8a8"
     "4e6e3a04936e001ca758dce1bfa5b54fb601683a7361c30d754347a75f321d28"
     "1b2727001d06f63916118b811da49a9344582c16f9e2d7e26657634712886775"
     "dc8d63cd0514d058bdf34774163709834519350c1a80dc04deaa58085a8810a5"
     "6aff83667a3bad8db2f55d69cf595f58b56af233f116ec24d93fe2aa51033eef"
     "03ffccc093c553a238a54fea13f2056749d83c24e65940f8d4bdb7135f1199a5"
     "cf0e1f8a027d3a38602ce6628399db5550ad7f0598c01979e01ab45b8a631639"
     "98f2052cba13ccbf7dc91e6ce4dbc02fc9f6421782c11f8403504222f4d423f7"
     "1b74dd5576787105a0efcd6e8fed74755bb3fd234aaa5d500e21ddbd56c2661a"
     "6a95b0faf6cee6adfda34cdfadb2fed6f4157a1d49aabef8cc9b94c187d69a1d"
     "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6"
     "c20728f5c0cb50972b50c929b004a7496d3f2e2ded387bf870f89da25793bb44"
     "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     default))
 '(org-agenda-files '("~/Documents/Data-Structures/Trees/AVL/notes.org"))
 '(package-selected-packages
   '(almost-mono-themes closql dash eglot ghub go-mode ligature
			markdown-mode multiple-cursors posframe
			rust-mode web-mode with-editor yaml)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
