;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Przemysław Grenda"
      user-mail-address "przemekgrenda@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 11 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 11))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/org/"
        org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "|" "DONE(d)"))))

(setq org-roam-directory "/home/pegre/roam")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; (setq projectile-project-search-path '("~/repos/" ))
;; (setq projectile-ignored-projects '("~/"))
;; (setq projectile-require-project-root t)
;; (defun projectile-ignored-project-function (filepath)
;;   "Return t if FILEPATH is within any of `projectile-ignored-projects'"
;;   (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

;;  (after! projectile (setq projectile-project-root-files-bottom-up (remove
;;             ".git" projectile-project-root-files-bottom-up)))
;; Open org files links in same window
(setq org-startup-folded t)
(setq org-link-frame-setup '((file . find-file)))
(setq org-startup-with-inline-images t)
(setq org-image-actual-width 800)

      (map! :leader
            (:prefix ("r" . "roam")
             :desc "Open random node"           "a" #'org-roam-node-random
             :desc "Find node"                  "f" #'org-roam-node-find
             :desc "Find ref"                   "F" #'org-roam-ref-find
             :desc "Show graph"                 "g" #'org-roam-graph
             :desc "Insert node"                "i" #'org-roam-node-insert
             :desc "Capture to node"            "n" #'org-roam-capture
             :desc "Toggle roam buffer"         "r" #'org-roam-buffer-toggle
             :desc "Launch roam buffer"         "R" #'org-roam-buffer-display-dedicated
             :desc "Sync database"              "s" #'org-roam-db-sync
             :desc "Anki insert"                "a" #'anki-editor-insert-note


                (:prefix ("d" . "by date")
                :desc "Goto previous note"        "b" #'org-roam-dailies-goto-previous-note
                :desc "Goto date"                 "d" #'org-roam-dailies-goto-date
                :desc "Capture date"              "D" #'org-roam-dailies-capture-date
                :desc "Goto next note"            "f" #'org-roam-dailies-goto-next-note
                :desc "Goto tomorrow"             "m" #'org-roam-dailies-goto-tomorrow
                :desc "Capture tomorrow"          "M" #'org-roam-dailies-capture-tomorrow
                :desc "Capture today"             "n" #'org-roam-dailies-capture-today
                :desc "Goto today"                "t" #'org-roam-dailies-goto-today
                :desc "Capture today"             "T" #'org-roam-dailies-capture-today
                :desc "Goto yesterday"            "y" #'org-roam-dailies-goto-yesterday
                :desc "Capture yesterday"         "Y" #'org-roam-dailies-capture-yesterday
                :desc "Find directory"            "-" #'org-roam-dailies-find-directory)))


(map! :leader
      (:prefix ("j" . "js")
       :desc "run/switch to node.js repl"           "r" #'nodejs-repl-switch-to-repl
       :desc "repl load file"           "f" #'nodejs-repl-load-file
       :desc "repl send selected region"           "s" #'nodejs-repl-send-region
       :desc "node send line "           "l" #'nodejs-repl-send-line
       :desc "node clear cache"           "c" #'nodejs-repl-clear-cache
       :desc "node send buffer"           "b" #'nodejs-repl-send-buffer))

(map! :leader
      (:prefix ("d" . "debug")
       :desc "breakpoint toggle"       "b" #'dap-breakpoint-toggle
       :desc "repl"                    "r" #'dap-ui-repl
       :desc "dap debug restart"       "s" #'dap-debug-restart
       :desc "dap debug start"         "d" #'dap-debug
       :desc "breakpoint delete all"   "a" #'dap-breakpoint-delete-all))




;; mouse buttons
(map! :n [mouse-8] #'better-jumper-jump-backward
      :n [mouse-9] #'better-jumper-jump-forward)


(use-package! org-roam-timestamps
  :after org-roam
  :config (org-roam-timestamps-mode))

;; (auto-save-visited-mode +1)
(use-package anki-editor
  :after org
  :config
                                        ; I like making decks
  (setq anki-editor-create-decks 't))
;; (setq eaf-python-command "python")
;; (use-package! eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :custom
;;   ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (browse-url-browser-function 'eaf-open-browser)
;;   :config
;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)
;; (require 'eaf-demo)
;;   (defalias 'browse-web #'eaf-open-browser))
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;;   :commands
;; (use-package epc :defer t :ensure t)
;; (use-package ctable :defer t :ensure t)
;; (use-package deferred :defer t :ensure t)
;; (use-package s :defer t :ensure t)
;; (use-package eaf
;;   :load-path "~/.config/emacs/.local/straight/repos/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :after (epc ctable deferred s)
;;   :custom
;;   (eaf-browser-continue-where-left-off t)
;;   :config
;;   (require 'eaf-image-viewer)
;;   (require 'eaf-pdf-viewer)
;;   (require 'eaf-browser)
;;   (require 'eaf-demo)
;;   (require 'eaf-org-previewer)
;;   (eaf-setq eaf-browser-enable-adblocker "true")
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding)
;;   (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki

;; (use-package eaf-evil
;;   :init
;;   (define-key key-translation-map (kbd "SPC")
;;     (lambda (prompt)
;;       (if (derived-mode-p 'eaf-mode)
;;           (pcase eaf--buffer-app-name
;;             ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
;;                            (kbd "SPC")
;;                          (kbd eaf-evil-leader-key)))
;;             ("pdf-viewer" (kbd eaf-evil-leader-key))
;;             ("image-viewer" (kbd eaf-evil-leader-key))
;;             (_  (kbd "SPC")))
;;         (kbd "SPC")))))
;;(require 'live-py-mode)
;;(require 'org-trello)


(use-package! chatgpt
  :defer t
  :config
  (unless (boundp 'python-interpreter)
    (defvaralias 'python-interpreter 'python-shell-interpreter))
  (setq chatgpt-repo-path (expand-file-name "straight/repos/ChatGPT.el/" doom-local-dir))
  (set-popup-rule! (regexp-quote "*ChatGPT*")
    :side 'bottom :size .5 :ttl nil :quit t :modeline nil)
  :bind ("C-c q" . chatgpt-query))

(setq chatgpt-query-format-string-map '(
                                        ("doc" . "Please write the documentation for the following function.\n\n%s")
                                        ("bug" . "There is a bug in the following function, please help me fix it.\n\n%s")
                                        ("understand" . "What does the following function do?\n\n%s")
                                        ("improve" . "Please improve the following code.\n\n%s")))

(setq display-line-numbers-type 'relative)

;; Cua-mode allows one to use ‘C-v’, ‘C-c’, and ‘C-x’ to paste, copy, and cut the region.
;; Since this conflicts with very important keybindings in Emacs, these
;; CUA bindings are only active when the mark is active.

(cua-mode +1)
(define-key evil-insert-state-map (kbd "C-c") (lambda () (interactive) (cua-copy-region nil)))
(define-key evil-insert-state-map (kbd "C-v") (lambda () (interactive) (cua-paste nil)))
(define-key evil-insert-state-map (kbd "C-x") (lambda () (interactive) (cua-cut-region nil)))
(define-key evil-insert-state-map (kbd "C-z") 'evil-undo)
(define-key evil-insert-state-map (kbd "C-y") 'evil-redo)

(use-package! ob-mermaid
  :config
  (setq ob-mermaid-cli-path "~/node_modules/.bin/mmdc")
  )

(use-package! leetcode
  ;; :load-path (lambda () (expand-file-name "site-lisp/leetcode.el" doom-private-dir))
  :hook (leetcode--problem-description-mode . visual-line-mode)
  :config
  (setq leetcode-prefer-language
        ;; "c"
        ;; "cpp"
        ;; "csharp"
        ;; "golang"
        ;; "java"
        ;; "javascript",
        ;; "typescript"
        ;; "kotlin"
        ;; "php"
        ;; "python"
        "python3"
        ;; "ruby"
        ;; "rust"
        ;; "scala"
        ;; "swift"
        )
  (setq leetcode-prefer-sql "mysql")
  (setq leetcode-save-solutions t)
  (setq leetcode-directory "~/org/leetcode"))


(setq cua-keep-region-after-copy t)
(after! dap-mode
  (setq dap-python-debugger 'debugpy))
(with-eval-after-load 'python
  (define-key python-mode-map (kbd "<tab>") 'python-indent-shift-right)
  (define-key python-mode-map (kbd "S-<tab>") 'python-indent-shift-left))

(add-hook 'python-mode-hook #'rainbow-mode)

(after! dap-python

  (dap-register-debug-template "Quart RF-api"
                               (list :type "python"
                                     :request "launch"
                                     :program "/home/pegre/quant/robo-front-api/wsgi.py"
                                     :cwd nil
                                     :env '(( "FLASK_CUSTOM_SETTINGS_FILE" . ".env") (
                                                                                      "QUART_APP" . "wsgi:app"))
                                     :debugger 'debugpy
                                     :name "dap-debug-script"))

  (dap-register-debug-template "FLASK RA-api"
                               (list :type "python"
                                     :request "launch"
                                     :env '(( "FLASK_CUSTOM_SETTINGS_FILE" . ".env") (
                                                                                      "FLASK_APP" . "app.py")("PROMETHEUS_MULTIPROC_DIR" . "./tmp"))
                                     :program "/home/pegre/quant/robo_advisory_api/wsgi.py"
                                     :cwd nil
                                     :debugger 'debugpy
                                     :name "dap-flask-script"))
  ;; debug also not my files
  (dap-register-debug-template "FLASK QAP-api"
                               (list :type "python"
                                     :env '(( "FLASK_CUSTOM_SETTINGS_FILE" . "/home/pegre/quant/qap-api/.env") (
                                                                                                                "FLASK_APP" . "wsgi:app") ("prometheus_multiproc_dir" . "/tmp"))
                                     :request "launch"
                                     :program "/home/pegre/quant/qap-api/wsgi.py"
                                     :justMyCode nil
                                     :cwd nil
                                     :debugger 'debugpy
                                     :name "dap-qap-flask-script"))

  (dap-register-debug-template "FLASK QAP-api attach"
                               (list :type "python"
                                     :request "attach"
                                     :cwd nil
                                     :debugger 'debugpy
                                     :name "dap-qap-flask-script"))

  (dap-register-debug-template "Firefox Attach New"
                               (list :type "firefox"
                                     :cwd nil
                                     :request "attach"
                                     :file nil
                                     :reAttach t
                                     :program nil
                                     :name "Firefox::Run"))
  (dap-register-debug-template
   "Chrome Browse URL"
   (list :type "firefox"
         :cwd nil
         :mode "url"
         :request "launch"
         :webRoot nil
         :url nil
         :name "Firefox Browse URL")))


;; print the path in jq format ("dot notation")
(after! json-mode
  (setq jsons-path-printer 'jsons-print-path-jq))

(setq browse-url-browser-function 'browse-url-firefox)
(use-package! ejira
  :init
  (setq jiralib2-url              "https://quantfolio2021.atlassian.net"
        jiralib2-auth             'token
        jiralib2-user-login-name  "przemyslaw.grenda@profil-software.com"
        jiralib2-token            "XUWqF8TwWnKe4a188xLh6F0D"

        ;; NOTE, this directory needs to be in `org-agenda-files'`
        ejira-org-directory       "~/org/jira"
        ejira-projects            '("SAPP")

        ejira-priorities-alist    '(("Highest" . ?A)
                                    ("High"    . ?B)
                                    ("Medium"  . ?C)
                                    ("Low"     . ?D)
                                    ("Lowest"  . ?E))
        ejira-todo-states-alist   '(("TO DO"       . 1)
                                    ("IN PROGRESS" . 2)
                                    ("BLOCKED"     . 3)
                                    ("TEST/REVIEW"     . 4)
                                    ("DONE" .5)))

  :config
  ;; Tries to auto-set custom fields by looking into /editmeta
  ;; of an issue and an epic.
  (add-hook 'jiralib2-post-login-hook #'ejira-guess-epic-sprint-fields)


  (require 'ejira-agenda)

  ;; Make the issues visisble in your agenda by adding `ejira-org-directory'
  ;; into your `org-agenda-files'.
  (add-to-list 'org-agenda-files ejira-org-directory)

  ;; Add an agenda view to browse the issues that
  (org-add-agenda-custom-command
   '("j" "My JIRA issues"
     ((ejira-jql "resolution = unresolved and assignee = currentUser()"
                 ((org-agenda-overriding-header "Assigned to me")))))))

(setq-hook! 'python-mode-hook +format-with-lsp nil)
(setq +format-on-save-enabled-modes '(not python-mode))
;; (dap-register-debug-template "Python: Django"
;;   (list :type "python"
;;         :args "runserver --noreload"
;;         :cwd "/home/pegre/work/backend"
;;         :module nil
;;         :console "integratedTerminal"
;;         :env '(("DEBUG" . "1"))
;;         :program "manage.py"
;;         :django t
;;         :request "launch"
;;         :name "Python: Django"))

;; (dap-register-debug-template
;;  "Testing"
;;  (list :type "python"
;;        :request "launch"
;;        :args "ENV_NAME='.env' -m pytest -n auto"

;;        :name "Testing")))
;; (add-hook 'python-mode-hook
;;       (lambda ()
;;         (setq indent-tabs-mode t)
;;         (setq tab-width 4)
;;         (setq python-indent-offset 4)))
;; (require 'go-translate)

;; (setq gts-translate-list '(("en" "pl") ("pl" "en") ("no" "en") ("en" "no")))

;; (setq gts-default-translator
;;       (gts-translator
;;        :picker (gts-prompt-picker)
;;        ;; :engines (list (gts-bing-engine) (gts-google-engine))

(with-eval-after-load 'org-tempo
  (add-to-list 'org-structure-template-alist '("y" "#+BEGIN_SRC jupyter-python :results output \n\n#+END_SRC") ))

;; on save of org file run org-re-reveal-export-to-html


;; i3 integration

(defmacro i3-msg (&rest args)
  `(start-process "emacs-i3-windmove" nil "i3-msg" ,@args))

(defun my/emacs-i3-windmove (dir)
  (let ((other-window (windmove-find-other-window dir)))
    (if (or (null other-window) (window-minibuffer-p other-window))
        (- (error command))
      (windmove-do-window-select dir))))

(defun my/emacs-i3-direction-exists-p (dir)
  (cl-some (lambda (dir)
             (let ((win (windmove-find-other-window dir)))
               (and win (not (window-minibuffer-p win)))))
           (pcase dir
             ('width '(left right))
             ('height '(up down)))))

(defun my/emacs-i3-move-window (dir)
  (let ((other-window (windmove-find-other-window dir))
        (other-direction (my/emacs-i3-direction-exists-p
                          (pcase dir
                            ('up 'width)
                            ('down 'width)
                            ('left 'height)
                            ('right 'height)))))
    (cond
     ((and other-window (not (window-minibuffer-p other-window)))
      (window-swap-states (selected-window) other-window))
     (other-direction
      (evil-move-window dir))
     (t (- (error command))))))

(defun my/emacs-i3-resize-window (dir kind value)
  (if (or (one-window-p)
          (not (my/emacs-i3-direction-exists-p dir)))
      (i3-msg "resize" (symbol-name kind) (symbol-name dir)
              (format "%s px or %s ppt" value value))
    (setq value (/ value 2))
    (pcase kind
      ('shrink
       (pcase dir
         ('width
          (evil-window-decrease-width value))
         ('height
          (evil-window-decrease-height value))))
      ('grow
       (pcase dir
         ('width
          (evil-window-increase-width value))
         ('height
          (evil-window-increase-height value)))))))
;; From the readme (https://github.com/noctuid/general.el#automatic-key-unbinding):
(general-auto-unbind-keys t)

(defun my/emacs-i3-integration (command)
  (pcase command
    ((rx bos "focus")
     (my/emacs-i3-windmove
      (intern (elt (split-string command) 1))))
    ((rx bos "move")
     (my/emacs-i3-move-window
      (intern (elt (split-string command) 1))))
    ((rx bos "resize")
     (my/emacs-i3-resize-window
      (intern (elt (split-string command) 2))
      (intern (elt (split-string command) 1))
      (string-to-number (elt (split-string command) 3))))
    ("layout toggle split" (transpose-frame))
    ("split h" (evil-window-split))
    ("split v" (evil-window-vsplit))
    (- (error command))))

(defun my-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (company-indent-or-complete-common nil)))

(define-key global-map [remap +web/indent-or-yas-or-emmet-expand] '(lambda ()
                                                         (interactive)
                                                         (or (copilot-accept-completion)
                                                             (+web/indent-or-yas-or-emmet-expand))))
(after! org
(add-hook 'org-mode-hook #'copilot-mode)
(add-hook 'org-mode-hook #'auto-save-visited-mode))

;; https://github.com/zerolfx/copilot.el/issues/35#issuecomment-1172977619
(define-key global-map [remap indent-for-tab-command] '(lambda ()
                                                         (interactive)
                                                         (or (copilot-accept-completion)
                                                             (indent-for-tab-command))))
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map company-active-map
         ("<tab>" . 'my-tab)
         ("TAB" . 'my-tab)
         :map company-mode-map
         ("<tab>" . 'my-tab)
         ("TAB" . 'my-tab)))

(defun reformat-xml ()
  (interactive)
  (save-excursion
    (sgml-pretty-print (point-min) (point-max))
    (indent-region (point-min) (point-max))))
;; after rjsx mode
(after! rjsx-mode
  (use-package! lsp-tailwindcss
    :init
    (setq! lsp-tailwindcss-add-on-mode t)))

(setq org-roam-timestamps-parent-file nil)
(setq org-roam-timestamps-remember-timestamps nil)
(setq org-roam-timestamps-minimum-gap 600)
(use-package! org-roam-timestamps
  :after org-roam
  :config (org-roam-timestamps-mode))
(setq org-agenda-files (list "~/org/agenda/" "~/org/roam/daily/"))

(require 'org-ai)

(defcustom my-default-org-image-directory
  "~/org-images/"
  "Default directory for images for org link insertion."
  :type 'string
  :group 'image-org-link-insertion)

(defcustom my-image-extensions
  '("png" "jpg" "jpeg" "tiff")
  "List of image extensions allowed for org link insertion."
  :type '(repeat string)
  :group 'image-org-link-insertion)

(defun insert-image-org-link (img)
  "Insert an org image link, choosing the file with completion
and starting from `my-default-org-image-directory'."
  (interactive
   (list (read-file-name
          "Image: " my-default-org-image-directory nil t nil
          (lambda (name)
            (or (directory-name-p name)
                (member (file-name-extension name)
                        my-image-extensions))))))
  (insert (format "[[%s]]" img)))
