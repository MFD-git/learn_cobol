       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUB-ADDR.

       DATA DIVISION.
       LINKAGE SECTION.
       01 ADDR PIC X(30).
       01 RESULT PIC X(35).
       PROCEDURE DIVISION USING ADDR RESULT.
           
           STRING 'ADDR:'
      *            ADDR DELIMITED BY SPACE
      *                 DELIMITED BY 'X'（遇到指定字符）
                   ADDR DELIMITED BY SIZE
                   INTO RESULT.

           EXIT PROGRAM.
