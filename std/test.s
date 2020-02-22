string: .asciz "128"
.align
.global main

main:
  adr r1, string
  push {r1}
  bl  eva_atoi
  pop {r1}
  mov r1, #6
  mov r2, #2
  push {r1, r2}
  bl eva_div
end: b end