class ZCL_SPED_LSTR_PARAMETERS definition
  public
  inheriting from /TMF/CL_SPED_PARAMETERS
  create public .

public section.

  methods SET_DT_DOC
    importing
      !IV_DT_DOC type /TMF/DE_DT_DOC .
  methods GET_DT_DOC
    returning
      value(RV_DT_DOC) type /TMF/DE_DT_DOC .
  methods CONSTRUCTOR
    importing
      !P_DAT type /TMF/DE_DT_DOC
      !P_EMP type /TMF/DE_EMPRESA .

  methods VALIDATE
    redefinition .
protected section.

  data MV_DT_DOC type /TMF/DE_DT_DOC .
private section.
ENDCLASS.



CLASS ZCL_SPED_LSTR_PARAMETERS IMPLEMENTATION.


  METHOD constructor.
    super->constructor( ).

    set_run_id( ).
    set_report_id( '20180807' ).

  set_dt_doc( p_dat ).
  set_empresa( p_emp ).
  set_dt_fin( p_dat ).
  set_dt_ini( p_dat ).
  set_orgstr_key( /tmf/cl_orgstr_utilities=>mc_cc ).
  set_erp_keys( ).


  set_where_clause(
      EXPORTING
        iv_use_mandt   = abap_true
        iv_use_empresa = abap_true
        iv_use_filial  = abap_false
      CHANGING
        cv_where_clause = mv_where_clause_no_filial
        ct_bind_values  = mt_bind_values_no_filial ).
  ENDMETHOD.


  METHOD get_dt_doc.
    rv_dt_doc = mv_dt_doc.
  ENDMETHOD.


  METHOD set_dt_doc.
    mv_dt_doc = iv_dt_doc.
  ENDMETHOD.


  METHOD validate.
  ENDMETHOD.
ENDCLASS.
