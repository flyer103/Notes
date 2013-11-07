(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t)
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-long-line-face ((((class color)) (:background "gray10"))) t)
 '(my-tab-face ((((class color)) (:background "grey10"))) t)
 '(my-trailing-space-face ((((class color)) (:background "gray10"))) t))

;; set default coding system
(prefer-coding-system 'utf-8)

;;设置emacs扩展目录位置
(add-to-list 'load-path "~/.emacs.d/extensions/")

;;设置背景和前景色,通过 M-x color-theme-select 进入主题列表,在所
;; (require 'color-theme)
;; (color-theme-comidia)

;; Turn on font-locking globally
(global-font-lock-mode t)

;;设置行距,可通过 M-x eval-current-buffer 执行
(setq-default line-spacing 1)

;;语法加亮
(global-font-lock-mode t)

;; 屏蔽 C-SPC 组合键
;; (global-set-key (kbd "C-SPC") nil)

;;设置字体
;(set-fontset-font "fontset-default" 'gb18030 '("WenQuanYi Zen Hei" . "unicode-bmp"))
(set-default-font "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")

;;设置个人信息
(setq user-full-name "flyer")
(setq user-mail-address "flyer103@gmail.com")

;;在标题栏显示buffer名字
(setq frame-title-format "%b")

;;自动显示行号,但要事先把 linum.el 添加到扩展中
(require 'linum)
(global-linum-mode 1)

;;设置tabbar
(require 'tabbar)
(tabbar-mode t)
(global-set-key (kbd "C-1") 'tabbar-backward)
(global-set-key (kbd "C-2") 'tabbar-forward)

;;高亮显示当前行
;; (global-hl-line-mode 1)

;;Make text mode the default major mode and start auto-fill mode 
;;automatically each time you enter Emacs
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;显示光标位置
(setq column-number-mode t)
(setq line-number-mode t)

;;设置 kill-ring-max 为300
(setq kill-ring-max 300)

;;高亮显示选择区域
(setq transient-mark-mode t)

;;显示日期时间
    ;在minibuffer上启动实现显示
    (display-time-mode 1)
    ;使用24小时制
    (setq display-time-24hr-format t)
    ;时间显示包括日期和具体时间
    (setq display-time-day-and-date t)
    ;时间栏旁边启用邮件设置
    (setq display-time-use-mail-icon t)
    ;时间变化率
    (setq display-time-interval 10)
(display-time-mode 1)


;;代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
;(add-hook 'php-mode-hook 'hs-minor-mode)x
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;;打开图片显示功能
;(auto-image-file-mode t)

;;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;;去掉工具栏
(tool-bar-mode 0)

;;去掉菜单栏
(menu-bar-mode 0)

;;去掉滚动栏
(scroll-bar-mode 0)

;;防止页面滚动时跳动，可在靠近屏幕边沿3行时就开始滚动
(setq scroll-margin 1 scroll-conservatively 10000)

;;用滚轴鼠标
(mouse-wheel-mode t)

;;去掉 Emacs 和 gnus 启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;;C/C++语言风格
(defun wx-c-mode-hook()
(setq tab-width 2 indent-tabs-mode nil)
;F7编译
(setq c-basic-offset 2)
)
;(add-hook 'c-mode-hook 'wx-c-mode-hook)
(add-hook 'c-mode-common-hook 'google-set-style)
(add-hook 'c++-mode-hook
   (setq c-basic-offset 2)
   '(lambda ()
   (c-set-style "stroustrup")))
;(setq c-basic-offset 4)

;;;;--------------Global Hot Key-------------------
;;F1: close 当前buffer
(global-set-key [(f1)] 'kill-buffer)

;;F2: close the current buffer and window
(global-set-key [(f2)] 'kill-buffer-and-window)

;;F3:切换到shell模式
(global-set-key [(f3)] 'ansi-term)

;;F4:关闭buffer
;(global-set-key [(f4)] 'kill-buffer-and-window)

;;F5:打开speedbar
(global-set-key [(f5)] 'speedbar)

;;F6:跳到另一个窗口
(global-set-key [(f6)] 'other-window)

;;F7:编译
(global-set-key [(f7)] 'compile)

;;F8:gdb
(global-set-key [(f8)] 'gdb)

;;F9:获得 man 帮助
(global-set-key [(f9)] 'man)

;;F10:gdb-next
(global-set-key [(f10)] 'gdb-next)

;;F11:insert template from ~/.template
;(global-set-key [(f11)] 'template-open-template)


;;激活org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
; Many commands in Org work on the region if the region is active. To make use
; of this, you need to have transient-mark-mode turned on.
(transient-mark-mode 1)  ; (zmacs-regions 1) for XEmacs
(setq org-log-done t)
; If you don't like the automatic table editor because it gets in your way on
; lines which you would like to start with '|', you can turn it off with
;(setq org-enable-table-editor nil)

;;标准注释 doxymacs
;; (require 'doxymacs)
;;     ;让doxymacs-mode随c/c++ mode自动启动
;;     (add-hook 'c-mode-common-hook 'doxymacs-mode)


;;cc-mode 配置
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
(defun my-c-mode-common-hook ()
  (setq tab-width 4 indent-tabs-mode nil)
  ;hungry-delete and auto-newline
;  (c-toggle-auto-hungry-state 1)
  ;按键定义
  (define-key c-mode-base-map [(control \')] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(meta \')] 'c-indent-command)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)

;;预处理设置
(setq c-macro-shrink-window-flag t)
(setq c-macro-preprocessor "cpp")
(setq c-macro-cppflags " ")
(setq c-macro-prompt-flag t)
(setq hs-minor-mode t)
(setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;;我的C++语言编辑策略
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
  ;;  (define-key c++-mode-map [f3] 'replace-regexp)
  )

;;默认Linux内核编程风格
(setq auto-mode-alist (cons '("/usr/src/linux.*/.*\\.[ch]$" . linux-c-mode) 
			    auto-mode-alist))
(defun linux-c-mode ()
  "C mode with ajusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (setq tab-width 4)    ;;默认风格是8个缩进
  (setq indent-tabs-mode t)
  (setq c-basic offset 4))    ;;默认风格是8个缩进

(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

;;加入 yasnippet-bundle
(require 'yasnippet-bundle)
(require 'yasnippet)

;; auto-complete
;(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/extensions/ac-dict")
(ac-config-default)
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-yasnippet)
(require 'auto-complete-etags)
(require 'auto-complete-extension)
(require 'auto-complete-octave)
(require 'auto-complete+)
;(require 'auto-complete-c)
(require 'util)

(defun auto-complete-settings ()
  "Settings for `auto-complete'."
  ;; After do this, isearch any string, M-: (match-data) always
  ;; return the list whose elements is integer
  (global-auto-complete-mode 1)

  ;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
  ;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
  ;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
  (apply-define-key
   ac-complete-mode-map
   `(("<return>"   nil)
     ("RET"        nil)
     ("C-i" ac-complete)
     ("M-j"        ac-complete)
     ("<C-return>" ac-complete)
     ("M-n"        ac-next)
     ("M-p"        ac-previous)))

  (setq ac-dwim t)
  (setq ac-candidate-max ac-candidate-menu-height)

  (set-default 'ac-sources
               '(ac-source-semantic
                 ac-source-yasnippet
                 ac-source-abbrev
                 ac-source-words-in-buffer
                 ac-source-words-in-all-buffer
                 ac-source-imenu
                 ac-source-files-in-current-dir
                 ac-source-filename))
  (setq ac-modes ac+-modes)

  (dolist (command `(backward-delete-char-untabify delete-backward-char))
    (add-to-list 'ac-trigger-commands command))

  (defun ac-start-use-sources (sources)
    (interactive)
    (let ((ac-sources sources))
      (call-interactively 'ac-start)))

  (defvar ac-trigger-edit-commands
    `(self-insert-command
      delete-backward-char
      backward-delete-char
      backward-delete-char-untabify)
    "*Trigger edit commands that specify whether `auto-complete' should start or not when `ac-completing'."))

(eval-after-load "auto-complete"
  '(auto-complete-settings))

(eval-after-load "cc-mode"
  '(progn
     (dolist (command `(c-electric-backspace
                        c-electric-backspace-kill))
       (add-to-list 'ac-trigger-commands command)
       (add-to-list 'ac-trigger-edit-commands command))))

(eval-after-load "autopair"
  '(progn
     (dolist (command `(autopair-insert-or-skip-quote
                        autopair-backspace
                        autopair-extra-skip-close-maybe))
       (add-to-list 'ac-trigger-commands command))

     (defun ac-trigger-command-p ()
       "Return non-nil if `this-command' is a trigger command."
       (or
        (and
         (memq this-command ac-trigger-commands)
         (let* ((autopair-emulation-alist nil)
                (key (this-single-command-keys))
                (beyond-autopair (or (key-binding key)
                                     (key-binding (lookup-key local-function-key-map key)))))
           (memq beyond-autopair ac-trigger-edit-commands)))
        (and ac-completing
             (memq this-command ac-trigger-edit-commands))))))

(defun ac-settings-4-lisp ()
  "Auto complete settings for lisp mode."
  (setq ac-omni-completion-sources '(("\\<featurep\s+'" ac+-source-elisp-features)
                                     ("\\<require\s+'"  ac+-source-elisp-features)
                                     ("\\<load\s+\""    ac-source-emacs-lisp-features)))
  (ac+-apply-source-elisp-faces)
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-symbols
          ;; ac-source-semantic
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ;; ac-source-imenu
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-java ()
  (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
                                         (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-c ()
  (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
                                         (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-c-keywords
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-cpp ()
  (setq ac-omni-completion-sources
        (list (cons "\\." '(ac-source-semantic))
              (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-c++-keywords
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-text ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-imenu)))

(defun ac-settings-4-eshell ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-symbols
          ac-source-imenu)))

(defun ac-settings-4-ruby ()
  (require 'rcodetools-settings)
  (setq ac-omni-completion-sources
        (list (cons "\\." '(ac-source-rcodetools))
              (cons "::" '(ac-source-rcodetools)))))

(defun ac-settings-4-html ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-tcl ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-awk ()
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-all-buffer
          ac-source-files-in-current-dir
          ac-source-filename)))

(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

(provide 'auto-complete-settings)

;; format the copied code automatically
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
	   (member major-mode
		   '(emacs-lisp-mode
		     lisp-mode
		     clojure-mode
		     scheme-mode
		     haskell-mode
		     ruby-mode
		     rspec-mode
		     python-mode
		     c-mode
		     c++-mode
		     objc-mode
		     latex-mode
		     js-mode
		     plain-tex-mode))
	   (let ((mark-even-if-inactive transient-mark-mode))
	     (indent-region (region-beginning) (region-end) nil))))))


;; Turn on documentation in elisp mode
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (turn-on-eldoc-mode)))

;; c-eldoc 函数提示
;(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(load "c-eldoc")
(add-hook 'c-mode-hook
	  (lambda()
	    (set (make-local-variable 'eldoc-idle-delay) 0.20)
	    (c-turn-on-eldoc-mode)
	    ))

;; complier 配置
(setq compile-command "gcc -Wall")


;; gdb 配置
(setq gdb-many-windows t)    ;调试时直接打开 gdb-many-windows

;; EIM Input Method. Use C-\ to toggle input method.
(add-to-list 'load-path "~/.emacs.d/extensions/eim")
(require 'eim-extra)
(autoload 'eim-use-package "eim" "chinese-py")
(setq eim-use-tooltip nil)              ; don't use tooltip
(setq eim-punc-translate-p nil)         ; use English punctuation
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "EIM Chinese Pinyin Input Method" "py.txt"
 'my-eim-py-activate-function)
(set-input-method "eim-py")             ; use Pinyin input method
(setq activate-input-method t)          ; active input method
(toggle-input-method nil)               ; default is turn off
(defun my-eim-py-activate-function ()
  (add-hook 'eim-active-hook
            (lambda ()
              (let ((map (eim-mode-map)))
                (define-key eim-mode-map "-" 'eim-previous-page)
                (define-key eim-mode-map "=" 'eim-next-page)))))

;;cscope
(require 'xcscope)
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (require 'xcscope)))
(setq cscope-do-not-update-database t)

;; 辅助函数，用来给指定模式添加超过80列的高亮功能
(defun cc-mode-add-keywords (mode)
  (font-lock-add-keywords 
   mode
   '(("\t+" (0 'my-tab-face append))
     ("^.\\{81\\}\\(.+\\)$" (1 'my-long-line-face append)))))

;; 对指定模式使用"超过80列高亮"功能
(cc-mode-add-keywords 'c-mode)
(cc-mode-add-keywords 'cc-mode)
(cc-mode-add-keywords 'c++-mode)
(cc-mode-add-keywords 'perl-mode)
(cc-mode-add-keywords 'python-mode)
;(cc-mode-add-keywords 'php-mode)

;;默认显示 80 列就换行
(setq default-fill-column 80)

;;把每次生成的备份文件(以~结尾)保存到 ~/.bak_emacs 中
(setq backup-directory-alist (quote (("." . "~/.bak_emacs"))))

;;ctyes.el,高亮显示 C 中自己定义的类型
(require 'ctypes)
(ctypes-auto-parse-mode 1)


;(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
;			 ("gnu" . "http://elpa.gnu.org/packages/")
;			 ("marmalade" . "http://marmalade-repo.org/packages/")))

;; slime for lisp
;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (add-to-list 'load-path "~/config/lisp/slime/")
;; (add-to-list 'load-path "~/config/lisp/slime/contrib")
;; (require 'slime)
;; (slime-setup '(slime-fancy slime-asdf slime-tramp))

;; python-mode
;; (load-library "init_python")

; Open large file
(require 'vlf)
(defun vlf-extract-part-of-file (file from to)
   "Returns bytes in FILE from FROM to TO."
   (let ((size (vlf-file-size file)))
     (if (or (> from size)
             (> to size))
         (error "From or to is larger that the file size"))
     (with-temp-buffer
       (shell-command
        (format "head --bytes %d %s | tail --bytes %d"
 	       to file (+ (- to from) 1)) t)
       (buffer-substring (point-min) (point-max)))))

; PSGML
(defalias 'xml-mode 'sgml-mode
  "Use `sgml-mode' instead of nXML's `xml-mode'.")
(setq sgml-set-face t)
(setq sgml-auto-activate-dtd t)
(setq sgml-indent-data t)
(setq sgml-markup-faces '(
			  (start-tag . font-lock-keyword-face)
			  (end-tag . font-lock-keyword-face)
			  (comment . font-lock-comment-face)
			  (pi . font-lock-constant-face) ;; <?xml?>
			  (sgml . font-lock-type-face)
			  (doctype . bold)
			  (entity . italic)
			  (shortref . font-lock-reference-face)))
;; (setq sgml-xml-mode t)
;; (add-hook 'html-mode-hook
;; 	  (lambda ()
;; 	    (set (make-local-variable 'sgml-xml-mode) t)))

; js
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
;(require 'js2-mode)
;(add-to-list 'load-path "~/.emacs.d/lintnode")
;(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
;(setq lintnode-location "~/.emacs.d/lintnode")
;; JSLint can be... opinionated
; (setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
; ;; Start the server when we first open a js file and start checking
; (add-hook 'js-mode-hook
;           (lambda ()
;             (lintnode-hook)))
; (add-hook 'js-mode-hook
;           (lambda ()
;             ;; Scan the file for nested code blocks
;             (imenu-add-menubar-index)
;             ;; Activate the folding mode
;             (hs-minor-mode t)))
; (require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")

(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
						 (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))

; Use ido-mode
(require 'ido)
(ido-mode t)

; templeate
(require 'template)
(template-initialize)
(setq template-default-directories (cons "~/config/templates/" template-default-directories))
(add-to-list 'template-find-file-commands
             'ido-exit-minibuffer)
(dolist (cmd '(ido-select-text ido-magic-forward-char
                               ido-exit-minibuffer))
  (add-to-list 'template-find-file-commands cmd))


; PHP mode
(require 'php-mode)
(add-hook 'php-mode-hook
	  '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))
(defun wx-php-mode-hook()
(setq tab-width 4 indent-tabs-mode nil)
(setq c-basic-offset 4)
)
(add-hook 'php-mode-hook 'wx-php-mode-hook)


; TODO list
;; set different states
(setq org-todo-keywords
      '((sequence "TODO" "IMPORTANT" "|" "DONE" "CANCELED")))
;; 在 DONE 状态时做注释
;(setq org-log-done 'note)


(setq default-tab-width 4)
(setq-default indent-tabs-mode t)    

;; ffap
(require 'ffap)
(global-set-key (kbd "C-4") 'ffap)


; Something that Emacs24.1.1 has changed
;; C-x C-f
(global-set-key (kbd "C-x C-f") 'find-file)


; Python

(defface codepilot-folding-overlay 
  '((default (:inherit region :box (:line-width 1 :color "DarkSeaGreen1" :style released-button))) 
	(((class color)) (:background "DarkSeaGreen2" :foreground "black"))) 
  "*Font used by folding overlay." 
  :group 'codepilot) 

(defun cptree-ov-delete () 
  (interactive) 
  (dolist (o (overlays-at (point))) 
	(cptree-delete-overlay o 'cptree))) 

(defvar cptree--overlay-keymap nil "keymap for folding overlay") 

(unless cptree--overlay-keymap 
  (let ((map (make-sparse-keymap))) 
	(define-key map [mouse-1] 'cptree-ov-delete) 
	(define-key map "\r" 'cptree-ov-delete) 
	(setq cptree--overlay-keymap map))) 

(defun cptree-delete-overlay(o prop) 
  (when (eq (overlay-get o 'cptree-tag) prop) 
	(delete-overlay o) 
	t)) 

(defun cptree-hide-region (from to prop) 
  "Hides a region by making an invisible overlay over it and save the 
overlay on the hide-region-overlays \"ring\"" 
  (interactive) 
  (let ((new-overlay (make-overlay from to))) 
	;;(overlay-put new-overlay 'invisible nil) 
	(overlay-put new-overlay 'cptree-tag prop) 
	(overlay-put new-overlay 'face 'codepilot-folding-overlay) 
	(overlay-put new-overlay 'display 
				 (propertize 
				  (format "...<%d lines>..." 
						  (1- (count-lines (overlay-start new-overlay) 
										   (overlay-end new-overlay)))))) 
	(overlay-put new-overlay 'priority (- 0 from)) 
	(overlay-put new-overlay 'keymap cptree--overlay-keymap) 
	(overlay-put new-overlay 'pointer 'hand))) 

(require 'python) 

(defun mypython-fold/unfold-block () 
  "fold the block" 
  (interactive) 
  (let (ret b e) 
	(dolist (o (overlays-at (if (python-open-block-statement-p) 
								(save-excursion 
								  (python-end-of-statement) 
								  (point) 
								  ) 
							  (point)))) 
	  (when (cptree-delete-overlay o 'cptree) 
		(setq ret t))) 
	(unless ret 
	  (save-excursion 
		(unless (python-open-block-statement-p) 
		  (python-beginning-of-block)) 
		(python-end-of-statement) 
		(setq b (point)) 
		(python-end-of-block) 
		(setq e (1- (point))) 
		(cptree-hide-region b e 'cptree))))) 

(define-key python-mode-map (kbd "C-x C-D") 'mypython-fold/unfold-block)

;; 'el-get' package manager
(add-to-list 'load-path "~/emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	(goto-char (point-max))
	(eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/emacs.d/el-get-user/recipes")
(el-get 'sync)

;; 'jedi': auto-completion for python
(add-hook 'python-mode-hook 'jedi:setup)

;; auto-indention using RET
(define-key global-map (kbd "RET") 'newline-and-indent)
