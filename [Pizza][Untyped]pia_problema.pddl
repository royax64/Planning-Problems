(define (problem pizzadeliveryproblema)
    (:domain pizzadelivery)
    
    (:objects
      delivery1 delivery2
      store1 store2
      customer1 customer2 customer3 customer4 customer5 customer6 customer7 customer8 customer9
      pizza1 pizza2 pizza3 pizza4 pizza5 pizza6 pizza7 pizza8 pizza9 pizza10
      home1 home2 home3 home4 home5 home6 home7 home8 home9
    )
    
    (:init
        (customer customer1) (customer customer2) (customer customer3) (customer customer4) (customer customer5)
        (customer customer6) (customer customer7) (customer customer8) (customer customer9)
    
        (pizza pizza1) (pizza pizza2) (pizza pizza3) (pizza pizza4) (pizza pizza5) (pizza pizza6)
        (pizza pizza7) (pizza pizza8) (pizza pizza9) (pizza pizza10)
    
        (home home1) (home home2) (home home3) (home home4) (home home5) (home home6) (home home7)
        (home home8) (home home9)
        
        (store store1) (store store2) (delivery delivery1) (delivery delivery2)
    
    
        (at pizza1 store1) (at pizza2 store2) (at pizza3 store2) (at pizza4 store1) (at pizza5 store2)
        (at pizza6 store2) (at pizza7 store2) (at pizza8 store1) (at pizza9 store1) (at pizza10 store2)
        
        (at customer1 home1) (at customer2 home2) (at customer3 home3) (at customer4 home4) (at customer5 home5)
        (at customer6 home6) (at customer7 home7) (at customer8 home8) (at customer9 home9)
        
        (at delivery1 store1) (at delivery2 store2)
        
        (pizza-order pizza1 customer1) (pizza-order pizza2 customer2) (pizza-order pizza3 customer3) (pizza-order pizza4 customer4) (pizza-order pizza5 customer5)
        (pizza-order pizza6 customer6) (pizza-order pizza7 customer7) (pizza-order pizza8 customer8) (pizza-order pizza9 customer9) (pizza-order pizza10 customer9)
        
        (is-delivery-person-of delivery1 store1)
        (is-delivery-person-of delivery2 store2)
        
        (was-driving delivery1)
        (was-driving delivery2)
    )
    
    (:goal 
        (and 
            (at pizza1 home1) (at pizza2 home2) (at pizza3 home3) (at pizza4 home4) (at pizza5 home5) (at pizza6 home6) (at pizza7 home7)
            (at pizza8 home8) (at pizza9 home9) (at pizza10 home9) 
        )
    )

)
