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
(set-frame-font "Iosevka Nerd Font Italic 21" nil t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq ispell-program-name "/usr/bin/hunspell")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
	(sh-mode . sh-ts-mode)
	(go-mode . go-ts-mode)))

(use-package savehist
  :init
  (savehist-mode))

(global-set-key (kbd "C-c c") #'compile)
(global-set-key (kbd "C-c r") #'recompile)
(global-set-key (kbd "C-c C-w") #'subword-mode)
(global-set-key (kbd "C-c C-f") #'eglot-format-buffer)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  (global-ligature-mode t)
  :ensure t)

(use-package company
  :config 
  (setq company-idle-delay 0.2)
  (setq company-tooltip-align-annotations t)
  (setq company-show-quick-access 'left)
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
	 (c-ts-mode . eglot-ensure)
	 (c++-ts-mode . eglot-ensure)
	 (sh-ts-mode . eglot-ensure)
	 (rust-ts-mode . eglot-ensure)
	 (go-ts-mode . eglot-ensure)
	 )
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
 '(custom-enabled-themes '(modus-operandi-tritanopia))
 '(custom-safe-themes
   '("8325ce8887001cf97589b3460ee88fd3344a290a815ec248945de6d223b7b01f"
     "138ed99a323c1b93c52f4b3726caf2bc634b79a76fa63a3d3aff76394db5f28f"
     "10e330880269244ae45ae9e02fe6f55766da9e15036e7c7f07d7ce228195deb5"
     "28f3ac0f5fade64dc7e27abe9d32e7d85576c40940977e8e319f25055d3a28b7"
     "2493d0ad0bb94bd2ad297a6d76288751a532fd6d8d6af694ac14008caa6b7fa2"
     "967c23e9ba179b80560774419f081df22e7674aac23c5c550b817e4a1ce7d058"
     "f2b09aa814c194d1e491448f8975c185c14f7d901958dd760b4e667d8daed1d6"
     "1c725e4aee133f350459e0692f2b885c3444982bf6e8647b05d1cfc519760d9f"
     default))
 '(package-selected-packages '(company dash go-mode ligature rust-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
