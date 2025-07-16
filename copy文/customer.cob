       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTOMER.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *仅插件报错
       COPY "custrec" REPLACING CUSTOMER-RECORD BY C.




       PROCEDURE DIVISION.

           MOVE "A001" TO CUST-ID.
           MOVE "Alice" TO CUST-NAME.
           MOVE 100 TO CUST-AGE.

           DISPLAY "Customer ID: " CUST-ID.
           DISPLAY "Customer Name: " CUST-NAME.
           DISPLAY "Customer Age: " CUST-AGE.

      *    DISPLAY "ALL:" CUSTOMER-RECORD.
           DISPLAY "ALL:" C.
           STOP RUN.
