       IDENTIFICATION DIVISION.
       PROGRAM-ID. INPUT-DEMO.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUT-FILE ASSIGN TO "./file/output_result.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD OUT-FILE.
       01 TEXT-1 PIC X(50).
       
       PROCEDURE DIVISION.
       MAIN-PROCESS.
           DISPLAY "âΩÇ©Çì¸óÕÇµÇƒÇ≠ÇæÇ≥Ç¢ÅB".
           ACCEPT TEXT-1.
           
           DISPLAY FUNCTION TRIM(TEXT-1)"Çì¸óÕÇµÇ‹ÇµÇΩÅB".

           OPEN OUTPUT OUT-FILE.
           WRITE TEXT-1.

           CLOSE OUT-FILE.
           STOP RUN.
       