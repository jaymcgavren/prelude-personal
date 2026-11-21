;;; lua-lsp.el --- Lua Language Server (LuaLS) via lsp-mode -*- lexical-binding: t; -*-

;;; Commentary:
;; Uses the Homebrew-installed lua-language-server instead of lsp-mode's
;; unverified auto-download.  lsp-mode only treats the server as installed
;; if both the binary and main.lua exist, so point it at Homebrew's files.
;; The bin/ wrapper keeps LuaLS logs in ~/.cache/lua-language-server.

;;; Code:

(with-eval-after-load 'lsp-lua
  (setq lsp-clients-lua-language-server-bin
        "/opt/homebrew/opt/lua-language-server/bin/lua-language-server"
        lsp-clients-lua-language-server-main-location
        "/opt/homebrew/opt/lua-language-server/libexec/main.lua"))

(add-hook 'lua-mode-hook #'lsp-deferred)

;;; lua-lsp.el ends here
