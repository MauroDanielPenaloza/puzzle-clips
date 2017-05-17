

(defrule movimientos_centro_null
        (declare (salience 2800))
        ?fact <- (estado (state ?A ?B ?C ?D "" ?F ?G ?H ?I) (nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 "") (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))
                =>
                (duplicate ?fact (state ?A ?B ?C "" ?D ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A "" ?C ?D ?B ?F ?G ?H ?I) (nivel (+ ?n 1)) (padre ?fact))
                (duplicate ?fact (state ?A ?B ?C ?D ?H ?F ?G "" ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?C ?D ?F "" ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
)

(defrule movimientos_x2_nul
        (declare (salience 2700))
        ?fact <- (estado (state  ?A ?B ?C "" ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 "") (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))
                =>
                (duplicate ?fact (state "" ?B ?C ?A ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?C ?G ?E ?F "" ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
)
(defrule movimientos_x1_null
        (declare (salience 2600))
        ?fact <- (estado (state  "" ?B ?C ?D ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 "")(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))
                =>
               
                (duplicate ?fact (state ?D ?B ?C "" ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?B "" ?C ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                
)
(defrule movimientos_x3_null
        (declare (salience 2400))
        ?fact <- (estado (state  ?A ?B ?C ?D ?E ?F "" ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 "") (y3 ?H) (z3 ?I)))
                =>
               
                (duplicate ?fact (state ?A ?B ?C ?D ?E ?F ?H "" ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?C "" ?E ?F ?D ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                
)
(defrule movimientos_y1_null
         (declare (salience 2500))
        ?fact <- (estado (state  ?A "" ?C ?D ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 "") (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))

                =>
               
                (duplicate ?fact (state "" ?A ?C ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?C "" ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?E ?C ?D "" ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
)
(defrule movimientos_y3_null
        ?fact <- (estado (state  ?A ?B ?C ?D ?E ?F ?G "" ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 "") (z3 ?I)))
                =>
               
                (duplicate ?fact (state ?A ?B ?C ?D ?E ?F ?G ?I "") (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?C ?D ?E ?F "" ?G ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?C ?D "" ?F ?G ?E ?I) (nivel (+ ?n 1) ) (padre ?fact) )
)
(defrule movimientos_z1_null
        
        ?fact <- (estado (state  ?A ?B "" ?D ?E ?F ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 "") (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I)))
      
                =>
               
                (duplicate ?fact (state ?A "" ?B ?D ?E ?F ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?F ?D ?E "" ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                
)
(defrule movimientos_z2_null
        
        ?fact <- (estado (state  ?A ?B ?C ?D ?E "" ?G ?H ?I)(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 "") (x3 ?G) (y3 ?H) (z3 ?I)))
                =>
                (duplicate ?fact (state ?A ?B "" ?D ?E ?C ?G ?H ?I) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?C ?D ?E ?I ?G ?H "") (nivel (+ ?n 1) ) (padre ?fact) )
                
)
(defrule movimientos_z3_null
        
        ?fact <- (estado (state  ?A ?B ?C ?D ?E ?F ?G ?H "")(nivel ?n) (max-nivel ?mn))
        (test (< ?n ?mn))
        (not (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 "")))
                =>
               
                (duplicate ?fact (state ?A ?B ?C ?D ?E "" ?G ?H ?F) (nivel (+ ?n 1) ) (padre ?fact) )
                (duplicate ?fact (state ?A ?B ?C ?D ?E ?F ?G "" ?H) (nivel (+ ?n 1) ) (padre ?fact) )
                
)

(defrule check
        (declare (salience 3000))
        (estado (state  ?A ?B ?C ?D ?E ?F ?G ?H ?I) (padre ?p))
        (solucion (x1 ?A)(y1 ?B) (z1 ?C) (x2 ?D) (y2 ?E) (z2 ?F) (x3 ?G) (y3 ?H) (z3 ?I))
        =>
        (halt)
        (printout t "Se alcanzo el objetivo" crlf)
)



