;
;      el problema del puzzle de 8 piezas
;

(deftemplate estado
      (multislot puzzle)
      (slot nodo
            (type INTEGER)
            (default 0))
      (slot nivel
            (type INTEGER))
      (slot padre
            (type SYMBOL FACT-ADDRESS)
            (allowed-symbols sin-padre)
            (default sin-padre))
      (slot mensaje
            (type STRING))
)


(defrule inicial
      ?i <- (initial-fact)
      ?partida <- (puzzle $?posicion)
=>
      (retract ?i)
      (assert (estado (puzzle $?posicion) (nivel 1) (padre sin-padre) (mensaje "[inicio]")))
      (assert (nodoactual 1))
)


(defrule contador-nodos
      (declare (salience 1000))
      ?estado <- (estado (nodo 0))
      ?n <- (nodoactual ?cuenta)
=>
      (assert (nodoactual (+ ?cuenta 1)))
      (modify ?estado (nodo ?cuenta))
      (retract ?n)
)



(defrule elimina-repetidos
      (declare (salience 2000))
      (estado (puzzle $?p1) (nodo ?x))
      ?n <- (estado (puzzle $?p2) (nodo 0))
      (test (eq $?p1 $?p2))
      (test (neq ?x 0))
=>
      (retract ?n)
)




(defrule meta
      (declare (salience 600))
      (estado-meta $?m)
      ?meta <- (estado (puzzle $?m)(nivel ?movimientos))
=>
      (printout t "Solucion con " ?movimientos "movimientos:" crlf)
      (assert (ultimo ?meta))
      (assert (camino))
)
 

(defrule construye-camino
      (declare (salience 2500))
      ?viejalista <- (camino $?secuencia)
      ?puntero <- (estado (padre ?padre) (mensaje ?cadena))
      ?viejoestado <- (ultimo ?puntero)
=>
      (assert (camino ?cadena $?secuencia))
      (assert (ultimo ?padre))
      (retract ?viejalista)
      (retract ?viejoestado)
)


(defrule camino-terminado
      (declare (salience 2500))
      ?fin <- (ultimo sin-padre)
      ?recorrido <- (camino $?secuencia)
=>
      (printout t "solución: " ?secuencia crlf)
      (retract ?fin ?recorrido)
)


(defrule informa-nodos
      (declare (salience 100))
      (nodoactual ?cuenta)
=>
      (printout t "Se han examinado un total de "(- ?cuenta 1) " estados distintos" crlf)
)


(defrule izquierda
      (declare (salience 500))
      ?origen <- (estado (puzzle $?inicio ?delante blanco $?final)(nivel ?nivel))
      (test (neq (length $?inicio) 2))
      (test (neq (length $?inicio) 5))
=>
      (assert (estado (puzzle $?inicio blanco ?delante $?final)(padre ?origen)(nivel (+ ?nivel 1))(mensaje "izquierda")))
)

(defrule derecha
      (declare (salience 500))
      ?origen <- (estado (puzzle $?inicio blanco ?detras $?final)(nivel ?nivel))
      (test (neq (length $?final) 2))
      (test (neq (length $?final) 5))
=>
      (assert (estado (puzzle $?inicio ?detras blanco $?final)(padre ?origen)(nivel (+ ?nivel 1))(mensaje "derecha")))
)


(defrule arriba
      (declare (salience 500))
      ?origen <- (estado (puzzle $?inicio ?arriba ?uno ?dos blanco $?final)(nivel ?nivel))
=>
      (assert (estado (puzzle $?inicio blanco ?uno ?dos ?arriba $?final)(padre ?origen)(nivel (+ ?nivel 1))(mensaje "arriba")))
)


(defrule abajo
      (declare (salience 500))
      ?origen <- (estado (puzzle $?inicio blanco ?uno ?dos ?debajo $?final)(nivel ?nivel))
=>
      (assert (estado (puzzle $?inicio ?debajo ?uno ?dos blanco $?final)(padre ?origen)(nivel (+ ?nivel 1))(mensaje "abajo")))
)
      
      




(deffacts situaciones
      (puzzle D C A G E B blanco H F)
      (estado-meta A B C D E F G H blanco)
)