;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tanbin Islam"
      user-mail-address "islamtanbin43@gmail.com")

(setq doom-font (font-spec :family "FantasqueSansMono Nerd Font" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "FantasqueSansMono Nerd Font" :size 16))

(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/.emacs.d/Org/")

(setq evil-insert-state-cursor '(box "#e0af68")
      evil-normal-state-cursor '(box "#9ece6a"))
(blink-cursor-mode 1)

(require 'org-bullets)
(org-bullets-mode 1)

(require 'all-the-icons)
(require 'dashboard)
(require 'page-break-lines)
(dashboard-setup-startup-hook)
(page-break-lines-mode)
(setq dashboard-items '((recents  . 10)
                        (projects . 5)))

(dashboard-modify-heading-icons '((recents . "file-text")))
(setq dashboard-startup-banner "~/.emacs.d/emacs.png")  ;; use custom image as banner
(setq dashboard-center-content nil)
(setq dashboard-show-shortcuts t)

(require 'mood-line)
(mood-line-mode)

(beacon-mode 1)

(require 'rainbow-mode)
(rainbow-mode)
