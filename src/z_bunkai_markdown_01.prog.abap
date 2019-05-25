*&---------------------------------------------------------------------*
*& Report Z_BUNKAI_MARKDOWN_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_bunkai_markdown_01.

PARAMETERS p_text TYPE string DEFAULT 'Hello _ABAP Markdown_!' ##NO_TEXT.

CLASS lcl_demo DEFINITION.
  PUBLIC SECTION.
    METHODS main IMPORTING iv_text TYPE string.

  PRIVATE SECTION.
    METHODS display IMPORTING iv_html TYPE string.
    METHODS input IMPORTING iv_text        TYPE string OPTIONAL
                  RETURNING VALUE(rv_text) TYPE string.
ENDCLASS.


START-OF-SELECTION.
  NEW lcl_demo( )->main( p_text ).

CLASS lcl_demo IMPLEMENTATION.

  METHOD input.
    rv_text = iv_text.
    cl_demo_input=>request( CHANGING field = rv_text ).
  ENDMETHOD.

  METHOD main.
    display( NEW zmarkdown( )->text( input( iv_text ) ) ).
  ENDMETHOD.

  METHOD display.
    cl_demo_output=>display_html( iv_html ).
  ENDMETHOD.

ENDCLASS.
