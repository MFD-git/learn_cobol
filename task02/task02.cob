       IDENTIFICATION DIVISION.
       PROGRAM-ID. TASK01.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN01 ASSIGN TO './IN01.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT IN02 ASSIGN TO './IN02.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT OT01 ASSIGN TO './result/OT01.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD IN01.
       01 IN-REC-1 PIC X(5).

       FD IN02.
       01 IN-REC-2 PIC X(15).

       FD OT01.
       01 OT01-REC PIC X(15).
       

 
       WORKING-STORAGE SECTION.
       01 EOF-FLAG-1 PIC X VALUE 'N'.
       01 EOF-FLAG-2 PIC X VALUE 'N'.


       PROCEDURE DIVISION.
       MAIN-PROCESS.
           OPEN INPUT IN01.
                      
           OPEN OUTPUT OT01.
          

           PERFORM  UNTIL EOF-FLAG-1 = 'Y'
               READ IN01
                   AT END
                       MOVE 'Y' TO EOF-FLAG-1
                   NOT AT END
                       MOVE 'N' TO EOF-FLAG-2
                       OPEN INPUT IN02
                       PERFORM  UNTIL EOF-FLAG-2 = 'Y'
                           READ IN02
                           AT END
                               MOVE 'Y' TO EOF-FLAG-2
                           NOT AT END
                               IF IN-REC-1 = IN-REC-2(1:5) THEN
                                   MOVE IN-REC-2 TO OT01-REC
                                   WRITE OT01-REC
                               END-IF
                       END-PERFORM
                       CLOSE IN02
           END-PERFORM.

           CLOSE IN01.
           CLOSE OT01.


           STOP RUN.
