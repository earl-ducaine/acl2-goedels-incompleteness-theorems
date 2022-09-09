





;; Predicate
(p 1 1)
(predicate (p 1 1))


;; variable
(v 0)
(g-variable (v 0))

;; function
(fn 0 2)
(g-function (fn 0 2))


;; not
(f-notp (f-not (v 0)))


;; or
(f-or (f-not (v 0))
      (v 0))


;; forsome
(forsome (v 0)
          (f-or
           (f-not (v 1))
           (v 1)))

(g-bind (forsome (v 0)
          (f-or
           (f-not (v 1))
           (v 1))))

(g-body (forsome (v 0)
          (f-or
           (f-not (v 1))
           (v 1))))





;; geql
(g-eql
 (forsome (v 0)
          (f-or
           (f-not (v 1))
           (v 1)))
 (forsome (v 1)
          (f-or
           (f-not (v 1))
           (v 1))))



(let ((y '(1 2))
      (x '(1 2))
      (z '(2 3)))
  (implies (not (g-eql x z))
           (equal (memb x (del z y)) (memb x y))))

(let ((y '(1 2))
      (x 1)
      (z 2))
  (cons (memb x (del z y)) (memb x y)))
