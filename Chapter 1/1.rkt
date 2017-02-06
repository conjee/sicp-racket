#lang racket

;; Exercise 1.2
;; Using _pretty-printing_
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))


;; Exercise 1.3
(define (sum-of-squares-of-two-max a b c)
  (define x (max a b))
  (define y (max c
                 (min a b)))
  (+ (sqr x)
     (sqr y)))


;; Exercise 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
;; (test 0 (p))

;; Applicative Order -> Evaluating (p) before substituting into test's body
;; Result: (Unbounded Recursion)

;; Normal Order -> (if (= 0 0) 0 (p)) -> (if #t 0 (p)) -> 0
;; Result: 0

;; Note: "if" is a special form.
;;       Its behavior is not affected by the evaluation model:
;;       "The predicate expression is evaluated first,
;;        and the result determines whether to evaluate
;;        the consequent or the alternative expression."

;; Square Roots by Newton's Method
; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;       guess
;       (sqrt-iter (improve guess x) x)))
; 
; (define (improve guess x)
;   (average guess (/ x guess)))
; (define (average x y)
;   (/ (+ x y) 2.0))
; 
; (define (good-enough? guess x)
;   (< (abs (- (sqr guess) x))
;      0.001))
; 
; (define (sqrt x)
;   (sqrt-iter 1.0 x))


;; Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond [predicate then-clause]
        [else else-clause]))
;; Unbounded Recursion on most interpreters.
;; See Reasons in Exercise 1.5


;; Exercise 1.7
;; Numerical analysis? Skipped for now.

;; Exercise 1.8
;; Cube Roots by Newton's Method
(define (cubert-iter last-guess guess x)
  (if (good-enough? last-guess guess x)
      guess
      (cubert-iter guess (improve guess x) x)))

(define (improve guess x)
  (average (/ x
              (sqr guess))
           guess
           guess))
(define (average x y z)
  (/ (+ x y z) 3.0))

(define (good-enough? last-guess guess x)
  (< (abs (/ (- guess last-guess)
             last-guess))
     0.001))

(define (cubert x)
  (cubert-iter x 1.0 x))