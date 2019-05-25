*&---------------------------------------------------------------------*
*& Report Z_BUNKAI_MARKDOWN_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_bunkai_markdown_01.

CONSTANTS c_default TYPE string VALUE 'Hello _ABAP Markdown_! ## Untertitel '.

CLASS lcl_demo DEFINITION.
  PUBLIC SECTION.
    METHODS main.

  PRIVATE SECTION.
    METHODS display IMPORTING iv_html TYPE string.
    METHODS input IMPORTING iv_text TYPE string OPTIONAL
                  RETURNING VALUE(rv_text) TYPE string.
ENDCLASS.


START-OF-SELECTION.
  NEW lcl_demo( )->main( ).

CLASS lcl_demo IMPLEMENTATION.

  METHOD input.
    rv_text = iv_text.
    cl_demo_input=>request( CHANGING field = rv_text ).
  ENDMETHOD.

  METHOD main.
    DATA lv_abap_text TYPE string VALUE c_default.

    display( NEW zmarkdown( )->text( input( lv_abap_text ) ) ).
  ENDMETHOD.

  METHOD display.
    cl_demo_output=>display_html( iv_html ).
  ENDMETHOD.

ENDCLASS.
