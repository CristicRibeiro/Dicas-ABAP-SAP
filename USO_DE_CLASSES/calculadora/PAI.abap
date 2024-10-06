*----------------------------------------------------------------------*
***INCLUDE Z_PRI_PROG_CLASSE_CCR_USER_I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9000 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'EXEC'.
      DATA: calcula TYPE REF TO lcl_calculadora.
      calcula = NEW lcl_calculadora( ).

      num_1_entradaI = num_1_entrada.
      num_2_entradaI = num_2_entrada.

      IF ra_soma IS NOT INITIAL.
        calcula->somar(
          EXPORTING
            num1   = num_1_entradaI
            num2   = num_2_entradaI
          IMPORTING
            result = result_saidaS ).

        result_saida = result_saidaS.

      ELSEIF ra_sub IS NOT INITIAL.
        calcula->subtrair(
          EXPORTING
            num1   = num_1_entradaI
            num2   = num_2_entradaI
          IMPORTING
            result = result_saidaS ).
        result_saida = result_saidaS.

      ELSEIF ra_mult IS NOT INITIAL.
        calcula->multiplicar(
          EXPORTING
            num1   = num_1_entradaI
            num2   = num_2_entradaI
          IMPORTING
            result = result_saidaS ).
        result_saida = result_saidaS.

      ELSEIF ra_div IS NOT INITIAL.
        calcula->dividir(
          EXPORTING
            num1   = num_1_entradaI
            num2   = num_2_entradaI
          IMPORTING
            result = result_saidaS ).
        result_saida = result_saidaS.

      ELSEIF ra_mod IS NOT INITIAL.
        calcula->resto(
          EXPORTING
            num1   = num_1_entradaI
            num2   = num_2_entradaI
          IMPORTING
            result = result_saidaS ).
        result_saida = result_saidaS.
      ENDIF.
  ENDCASE.
ENDMODULE.


*
*
*
*r_bask_n
*ra_fibon
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9001 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'EXEC'.
      DATA: calculaB TYPE REF TO lcl_calculadora.
      calculaB = NEW lcl_calculadora( ).

      num_1_entradabI = num_1_entradab.
      num_2_entradabI = num_2_entradab.
      num_3_entradabI = num_3_entradab.

      IF r_bask_p IS NOT INITIAL.
        calculaB->baskara_pos(
          EXPORTING
            num1   = num_1_entradabI
            num2   = num_2_entradabI
            num3   = num_3_entradabI
          IMPORTING
            result = result_saidabI ).
        result_saidab = result_saidabI.

      ELSEIF r_bask_n IS NOT INITIAL.
        calculaB->baskara_neg(
          EXPORTING
            num1   = num_1_entradabI
            num2   = num_2_entradabI
            num3   = num_3_entradabI
          IMPORTING
            result = result_saidabI ).
        result_saidab = result_saidabI.

      ENDIF.
  ENDCASE.
ENDMODULE.