*&---------------------------------------------------------------------*
*& Report ZTEST_SUMMIT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_summit.

START-OF-SELECTION.

  PARAMETERS: p_emp TYPE /tmf/de_empresa DEFAULT 'BR10'.
  PARAMETERS: p_dat TYPE /tmf/de_dt_doc DEFAULT '20140101'.

END-OF-SELECTION.

  DATA(lo_parameters) = NEW zcl_sped_lstr_parameters( p_dat = p_dat p_emp = p_emp ).

  DATA(lo_report) = NEW zcl_sped_lstr_report( lo_parameters ).

  lo_report->pre_execute_sped( abap_false ).

  DATA(lt_output) = lo_report->get_result( ).

  LOOP AT lt_output INTO DATA(ls_result).
    WRITE / ls_result-reg.
  ENDLOOP.
