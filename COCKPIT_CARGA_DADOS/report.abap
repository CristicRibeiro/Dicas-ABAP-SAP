*&---------------------------------------------------------------------*
*& Report ZPROG_CARGA_LOJISTAS_CCR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
"autor: CRISTINA CARNEIRO RIBEIRO
REPORT zprog_carga_lojistas_ccr.


TABLES: zcad_loja_ccr.


DATA: ent_cnpj     TYPE c LENGTH 20,
      ent_nome     TYPE c LENGTH 50,
      ent_endereco TYPE c LENGTH 50,
      ent_num      TYPE c LENGTH 10,
      ent_compl    TYPE c LENGTH 20,
      ent_bairro   TYPE c LENGTH 20,
      ent_cidade   TYPE c LENGTH 20,
      ent_estado   TYPE c LENGTH 2,
      ent_cep      TYPE c LENGTH 15,
      ent_email    TYPE c LENGTH 255,
      ent_file     TYPE localfile.


DATA: wa_cad_loja  TYPE zcad_loja_ccr,
      it_cad_loja  TYPE TABLE OF zcad_loja_ccr,
      it_alv_final TYPE TABLE OF zcad_loja_ccr,
      st_layout    TYPE lvc_s_layo,
      it_file      TYPE filetable,
      wa_file      TYPE file_table,
      v_rc         TYPE i.

DATA: o_alv       TYPE REF TO cl_gui_alv_grid,
      o_container TYPE REF TO cl_gui_custom_container.


INCLUDE zprog_carga_lojistas_ccr_pbo.
INCLUDE zprog_carga_lojistas_ccr_pai.
INCLUDE zprog_carga_lojistas_ccr_f01.


START-OF-SELECTION.
  CALL SCREEN 9001.