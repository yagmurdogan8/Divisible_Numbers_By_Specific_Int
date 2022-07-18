ORG 100H  

.MODEL SMALL
.DATA  
 
MSGDIV DB "The number can be divided by 2", 13, 10
MSGDIV2 DB "The number can be divided by 3", 13, 10
MSGDIV3 DB "The number can be divided by 5", 13, 10
MSGDIV4 DB "The number can be divided by 1O", 13, 10 

NUM DB 15

.CODE

FIRST:
MOV AL, NUM
MOV AH, 0     
MOV BL, 2     

DIV BL       

CMP AH, 0         

JNE SECOND    

LEA SI, MSGDIV
MOV CX, 32
MOV AH, 0EH

GO: LODSB
    INT 10H
    LOOP GO

SECOND:
MOV AL, NUM
MOV AH, 0     
MOV BL, 3     

DIV BL        

CMP AH, 0     
JNE THIRD    

LEA SI, MSGDIV2
MOV CX, 32
MOV AH, 0EH

GO1: LODSB
    INT 10H
    LOOP GO1

THIRD:
MOV AL,NUM
MOV AH, 0    
MOV BL, 5     

DIV BL       

CMP AH, 0    

JNE LAST

LEA SI, MSGDIV3
MOV CX, 32
MOV AH, 0EH 

GO2: LODSB
    INT 10H
    LOOP GO2

LAST:
MOV AL, NUM
MOV AH, 0     
MOV BL, 10    

DIV BL       

CMP AH, 0     

JNE EXIT

LEA SI, MSGDIV4
MOV CX, 32
MOV AH, 0EH  

GO3: LODSB
    INT 10H
    LOOP GO3      

EXIT:
MOV AH, 4CH

INT 21H

JMP EXIT