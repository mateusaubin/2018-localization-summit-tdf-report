*&---------------------------------------------------------------------*
*& Report ZTMF_TRFED_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztmf_trfed_report.

START-OF-SELECTION.

  PARAMETERS: p_emp TYPE /tmf/de_empresa DEFAULT 'BR10'.
  PARAMETERS: p_dat TYPE /tmf/de_data DEFAULT '20140115'.

END-OF-SELECTION.

  DATA(lo_parameters) = NEW ztmf_cl_trfed_parameters(
                              p_dat = p_dat
                              p_emp = p_emp
                        ).

  DATA(lo_report) = NEW ztmf_cl_trfed( lo_parameters ).

  lo_report->execute_sped( ).

  DATA(lt_output) = lo_report->get_result( ).

  LOOP AT lt_output INTO DATA(ls_result).
    WRITE / ls_result-reg.
  ENDLOOP.
