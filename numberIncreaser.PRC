@POWER POWSHEET SHEET1 *
@POWER POWEDIT CAMPO-TEXTO RETURN
 ENVIRONMENT DIVISION.
 DATA        DIVISION.
 WORKING-STORAGE SECTION.
 77 Contador PIC 9(4) VALUE ZEROS.
 77 Incremento PIC 9(4) VALUE ZEROS.
 
 PROCEDURE   DIVISION.
 IncrementaContador.
 *Se asigna el valor del CAMPO-TEXTO a la variable Contador.
 MOVE POW-TEXT OF CAMPO-TEXT5O TO Contador.
 
 *Se realiza el incremento.
 ADD 100 TO Incremento.
 
 *Se cambia el valor anterior de CAMPO-TEXTO.
 MOVE Incremento TO POW-TEXT OF CAMPO-TEXTO.
 
 *Limitacion del contador en 1000.
 IF Incremento > 1000
 MOVE ZEROS TO POW-TEXT OF CAMPO-TEXTO
 MOVE ZEROS TO Incremento
 END-IF.
 
@POWER POWPSBTN BTN-INCREMENTO CLICK
 ENVIRONMENT DIVISION.
 DATA        DIVISION.
 WORKING-STORAGE SECTION.
 77 Contador PIC 9(4) VALUE ZEROS.
 77 Incremento PIC 9(4) VALUE ZEROS.
 
 PROCEDURE   DIVISION.
 IncrementaContador.
 *Se asigna el valor del CAMPO-TEXTO a la variable Contador.
 MOVE POW-TEXT OF CAMPO-TEXTO TO Contador.
 
 *Se realiza el incremento.
 ADD 100 TO Incremento.
 
 *Se cambia el valor anterior de CAMPO-TEXTO.
 MOVE Incremento TO POW-TEXT OF CAMPO-TEXTO.
