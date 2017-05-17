(deftemplate previo
        (multislot state)
)


(deftemplate solucion 
        (slot x1 (type STRING))
        (slot y1 (type STRING))
        (slot z1 (type STRING))
        (slot x2 (type STRING))
        (slot y2 (type STRING))
        (slot z2 (type STRING))
        (slot x3 (type STRING))
        (slot y3 (type STRING))
        (slot z3 (type STRING))
)
(deftemplate estado
        (multislot state)
         (slot padre
            (type SYMBOL FACT-ADDRESS)
            (allowed-symbols sin-padre)
            (default sin-padre))
        (slot nivel
            (type INTEGER)
            )
        (slot max-nivel
            (type INTEGER)
            )
        (slot h (type INTEGER))

        (multislot hijos)
)
(deffacts startup 

        (solucion (x1 "E")(y1 "A") (z1 "C") (x2 "B") (y2 "G")  (z2 "F") (x3 "D") (y3 "")  (z3 "H"))

        (estado (state "A" "B" "C" "D" "E" "F" "" "G" "H")
                (nivel 0)
                (h 10000)
                (max-nivel 20)
        )
)