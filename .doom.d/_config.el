;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

(if (window-system)
    (set-frame-size (selected-frame) 210 80))

;;(setq doom-font (font-spec :family "Fira Code" :size 13 :weight 'medium))
(setq doom-font (font-spec :family "Fira Code" :size 13 :weight 'medium))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size )
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-badger)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "~/org/")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-hide-emphasis-markers t)
(add-hook 'org-mode-hook (lambda ()
          (set-face-attribute 'org-level-1 nil :height 2.0)
          (set-face-attribute 'org-level-2 nil :height 1.5)
          (set-face-attribute 'org-level-3 nil :height 1.3)
          (set-face-attribute 'org-level-4 nil :height 1.2)
          (set-face-attribute 'org-level-5 nil :height 1.1)
          ))

(require 'cl-lib)
(cl-pushnew "/Library/TeX/texbin" exec-path :test #'equal)
;;(require 'pdf-tools)
(require 'latex-preview-pane)
(latex-preview-pane-enable)
(setq doc-view-resolution 300)

;;(map! :leader
;;    :desc "Export current buffer to a Markdown file."
;;    "c e m m" #'org-md-export-to-markdown)

(defun define-doc-view-current-cache-dir ()
  ;; doc-view-current-cache-dir was renamed to doc-view--current-cache-dir in Emacs 24.5
  (or (fboundp 'doc-view-current-cache-dir)
      (defalias 'doc-view-current-cache-dir 'doc-view--current-cache-dir)))
(eval-after-load "doc-view" '(define-doc-view-current-cache-dir))

(defun doc-view-reverse-colors ()
  "Inverts document colors.\n
Requires an installation of ImageMagick (\"convert\")."
  (interactive)
  ;; error out when ImageMagick is not installed
  (if (/= 0 (call-process-shell-command "convert -version"))
      (error "Reverse colors requires ImageMagick (convert)")
    (when (eq major-mode 'doc-view-mode)
      ;; assume current doc-view internals about cache-names
      (let ((file-name (expand-file-name (format "page-%d.png"
                                                 (doc-view-current-page))
                                         (doc-view-current-cache-dir))))
        (call-process-shell-command
         "convert" nil nil nil "-negate" file-name file-name)
        (clear-image-cache)
        (doc-view-goto-page (doc-view-current-page))))))

(defun doc-view-reverse-colors-all-pages ()
  "Inverts document colors on all pages.\n
Requires an installation of ImageMagick (\"convert\")."
  (interactive)
  ;; error out when ImageMagick is not installed
  (if (/= 0 (call-process-shell-command "convert -version"))
      (error "Reverse colors requires ImageMagick (convert)")
    (when (eq major-mode 'doc-view-mode)
      ;; assume current doc-view internals about cache-names
      (let ((orig (doc-view-current-page))
            (page nil))
        (message "Reversing video on all pages...")
        (dotimes (pnum (doc-view-last-page-number))
          (setq page (expand-file-name (format "page-%d.png" (1+ pnum))
                                       (doc-view-current-cache-dir)))
          (call-process-shell-command
           "convert" nil nil nil "-negate" page page))
        (clear-image-cache)
        (doc-view-goto-page orig)
        (message "Done reversing video!")))))
