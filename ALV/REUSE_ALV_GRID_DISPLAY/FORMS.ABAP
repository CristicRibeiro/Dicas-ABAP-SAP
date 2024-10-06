***&---------------------------------------------------------------------*
***& Include          Z_PRIMEIRO_ALV_CCR_F01
***&---------------------------------------------------------------------*
TABLES: ZTABLE_TESTE_CCR.

TYPES: BEGIN OF ty_table_final,
         matnr TYPE mara-matnr,
         werks TYPE marc-werks,
         lgort TYPE mard-lgort,
         ersda TYPE mara-ersda,
         meins TYPE mara-meins,
         mtart TYPE mara-mtart,
         maktx TYPE makt-maktx,
         ekgrp TYPE marc-ekgrp,
         labst TYPE mard-labst,
         umlme TYPE mard-umlme,

       END OF ty_table_final.


DATA: cl_table        TYPE REF TO cl_salv_table,
      cl_salv_columns TYPE REF TO cl_salv_columns,
      it_final        TYPE TABLE OF ty_table_final,
      lt_fieldcat     TYPE STANDARD TABLE OF slis_fieldcat_alv.

FIELD-SYMBOLS: <fs_final> TYPE ty_table_final.




FORM f_get_dados.
  SELECT a~matnr, a~werks, a~lgort, b~ersda, b~meins, b~mtart, d~maktx, c~ekgrp, a~labst, a~umlme
    FROM mard AS a
    INNER JOIN mara AS b
    ON b~matnr = a~matnr
    LEFT OUTER JOIN marc AS c
    ON  c~matnr = a~matnr
    AND c~werks = a~werks
    LEFT OUTER JOIN makt AS d
    ON  d~matnr = a~matnr
    AND d~spras = @sy-langu
    INTO TABLE @it_final
    WHERE a~matnr IN @s_matnr
    AND a~werks IN @s_werks
    AND b~ersda IN @s_ersda.

  IF sy-subrc IS INITIAL.
    SORT it_final BY matnr werks lgort. "ORDENANDO A TABELA PELOS CAMPOS MATNR WERKS LGORT
  ENDIF.
ENDFORM.

FORM f_fieldcat.
  DATA: ls_fieldcat TYPE slis_fieldcat_alv.

"CRIANDO OS RÓTULOS DE CADA COLUNA QUE SERÁ EXIBIDA

  ls_fieldcat-fieldname = 'matnr'.
  ls_fieldcat-seltext_m = 'Material'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'werks'.
  ls_fieldcat-seltext_m = 'Centro'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'lgort'.
  ls_fieldcat-seltext_m = 'Depósito'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'ersda'.
  ls_fieldcat-seltext_m = 'Data'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'meins'.
  ls_fieldcat-seltext_m = 'U medida'.
  ls_fieldcat-seltext_l = 'UM basica'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'mtart'.
  ls_fieldcat-seltext_m = 'Tp material'.
  "ls_fieldcat-edit      = 'X'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'maktx'.
  ls_fieldcat-seltext_m = 'Txt material'.
  ls_fieldcat-seltext_l = 'texto breve material'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'ekgrp'.
  ls_fieldcat-seltext_m = 'Grp Compras'.
  ls_fieldcat-seltext_l = 'Grupo compradores'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'labst'.
  ls_fieldcat-seltext_m = 'Util Livre'.
  APPEND ls_fieldcat TO lt_fieldcat.

  CLEAR ls_fieldcat.
  ls_fieldcat-fieldname = 'umlme'.
  ls_fieldcat-seltext_m = 'Em transf.'.
  APPEND ls_fieldcat TO lt_fieldcat.


  LOOP AT lt_fieldcat INTO ls_fieldcat.
    CASE ls_fieldcat-fieldname.
      WHEN 'mtart'.
        ls_fieldcat-edit = abap_true.
        MODIFY lt_fieldcat FROM ls_fieldcat TRANSPORTING edit.
    ENDCASE.
  ENDLOOP.



  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
*     i_grid_title       =
*     i_grid_settings    =
*     is_layout          =
      it_fieldcat        = lt_fieldcat
*     i_save             = space
*    IMPORTING
*     e_exit_caused_by_caller     =
*     es_exit_caused_by_user      =
    TABLES
      t_outtab           = it_final
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.




ENDFORM.