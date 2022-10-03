;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/.doom.d/lisp/")

(use-package all-the-icons)

;; Fonts
(setq doom-font (font-spec :family "FantasqueSansMono Nerd Font" :size 15  :weight 'regular)
      doom-variable-pitch-font (font-spec :family "FantasqueSansMono Nerd Font" :size 16))


; Exwm (add the package in packages.el, if you want to use it)
;

(setq initial-buffer-choice "dashboard")


(require 'exwm)
(require 'exwm-config)
(exwm-config-example)
(require 'exwm-randr)
(setq exwm-randr-workspace-monitor-plist '(0 "VGA-1"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
            "xrandr" nil "xrandr --output VGA-1 --mode 1366x768 --pos 0x0 --rotate normal")))
(exwm-randr-enable)
(require 'exwm-systemtray)
(exwm-systemtray-enable)

(setq exwm-workspace-index-map
(lambda (index)
(let ((named-workspaces ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9"]))
(if (< index (length named-workspaces))
(elt named-workspaces index)
(number-to-string index)))))

;; easy window moving with buffer-move

(exwm-input-set-key (kbd "<C-s-up>") 'buf-move-up)
(exwm-input-set-key (kbd "<C-s-down>") 'buf-move-down)
(exwm-input-set-key (kbd "<C-s-right>") 'buf-move-right)
(exwm-input-set-key (kbd "<C-s-left>") 'buf-move-left)
;; easy window switching with windmove

(exwm-input-set-key (kbd "<s-up>") 'windmove-up)
(exwm-input-set-key (kbd "<s-down>") 'windmove-down)
(exwm-input-set-key (kbd "<s-right>") 'windmove-right)
(exwm-input-set-key (kbd "<s-left>") 'windmove-left)


(defun launch-terminal ()
(interactive)
(start-process-shell-command "st" nil "st"))


(defun launch-qute ()
(interactive)
(start-process-shell-command "qutebrowser" nil "qutebrowser"))

(exwm-input-set-key (kbd "s-# t") 'launch-terminal)
(exwm-input-set-key (kbd "s-# w") 'launch-qute)


(call-process "/usr/bin/bash" "~/.local/share/dwm/emacsstart.sh")

;; Doom-theme (I like toyko-night)
(setq doom-theme 'doom-tokyo-night)

;; Line Numbers
(setq display-line-numbers-type 'relative)

;; Some org related stuff
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-directory "~/.config/org/"
      org-agenda-files '("~/.config/org/agenda.org"))

; Org-Bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; vterm
(use-package vterm)
(setq shell-file-name "/bin/fish"
      vterm-max-scrollback 5000)
(set-window-margins (selected-window) 1 1)

;; doom-dashboard
(setq fancy-splash-image "~/.emacs.d/emacs.png")
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(setq doom-fallback-buffer-name "*dashboard*")

;; Dashboard
(require 'dashboard)
(require 'page-break-lines)
(page-break-lines-mode)
(dashboard-setup-startup-hook)
(setq dashboard-items '((recents  . 10)
                        (projects . 5)))

(dashboard-modify-heading-icons '((recents . "file-text")))
(setq dashboard-startup-banner "~/.emacs.d/emacsgnu.png")  ;; use custom image as banner
(setq dashboard-center-content nil)
(setq dashboard-show-shortcuts t)

;; Mood-line
(mood-line-mode)
(display-time-mode 1)

;; cursor settings
(setq evil-insert-state-cursor '(box "#e0af68")
      evil-normal-state-cursor '(box "#9ece6a"))
(blink-cursor-mode 1)

;; Dired Settings and Keymaps
(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines)

;; rainbow-mode
(add-hook! org-mode 'rainbow-mode)
(add-hook! prog-mode 'rainbow-mode)

(setq emms-source-file-default-directory "~/Music/")
