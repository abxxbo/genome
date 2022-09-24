[org 0x7c00]
[bits 16]

xor ax, ax
mov ds, ax
mov es, ax

mov sp, 0x7c00
mov bp, sp

loop:
  ;; Get input
  xor ah, ah
  int 0x16

  mov ah, 0x0e
  int 0x10

  cmp al, 13
  je scan_buf

  jmp loop


;; Do something...
scan_buf:
  nop
  jmp scan_buf


jmp $

buffer: times 128 db 0
ip: db 0

times 510-($-$$) db 0
dw 0xaa55
