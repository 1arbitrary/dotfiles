(fido-vertical-mode 1)

(windmove-default-keybindings)
(windmove-swap-states-default-keybindings)
(setq windmove-wrap-around t)
(setq mouse-avoidance-mode 'banish)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(which-key-mode t)
(set-frame-font "IosevkaNerdFont 16" nil t)

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
 '(custom-enabled-themes '(gruvbox-light-medium))
 '(custom-safe-themes
   '("18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9"
     "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3"
     "75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176"
     "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
