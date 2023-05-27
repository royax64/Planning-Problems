(define (problem recoleccionPaquetes)
    (:domain paquetes)
    (:objects
     p1 p2 - paquete
     l1 l2 l3 l4 l5 - localizacion
     a - trabajador
     h - camioneta)

    (:init
    (camioneta-en l1)
    (paquete-en-l l3 p1)
    (paquete-en-l l5 p2)
    (trabajador-en-l l1 a)
    (libre-trabajador)
    (ir l1 l3)
    (ir l3 l2) 
    (ir l2 l4)
    (ir l4 l5)

    )
    (:goal (and
    (paquete-en-l l1 p1)
    (paquete-en-l l1 p2))
    )
)
