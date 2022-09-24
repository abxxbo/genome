[org 0x7c00]
[bits 16]

xor ax, ax
mov ds, ax
mov es, ax

mov sp, 0x7c00
mov bp, sp


%macro enter 0
  mov ah, 0x0e
  mov al, `\r`
  int 0x10

  mov ah, 0x0e
  mov al, `\n`
  int 0x10
%endmacro

mov si, 0x00
loop:
  ;; Get input
  xor ah, ah
  int 0x16

  mov ah, 0x0e
  int 0x10

  ;; Check if enter
  cmp al, 13
  je scan_buf

  ;; If not enter, add to buffer
  mov byte [buffer+si], byte al
  inc si

  jmp loop


;; Do something...
scan_buf:
  enter
  jmp $


jmp $

buffer: times 128 db 0
ip: db 0

times 510-($-$$) db 0
dw 0xaa55
