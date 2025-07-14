       IDENTIFICATION DIVISION.
       PROGRAM-ID. TASK01.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN01 ASSIGN TO './IN01.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT OT01 ASSIGN TO './result/OT01.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT OT02 ASSIGN TO './result/OT02.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT OT03 ASSIGN TO './result/OT03.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT OT04 ASSIGN TO './result/OT04.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD IN01.
       01 IN-REC PIC X(50).


       FD OT01.
       01 OT01-REC PIC X(50).
       

       FD OT02.
       01 OT02-REC PIC X(50).

       FD OT03.
       01 OT03-REC PIC X(30).

       FD OT04.
       01 OT04-REC PIC X(20).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG PIC X VALUE 'N'.
       01 FILE-ROW PIC 9(10).
       01 ROW-RESULT PIC 9(10).
       01 IS-EVE PIC 9(1).

       PROCEDURE DIVISION.
       MAIN-PROCESS.
           OPEN INPUT IN01.
           OPEN OUTPUT OT01.
           OPEN OUTPUT OT02.
           OPEN OUTPUT OT03.
           OPEN OUTPUT OT04.

           PERFORM VARYING FILE-ROW FROM 1 BY 1 UNTIL EOF-FLAG = 'Y'
               READ IN01
                   AT END
                       MOVE 'Y' TO EOF-FLAG
                   NOT AT END
                       DIVIDE FILE-ROW BY 2 
                           GIVING ROW-RESULT REMAINDER IS-EVE
                       IF IS-EVE NOT = 0 THEN
                           MOVE IN-REC TO OT01-REC
                           WRITE OT01-REC
                       ELSE
                           MOVE IN-REC TO OT02-REC
                           WRITE OT02-REC
                       END-IF
                       MOVE IN-REC(1:30) TO OT03-REC
                       WRITE OT03-REC

                       MOVE IN-REC(31:20) TO OT04-REC
                       WRITE OT04-REC
           END-PERFORM.

           CLOSE IN01.
           CLOSE OT01.
           CLOSE OT02.
           CLOSE OT03.
           CLOSE OT04.

           STOP RUN.
