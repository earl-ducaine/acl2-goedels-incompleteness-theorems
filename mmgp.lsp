
(defun z2-function (fn)
  (equal (car fn) 2))

(defun z2-variable (x)
  (integerp x))

(defun predicate (p)
  (equal (car p) 3))

(defun degree (fn)
  (fix (cddr fn)))

(defun index (fn)
  (fix (cadr fn)))

(defun v (x)
  (fix x))

(defun fn (x y)
  (cons 2 (cons (fix x) (fix y))))

(defun p (x y)
  (cons 3 (cons (fix x) (fix y))))


(defun z2-notp (x)
  (equal (car x) 'z2-not))

(defun f-not (x)
  (cons 'z2-not x))

(defun z2-orp (x)
  (equal (car x) 'z2-or))

(defun z2-or (x)
  (cons 'z2-or x))


;; (include-book "tools/include-raw" :dir :system)

;; (defttag :my-ttag) ; required before calling include-raw

;; (include-raw "my-raw-lisp-file.lsp")

;; (include-raw "another-raw-lisp-file.lsp"
;;              :do-not-compile t)
