       IDENTIFICATION DIVISION.
       PROGRAM-ID. A.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUST-A-SORTED ASSIGN TO './result/custA-sorted.txt'
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS CUST-A-STATUS.

           SELECT CUST-B-SORTED ASSIGN TO './result/custB-sorted.txt'
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS CUST-B-STATUS.

           SELECT CUST-ALL ASSIGN TO './result/cust-all.txt'
               ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.

       FD CUST-A-SORTED.
       01 A-REC.
           05 A-ID PIC X(5).
           05 A-NAME PIC X(20).

       FD CUST-B-SORTED.
       01 B-REC.
           05 B-ID PIC X(5).
           05 B-ADDR PIC X(30).
   
       FD CUST-ALL.
       01 OUT-REC.
           05 OUT-ID PIC X(5).
           05 OUT-NAME PIC X(20).
           05 OUT-ADDR PIC X(30).
       
       WORKING-STORAGE SECTION.
       01 CUST-A-STATUS PIC XX.
       01 CUST-B-STATUS PIC XX.
       01 RESULT PIC X(35).



       PROCEDURE DIVISION.
           
           OPEN INPUT CUST-A-SORTED.
           OPEN INPUT CUST-B-SORTED.
           OPEN OUTPUT CUST-ALL.

           READ CUST-A-SORTED AT END MOVE 10 TO CUST-A-STATUS.
           READ CUST-B-SORTED AT END MOVE 10 TO CUST-B-STATUS.
           
           PERFORM UNTIL CUST-A-STATUS = 10 OR CUST-B-STATUS = 10
               IF A-ID = B-ID THEN
                   MOVE A-ID TO OUT-ID
                   MOVE A-NAME TO OUT-NAME
                   CALL 'SUB-ADDR' USING B-ADDR RESULT
                   MOVE RESULT TO OUT-ADDR
                   WRITE OUT-REC
                   READ CUST-A-SORTED AT END MOVE 10 TO CUST-A-STATUS
                   READ CUST-B-SORTED AT END MOVE 10 TO CUST-B-STATUS
               ELSE IF A-ID < B-ID THEN
                       READ CUST-A-SORTED
                           AT END MOVE 10 TO CUST-A-STATUS
                   ELSE
                       READ CUST-B-SORTED 
                           AT END MOVE 10 TO CUST-B-STATUS
                   END-IF
               END-IF
           END-PERFORM.

           CLOSE CUST-A-SORTED.
           CLOSE CUST-B-SORTED.
           CLOSE CUST-ALL.
           STOP RUN.
