       IDENTIFICATION DIVISION.
       PROGRAM-ID. B.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUST-B ASSIGN TO './custB.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
           
           SELECT CUST-B-SORTED ASSIGN TO './result/custB-sorted.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT SORTED-WORK ASSIGN TO SORTED-WORK.

       DATA DIVISION.
       FILE SECTION.

       SD SORTED-WORK.
       01 SORT-REC.
           05 S-ID PIC X(5).
           05 S-ADDR PIC X(30).

       FD CUST-B.
       01 IN-REC.
           05 IN-ID PIC X(5).
           05 IN-ADDR PIC X(30).

       FD CUST-B-SORTED.
       01 OUT-REC.
           05 OUT-ID PIC X(5).
           05 OUT-ADDR PIC X(30).
   
       

       PROCEDURE DIVISION.
           
           SORT SORTED-WORK
               ON ASCENDING KEY S-ID
               USING CUST-B
               GIVING CUST-B-SORTED.


           STOP RUN.
