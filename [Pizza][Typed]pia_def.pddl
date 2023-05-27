;;Repartición de pizza
(define (domain pizzadelivery)
  (:requirements :typing) 
    (:types
        customer
        delivery - person
        pizza - food
        food
        person - object
        store 
        home - location
    )

    (:predicates
        (has-pizza ?pizz - food ?who - person)
        (at ?th - object ?loc - location)
        (is-delivery-person-of ?deli - delivery ?stor - store)
        (is-customer-satisfied ?cust - customer)
        (pizza-order ?pizz - food ?cust - customer)
        (was-driving ?deli - delivery)
    )

    (:action pick-up-pizza
        :parameters (?pizz - food ?deli - delivery ?stor - store ?cust - customer)
        :precondition (and (at ?pizz ?stor) (at ?deli ?stor) (pizza-order ?pizz ?cust) (not (has-pizza ?pizz ?deli)) (was-driving ?deli))
        :effect (and (has-pizza ?pizz ?deli) (not (was-driving ?deli)))
    )

    (:action deliver-pizza
        :parameters (?home - home ?deli - delivery ?pizz - food ?cust - customer)
        :precondition (and (has-pizza ?pizz ?deli) (at ?deli ?home) (pizza-order ?pizz ?cust) (at ?cust ?home) (was-driving ?deli))
        :effect (and (not (has-pizza ?pizz ?deli)) (at ?pizz ?home) (is-customer-satisfied ?cust) (at ?deli ?home) (has-pizza ?pizz ?cust) (not (was-driving ?deli)))
    )

    (:action drive
        :parameters (?from - store ?to - home  ?deli - delivery ?pizz - food)
        :precondition (and (at ?deli ?from) (has-pizza ?pizz ?deli) (not(was-driving ?deli)))
        :effect (and (at ?deli ?to) (was-driving ?deli) )
    )
    
    (:action return-Store
        :parameters (?from - home ?to - store ?deli - delivery ?pizza - food)
        :precondition (and (at ?deli ?from) (is-delivery-person-of ?deli ?to) (not(was-driving ?deli)))
        :effect (and (at ?deli ?to) (was-driving ?deli))
    )

)
