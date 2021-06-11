*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_Customer DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS:

    activateCustomer
      FOR MODIFY
      IMPORTING keys
                  FOR ACTION Customer~activateCustomer RESULT result,

    validateCustomerID
      FOR VALIDATE ON SAVE
      IMPORTING keys
                  FOR Customer~validateCustomerID.

ENDCLASS.

CLASS lhc_Customer IMPLEMENTATION.

  METHOD validateCustomerID.

    READ ENTITIES OF zhska_actimel_i_cr IN LOCAL MODE
    ENTITY Customer
     FIELDS ( CustomerID )
     WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_customers).

    SELECT FROM zhska_actimel_cr
        FIELDS customer_id
        INTO TABLE @DATA(customer_ids).

    LOOP AT lt_customers INTO DATA(customer).

      IF line_exists( customer_ids[ customer_id = customer-CustomerID ] ).
*      OR customer-CustomerID IS INITIAL.


        APPEND VALUE #( customerguid  = customer-CustomerGUID ) TO failed-customer.
        APPEND VALUE #( customerguid = customer-CustomerGUID
                         %msg = new_message(
                                  id       = 'ZHSKA_ACTIMEL'
                                  number   = 001
                                  severity = if_abap_behv_message=>severity-error
                                  v1       = customer-CustomerID
                                )
                         %element-customerid = if_abap_behv=>mk-on )
          TO reported-customer.

      ELSE.

        APPEND VALUE #( customer_id = customer-CustomerID ) TO customer_ids.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.


  METHOD activateCustomer.

    READ ENTITIES OF zhska_actimel_i_cr IN LOCAL MODE
         ENTITY Customer
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(customers)
         FAILED failed
         REPORTED reported.

    LOOP AT customers ASSIGNING FIELD-SYMBOL(<customer>).
      <customer>-IsActive = abap_true.
    ENDLOOP.

    MODIFY ENTITIES OF zhska_actimel_i_cr IN LOCAL MODE
           ENTITY Customer
              UPDATE FIELDS ( IsActive )
                 WITH VALUE #( FOR customer IN customers ( CustomerGUID = customer-CustomerGUID
                                                           IsActive = customer-IsActive ) )
           FAILED   failed
           REPORTED reported.

    IF failed IS INITIAL.
      result = VALUE #( FOR customer IN customers ( CustomerGUID = customer-CustomerGUID
                                                    %param    = customer ) ).
    ENDIF.

  ENDMETHOD.


ENDCLASS.
