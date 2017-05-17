

(deffunction pondera (?As ?A ?B ?Bs) 
        (if (and (eq ?A ?As) (eq ?B ?Bs))
                then 0
                else 1
        )
)
(deffunction pondera-centro (?E ?Es) 
        (if (eq ?E ?Es)
                then 0
                else 2
        )
)
(deffunction ponderamiento (?A ?B ?C ?D ?E ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is)
        (+ (pondera  ?As ?A ?B ?Bs) (pondera  ?Bs ?B ?C ?Cs) (pondera  ?Cs ?C ?F ?Fs)
                     (pondera  ?Fs ?F ?I ?Is) (pondera  ?Fs ?F ?I ?Is) (pondera  ?Is ?I ?H ?Hs)
                     (pondera  ?Hs ?H ?G ?Gs) (pondera  ?Gs ?G ?D ?Ds) (pondera  ?Ds ?D ?A ?As)
                     (pondera-centro ?E ?Es)
                  )        
)




(defrule movimientos_centro_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state ?A ?B ?C ?D "" ?F ?G ?H ?I) (nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))

        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 "") (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))
                =>
                (bind ?ha1 (ponderamiento  ?A "" ?C ?D ?B ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))

                (bind ?hijo1 (duplicate ?fact (state ?A "" ?C ?D ?B ?F ?G ?H ?I) (nivel (+ ?n 1)) (padre ?fact) (h ?ha1)))

                (bind ?ha2 (ponderamiento  ?A ?B ?C ?D ?H ?F ?G "" ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?B ?C ?D ?H ?F ?G "" ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))

                (bind ?ha3 (ponderamiento  ?A ?B ?C ?D ?F "" ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo3 (duplicate ?fact (state ?A ?B ?C ?D ?F "" ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha3)))

                (bind ?ha4 (ponderamiento  ?A ?B ?C "" ?D ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo4 (duplicate ?fact (state ?A ?B ?C "" ?D ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha4)))

                (assert (previo (state ?A ?B ?C ?D "" ?F ?G ?H ?I)))
                
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
)



(defrule movimientos_x2_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  ?A ?B ?C "" ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 "") (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))
                =>
                (bind ?ha1 (ponderamiento  "" ?B ?C ?A ?E ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state "" ?B ?C ?A ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))

                (bind ?ha2 (ponderamiento  ?A ?B ?C ?G ?E ?F "" ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?B ?C ?G ?E ?F "" ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                 (assert (previo (state ?A ?B ?C "" ?E ?F ?G ?H ?I)))
                 (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2))
                
)
(defrule movimientos_x1_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  "" ?B ?C ?D ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 "")(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))

                =>
                (bind ?ha1 (ponderamiento  ?D ?B ?C "" ?E ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state ?D ?B ?C "" ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))
                (bind ?ha2 (ponderamiento  ?B "" ?C ?D ?E ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?B "" ?C ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                (assert (previo (state "" ?B ?C ?D ?E ?F ?G ?H ?I)))
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2))
                
)
(defrule movimientos_x3_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  ?A ?B ?C ?D ?E ?F "" ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 "") (y3 ?H) (z3 ?I)))
                =>
                (bind ?ha1 (ponderamiento  ?A ?B ?C ?D ?E ?F ?H "" ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state ?A ?B ?C ?D ?E ?F ?H "" ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))
                (bind ?ha2 (ponderamiento  ?A ?B ?C "" ?E ?F ?D ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?B ?C "" ?E ?F ?D ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                    (assert (previo (state ?A ?B ?C ?D ?E ?F "" ?H ?I)))
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2))
                
)
(defrule movimientos_y1_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  ?A "" ?C ?D ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 "") (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))

                =>
                (bind ?ha1 (ponderamiento  "" ?A ?C ?D ?E ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state "" ?A ?C ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))
                (bind ?ha2 (ponderamiento  ?A ?C "" ?D ?E ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?C "" ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                (bind ?ha3 (ponderamiento  ?A ?E ?C ?D "" ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo3 (duplicate ?fact (state ?A ?E ?C ?D "" ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha3)))
                  (assert (previo (state ?A "" ?C ?D ?E ?F ?G ?H ?I)))
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))

)
(defrule movimientos_y3_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  ?A ?B ?C ?D ?E ?F ?G "" ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 "") (z3 ?I)))
                =>
                (bind ?ha1 (ponderamiento  ?A ?B ?C ?D ?E ?F ?G ?I "" ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state ?A ?B ?C ?D ?E ?F ?G ?I "") (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))
                (bind ?ha2 (ponderamiento  ?A ?B ?C ?D ?E ?F "" ?G ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?B ?C ?D ?E ?F "" ?G ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                (bind ?ha3 (ponderamiento  ?A ?B ?C ?D "" ?F ?G ?E ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo3 (duplicate ?fact (state ?A ?B ?C ?D "" ?F ?G ?E ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha3)))
                (assert (previo (state ?A ?B ?C ?D ?E ?F ?G "" ?I)))
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))

)
(defrule movimientos_z1_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  ?A ?B "" ?D ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 "") (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))
      
                =>
                (bind ?ha1 (ponderamiento  ?A "" ?B ?D ?E ?F ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state ?A "" ?B ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))
                (bind ?ha2 (ponderamiento  ?A ?B ?F ?D ?E "" ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?B ?F ?D ?E "" ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                 (assert (previo (state ?A ?B "" ?D ?E ?F ?G ?H ?I)))
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2))
                
)
(defrule movimientos_z2_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  ?A ?B ?C ?D ?E "" ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 "") (x3 ?G) (y3 ?H) (z3 ?I)))
                =>
                (bind ?ha1 (ponderamiento  ?A ?B "" ?D ?E ?C ?G ?H ?I ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state ?A ?B "" ?D ?E ?C ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))
                (bind ?ha2 (ponderamiento  ?A ?B ?C ?D ?E ?I ?G ?H "" ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?B ?C ?D ?E ?I ?G ?H "") (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                (assert (previo (state ?A ?B ?C ?D ?E "" ?G ?H ?I)))
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2))
                
)
(defrule movimientos_z3_null
        ?solucion <- (solucion (x1 ?As)(y1 ?Bs) (z1 ?Cs) (x2 ?Ds) (y2 ?Es) (z2 ?Fs) (x3 ?Gs) (y3 ?Hs) (z3 ?Is))
        ?fact <- (estado (state  ?A ?B ?C ?D ?E ?F ?G ?H "")(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 "")))
                =>
                (bind ?ha1 (ponderamiento  ?A ?B ?C ?D ?E "" ?G ?H ?F ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo1 (duplicate ?fact (state ?A ?B ?C ?D ?E "" ?G ?H ?F) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha1)))
                (bind ?ha2 (ponderamiento  ?A ?B ?C ?D ?E ?F ?G "" ?H ?As ?Bs ?Cs ?Ds ?Es ?Fs ?Gs ?Hs ?Is ))
                (bind ?hijo2 (duplicate ?fact (state ?A ?B ?C ?D ?E ?F ?G "" ?H) (nivel (+ ?n 1) ) (padre ?fact) (h ?ha2)))
                (assert (previo (state ?A ?B ?C ?D ?E ?F ?G ?H "")))
                (modify ?fact (hijos ?hijo1 ?ha1 ?hijo2 ?ha2))
                
)




(defrule check
        (declare (salience 3000))
        (estado (state  ?A ?B ?C ?D ?E ?F ?G ?H ?I) (padre ?p))
        (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I))
        =>
         (printout t "Estado Solucion -- ([" ?A ?B ?C "] [" ?D ?E ?F"] [" ?G ?H ?I"])" crlf)
        (halt)
       
)
(defrule aplicar_heuristica
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (< ?ha1 ?ha2))
        (test (< ?ha1 ?ha3))
        (test (< ?ha1 ?ha4))
        =>
        (retract ?padre)
        (retract ?hijo2)
        (retract ?hijo3)
        (retract ?hijo4)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)
(defrule aplicar_heuristica_4hijos_h2
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (< ?ha2 ?ha1))
        (test (< ?ha2 ?ha3))
        (test (< ?ha2 ?ha4))
        =>
        (retract ?padre)
        (retract ?hijo1)
        (retract ?hijo3)
        (retract ?hijo4)
        (printout t "Estado Intermedio -- (" ?hijo2 ")" crlf)
)
(defrule aplicar_heuristica_4hijos_h3
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (< ?ha3 ?ha1))
        (test (< ?ha3 ?ha2))
        (test (< ?ha3 ?ha4))
        =>
        (retract ?padre)
        (retract ?hijo1)
        (retract ?hijo2)
        (retract ?hijo4)
        (printout t "Estado Intermedio -- (" ?hijo3 ")" crlf)
)
(defrule aplicar_heuristica_4hijos_h4
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (< ?ha4 ?ha1))
        (test (< ?ha4 ?ha2))
        (test (< ?ha4 ?ha3))
        =>
        (retract ?padre)
        (retract ?hijo1)
        (retract ?hijo2)
        (retract ?hijo3)
         (printout t "Estado Intermedio -- (" ?hijo4 ")" crlf)
)
(defrule aplicar_heuristica_3hijos_h1
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))
        (test (< ?ha1 ?ha2))
        (test (< ?ha1 ?ha3))
        =>
        (retract ?padre)
        (retract ?hijo2)
        (retract ?hijo3)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)
(defrule aplicar_heuristica_3hijos_h2
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))
        (test (< ?ha2 ?ha1))
        (test (< ?ha2 ?ha3))
        =>
        (retract ?padre)
        (retract ?hijo1)
        (retract ?hijo3)
        (printout t "Estado Intermedio -- (" ?hijo2 ")" crlf)
)
(defrule aplicar_heuristica_3hijos_h3
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))
        (test (< ?ha3 ?ha1))
        (test (< ?ha3 ?ha2))
        =>
        (retract ?padre)
        (retract ?hijo1)
        (retract ?hijo2)
        (printout t "Estado Intermedio -- (" ?hijo3 ")" crlf)
)

(defrule aplicar_heuristica_2hijos_h1
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ))
        (test (< ?ha1 ?ha2))
        =>
        (retract ?padre)
        (retract ?hijo2)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)
(defrule aplicar_heuristica_2hijos_h2
        (declare (salience 2500))
        ?padre <- (estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ))
        (test (< ?ha2 ?ha1))
        =>
        (retract ?padre)
        (retract ?hijo1)
        (printout t "Estado Intermedio -- (" ?hijo2 ")" crlf)
        
)

(defrule aplicar_heuristica_4hijos_Igualdad
        (declare (salience 2500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (= ?ha1 ?ha2))
        (test (= ?ha2 ?ha3))
        (test (= ?ha3 ?ha4))
        =>
        (retract ?padre)
        (retract ?hijo2)
        (retract ?hijo3)
        (retract ?hijo4)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)



(defrule aplicar_heuristica_4hijos_h2_igualdad_r1
        (declare (salience 2000))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (= ?ha2 ?ha1))
        =>
        (retract ?padre)
        (retract ?hijo2)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)
(defrule aplicar_heuristica_4hijos_h2_igualdad_2
        (declare (salience 1900))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (= ?ha2 ?ha3))
        =>
        (retract ?padre)
        (retract ?hijo3)
        (printout t "Estado Intermedio -- (" ?hijo2 ")" crlf)
)

(defrule aplicar_heuristica_4hijos_h2_igualdad_3
        (declare (salience 1800))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (= ?ha2 ?ha4))
        =>
        (retract ?padre)
        (retract ?hijo4)
        (printout t "Estado Intermedio -- (" ?hijo2 ")" crlf)
)

(defrule aplicar_heuristica_4hijos_h3_igualdad_r1
        (declare (salience 1700))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (= ?ha3 ?ha1))
        =>
        (retract ?padre)
        (retract ?hijo3)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)

(defrule aplicar_heuristica_4hijos_h3_igualdad_r2
        (declare (salience 1600))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (= ?ha3 ?ha4))
        =>
        (retract ?padre)
        (retract ?hijo4)
        (printout t "Estado Intermedio -- (" ?hijo3 ")" crlf)
)

(defrule aplicar_heuristica_4hijos_h4_igualdad_r1
        (declare (salience 1500))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3 ?hijo4 ?ha4))
        (test (= ?ha4 ?ha1))
        =>
        (retract ?padre)

        (retract ?hijo4)
        (retract ?hijo3)
        (retract ?hijo2)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)







(defrule aplicar_heuristica_3hijos_Igualdad_h1
        (declare (salience 2000))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))
        (test (= ?ha1 ?ha2))
        (test (= ?ha1 ?ha3))        
        =>
        (retract ?padre)
        (retract ?hijo2)
        (retract ?hijo3)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)       
)
(defrule aplicar_heuristica_3hijos_h1_Igualdad_r1
        (declare (salience 1900))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))
        (test (= ?ha1 ?ha2))
        =>
        (retract ?padre)
        (retract ?hijo2)
        (retract ?hijo3)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)
(defrule aplicar_heuristica_3hijos_h1_Igualdad_r2
        (declare (salience 1800))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))
        (test (= ?ha1 ?ha3))
        =>
        (retract ?padre)
        (retract ?hijo3)
        (retract ?hijo2)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)
(defrule aplicar_heuristica_3hijos_h2_Igualdad_r1
        (declare (salience 1700))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ?hijo3 ?ha3))
        (test (= ?ha2 ?ha3))
        =>
        (retract ?padre)
        (retract ?hijo3)
        (retract ?hijo1)
        (printout t "Estado Intermedio -- (" ?hijo2 ")" crlf)
)


(defrule aplicar_heuristica_2hijos_h1_Igualdad
        (declare (salience 2000))
        ?padre <-(estado (hijos ?hijo1 ?ha1 ?hijo2 ?ha2 ))
        (test (= ?ha1 ?ha2))
        =>
        (retract ?padre)
        (retract ?hijo2)
        (printout t "Estado Intermedio -- (" ?hijo1 ")" crlf)
)



(defrule eliminar_repetido
     (declare (salience 3100))
    ?stado <- (estado (state $?e))
    (previo (state $?e))
    =>
        (retract ?stado)
)









