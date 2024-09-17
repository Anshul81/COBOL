       IDENTIFICATION DIVISION.
       PROGRAM-ID. FactorialCalculator.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NUMBER               PIC 9(02) VALUE 0.
       01  WS-FACTORIAL            PIC 9(18) VALUE 1.
       01  WS-COUNTER              PIC 9(02) VALUE 1.
       01  WS-USER-INPUT           PIC X(03).

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter a number to calculate its factorial (0-99): "
           ACCEPT WS-USER-INPUT
           MOVE FUNCTION NUMVAL(WS-USER-INPUT) TO WS-NUMBER

           IF WS-NUMBER < 0 OR WS-NUMBER > 99
               DISPLAY "Invalid input. Please enter a number between 0 and 99."
               STOP RUN
           END-IF

           PERFORM CALCULATE-FACTORIAL
               UNTIL WS-COUNTER > WS-NUMBER

           DISPLAY "The factorial of " WS-NUMBER " is " WS-FACTORIAL

           STOP RUN.

       CALCULATE-FACTORIAL.
           IF WS-NUMBER = 0
               MOVE 1 TO WS-FACTORIAL
           ELSE
               MULTIPLY WS-FACTORIAL BY WS-COUNTER
               ADD 1 TO WS-COUNTER
           END-IF.

       END PROGRAM FactorialCalculator.
