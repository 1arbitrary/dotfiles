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

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match 'insert) ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))
  
  
  :init
  
  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (global-corfu-mode)
  
  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  (corfu-popupinfo-mode)
  :config
  (setq corfu-auto t
	corfu-auto-delay 0.2
	corfu-auto-trigger "." ;; Custom trigger characters
	corfu-quit-no-match 'separator) 
  )	

(use-package eglot
  :init
  (electric-pair-mode t)
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
	 (python-ts-mode . eglot-ensure)
	 )
  :ensure t)

(use-package doom-themes
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
 '(custom-enabled-themes '(doom-ayu-dark))
 '(custom-safe-themes
   '("9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518"
     default))
 '(package-selected-packages
   '(company corfu doom-themes go-mode ligature rust-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
