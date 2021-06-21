.p2align 2,,3
.syntax unified
.text

.global gf_polymul_1280x1280_mod3
.type gf_polymul_1280x1280_mod3, %function
@ void gf_polymul_1280x1280_mod3(uint32_t *h, uint32_t *c, uint32_t *f)
gf_polymul_1280x1280_mod3:
    push {r3-r12, lr}
    vmov s1, r0
    sub.w sp, sp, #7680
    mov.w r0, sp
    mov.w r12, #0x03030303
    add.w lr, r0, #256
gf_polymul_1280x1280_mod3_extend:
    ldr.w r4, [r1, #256] @ a1
    ldr.w r5, [r1, #512] @ a2
    ldr.w r6, [r1, #768] @ a3
    ldr.w r7, [r1, #1024] @ a4
    ldr.w r3, [r1], #4 @ a0
    add.w r8, r3, r4 
    usub8 r9, r8, r12
    sel r8, r9, r8 @ a0 + a1
    add.w r9, r3, r5
    usub8 r10, r9, r12
    sel r9, r10, r9 @ a0 + a2
    add.w r10, r3, r6
    usub8 r11, r10, r12
    sel r10, r11, r10 @ a0 + a3
    str.w r8, [r0]
    str.w r9, [r0, #512]
    str.w r10, [r0, #1024]
    add.w r8, r4, r5 
    usub8 r9, r8, r12
    sel r8, r9, r8 @ a1 + a2
    add.w r9, r3, r7
    usub8 r10, r9, r12
    sel r9, r10, r9 @ a0 + a4
    add.w r10, r4, r6
    usub8 r11, r10, r12
    sel r10, r11, r10 @ a1 + a3
    str.w r8, [r0, #1536]
    str.w r9, [r0, #2048]
    str.w r10, [r0, #2560]
    add.w r8, r4, r7 
    usub8 r9, r8, r12
    sel r8, r9, r8 @ a1 + a4
    add.w r9, r5, r6
    usub8 r10, r9, r12
    sel r9, r10, r9 @ a2 + a3
    add.w r10, r5, r7
    usub8 r11, r10, r12
    sel r10, r11, r10 @ a2 + a4
    add.w r3, r6, r7
    usub8 r4, r3, r12
    sel r3, r4, r3 @ a3 + a4
    add.w r0, r0, #3072
    str.w r8, [r0]
    str.w r9, [r0, #512]
    str.w r10, [r0, #1024]
    str.w r3, [r0, #1536]
@ f ok
    ldr.w r4, [r2, #256] @ b1
    ldr.w r5, [r2, #512] @ b2
    ldr.w r6, [r2, #768] @ b3
    ldr.w r7, [r2, #1024] @ b4
    ldr.w r3, [r2], #4 @ b0
    sub.w r0, r0, #3072
    add.w r8, r3, r4 
    usub8 r9, r8, r12
    sel r8, r9, r8 @ b0 + b1
    add.w r9, r3, r5
    usub8 r10, r9, r12
    sel r9, r10, r9 @ b0 + b2
    add.w r10, r3, r6
    usub8 r11, r10, r12
    sel r10, r11, r10 @ b0 + b3
    str.w r8, [r0, #256]
    str.w r9, [r0, #768]
    str.w r10, [r0, #1280]
    add.w r8, r4, r5 
    usub8 r9, r8, r12
    sel r8, r9, r8 @ b1 + b2
    add.w r9, r3, r7
    usub8 r10, r9, r12
    sel r9, r10, r9 @ b0 + b4
    add.w r10, r4, r6
    usub8 r11, r10, r12
    sel r10, r11, r10 @ b1 + b3
    str.w r8, [r0, #1792]
    str.w r9, [r0, #2304]
    str.w r10, [r0, #2816]
    add.w r8, r4, r7 
    usub8 r9, r8, r12
    sel r8, r9, r8 @ b1 + b4
    add.w r9, r5, r6
    usub8 r10, r9, r12
    sel r9, r10, r9 @ b2 + b3
    add.w r10, r5, r7
    usub8 r11, r10, r12
    sel r10, r11, r10 @ b2 + b4
    add.w r3, r6, r7
    usub8 r4, r3, r12
    sel r3, r4, r3 @ b3 + b4
    add.w r0, r0, #3072
    str.w r8, [r0, #256]
    str.w r9, [r0, #768]
    str.w r10, [r0, #1280]
    str.w r3, [r0, #1792]
@ g ok
    sub.w r0, r0, #3068
    cmp.w r0, lr
    bne.w gf_polymul_1280x1280_mod3_extend
    sub.w r0, r0, #256 @ stack #0
    sub.w r1, r1, #256 @ f #0
    sub.w r2, r2, #256 @ g #0
    mov.w r4, r0 @ stack
    mov.w r5, r1 @ f
    mov.w r6, r2 @ g
    add.w r0, r4, #7168
    add.w r1, r4, #4608
    add.w r2, r4, #4864
    bl.w gf_polymul_256x256_mod3 @ a3+a4 b3+b4
    add.w r0, r4, #6656
    add.w r1, r4, #4096
    add.w r2, r4, #4352
    bl.w gf_polymul_256x256_mod3 @ a2+a4 b2+b4
    add.w r0, r4, #6144
    add.w r1, r4, #3584
    add.w r2, r4, #3840
    bl.w gf_polymul_256x256_mod3 @ a2+a3 b2+b3
    add.w r0, r4, #5632
    add.w r1, r4, #3072
    add.w r2, r4, #3328
    bl.w gf_polymul_256x256_mod3 @ a1+a4 b1+b4
    add.w r0, r4, #5120
    add.w r1, r4, #2560
    add.w r2, r4, #2816
    bl.w gf_polymul_256x256_mod3 @ a1+a3 b1+b3
    add.w r0, r4, #4608
    add.w r1, r4, #2048
    add.w r2, r4, #2304
    bl.w gf_polymul_256x256_mod3 @ a0+a4 b0+b4
    add.w r0, r4, #4096
    add.w r1, r5, #1024
    add.w r2, r6, #1024
    bl.w gf_polymul_256x256_mod3 @ a4b4
    add.w r0, r4, #3584
    add.w r1, r4, #1536
    add.w r2, r4, #1792
    bl.w gf_polymul_256x256_mod3 @ a1+a2 b1+b2
    add.w r0, r4, #3072
    add.w r1, r4, #1024
    add.w r2, r4, #1280
    bl.w gf_polymul_256x256_mod3 @ a0+a3 b0+b3
    add.w r0, r4, #2560
    add.w r1, r5, #768
    add.w r2, r6, #768
    bl.w gf_polymul_256x256_mod3 @ a3b3
    add.w r0, r4, #2048
    add.w r1, r4, #512
    add.w r2, r4, #768
    bl.w gf_polymul_256x256_mod3 @ a0+a2 b0+b2
    add.w r0, r4, #1536
    add.w r1, r5, #512
    add.w r2, r6, #512
    bl.w gf_polymul_256x256_mod3 @ a2b2
    add.w r0, r4, #1024
    mov.w r1, r4
    add.w r2, r4, #256
    bl.w gf_polymul_256x256_mod3 @ a0+a1 b0+b1
    add.w r0, r4, #512
    add.w r1, r5, #256
    add.w r2, r6, #256
    bl.w gf_polymul_256x256_mod3 @ a1b1
    mov.w r0, r4
    mov.w r1, r5
    mov.w r2, r6
    bl.w gf_polymul_256x256_mod3 @ a0b0
    mov.w r1, r4 @ stack
    vmov r0, s1 @ h
    mov.w r12, 0x03030303
    add.w lr, r0, #256
gf_polymul_1280x1280_mod3_output:
    ldr.w r2, [r1] @ a0b0 bot
    ldr.w r3, [r1, #256] @ a0b0 top
    ldr.w r4, [r1, #512] @ a1b1 bot
    ldr.w r5, [r1, #768] @ a1b1 top
    ldr.w r6, [r1, #1024] @ a0+a1 b0+b1 bot
    ldr.w r7, [r1, #1280] @ a0+a1 b0+b1 top
    str.w r2, [r0]
    usub8 r8, r12, r2
    usub8 r9, r12, r3
    usub8 r10, r12, r4
    usub8 r11, r12, r5
    vmov s2, r8 @ -a0b0 bot
    vmov s3, r9 @ -a0b0 top
    vmov s4, r10 @ -a1b1 bot
    vmov s5, r11 @ -a1b1 top
    add.w r6, r6, r8
    add.w r6, r6, r10 @ a0b1 + a1b0 bot, 2~8
    add.w r7, r7, r9
    add.w r7, r7, r11 @ a0b1 + a1b0 top, 2~8
    add.w r6, r6, r3
    bic r2, r6, r12
    and r6, r6, r12
    add.w r6, r6, r2, lsr #2
    usub8 r2, r6, r12
    sel r6, r2, r6 @ str 256
    add.w r10, r10, r8
    add.w r11, r11, r9
    vmov s8, r10 @ -(a0b0 + a1b1) bot
    vmov s9, r11 @ -(a0b0 + a1b1) top
    str.w r6, [r0, #256]
    ldr.w r2, [r1, #1536] @ a2b2 bot
    ldr.w r6, [r1, #2048] @ a0+a2 b0+b2 bot
    add.w r6, r6, r4
    add.w r6, r6, r8
    add.w r6, r6, r12
    usub8 r6, r6, r2 @ a0b2 + a1b1 + a2b0 bot
    add.w r6, r6, r7
    bic r7, r6, r12
    and r6, r6, r12
    add.w r6, r6, r7, lsr #2
    bic r7, r6, r12
    and r6, r6, r12
    add.w r6, r6, r7, lsr #2
    usub8 r7, r6, r12
    sel r6, r7, r6 @ str 512
    vmov s6, r2 @ a2b2 bot
    str.w r6, [r0, #512]
    ldr.w r2, [r1, #1792] @ a2b2 top
    ldr.w r3, [r1, #2304] @ a0+a2 b0+b2 top
    vmov s7, r2 @ a2b2 top
    add.w r3, r3, r5
    add.w r3, r3, r9
    add.w r3, r3, r12
    usub8 r3, r3, r2
    bic r4, r3, r12
    and r3, r3, r12
    add.w r3, r3, r4, lsr #2
    usub8 r4, r3, r12
    sel r3, r4, r3 @ a0b2 + a1b1 + a2b0 top
    ldr.w r4, [r1, #2560] @ a3b3 bot
    ldr.w r5, [r1, #3072] @ a0+a3 b0+b3 bot
    ldr.w r6, [r1, #3584] @ a1+a2 b1+b2 bot
    vmov r7, s8
    vmov r8, s6
    add.w r5, r5, r6 @ 0~4
    add.w r5, r5, r7 @ 2~10
    add.w r5, r5, r12
    usub8 r5, r5, r8
    usub8 r4, r12, r4 @ -a3b3 bot
    add.w r5, r5, r4 @ a0b3 + a1b2 + a2b1 + a3b0 bot
    add.w r5, r5, r3
    bic r6, r5, r12
    and r5, r5, r12
    add.w r5, r5, r6, lsr #2
    bic r6, r5, r12
    and r5, r5, r12
    add.w r5, r5, r6, lsr #2
    usub8 r6, r5, r12
    sel r5, r6, r5 @ str 768
    vmov s10, r4 @ -a3b3 bot
    str.w r5, [r0, #768]
    ldr.w r2, [r1, #2816] @ a3b3 top
    ldr.w r3, [r1, #3328] @ a0+a3 b0+b3 top
    ldr.w r4, [r1, #3840] @ a1+a2 b1+b2 top
    vmov r5, s9
    vmov r6, s7
    add.w r3, r3, r4
    add.w r3, r3, r5
    add.w r3, r3, r12
    usub8 r3, r3, r6
    usub8 r2, r12, r2 @ -a3b3 top
    add.w r3, r3, r2 @ a0b3 + a1b2 + a2b1 + a3b0 top
    add.w r1, r1, #4096
    vmov s11, r2 @ -a3b3 top
    ldr.w r4, [r1] @ a4b4 bot
    ldr.w r5, [r1, #512] @ a0+a4 bo+b4 bot
    ldr.w r6, [r1, #1024] @ a1+a3 b1+b3 bot
    vmov r7, s6 @ a2b2 bot
    vmov r8, s8 @ -(a0b0 + a1b1) bot
    vmov r9, s10 @ -a3b3 bot
    add.w r5, r5, r6
    add.w r5, r5, r7
    add.w r5, r5, r8
    add.w r5, r5, r9
    usub8 r4, r12, r4 @ -a4b4 bot
    add.w r5, r5, r4
    add.w r5, r5, r3
    bic r6, r5, r12
    and r5, r5, r12
    add.w r5, r5, r6, lsr #2
    bic r6, r5, r12
    and r5, r5, r12
    add.w r5, r5, r6, lsr #2
    usub8 r6, r5, r12
    sel r5, r6, r5 @ str 1024
    vmov s12, r4 @ -a4b4 bot
    str.w r5, [r0, #1024]
    ldr.w r2, [r1, #256] @ a4b4 top
    ldr.w r3, [r1, #768] @ a0+a4 bo+b4 top
    ldr.w r4, [r1, #1280] @ a1+a3 b1+b3 top
    str.w r2, [r0, #2304]
    vmov r5, s7 
    vmov r6, s9
    vmov r7, s11
    add.w r3, r3, r4
    add.w r3, r3, r5
    add.w r3, r3, r6
    add.w r3, r3, r7
    usub8 r2, r12, r2 @ -a4b4 top
    add.w r3, r3, r2 @ a0b4 + ... + a4b0 top
    vmov s13, r2 @ -a4b4 top
    ldr.w r4, [r1, #1536] @ a1+a4 b1+b4 bot
    ldr.w r5, [r1, #2048] @ a2+a3 b2+b3 bot
    vmov r6, s4 @ -a1b1 bot
    vmov r7, s6 @ a2b2 bot
    vmov r8, s10 @ -a3b3 bot
    vmov r9, s12 @ -a4b4 bot
    add.w r4, r4, r5
    add.w r4, r4, r6
    add.w r4, r4, r12
    usub8 r4, r4, r7
    add.w r4, r4, r8 @ a1b4 + a2b3 + a3b2 + a4b1
    add.w r4, r4, r9
    add.w r4, r4, r3
    bic r5, r4, r12
    and r4, r4, r12
    add.w r4, r4, r5, lsr #2
    bic r5, r4, r12
    and r4, r4, r12
    add.w r4, r4, r5, lsr #2
    usub8 r5, r4, r12
    sel r4, r5, r4 @ str 1280
    str.w r4, [r0, #1280]
    ldr.w r4, [r1, #1792] @ a1+a4 b1+b4 top
    ldr.w r5, [r1, #2304] @ a2+a3 b2+b3 top
    vmov r6, s5 @ -a1b1 top
    vmov r7, s7 @ a2b2 top
    vmov r8, s11 @ -a3b3 top
    vmov r9, s13 @ -a4b4 top
    add.w r4, r4, r5
    add.w r4, r4, r6
    add.w r4, r4, r12
    usub8 r4, r4, r7
    add.w r4, r4, r8
    add.w r4, r4, r9 @ a1b4 + a2b3 + a3b2 + a4b1 top
    ldr.w r5, [r1, #2560] @ a2+a4 b2+b4 bot
    vmov r6, s10 @ -a3b3 bot
    vmov r7, s6 @ a2b2 bot
    vmov r8, s12 @ -a4b4 bot
    add.w r5, r5, r12
    usub8 r5, r5, r6
    add.w r5, r5, r12
    usub8 r5, r5, r7
    add.w r5, r5, r8
    add.w r5, r5, r4
    bic r6, r5, r12
    and r5, r5, r12
    add.w r5, r5, r6, lsr #2
    bic r6, r5, r12
    and r5, r5, r12
    add.w r5, r5, r6, lsr #2
    usub8 r6, r5, r12
    sel r5, r6, r5 @ str 1536
    str.w r5, [r0, #1536]
    ldr.w r5, [r1, #2816] @ a2+a4 b2+b4 top
    vmov r6, s11 @ -a3b3 top
    vmov r7, s7 @ a2b2 top
    vmov r8, s13 @ -a4b4 top
    add.w r5, r5, r12
    usub8 r5, r5, r6
    add.w r5, r5, r12
    usub8 r5, r5, r7
    add.w r5, r5, r8 @ a2b4 + a3b3 + a4b2 top
    ldr.w r6, [r1, #3072] @ a3+a4 b3+b4 bot
    vmov r7, s10
    vmov r8, s12
    add.w r6, r6, r7
    add.w r6, r6, r8
    add.w r6, r6, r5
    bic r7, r6, r12
    and r6, r6, r12
    add.w r6, r6, r7, lsr #2
    bic r7, r6, r12
    and r6, r6, r12
    add.w r6, r6, r7, lsr #2
    usub8 r7, r6, r12
    sel r6, r7, r6 @ str 1792
    str.w r6, [r0, #1792]
    ldr.w r6, [r1, #3328] @ a3+a4 b3+b4 top
    vmov r7, s11 @ -a3b3 top
    vmov r8, s13 @ -a4b4 top
    vmov r9, s12 @ -a4b4 bot
    add.w r6, r6, r7
    add.w r6, r6, r8
    add.w r6, r6, r12
    usub8 r6, r6, r9
    bic r7, r6, r12
    and r6, r6, r12
    add.w r6, r6, r7, lsr #2
    usub8 r7, r6, r12
    sel r6, r7, r6
    str.w r6, [r0, #2048]
    sub.w r1, r1, #4092
    add.w r0, r0, #4
    cmp.w r0, lr
    bne.w gf_polymul_1280x1280_mod3_output
    add.w sp, sp, #7680
    pop {r3-r12, pc}