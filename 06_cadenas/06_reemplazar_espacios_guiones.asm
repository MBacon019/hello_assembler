.386
.model flat, stdcall
option casemap:none

include \masm32\include\masm32rt.inc

.data
  buffer db 256 dup(0)
  mensaje db "Ingresa una frase: ", 0
  guion db '-', 0

.code
start:
  invoke StdOut, addr mensaje
  invoke StdIn, addr buffer, 256

  mov esi, offset buffer

reemplazar_espacios:
  mov al, [esi]
  cmp al, 0
  je reemplazo_a
  cmp al, ' '
  jne siguiente_espacio
  mov byte ptr [esi], '-'

siguiente_espacio:
  inc esi
  jmp reemplazar_espacios

reemplazo_a:
  mov esi, offset buffer

reemplazar_a:
  mov al, [esi]
  cmp al, 0
  je fin
  cmp al, 'a'
  jne siguiente_a
  mov byte ptr [esi], '*'

siguiente_a:
  inc esi
  jmp reemplazar_a

fin:
  invoke StdOut, addr buffer
  invoke ExitProcess, 0

end start
