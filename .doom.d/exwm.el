;;; exwm.el -*- lexical-binding: t; -*-
;;;

;; Exwm (add the package to packages.el and copy the elisp below to your config.el to use)

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
(defun launch-firefox ()
(interactive)
(start-process-shell-command "firefox" nil "firefox"))
(exwm-input-set-key (kbd "s-# t") 'launch-terminal)
(exwm-input-set-key (kbd "s-# w") 'launch-firefox)
(call-process "/usr/bin/bash" "~/.local/share/dwm/emacsstart.sh")
