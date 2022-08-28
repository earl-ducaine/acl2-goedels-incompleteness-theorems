



(defun app (x y)
  (cond ((endp x) y)
        (t (cons (car x)
                 (app (cdr x) y)))))


(defun rightarrow (x y)
  (implies x y))

(defun leftarrow (x y)
  (implies y x))

(defun leftrightarrow (x y)
  (and (rightarrow x y)
       (leftarrow x y)))

(defun true (x)
  (not (null x)))

(defun land (a b)
  (and a b))

(defun lor (a b)
  (or a b))


(defthm land-def
  (equal (land a b)
         (not (lor (not a) (not b)))))

(defthm rightarrow-self-implication
  (equal (rightarrow x x)
         t))



(defthm rightarrow-self-implication
  (equal (rightarrow x x)
         t))




(defthm rightarrow-self-implication
  (equal (rightarrow x x)
         t))

(defthm leftrightarrow-equivelence
    (equal (or (and (null b) (null a))
               (and (true b) (true a)))
        (leftrightarrow a b)))



(defthm associativity-of-app
        (equal (app (app a b) c)
               (app a (app b c))))


(defthm equivalence
    (implies (and (implies a b) (implies b a))
             (= a b)))
