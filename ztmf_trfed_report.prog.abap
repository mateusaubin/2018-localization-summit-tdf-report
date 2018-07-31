*&---------------------------------------------------------------------*
*& Report ZTMF_TRFED_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTMF_TRFED_REPORT.

START-OF-SELECTION.

  PARAMETERS: p_emp TYPE /tmf/de_empresa DEFAULT 'BR10'.
  PARAMETERS: p_dat TYPE /tmf/de_data DEFAULT '20140115'.

END-OF-SELECTION.

  DATA(lo_parameters) = NEW ZTMF_CL_TRFED_PARAMETERS( p_dat = p_dat p_emp = p_emp ).

  DATA(lo_report) = NEW ZTMF_CL_TRFED( lo_parameters ).

  lo_report->execute_sped( ).

  DATA(lt_output) = lo_report->get_result( ).

  LOOP AT lt_output INTO DATA(ls_result).
    WRITE / ls_result-reg.
  ENDLOOP.
