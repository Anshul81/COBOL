      IDENTIFICATION DIVISION.
      PROGRAM-ID. PerformUntilVarMix.
      ENVIRONMENT DIVISION.
      DATA DIVISION.
      WORKING-STORAGE SECTION.
      01  WS-INDEX           PIC 9(03) VALUE 0.
      01  MAX-COUNT          PIC 9(03) VALUE 100.
      01  CURRENT-TOTAL      PIC 9(03) VALUE 0.
      01  THRESHOLD-LIMIT    PIC 9(03) VALUE 50.
      01  TEMP-READING       PIC 9(03) VALUE 65.
      01  TEMP-MAX           PIC 9(03) VALUE 120.
      01  FLAG-CONTROL       PIC X(01)  VALUE 'N'.
      01  ITEM-COUNT         PIC 9(03) VALUE 0.
      01  ITEM-LIMIT         PIC 9(03) VALUE 25.
      PROCEDURE DIVISION.
      MAIN-PROCEDURE.
          DISPLAY "Starting PERFORM UNTIL Variable Mix Example."
          * Simple numeric comparison with different variable names
          PERFORM UNTIL WS-INDEX >= MAX-COUNT
              DISPLAY "Processing Index: " WS-INDEX
              ADD 1 TO WS-INDEX
          END-PERFORM.
          * Loop using different variable names with total and limit check
          PERFORM UNTIL ITEM-COUNT >= ITEM-LIMIT
              DISPLAY "Items Processed: " ITEM-COUNT
              ADD 1 TO ITEM-COUNT
          END-PERFORM.
          * Loop with multiple conditions using completely different variable names
          PERFORM UNTIL TEMP-READING >= TEMP-MAX OR CURRENT-TOTAL >= THRESHOLD-LIMIT
              DISPLAY "Temperature: " TEMP-READING ", Current Total: " CURRENT-TOTAL
              COMPUTE TEMP-READING = TEMP-READING + 5
              ADD 10 TO CURRENT-TOTAL
          END-PERFORM.
          * Flag-based termination using a different variable name
          PERFORM UNTIL FLAG-CONTROL = 'Y'
              DISPLAY "Flag Status: " FLAG-CONTROL
              IF CURRENT-TOTAL >= THRESHOLD-LIMIT THEN
                  MOVE 'Y' TO FLAG-CONTROL
              END-IF
          END-PERFORM.
          DISPLAY "All operations complete."
          STOP RUN.


