TITLE Lab xxx     (main.asm) 
 
INCLUDE Irvine32.inc 
 
.data 
tea    WORD 60
choco  WORD 70
coffee WORD 100
mocha  WORD 120
cents1 Word 10
cents2 Word 20
cents3 Word 50
total  WORD 0
pick   WORD ?
price  WORD ?

header1 BYTE "      UTM Vending Machine",0
header2 BYTE "################################",0
menu1   BYTE "1. Tea    - 60  cents",0
menu2   BYTE "2. Choco  - 70  cents",0
menu3   BYTE "3. Coffee - 100 cents",0
menu4   BYTE "4. Mocha  - 120 cents",0
req1    BYTE "Please Insert Money",0
money1  BYTE "10 cents : ",0
money2  BYTE "20 cents : ",0
money3  BYTE "50 cents : ",0
ttlmony BYTE "Total Money Inserted : ",0
order   BYTE "Please Choose A Drink : ",0
error   BYTE "Please Pick A Valid Option",0
addmon  BYTE "Not Enough Money. Please Insert More",0
comp    BYTE "Enjoy Your Drink! Thank You For Using Our Service",0
change  BYTE "Your Change Is : ",0
cent   BYTE " cents",0

.code 
main PROC 
 
    mov edx, OFFSET header2; Loads edx with the address of header 2
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    mov edx, OFFSET header1; Loads edx with the address of header 1
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    mov edx, OFFSET header2; Loads edx with the address of header 2
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf

    mov edx, OFFSET menu1; Loads edx with the address of menu1
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    mov edx, OFFSET menu2; Loads edx with the address of menu 2
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    mov edx, OFFSET menu3; Loads edx with the address of menu 3
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    mov edx, OFFSET menu4; Loads edx with the address of menu 4
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf

    mov edx, OFFSET header2; Loads edx with the address of header 2
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf

    mov edx, OFFSET req1; Loads edx with the address of req1
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf
    mov edx, OFFSET money1; Loads edx with the address of money1
    call WriteString; Writes a null-terminated string to standard output
    call ReadInt
    mov bx, cents1; Loads bx with the value stored at the address of cents1
    mul bx
    mov cents1, ax; Loads cents1 with the value stored at adress of ax
    mov edx, OFFSET money2; Loads edx with the address of money2
    call WriteString; Writes a null-terminated string to standard output
    call ReadInt
    mov bx, cents2; Loads bx with the value stored at the address of cents2
    mul bx
    mov cents2, ax; Loads cents2 with the value stored at the address of ax
    mov edx, OFFSET money3; Loads edx with the address of money3
    call WriteString; Writes a null-terminated string to standard output
    call ReadInt
    mov bx, cents3; Loads bx with the value stored at the address of cents3
    mul bx
    mov cents3, ax; Loads cents3 with the value stored at the address of ax

    mov ax, total; Loads ax with the value stored at the address of total
    add ax, cents1; Add the value stored at the address of cents1 with the value stored at the address of ax, the sum of number is stored in ax
    add ax, cents2; Add the value stored at the address of cents2 with the value stored at the address of ax, the sum of number is stored in ax
    add ax, cents3; Add the value stored at the address of cents3 with the value stored at the address of ax, the sum of number is stored in ax
    mov total, ax; Loads total with the value stored at the address of ax
    call crlf

    mov edx, OFFSET ttlmony; Loads edx with the address of ttlmony
    call WriteString; Writes a null-terminated string to standard output
    call WriteDec; Display decimal
    call crlf
    call crlf

    mov edx, OFFSET header2; Loads edx with the address of header2
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf
    
redo1:
    mov edx, OFFSET order; Loads edx with the address of order
    call WriteString; Writes a null-terminated string to standard output
    call ReadInt
    mov pick, ax; Loads pick with the value stored at the address of ax
    mov dx, pick; Loads dx with the value stored at the address of pick

    cmp dx,1; Compare the value stored in address dx with 1
    je drink1; If, it's equal then jump to drink1
    cmp dx,2; Compare the value stored in address dx with 2
    je drink2; If, it's equal then jump to drink2
    cmp dx,3; Compare the value stored in address dx with 3
    je drink3; If, it's equal then jump to drink3
    cmp dx,4; Compare the value stored in address dx with 4
    je drink4; If, it's equal then jump to drink4

    call crlf
    mov edx, OFFSET header2; Loads edx with the address of header2
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf
    mov edx, OFFSET error; Loads edx with the address of error
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf
    jmp redo1; Jump to redo1

drink1 :
    mov price, 60; Loads price with value 60
    jmp done; Jump to done

drink2 :
    mov price, 70; Loads price with value 70
    jmp done; Jump to done

drink3 :
    mov price, 100; Loads price with value 100
    jmp done; Jump to done

drink4 :
    mov price, 120; Loads price with value 120
    jmp done; Jump to done

done :
    mov dx, total; Loads dx with the value stored at the address of total
    cmp dx, price; Compare the value stored at address of dx and value stored at address of price
    jge pos; Jump to pos with the value greater or equal

    call crlf

    mov edx, OFFSET addmon; Loads edx with the address of addmon
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf

    jmp redomon; Jump to redomon

pos:
    mov ax, price; Loads ax with the value stored at the address of price
    sub total, ax; Subtract the value stored at the address of total with the value stored at the address of ax
    mov ax, total; Loads ax with the value stored at the address of total
    call crlf
    mov edx, OFFSET header2; Loads edx with the address of header2
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf
    mov edx, OFFSET change; Loads edx with the address of change
    call WriteString; Writes a null-terminated string to standard output
    call WriteDec
    mov edx, OFFSET cent; Loads edx with the address of cent
    call WriteString; Writes a null-terminated string to standard output
    call crlf 
    call crlf
    mov edx, OFFSET comp; Loads edx with the address of comp
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf
    mov edx, OFFSET header2; Loads edx with the address of header2
    call WriteString; Writes a null-terminated string to standard output

    jmp done2; Jump to done2

redomon:
    mov cents1, 10; Loads cents1 with the value 10
    mov cents2, 20; Loads cents2 with the value 20
    mov cents3, 50; Loads cents3 with the value 50

    mov edx, OFFSET req1; Loads edx with the address of req1
    call WriteString; Writes a null-terminated string to standard output
    call crlf
    call crlf
    mov edx, OFFSET money1; Loads edx with the address of money1
    call WriteString; Writes a null-terminated string to standard output
    call ReadInt
    mov bx, cents1; Loads bx with the value stored at the address of cents1
    mul bx
    mov cents1, ax; Loads cents1 with the value stored at the address of ax
    mov edx, OFFSET money2; Loads edx with the address of money2
    call WriteString; Writes a null-terminated string to standard output
    call ReadInt
    mov bx, cents2; Loads bx with the value stored at the address of cents2
    mul bx
    mov cents2, ax; Loads cents2 with the value stored at the address of ax
    mov edx, OFFSET money3; Loads edx with the address of money3
    call WriteString; Writes a null-terminated string to standard output
    call ReadInt
    mov bx, cents3; Loads bx with the value stored at the address of cents3
    mul bx
    mov cents3, ax; Loads cents3 with the value stored at the address of ax

    mov ax, total; Loads ax with the value stored at the address of total
    add ax, cents1; Add the value stored at the address of ax with the value stored at the address of cents1, the sum is stored in ax
    add ax, cents2; Add the value stored at the address of ax with the value stored at the address of cents2, the sum is stored in ax
    add ax, cents3; Add the value stored at the address of ax with the value stored at the address of cents3, the sum is stored in ax
    mov total, ax; Loads total with the value stored at the address of ax

    jmp done; Jump to done
    
done2:
 
    exit 
main ENDP 
 
END main