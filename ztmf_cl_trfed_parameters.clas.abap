CLASS ztmf_cl_trfed_parameters DEFINITION
  PUBLIC
  INHERITING FROM /tmf/cl_sped_parameters
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !p_emp TYPE /tmf/de_empresa
        !p_dat TYPE /tmf/de_data .

    METHODS validate
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTMF_CL_TRFED_PARAMETERS IMPLEMENTATION.


  METHOD constructor.

    super->constructor( ).


*   adjust dates to beggining and end of the month
    DATA: lv_dt_temp TYPE d,
          lv_dt_ini  TYPE d,
          lv_dt_fin  TYPE d.

    lv_dt_temp = p_dat.
    lv_dt_temp+6(2) = '01'.
    lv_dt_ini = lv_dt_temp.
    lv_dt_temp+4(2) = 1 + CONV i( lv_dt_temp+4(2) ).
    SUBTRACT 1 FROM lv_dt_temp.
    lv_dt_fin = lv_dt_temp.
    CLEAR lv_dt_temp.


*   generate run ID
    set_run_id( ).


*   identify as TDF Reporting Framework Extensibility Demo
*   as per data on table /TMF/D_REP_FISC
    set_report_id( '0020180726' ).


*   define basic parameters
    set_empresa( p_emp ).
    set_dt_ini( CONV #( lv_dt_ini ) ).
    set_dt_fin( CONV #( lv_dt_fin ) ).
    set_orgstr_key( /tmf/cl_orgstr_utilities=>mc_cc ).
    set_erp_keys( ).


*   generate WHERE query clause
    set_where_clause(
          EXPORTING
            iv_use_mandt   = abap_true
            iv_use_empresa = abap_false
            iv_use_filial  = abap_false
          CHANGING
            cv_where_clause = mv_where_clause_no_filial
            ct_bind_values  = mt_bind_values_no_filial
        ).

  ENDMETHOD.


  METHOD validate.

*-----------------------------------------------------------
*    Insert business rules for your scenario validation
*-----------------------------------------------------------

  ENDMETHOD.
ENDCLASS.
