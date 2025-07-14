       IDENTIFICATION DIVISION.
       PROGRAM-ID. TASK03.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN01 ASSIGN TO './IN01.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT OT01 ASSIGN TO './result/OT01.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD IN01.
       01 IN-REC-1 PIC X(5).

       FD OT01.
       01 OT01-REC PIC X(5).
       

 
       WORKING-STORAGE SECTION.
       01 EOF-FLAG-1 PIC X VALUE 'N'.
       01 IS-FIRST PIC X VALUE 'Y'.
       01 TEMP PIC X(5).

       PROCEDURE DIVISION.
       MAIN-PROCESS.

           OPEN INPUT IN01.                  
           OPEN OUTPUT OT01.
          

           PERFORM  UNTIL EOF-FLAG-1 = 'Y'
               READ IN01
                   AT END
                       MOVE 'Y' TO EOF-FLAG-1
                   NOT AT END
                       IF IS-FIRST = 'Y' THEN
                           MOVE IN-REC-1 TO OT01-REC
                           WRITE OT01-REC
                           MOVE IN-REC-1 TO TEMP
                           MOVE 'N' TO IS-FIRST
                       ELSE
                           IF TEMP NOT = IN-REC-1 THEN
                               MOVE IN-REC-1 TO OT01-REC
                               WRITE OT01-REC
                               MOVE IN-REC-1 TO TEMP
                           END-IF
                       END-IF
           END-PERFORM.

           CLOSE IN01.
           CLOSE OT01.


           STOP RUN.
