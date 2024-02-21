+++
title = "Cider shadow-cljs sane defaults"
date = 2024-02-20T00:00:00-03:00
lastmod = 2024-02-20T23:50:10-03:00
draft = true
weight = 2001
+++

```lisp-data
((clojure-mode
  (cider-lein-parameters . "with-profile -user,+pretty,+dev-local,+dev,+test repl :headless :host localhost")
  (cider-ns-reload-after-fn . "user/restart")
  (cider-ns-refresh-after-fn . "user/reset"))
 (clojurescript-mode
  (cider-preferred-build-tool . shadow-cljs))
 (nil
  (cider-default-cljs-repl . shadow)
  (cider-shadow-default-options . ":app")))
```

[file:~/myproject/.dir-locals.el](~/Documentos/Programming/Clojure/zougue-mpms/.dir-locals.el)
