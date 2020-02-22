@ ================================
@ Minimal Standard Lib for Eva
@ Author : Arthur Correnson
@ ================================

.text
.global eva_div
.global eva_atoi
.global eva_itoa


@ Integer division
@ params :
@   1 : integer a
@   2 : integer b
@ returns :
@   1 : a // b
@   2 : a % b
eva_div:
  pop {r2, r1}
  @ r1 / r2
  mov r3, r1      @ remainder
  mov r4, #0      @ quotient
eva_div_loop:
  cmp r3, r2
  blt eva_div_end
  sub r3, r3, r2
  add r4, r4, #1
  b eva_div_loop
eva_div_end:
  push {r3, r4}
  mov pc, r14


@ Ascii to Integer conversion
@ params :
@   1 : string (\0 terminated) adress
@ returns :
@   1 : integer
eva_atoi:
  pop {r1}        @ r1 is string address
  mov r2, #0      @ int
  mov r3, #10     @ factor
eva_atoi_loop:
  ldrb r4, [r1]
  add r1, #1
  cmp r4, #0
  beq eva_atoi_end
  sub r4, r4, #('0')
  mul r2, r2, r3
  add r2, r2, r4
  b eva_atoi_loop
eva_atoi_end:
  push {r2}
  mov pc, r14


@ Integer to ascii conversion
@ warning :
@   Not Yet Implemented !
eva_itoa:
