*&---------------------------------------------------------------------*
*& Include          ZPROG_CARGA_LOJISTAS_CCR_F01
*&---------------------------------------------------------------------*
DATA: lt_fieldcat TYPE STANDARD TABLE OF slis_fieldcat_alv.

FORM f_select_loja.
  SELECT *
    FROM zcad_loja_ccr
    INTO TABLE it_cad_loja
    WHERE cnpj <> ''.
ENDFORM.


FORM f_salvar_dados.

  IF ent_cnpj IS INITIAL.
    MESSAGE: 'favor preencher o campo de CNPJ' TYPE 'I' DISPLAY LIKE 'I'.
  ELSE.

    LOOP AT it_cad_loja INTO wa_cad_loja.
      IF wa_cad_loja-cnpj EQ ent_cnpj .
        MESSAGE: 'CNPJ já cadastrado!!' TYPE 'I' DISPLAY LIKE 'I'.
        LEAVE SCREEN.
      ELSE.
        wa_cad_loja-cnpj = ent_cnpj.
        wa_cad_loja-nome = ent_nome.
        wa_cad_loja-endereco = ent_endereco.
        wa_cad_loja-num = ent_num.
        wa_cad_loja-complemento = ent_compl.
        wa_cad_loja-bairro = ent_bairro.
        wa_cad_loja-cidade = ent_cidade.
        wa_cad_loja-estado = ent_estado.
        wa_cad_loja-cep = ent_cep.
        wa_cad_loja-email = ent_email.

        APPEND wa_cad_loja TO it_cad_loja.
        CLEAR wa_cad_loja.
        MODIFY zcad_loja_ccr FROM TABLE it_cad_loja .

        IF sy-subrc IS INITIAL.
          MESSAGE: 'Cadastro efetuado com sucesso!!' TYPE 'I' DISPLAY LIKE 'I'.
          LEAVE SCREEN.
        ELSE.
          MESSAGE: 'CADASTRO NÃO EFETUADO!!' TYPE 'I' DISPLAY LIKE 'E'.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
ENDFORM.


*&---------------------------------------------------------------------*
*& Form f_alv_loja
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_alv_loja .
  DATA: selfield TYPE slis_selfield,
        u_ucomm LIKE SY-UCOMM.
  "INICIO PRIMEIRA MANEIRA
  PERFORM f_select_loja.

  "verifica se o objeto foi instanciado e limpa logo em seguida
  IF o_alv IS BOUND.
    o_alv->free( ).
  ELSEIF o_alv IS NOT BOUND.
    "se objeto ñ foi instanciado.. ele eh criado agora
    CREATE OBJECT o_container
      EXPORTING
        container_name = 'CC_ALV2'.
  ENDIF.

  "cria objeto alv e passa container que recebera alv
  CREATE OBJECT o_alv
    EXPORTING
      i_parent = o_container.


  "layout do alv
  st_layout-cwidth_opt = 'X'.
  st_layout-zebra = 'X'.

  call METHOD o_alv->set_table_for_first_display
    EXPORTING
      i_structure_name              = 'ZCAD_LOJA_CCR'
      is_layout                     =  st_layout
    CHANGING
      it_outtab                     = it_cad_loja.

  CALL METHOD o_alv->refresh_table_display( ).
  "FIM PRIMEIRA MANEIRA


"inicio 2 maaneira
*  PERFORM f_select_loja.
*  PERFORM fieldcat.
*
*  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*    EXPORTING
*      i_callback_program = sy-repid
*      it_fieldcat        = lt_fieldcat
*    TABLES
*      t_outtab           = it_cad_loja
*    EXCEPTIONS
*      program_error      = 1
*      OTHERS             = 2.
*  IF sy-subrc <> 0.
**   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
**     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
*  ENDIF.
*  "selfield-refresh = 'X'.
"fim 2 maneira


ENDFORM.
*&---------------------------------------------------------------------*
*& Form fieldcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fieldcat .

  DATA: ls_fieldcat TYPE slis_fieldcat_alv.


  ls_fieldcat-fieldname = 'CNPJ'.
  ls_fieldcat-seltext_m = 'CNPJ'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'NOME'.
  ls_fieldcat-seltext_m = 'NOME'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'ENDERECO'.
  ls_fieldcat-seltext_m = 'ENDEREÇO'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'NUM'.
  ls_fieldcat-seltext_m = 'NÚMERO'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'COMPLEMENTO'.
  ls_fieldcat-seltext_m = 'COMPLEMENTO'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'BAIRRO'.
  ls_fieldcat-seltext_m = 'BAIRRO'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'CIDADE'.
  ls_fieldcat-seltext_m = 'CIDADE'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'ESTADO'.
  ls_fieldcat-seltext_m = 'ESTDO'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'CEP'.
  ls_fieldcat-seltext_m = 'CEP'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-fieldname = 'EMAIL'.
  ls_fieldcat-seltext_m = 'E-MAIL'.
  APPEND ls_fieldcat TO lt_fieldcat.
ENDFORM.