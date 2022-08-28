;; Load using ld

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


(defun f-notp (x)
  (equal (car x) 'z2-not))

(defun f-not (x)
  (cons 'z2-not x))

(defun arg (x)
  (cdr x))

(defun f-orp (x)
  (equal (car x) 'z2-or))

(defun z2-or (x y)
  (cons 'z2-or (cons x y)))

(defun arg1 (x)
  (cadr x))

(defun arg2 (x)
  (cddr x))


;; forsome

(defun forsomep (x)
  (equal (car x) 'z2-forsome))

(defun forsome (x y)
  (cons 'z2-forsome (cons (fix x) y)))

(defun bind (x)
  (fix (cadr x)))

(defun fix1 (x)
  (if (integerp x) x nil))

(defun z2-body (x)
  (cddr x))

(defun z2-eql (x y)
  (if (consp x)
      (if (consp y)
          (and (z2-eql (car x) (car y))
               (z2-eql (cdr x) (cdr y)))
          nil)
      (if (consp y)
          nil
          (if (f-notp x)
              (if (f-notp y)
                  (z2-eql (arg x) (arg y))
                  nil)
              (if (f-notp y)
                  nil
                  (if (f-orp x)
                      (if (f-orp y)
                          (and (z2-eql (arg1 x) (arg1 y))
                               (z2-eql (arg2 x) (arg2 y)))
                          nil)
                      (if (f-orp y)
                          nil
                          (if (forsomep x)
                              (if (forsomep y)
                                  (and (equal (bind x) (bind y))
                                       (z2-eql (z2-body x) (z2-body y)))
                                  nil)
                              (if (forsomep y)
                                  nil
                                  (equal (fix1 x)
                                         (fix1 y)))))))))))


(defun memb (x y)
  (if (consp y)
      (if (z2-eql x (car y))
          t
          (memb x (cdr y)))
      nil))

(defun symb (x symbols)
  (or (equal x (p 0 2))
      (memb x symbols)))

(defmacro nlistp (exp)
  (not (consp exp)))


;; z2-termp


;; (defun z2-termp (exp flg symbols)
;;   (declare (xargs :guard (and (listp symbols) (or (consp exp) (nlistp exp))
;;                                (integerp flg))))
;;   (if (zerop (fix flg))


(defun z2-termp (exp flg symbols)
  (declare (xargs :guard (and (listp symbols) (or (consp exp) (nlistp exp))
                               (integerp flg))))
  (if (zerop (fix flg))







      (if (consp exp)
          (and (z2-function (car exp))
               (symb (car exp) symbols)
               (z2-termp (cdr exp) 1 symbols)
               (equal (length (cdr exp))
                      (degree (car exp))))
          (z2-variable exp))
      (if (nlistp exp)
          t
          (and (z2-termp (car exp) 0 symbols)
               (z2-termp (cdr exp) 1 symbols)))))






;; (include-book "tools/include-raw" :dir :system)

;; (defttag :my-ttag) ; required before calling include-raw

;; (include-raw "my-raw-lisp-file.lsp")

;; (include-raw "another-raw-lisp-file.lsp"
;;              :do-not-compile t)
