(define-fun e0 () (_ BitVec 1) (_ bv0 1))
(declare-fun c1 () (_ BitVec 1))
(define-fun e2 () Bool (= e0 c1))
(define-fun e3 () (_ BitVec 48) (_ bv0 48))
(declare-fun c4 () (_ BitVec 48))
(define-fun e5 () Bool (= e3 c4))
(declare-fun c6 () (_ BitVec 48))
(define-fun e7 () Bool (= e3 c6))
(declare-fun c8 () (_ BitVec 48))
(define-fun e9 () Bool (= e3 c8))
(declare-fun c10 () (_ BitVec 48))
(define-fun e11 () Bool (= e3 c10))
(declare-fun c12 () (_ BitVec 16))
(define-fun e13 () (_ BitVec 30) ((_ zero_extend 14) c12))
(define-fun e14 () (_ BitVec 30) (_ bv65536 30))
(define-fun e15 () Bool (bvult e13 e14))
(declare-fun c16 () (_ BitVec 16))
(define-fun e17 () (_ BitVec 18) ((_ zero_extend 2) c16))
(define-fun e18 () (_ BitVec 18) (_ bv65536 18))
(define-fun e19 () Bool (bvult e17 e18))
(define-fun e20 () Bool (and e15 e19))
(define-fun e21 () Bool (and e11 e20))
(define-fun e22 () Bool (and e9 e21))
(define-fun e23 () Bool (and e7 e22))
(define-fun e24 () Bool (and e5 e23))
(define-fun e25 () Bool (and e2 e24))
(assert e25)
(define-fun e26 () (_ BitVec 16) (bvmul c16 c12))
(define-fun e27 () (_ BitVec 48) (_ bv7082414082 48))
(define-fun e28 () (_ BitVec 48) (_ bv17592186044416 48))
(define-fun e29 () (_ BitVec 48) (concat e13 e17))
(define-fun e30 () (_ BitVec 48) (bvxor e28 e29))
(define-fun e31 () (_ BitVec 48) (bvand e27 e30))
(define-fun e32 () (_ BitVec 11) ((_ extract 22 12) e31))
(define-fun e33 () (_ BitVec 12) (concat e32 e0))
(define-fun e34 () (_ BitVec 13) ((_ zero_extend 1) e33))
(define-fun e35 () (_ BitVec 48) (bvxor e27 e30))
(define-fun e36 () (_ BitVec 12) ((_ extract 23 12) e35))
(define-fun e37 () (_ BitVec 13) ((_ zero_extend 1) e36))
(define-fun e38 () (_ BitVec 13) (bvadd e34 e37))
(define-fun e39 () (_ BitVec 12) ((_ extract 11 0) e38))
(define-fun e40 () (_ BitVec 11) ((_ extract 10 0) e31))
(define-fun e41 () (_ BitVec 12) (concat e40 e0))
(define-fun e42 () (_ BitVec 13) ((_ zero_extend 1) e41))
(define-fun e43 () (_ BitVec 12) ((_ extract 11 0) e35))
(define-fun e44 () (_ BitVec 13) ((_ zero_extend 1) e43))
(define-fun e45 () (_ BitVec 13) (bvadd e42 e44))
(define-fun e46 () (_ BitVec 12) ((_ extract 11 0) e45))
(define-fun e47 () (_ BitVec 24) (concat e39 e46))
(define-fun e48 () (_ BitVec 16) ((_ extract 15 0) e47))
(define-fun e49 () Bool (= e26 e48))
(define-fun e50 () Bool (not e49))
(assert e50)
(check-sat)
(get-model)
