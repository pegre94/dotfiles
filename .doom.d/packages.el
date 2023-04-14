;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
(unpin! org-roam company-org-roam)
(package! exec-path-from-shell)
(package! ob-mermaid)
(package! org-trello)
(package! org-roam-timestamps)
(package! org-ai :recipe (:host github :repo "rksm/org-ai"))


;; (use-package! eaf
;;   :commands (eaf-open-browser eaf-open find-file)
;;   :config
;;   (use-package! ctable)
;;   (use-package! deferred)
;;   (use-package! epc))

;; (package! eaf-browser
;;   :recipe (:host github
;;            :repo "emacs-eaf/eaf-browser"
;;            :files ("*")
;;            :pre-build ("npm" "install")))
;; (package! eaf :recipe (:type git :host github
;;                              :repo "manateelazycat/emacs-application-framework"
;;                              :files ("app" "core" "*.el" "*.py")
;;                              :build (:not compile)))


;;  (package! ctable :recipe (:host github :repo "kiwanami/emacs-ctable"))
;;  (package! deferred :recipe (:host github :repo "kiwanami/emacs-deferred"))
;;  (package! epc :recipe (:host github :repo "kiwanami/emacs-epc"))

;; (straight-use-package
;;  '(eaf
;;    :host github
;;    :repo "emacs-eaf/emacs-application-framework"
;;    :files (:defaults "eaf.py" "setup.py" "install-eaf.py" "core" "extension" "app" "*.el" )
;;    )
;;
;;
(package! epc)
(package! ctable)
(package! deferred)
(package! s)
(package! blamer)
(package! ejira :recipe (:host github :repo "nyyManni/ejira"))
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! chatgpt
  :recipe (:host github :repo "joshcho/ChatGPT.el" :files ("dist" "*.el")))

;; (package! eaf
;;   :recipe (:host github
;;            :repo "emacs-eaf/emacs-application-framework"))

;; (use-package i3-mode
;;   :straight (i3-mode :repo "junyi-hou/i3-mode" :host github
;;                      :files ("i3-mode.el" "i3-call" "sway-call"))
;;   :init
;;   (i3-mode 1))
