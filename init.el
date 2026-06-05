;; -*- lexical-binding: t; -*-
(fido-vertical-mode 1)

(windmove-default-keybindings)
(windmove-swap-states-default-keybindings)
(setq windmove-wrap-around t)
(setq mouse-avoidance-mode 'banish)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(which-key-mode t)
(set-frame-font "Iosevka Nerd Font Italic 18" nil t)

					; Turns on displaying numbers 
(global-display-line-numbers-mode 1)
					; Sets the number-display-type to relative numbers
(setq display-line-numbers-type 'relative)
(setq ispell-program-name "/usr/bin/hunspell")

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

(global-set-key (kbd "C-c c") #'compile)
(global-set-key (kbd "C-c r") #'recompile)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  (global-ligature-mode t)
  :ensure t)

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) 
  (global-set-key (kbd "C->") 'mc/mark-next-like-this) 
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this) 
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  :ensure t) 

(use-package eglot
  :init
  (electric-pair-mode t)
  (global-company-mode t)
  :config
  (setq-default eglot-workspace-configuration
		'(:completions
                  (:completeFunctionCalls t)))
  :hook (
	 (c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure)
	 (sh-mode . eglot-ensure)
	 (rust-mode . eglot-ensure)
	 (go-mode . eglot-ensure)
	 (python-mode . eglot-ensure)
	 )
  :ensure t)

(use-package company
  :config
  (setq company-idle-delay 0.2)
  (setq company-tooltip-align-annotations t)
  (setq company-show-quick-access 'left)
  :ensure t)

(use-package yasnippet
  :config
  (yas-global-mode 1)
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(setq dictionary-server "dict.org")

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(almost-mono-black))
 '(custom-safe-themes
   '("8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae"
     "3a8520a563ef5719ef22438ceb5f2ba6c43cf6f7103aaf3686a3c3183365ca6f"
     "8f5b7d56999c86f00982cfbfd8e6cad9b4d6eb0f561c4f66e89d414ceb3bd29c"
     "b2b5e96a5cdda0a5dce3420e0eac37276231a6a5e79816d20040f38075d81fe3"
     "ba7682deadc8cefeeb07a1198ba4b777c9fd1cdab7c7798892a5aab598336baa"
     "606d9e3d98ef969d4e9eba9628ee1ce25934ecfe72cd0a995d31c907cb69dafd"
     "5de3e12da5f2cc8fbf99923964ad4367720e7fcb97e146e067f4db8799a86f5f"
     "69aafaf59656887750bfeeb890d81173d41cca498b362928f5d240be591a0add"
     "ded0cd1b37a2633465fd30dca9b7aa9b5e57dca6d3337bf80d54c9ebd241e755"
     "ca42424bb1ce63edd27fe89d0958bc78a9e8f6032db1c15b45fbb88cfe823ddd"
     "f5823ed842375c0874f876b352f624ef46f00f7ecdcb43d433f248307b3f6b86"
     "866c42bcd430df48c64e86694fa62737fc0eb2bfbbe6f68d7d95dd9f05d63bb3"
     "f7a004e3a1f920d79a02988fd20a9af9f5cedb1491918e1ef247bf7481cbe93b"
     "3afa642b2bfcd45a84b2725a87a88f0063b9787162b067bb8e614e7301be69e1"
     "b094d1a522d3ffa94b09811ae6af217bb01579a1f58d13b4f517306d94e6ea4e"
     "f2f07719428af0572740e5f962677173777b439349ec6abc0db2db8d4ce3de41"
     "967c23e9ba179b80560774419f081df22e7674aac23c5c550b817e4a1ce7d058"
     "6dcc66a60dce37a5817d46e7b1f838ac5d95a79061119adeb7c04c7ae9f511d0"
     "138ed99a323c1b93c52f4b3726caf2bc634b79a76fa63a3d3aff76394db5f28f"
     "10e330880269244ae45ae9e02fe6f55766da9e15036e7c7f07d7ce228195deb5"
     "0ef0c3e24c8f704430e2b2f473101c08fb8bab93d09a80dbc2ea2dbb799aa861"
     "8325ce8887001cf97589b3460ee88fd3344a290a815ec248945de6d223b7b01f"
     "28f3ac0f5fade64dc7e27abe9d32e7d85576c40940977e8e319f25055d3a28b7"
     "2493d0ad0bb94bd2ad297a6d76288751a532fd6d8d6af694ac14008caa6b7fa2"
     "fc5c5ec472d1a97e99bf294efdae866827ff78692530038e4df7b6dfe633263d"
     "28b9703810da2df6fb8667b681cea47d6fbfa5df6a7f23d5dee41d25acca38ba"
     "bb8587d7e8ba2a39fcd293498140598188c7bd0c8be0360cca36f08c2b7bf5d9"
     default))
 '(package-selected-packages
   '(almost-mono-themes company go-mode kaolin-themes ligature
			markdown-mode markdown-ts-mode modus-themes
			multiple-cursors rust-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
