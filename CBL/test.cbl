IDENTIFICATION DIVISION.
PROGRAM-ID. InventoryManager.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT InventoryFile ASSIGN TO 'Inventory.dat'
        ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD InventoryFile.
01 InventoryRecord.
   05 ItemCode PIC X(5).
   05 ItemName PIC X(20).
   05 ItemQuantity PIC 9(4).

WORKING-STORAGE SECTION.
01 WS-EOF PIC X VALUE 'N'.
   88 EOF VALUE 'Y'.
   88 NOT-EOF VALUE 'N'.
01 Response PIC X.
01 AddMoreItems PIC X VALUE 'Y'.
   88 Add-More VALUE 'Y'.
   88 No-More VALUE 'N'.
01 WS-InventoryRecord.
   05 WS-ItemCode PIC X(5).
   05 WS-ItemName PIC X(20).
   05 WS-ItemQuantity PIC 9(4).
01 Counter PIC 9(3) VALUE 0.

PROCEDURE DIVISION.
Begin.
    OPEN OUTPUT InventoryFile
    PERFORM UNTIL Add-More = No-More
        DISPLAY "Enter item code: "
        ACCEPT WS-ItemCode
        DISPLAY "Enter item name: "
        ACCEPT WS-ItemName
        DISPLAY "Enter quantity: "
        ACCEPT WS-ItemQuantity

        MOVE WS-ItemCode TO ItemCode
        MOVE WS-ItemName TO ItemName
        MOVE WS-ItemQuantity TO ItemQuantity
        WRITE InventoryRecord

        DISPLAY "Add more items? (Y/N): "
        ACCEPT Response
        IF Response NOT = 'Y'
            MOVE 'N' TO AddMoreItems
        END-IF

        ADD 1 TO Counter
        IF Counter > 99
            DISPLAY "Maximum item limit reached."
            MOVE 'N' TO AddMoreItems
        END-IF
    END-PERFORM

    CLOSE InventoryFile
    DISPLAY "Inventory update complete."

    OPEN INPUT InventoryFile
    PERFORM UNTIL EOF
        READ InventoryFile INTO InventoryRecord
            AT END
                MOVE 'Y' TO WS-EOF
            NOT AT END
                DISPLAY "Item Code: " ItemCode,
                        " Name: " ItemName,
                        " Quantity: " ItemQuantity
        END-READ
    END-PERFORM
    CLOSE InventoryFile

    STOP RUN.
