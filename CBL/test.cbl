IDENTIFICATION DIVISION.
       PROGRAM-ID. PerformUntilExample.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-COUNTER       PIC 9(02) VALUE 1.
       01 WS-TOTAL         PIC 9(03) VALUE 0.
       01 WS-LIMIT         PIC 9(02) VALUE 10.
       01 WS-FLAG          PIC X VALUE 'N'.
       01 WS-NUMBER        PIC 9(02) VALUE 5.
 
       PROCEDURE DIVISION.
       
       MAIN-LOGIC.
 
           DISPLAY "Perform Until Example in COBOL".
 
           PERFORM WITH TEST BEFORE
               UNTIL WS-COUNTER > WS-LIMIT
               DISPLAY "Counter: " WS-COUNTER
               COMPUTE WS-COUNTER = WS-COUNTER + 1
           END-PERFORM.
 
           MOVE 1 TO WS-COUNTER.
 
           PERFORM WITH TEST AFTER
               UNTIL WS-COUNTER > WS-LIMIT
               DISPLAY "Counter after test: " WS-COUNTER
               COMPUTE WS-COUNTER = WS-COUNTER + 1
           END-PERFORM.
 
           MOVE 1 TO WS-COUNTER.
 
           PERFORM UNTIL WS-COUNTER > WS-LIMIT
               DISPLAY "Perform until: Counter: " WS-COUNTER
               COMPUTE WS-COUNTER = WS-COUNTER + 1
           END-PERFORM.
 
           MOVE 0 TO WS-TOTAL.
           PERFORM UNTIL WS-FLAG = 'Y'
               DISPLAY "Perform with condition on flag."
               ADD WS-NUMBER TO WS-TOTAL
               IF WS-TOTAL >= 50 THEN
                   MOVE 'Y' TO WS-FLAG
               END-IF
           END-PERFORM.
 
           STOP RUN.
 
