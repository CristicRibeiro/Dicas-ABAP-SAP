*&---------------------------------------------------------------------*
*& Include          ZPROG_CARGA_MASSIVA_CCR_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_guarda_arquivo
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_guarda_arquivo .
    DATA: lv_file TYPE string.
  
    lv_file = p_file.
  
    CLEAR it_arquivo.
  
    CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
      EXPORTING
        i_tab_raw_data       = it_raw
        i_filename           = p_file
      TABLES
        i_tab_converted_data = it_arquivo[]
      EXCEPTIONS
       conversion_failed    = 1
       others               = 2
      .
    IF sy-subrc <> 0.
     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
  
  
    LOOP AT it_arquivo INTO wa_arquivo.
      wa_cads_loja-bairro       = wa_arquivo-bairro.
      wa_cads_loja-cep          = wa_arquivo-cep.
      wa_cads_loja-cidade       = wa_arquivo-cidade.
      wa_cads_loja-cnpj         = wa_arquivo-cnpj.
      wa_cads_loja-complemento  = wa_arquivo-complemento.
      wa_cads_loja-email        = wa_arquivo-email.
      wa_cads_loja-endereco     = wa_arquivo-endereco.
      wa_cads_loja-estado       = wa_arquivo-estado.
      wa_cads_loja-nome         = wa_arquivo-nome.
      wa_cads_loja-num          = wa_arquivo-num.
    ENDLOOP.
  
    APPEND wa_cads_loja TO it_cads_loja.
    CLEAR wa_cads_loja.
  
    MODIFY zcad_loja_ccr FROM TABLE it_cads_loja.
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form f_le_arquivo
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM f_le_arquivo .
    "teste2
    CALL FUNCTION 'F4_FILENAME'
      EXPORTING
        field_name    = 'p_file'
      IMPORTING
        file_name     = p_file.
  
  
  
  
  
  
  
  "metodo para abri a janela de seleção de arquivos
  "  CALL METHOD cl_gui_frontend_services=>file_open_dialog
  "**    EXPORTING
  "**      window_title            = 'Selecione o arquivo para upload'
  "**      default_extension       = 'XLSX'
  "**    CHANGING
  "**      file_table              = it_file
  "**      rc                      = v_rc
  "**    EXCEPTIONS
  "**      file_open_dialog_failed = 1
  "**      cntl_error              = 2
  "**      error_no_gui            = 3
  "**      not_supported_by_gui    = 4
  "**      OTHERS                  = 5.
  "**  IF sy-subrc <> 0.
 " **    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
  "**      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
 " **  ELSE.
  "**    READ TABLE it_file INTO wa_file INDEX 1.
 " **    p_file = wa_file-filename.
  "**  ENDIF.
  ENDFORM.