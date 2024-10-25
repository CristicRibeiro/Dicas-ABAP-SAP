*&---------------------------------------------------------------------*
*& Report ZPROG_CARGA_MASSIVA_CCR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprog_carga_massiva_ccr.

type-pools: truxs.
TABLES: zcad_loja_ccr.


TYPES: BEGIN OF ty_arquivo,
         cnpj        TYPE c LENGTH 20,
         nome        TYPE c LENGTH 50,
         endereco    TYPE c LENGTH 50,
         num         TYPE i,
         complemento TYPE c LENGTH 20,
         bairro      TYPE c LENGTH 20,
         cidade      TYPE c LENGTH 20,
         estado      TYPE c LENGTH 2,
         cep         TYPE i,
         email       TYPE c LENGTH 255,
       END OF ty_arquivo.

DATA: it_arquivo TYPE STANDARD TABLE OF ty_arquivo,
      wa_arquivo TYPE ty_arquivo.



DATA: wa_cads_loja  TYPE zcad_loja_ccr,
      it_cads_loja  TYPE TABLE OF zcad_loja_ccr,
      it_file       TYPE filetable,
      wa_file       TYPE file_table,
      v_rc          TYPE i,
      it_raw        TYPE truxs_t_text_data.


SELECTION-SCREEN BEGIN OF BLOCK b01.
  PARAMETERS: p_file TYPE rlgrap-filename.
SELECTION-SCREEN END OF BLOCK b01.

INCLUDE ZPROG_CARGA_MASSIVA_CCR_F01.


"ativando o matchcode
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  PERFORM f_le_arquivo.

START-OF-SELECTION.
  PERFORM f_guarda_arquivo.