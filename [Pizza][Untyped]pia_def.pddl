;;Repartición de pizza
(define (domain pizzadelivery)

    (:predicates
        (customer ?cust)
        (delivery ?deli)
        (pizza ?pizz)
        (store ?stor)
        (home ?home)
    
        (has-pizza ?pizz ?who)
        (at ?obj ?loc )
        (is-delivery-person-of ?deli ?stor)
        (is-customer-satisfied ?cust)
        (pizza-order ?pizz ?cust)
        (was-driving ?deli)
    )

    (:action pick-up-pizza
        :parameters (?pizz ?deli ?stor ?cust)
        :precondition (and (pizza ?pizz) (store ?stor) (delivery ?deli) (customer ?cust) (at ?pizz ?stor) (at ?deli ?stor) (pizza-order ?pizz ?cust) (not (has-pizza ?pizz ?deli)) (was-driving ?deli))
        :effect (and (has-pizza ?pizz ?deli) (not (was-driving ?deli)))
    )

    (:action deliver-pizza
        :parameters (?home ?deli ?pizz ?cust)
        :precondition (and (pizza ?pizz) (home ?home) (delivery ?deli) (customer ?cust) (has-pizza ?pizz ?deli) (at ?deli ?home) (pizza-order ?pizz ?cust) (at ?cust ?home) (was-driving ?deli))
        :effect (and (not (has-pizza ?pizz ?deli)) (at ?pizz ?home) (is-customer-satisfied ?cust) (at ?deli ?home) (has-pizza ?pizz ?cust) (not (was-driving ?deli)))
    )

    (:action drive
        :parameters (?from ?to ?deli ?pizz)
        :precondition (and  (pizza ?pizz) (store ?from) (delivery ?deli) (home ?to) (at ?deli ?from) (has-pizza ?pizz ?deli) (not(was-driving ?deli)))
        :effect (and (at ?deli ?to) (was-driving ?deli) )
    )
    
    (:action return-Store
        :parameters (?from ?to ?deli ?pizza)
        :precondition (and (pizza ?pizza) (home ?from) (store ?to) (delivery ?deli) (at ?deli ?from) (is-delivery-person-of ?deli ?to) (not(was-driving ?deli)))
        :effect (and (at ?deli ?to) (was-driving ?deli))
    )

)
