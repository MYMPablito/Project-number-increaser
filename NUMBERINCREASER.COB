000001 IDENTIFICATION DIVISION.
000002 PROGRAM-ID. "SHEET1".
000003 ENVIRONMENT DIVISION.
000004 CONFIGURATION SECTION.
000005 SPECIAL-NAMES.
000006 INPUT-OUTPUT SECTION.
000007 FILE-CONTROL.
000008 DATA DIVISION.
000009 BASED-STORAGE SECTION.
000010 FILE SECTION.
000011 WORKING-STORAGE SECTION.
000012 01 POWER--HPOWOBJS-SHEET1 IS GLOBAL IS EXTERNAL.
000013   02 POWER--HPOWOBJ--SHEET1.
000013     03 SHEET1 PIC S9(9) COMP-5.
000013     03 POW-P001 REDEFINES  SHEET1 USAGE POINTER.
000013   02 POWER--HPOWOBJ--CAMPO-TEXTO.
000013     03 CAMPO-TEXTO PIC S9(9) COMP-5.
000013     03 POW-P002 REDEFINES  CAMPO-TEXTO USAGE POINTER.
000013   02 POWER--HPOWOBJ--BTN-INCREMENTO.
000013     03 BTN-INCREMENTO PIC S9(9) COMP-5.
000013     03 POW-P003 REDEFINES  BTN-INCREMENTO USAGE POINTER.
000014 01  REDEFINES POWER--HPOWOBJS-SHEET1.
000015   02  POWER--HPOWOBJS PICTURE IS X(4) OCCURS 3 TIMES.
000016 01  POWER-HPOWOBJIDX PIC S9(9) COMP-5.
000017 CONSTANT SECTION.
000018 LINKAGE SECTION.
000019 01  POWER--HPOWOBJ IS GLOBAL PICTURE IS  X(4).
000020 01  POWER--ID      IS GLOBAL PICTURE IS S9(9)
000021                    USAGE IS COMPUTATIONAL-5.
000022 01  POWER--NOTIFY  IS GLOBAL PICTURE IS S9(9)
000023                    USAGE IS COMPUTATIONAL-5.
000024 01  POWER--MESSAGE IS GLOBAL PICTURE IS S9(9)
000025                    USAGE IS COMPUTATIONAL-5.
000026 PROCEDURE DIVISION
000027     USING POWER--HPOWOBJ POWER--ID POWER--MESSAGE POWER--NOTIFY.
000028     EVALUATE POWER--MESSAGE
000029     WHEN 1025
000030         EVALUATE POWER--HPOWOBJ
000031         WHEN POWER--HPOWOBJ--CAMPO-TEXTO
000032             EVALUATE POWER--NOTIFY
000033             WHEN 27 
000034                CALL "CAMPO-TEXTO-RETURN"
000035             END-EVALUATE
000036         WHEN POWER--HPOWOBJ--BTN-INCREMENTO
000037             EVALUATE POWER--NOTIFY
000038             WHEN 1 
000039                CALL "BTN-INCREMENTO-CLICK"
000040             END-EVALUATE
000041         END-EVALUATE
000042     WHEN 1024
000043         MOVE POWER--HPOWOBJ TO POWER--HPOWOBJS (POWER--ID + 1)
000044     WHEN 1038
000045         CALL "SHEET1-START"
000046     END-EVALUATE
000047     EXIT PROGRAM.
000048 IDENTIFICATION DIVISION.
000049 PROGRAM-ID. "SHEET1-START".
000050 PROCEDURE DIVISION.
000051     EXIT PROGRAM.
000052 END PROGRAM "SHEET1-START".
000053 IDENTIFICATION DIVISION.
000054 PROGRAM-ID. "CAMPO-TEXTO-RETURN".
000055 ENVIRONMENT DIVISION.
000056 DATA        DIVISION.
000057 WORKING-STORAGE SECTION.
000058 77 Contador PIC 9(4) VALUE ZEROS.
000059 77 Incremento PIC 9(4) VALUE ZEROS.
000059 77 POW-0001 PIC X(256) .
000059 77 POW-0002 PIC X(256) .
000060 
000061 PROCEDURE   DIVISION.
000062 IncrementaContador.
000063 *Se asigna el valor del CAMPO-TEXTO a la variable Contador.
000064 MOVE POW-TEXT OF CAMPO-TEXT5O TO Contador.
000065 
000066 *Se realiza el incremento.
000067 ADD 100 TO Incremento.
000068 
000069 *Se cambia el valor anterior de CAMPO-TEXTO.
000070 MOVE  Incremento  TO POW-0001.
000070 CALL  "XPOWCWSETTEXT"  USING BY VALUE CAMPO-TEXTO  BY REFERENCE POW-0001 .
000071 
000072 *Limitacion del contador en 10000.
000073 IF Incremento > 10000
000074 MOVE  ZEROS  TO POW-0002
000074 CALL  "XPOWEDITSETTEXT"  USING BY VALUE CAMPO-TEXTO  BY REFERENCE POW-0002 
000075 MOVE ZEROS TO Incremento
000076 END-IF.
000077 
000078 END PROGRAM "CAMPO-TEXTO-RETURN".
000079 IDENTIFICATION DIVISION.
000080 PROGRAM-ID. "BTN-INCREMENTO-CLICK".
000081 ENVIRONMENT DIVISION.
000082 DATA        DIVISION.
000083 WORKING-STORAGE SECTION.
000084 77 Contador PIC 9(4) VALUE ZEROS.
000085 77 Incremento PIC 9(4) VALUE ZEROS.
000085 77 POW-0001 PIC X(256) .
000085 77 POW-0002 PIC X(256) .
000086 
000087 PROCEDURE   DIVISION.
000088 IncrementaContador.
000089 *Se asigna el valor del CAMPO-TEXTO a la variable Contador.
000090 CALL  "XPOWEDITGETTEXT"  USING BY VALUE CAMPO-TEXTO  BY REFERENCE POW-0001 .
000090 MOVE POW-0001 TO Contador.
000091 
000092 *Se realiza el incremento.
000093 ADD 100 TO Incremento.
000094 
000095 *Se cambia el valor anterior de CAMPO-TEXTO.
000096 MOVE  Incremento  TO POW-0002.
000096 CALL  "XPOWCWSETTEXT"  USING BY VALUE CAMPO-TEXTO  BY REFERENCE POW-0002 .
000097 END PROGRAM "BTN-INCREMENTO-CLICK".
000098 END PROGRAM "SHEET1".
