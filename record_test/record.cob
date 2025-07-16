       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTOMER.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FIRST-RECORD.
           05 R-NAME PIC X(10).
       
       01 SECOND-RECORD.
           05 R-NAME PIC X(10).



       PROCEDURE DIVISION.

      *    不能这样写
           MOVE "Alice" TO FIRST-RECORD.R-NAME.
           MOVE "Bob" TO SECOND-RECORD.R-NAME.

           DISPLAY "FIRST:" FIRST-RECORD.R-NAME.
           DISPLAY "SECOND:" SECOND-RECORD.R-NAME.

         
           STOP RUN.
