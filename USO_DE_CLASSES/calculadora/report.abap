*&---------------------------------------------------------------------*
*& Report Z_PRI_PROG_CLASSE_CCR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_pri_prog_classe_ccr.
DATA: num_1_entrada(15) TYPE c,
      num_1_entradaI    TYPE i,
      num_2_entrada(15) TYPE c,
      num_2_entradaI    TYPE i,
      result_saida(15)  TYPE c,
      result_saidaS     TYPE i,
      num_1_entradab(15)  TYPE c,
      num_1_entradabI  TYPE i,
      num_2_entradab(15)  TYPE c,
      num_2_entradabI  TYPE i,
      num_3_entradab(15)  TYPE c,
      num_3_entradabI  TYPE i,
      result_saidab(15)  TYPE c,
      result_saidabI  TYPE DECFLOAT16.


INCLUDE z_pri_prog_classe_ccr_cl.
INCLUDE z_pri_prog_classe_ccr_sc.
INCLUDE z_pri_prog_classe_ccr_user_i01.
INCLUDE z_pri_prog_classe_ccr_statuo01.


START-OF-SELECTION.

  IF ( ra_soma IS NOT INITIAL ) OR ( ra_sub IS NOT INITIAL ) OR ( ra_mult IS NOT INITIAL ) OR
     ( ra_div IS NOT INITIAL ) OR ( ra_mod IS NOT INITIAL ) .
    CALL SCREEN 9000.

  ELSEIF ( r_bask_p IS NOT INITIAL ) OR ( r_bask_n IS NOT INITIAL ).
    CALL SCREEN 9001.

  ELSEIF ra_fibon is not INITIAL.
    data: calcula_fib TYPE REF TO lcl_calculadora.

    calcula_fib = new lcl_calculadora( ).
    calcula_fib->fibonacci( ).
  ENDIF.