(define (domain paquetes)
   (:requirements :typing)

   (:types paquete trabajador localizacion camioneta)
   (:predicates
       (paquete-en-l ?l - localizacion ?p - paquete)
       (trabajador-en-l ?l - localizacion ?a - trabajador)
       (camioneta-en ?l - localizacion)
       (llena-trabajador ?p - paquete)
       (libre-trabajador)
       (ir ?l1 - localizacion ?l3 - localizacion)
   )

   (:action mover
       :parameters (?a - trabajador ?l1 - localizacion ?l3 - localizacion)
       :precondition
           ( and( trabajador-en-l ?l1 ?a) (ir ?l1 ?l3))
       :effect
           ( and( not( trabajador-en-l ?l1 ?a)) (trabajador-en-l ?l3 ?a) (ir ?l3 ?l1))
    )

    (:action subir
        :parameters (?p - paquete ?l1 - localizacion ?a - trabajador)
        :precondition
            (and (libre-trabajador) (trabajador-en-l ?l1 ?a) (paquete-en-l ?l1 ?p) )
        :effect
            (and (not(libre-trabajador)) (llena-trabajador ?p))
     )

     (:action bajar
         :parameters (?p - paquete ?l1 - localizacion ?a - trabajador)
         :precondition
             (and (llena-trabajador ?p) (trabajador-en-l ?l1 ?a))
         :effect
             (and (not(llena-trabajador ?p)) (libre-trabajador)
             (trabajador-en-l ?l1 ?a) (paquete-en-l ?l1 ?p) )
      )

)
       
 















