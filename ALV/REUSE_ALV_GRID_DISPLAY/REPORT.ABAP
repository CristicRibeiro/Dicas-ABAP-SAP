*&---------------------------------------------------------------------*
*& Report Z_PRIMEIRO_ALV_CCR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_PRIMEIRO_ALV_CCR.


INCLUDE Z_PRIMEIRO_ALV_CCR_S01.
INCLUDE Z_PRIMEIRO_ALV_CCR_F01.





START-OF-SELECTION.

  perform f_get_dados.
  perform f_fieldcat.