;; Color Theme
;;
;;(load-theme 'adwaita)
;;(load-theme 'deeper-blue)
;;(load-theme 'dichromacy)
;;(load-theme 'light-blue)
;;(load-theme 'manoj-dark)
;;(load-theme 'misterioso)
;;(load-theme 'tango)
;;(load-theme 'tango-dark)
;;(load-theme 'tsdh-dark) ;; *
;;(load-theme 'tsdh-light)
;;(load-theme 'wheatgrass) ;; *
;;(load-theme 'whiteboard)
(load-theme 'wombat)


;; Melpa!
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; All The Icons
(add-to-list 'load-path "/Users/kris/kenv/emacs.dependencies/all-the-icons.el")   
(require 'all-the-icons)  

;; NeoTree
(add-to-list 'load-path "/Users/kris/kenv/emacs.dependencies/neotree")
(require 'neotree)
(global-set-key (kbd "C-x p") 'neotree-toggle)
(setq neo-theme (if window-system 'icons 'arrow))

;; Go Autocomplete
(add-to-list 'load-path "/Users/kris/kenv/emacs.dependencies/go-autocomplete") 
(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)


;; Go Mode
(require 'go-mode)

;; Bash Autocomplete
(require 'bash-completion)


;; Init options
(split-window-right) ;; Open with 2 windows
(neotree-toggle) ;; Open with the NeoTree browser
(require 'transpose-frame)


;; ----------------------------------------------------------------------------------
;; Emacs Welcome Message
;; ----------------------------------------------------------------------------------
(setq initial-scratch-message "

Kris Nova

---------------------------------
C-x f             Find file
C-x p             File Browser
C-x o             Change Window
M-x term          Terminal
C-c o             Exit Terminal
C-x s             Save
---------------------------------
")
