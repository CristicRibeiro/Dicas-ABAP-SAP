*&---------------------------------------------------------------------*
*& Include          Z_PRIMEIRO_ALV_CCR_S01
*&---------------------------------------------------------------------*
TABLES: mara, marc.

SELECTION-SCREEN begin of BLOCK 01 .
"DEFININDO OS CAMPOS QUE APARECERÃO NA TELA PARA USUÁRIO PREENCHER
  select-OPTIONS: s_MATNR for MARA-MATNR,
                  s_WERKS for MARC-WERKS,
                  s_ERSDA for MARA-ERSDA.
  SELECTION-SCREEN end of block 01.