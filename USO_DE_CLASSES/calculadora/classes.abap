*&---------------------------------------------------------------------*
*& Include          Z_PRI_PROG_CLASSE_CCR_CL
*&---------------------------------------------------------------------*

CLASS lcl_calculadora DEFINITION.
  PUBLIC SECTION.
    DATA: num1       TYPE i,
          num2       TYPE i,
          num3       TYPE i,
          operacao   TYPE boolean,
          resultado  TYPE i,
          result_fib TYPE string.

    METHODS: construtor IMPORTING iv_num1 TYPE i
                                  iv_num2 TYPE i
                                  iv_num3 TYPE i OPTIONAL,
             somar    IMPORTING num1 TYPE i
                                num2 TYPE i
                       EXPORTING result TYPE i,

             subtrair IMPORTING num1 TYPE i
                                num2 TYPE i
                       EXPORTING result TYPE i,

             multiplicar IMPORTING num1 TYPE i
                                num2 TYPE i
                       EXPORTING result TYPE i,

             dividir  IMPORTING num1 TYPE i
                                num2 TYPE i
                       EXPORTING result TYPE i,

             resto    IMPORTING num1 TYPE i
                                num2 TYPE i
                       EXPORTING result TYPE i,

             baskara_pos IMPORTING num1 TYPE i
                                   num2 TYPE i
                                   num3 TYPE i
                       EXPORTING result TYPE DECFLOAT16,

             baskara_neg IMPORTING num1 TYPE i
                                   num2 TYPE i
                                   num3 TYPE i
                       EXPORTING result TYPE DECFLOAT16,

             fibonacci.

ENDCLASS.


CLASS lcl_calculadora IMPLEMENTATION.
  METHOD construtor.
    num1 = iv_num1.
    num2 = iv_num2.
    num3 = iv_num3.
  ENDMETHOD.


  METHOD somar.
    result = num1 + num2.

  ENDMETHOD.

  METHOD subtrair.
    result = num1 - num2.
  ENDMETHOD.

  METHOD multiplicar.
    result = num1 * num2.
  ENDMETHOD.

  METHOD dividir.
    IF num2 <= 0.
      WRITE: / 'Não é possivel dividir por número zero!!'.
      EXIT.
    ELSE.
      result = num1 / num2.
    ENDIF.
  ENDMETHOD.
  METHOD resto.
    result = num1 MOD num2.
  ENDMETHOD.
  METHOD baskara_pos.
    DATA: delta TYPE i,
          raiz type p DECIMALS 2.


    delta = ( ( num2 ** 2 ) - 4 * ( num1 * num3 ) ).
    raiz = sqrt( delta ).

    IF delta < 0.
      MESSAGE: 'Delta negativo, sendo assim, não existe raizes reais!!' TYPE 'I' DISPLAY LIKE 'I'.
      EXIT.
      else.
        result = ( ( ( - 1 * num2 )  + raiz ) / ( 2 * num1 ) ).
    ENDIF.



  ENDMETHOD.

  METHOD baskara_neg.
    DATA: delta TYPE i,
          raiz type p DECIMALS 2.


    delta = ( ( num2 ** 2 ) - 4 * ( num1 * num3 ) ).
    raiz = sqrt( delta ).

    IF delta < 0.
      MESSAGE: 'Delta negativo, sendo assim, não existe raizes reais!!' TYPE 'I' DISPLAY LIKE 'I'.
      EXIT.
      else.
        result = ( ( ( - 1 * num2 )  - raiz ) / ( 2 * num1 ) ).
    ENDIF.


  ENDMETHOD.

  METHOD fibonacci.
    DATA: aux       TYPE i VALUE 1,
          aux2      TYPE i VALUE 2,
          cont      TYPE i,
          resultado TYPE i.


    WRITE: / aux, aux, aux2.
    WHILE cont <= 20.
      resultado = aux + aux2.
      WRITE: resultado.
      aux = aux2.
      aux2 = resultado.
      cont = cont + 1.
    ENDWHILE.


  ENDMETHOD.

ENDCLASS.