.data
L1: .word 1000000
.text
.global main
main:
  la x3, L1
  li x1, 0x10012004
  li x2, 0x10012008
  li x5, 0x1001200C
  addi x6, x0, 32
  sw x0, 0(x1)
  sw x6, 0(x2)
  load:
      lw x4, 0(x3)
  loop:
    beq x4,x0, turn
    li x6, 0x20
    sw x6, 0(x5)
    addi x4, x4, -1
    bne x4,x0,loop
  turn:
    lw x7, 0(x3)
  turn_off_led:
    li x6, 0x0
    sw x6, 0(x5)
    beq x7,x0, load
    addi x7, x7, -1
    bne x7,x0,turn_off_led
    beq x7, x0, turn_off_led

Lwhile1:j Lwhile1