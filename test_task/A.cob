       IDENTIFICATION DIVISION.
       PROGRAM-ID. A.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUST-A ASSIGN TO './custA.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
           
           SELECT CUST-A-SORTED ASSIGN TO './result/custA-sorted.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT SORTED-WORK ASSIGN TO SORTED-WORK.

       DATA DIVISION.
       FILE SECTION.

       SD SORTED-WORK.
       01 SORT-REC.
           05 S-ID PIC X(5).
           05 S-NAME PIC X(20).

       FD CUST-A.
       01 IN-REC.
           05 IN-ID PIC X(5).
           05 IN-NAME PIC X(20).

       FD CUST-A-SORTED.
       01 OUT-REC.
           05 OUT-ID PIC X(5).
           05 OUT-NAME PIC X(20).
   
       

       PROCEDURE DIVISION.
           
           SORT SORTED-WORK
               ON ASCENDING KEY S-ID
               USING CUST-A
               GIVING CUST-A-SORTED.
      *    用于文件合并（字段/结构相同）
      *    MERGE MERGE-FILE
      *        ON ASCENDING KEY S-ID
      *        USING FILE-A FILE-B
      *        GIVING FILE-C.
           STOP RUN.
