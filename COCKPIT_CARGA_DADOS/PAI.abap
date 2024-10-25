*&---------------------------------------------------------------------*
*& Include          ZPROG_CARGA_LOJISTAS_CCR_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9000 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      CALL SCREEN 9001.
    WHEN 'SALV'.
      PERFORM f_salvar_dados.
    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9001 INPUT.
  CASE sy-ucomm.
    WHEN 'CAD_UNIC'.
      CALL SCREEN 9000.
    WHEN 'CAD_MAS'.
      call TRANSACTION 'ZCARGA_MASSIVA_CCR'.
    WHEN 'ALV_LOJA'.
      PERFORM f_alv_loja.
      CALL SCREEN 9003.
    WHEN 'BACK'.
      LEAVE PROGRAM.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9002  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9002 INPUT.
*  WRITE: 'Escolha o arquivo para fazer a carga de dados'.
*  PARAMETERS: p_file type localfile OBLIGATORY.

  CASE sy-ucomm.
    WHEN 'BACK'.
      CALL SCREEN 9001.
*     WHEN .
*     WHEN OTHERS.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9003  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9003 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      CALL SCREEN 9001.
*     WHEN .
*     WHEN OTHERS.
  ENDCASE.
ENDMODULE.