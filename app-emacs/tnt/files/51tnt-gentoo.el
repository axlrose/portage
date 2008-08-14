
;;; tnt site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'tnt-open "tnt" "Start TNT" t)
(autoload 'tnt-proxy-switch-servers "tnt" "Switch TNT proxy servers." t)
(autoload 'tnt-proxy-toggle-proxy-use "tnt" "Toggle use of TNT proxy server." t)
(autoload 'tnt-customize "tnt" "Customization of the group 'tnt'." t)
