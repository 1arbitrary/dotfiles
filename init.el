(fido-vertical-mode 1)

(windmove-default-keybindings)
(windmove-swap-states-default-keybindings)
(setq windmove-wrap-around t)
(setq mouse-avoidance-mode 'banish)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(which-key-mode t)
(set-frame-font "IosevkaTerm Nerd Font 16" nil t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(github-dark-vscode))
 '(custom-safe-themes
   '("b9f44212b4be6f0466811c5d8a297dda3c40dbf4c4cfd97c1686fceb2043b617"
     "59cb0b29e1b279f887d13214bb91c20cce880c3b9647d3e74f66d1b18756c682"
     "a94e15f0a3fd9e86430b4b8dadffc58faa0310168bcbc4fd3c1b687cf25e1f5d"
     "dfa1e5afbab42ab2924102e11672a2731c53347ce078b734d9816f1d4429f68a"
     "1b0db76a9b417336906972209ca4b2bf1f0755f6c2013b772cb26117cc326eda"
     "b3c54ff374d12c2e45c621d723a0f6dfb6aab2bb5478a0c4f8b7590adaa23892"
     "13794b95ba118a1e0f60fe880be9c8a79d881aeb2203656a092f462b2b601629"
     "d10c58f4a53b7d4760022fdf67734865c290e40ef5dfa597a653e14b810a7d07"
     "70901ffb0f502ec640c30f96a626e66a024af80ebb836eb0cdbe42c06446951b"
     "b97004bc28b4d931b589c3453ff83852c28bb009df3421ef0b8b2752e43c67fa"
     "5d09ffe65f025fd9f51304aad148140d18ce14411d20b9e563f27581b0305af9"
     "d81457b350b6b3ba9cf98b589b76b16faef3918e5857d302839484bdef9f58ac"
     "62e5ee6ff1f9437e7b9010d4575d0415237dfbee5fd64b2f2b5597969499fec2"
     "d20b3f5c1adf9cf2e2ad40a0f6172b32d53faa0489478cf359d2bdf432b9d8a4"
     "ac7b410453c725606757b5aa46df55be487d53b9fa50b13ea548e9642c32377b"
     "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2"
     "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7"
     "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c"
     "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae"))
 '(package-selected-packages
   '(company github-dark-vscode-theme go-mode ligature multiple-cursors
	     rust-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
