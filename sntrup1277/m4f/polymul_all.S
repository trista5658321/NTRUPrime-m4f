@ .p2align 2,,3
@ .syntax unified
@ .text
@ .global gf_polymul_16x16_mod3
@ .type gf_polymul_16x16_mod3, %function
@ gf_polymul_16x16_mod3:
@ 	push.w {r3-r12, lr}
@ 	vmov s0, r0
@ 	sub.w sp, sp, #48
@ 	mov.w r0, sp
@ 	mov.w r12, #0x03030303
@ 	add.w lr, r0, #8
@ gf_polymul_16x16_mod3_extend:
@ 	ldr.w r4, [r1, #4]
@ 	ldr.w r5, [r1, #8]
@ 	ldr.w r6, [r1, #12]
@ 	ldr.w r3, [r1], #8
@ 	ldr.w r8, [r2, #4]
@ 	ldr.w r9, [r2, #8]
@ 	ldr.w r10, [r2, #12]
@ 	ldr.w r7, [r2], #8
@ 	add.w r3, r3, r5
@ 	add.w r4, r4, r6
@ 	add.w r7, r7, r9
@ 	add.w r8, r8, r10
@ 	usub8 r11, r3, r12
@ 	sel r3, r11, r3
@ 	usub8 r11, r4, r12
@ 	sel r4, r11, r4
@ 	usub8 r11, r7, r12
@ 	sel r7, r11, r7
@ 	usub8 r11, r8, r12
@ 	sel r8, r11, r8
@ 	str.w r4, [r0, #4]
@ 	str.w r7, [r0, #8]
@ 	str.w r8, [r0, #12]
@ 	str.w r3, [r0], #8
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_16x16_mod3_extend
@ 	sub.w r4, r0, #8
@ 	sub.w r5, r1, #8
@ 	sub.w r6, r2, #8
@ 	add.w r0, r4, #16
@ 	bl.w gf_polymul_8x8_mod3 @ a1b1
@ 	add.w r0, r4, #32
@ 	mov.w r1, r4
@ 	add.w r2, r4, #8
@ 	bl.w gf_polymul_8x8_mod3 @ a0+a1 * b0+b1
@ 	mov.w r0, r4
@ 	mov.w r1, r5
@ 	mov.w r2, r6
@ 	bl.w gf_polymul_8x8_mod3 @ a0b0
@ 	vmov r0, s0
@ 	mov.w r1, r4
@ 	add.w lr, r0, #8
@ 	mov.w r12, #0x03030303
@ gf_polymul_16x16_mod3_output:
@ 	ldr.w r3, [r1, #8] @ a0b0 top
@ 	ldr.w r4, [r1, #16] @ a1b1 bot
@ 	ldr.w r5, [r1, #24] @ a1b1 top
@ 	ldr.w r6, [r1, #32] @ a0+a1 * b0+b1 bot
@ 	ldr.w r7, [r1, #40] @ a0+a1 * b0+b1 top
@ 	ldr.w r2, [r1], #4 @ a0b0 bot
@ 	str.w r5, [r0, #24]
@ 	usub8 r8, r12, r4
@ 	add.w r8, r3, r8
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	usub8 r9, r12, r2
@ 	add.w r9, r8, r9
@ 	usub8 r10, r9, r12
@ 	sel r9, r10, r9
@ 	add.w r9, r9, r6
@ 	usub8 r10, r9, r12
@ 	sel r6, r10, r9
@ 	usub8 r8, r12, r8
@ 	usub8 r9, r12, r5
@ 	add.w r8, r8, r9
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	add.w r8, r8, r7
@ 	usub8 r9, r8, r12
@ 	sel r7, r9, r8
@ 	str.w r7, [r0, #16]
@ 	str.w r6, [r0, #8]
@ 	str.w r2, [r0], #4
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_16x16_mod3_output
@ 	add.w sp, sp, #48
@ 	pop.w {r3-r12, pc}

@ .p2align 2,,3
@ .syntax unified
@ .text
@ .global gf_polymul_32x32_mod3
@ .type gf_polymul_32x32_mod3, %function
@ gf_polymul_32x32_mod3:
@ 	push.w {r3-r12, lr}
@ 	vmov s1, r0
@ 	sub.w sp, sp, #96
@ 	mov.w r0, sp
@ 	mov.w r12, #0x03030303
@ 	add.w lr, r0, #16
@ gf_polymul_32x32_mod3_extend:
@ 	ldr.w r4, [r1, #4]
@ 	ldr.w r5, [r1, #16]
@ 	ldr.w r6, [r1, #20]
@ 	ldr.w r3, [r1], #8
@ 	ldr.w r8, [r2, #4]
@ 	ldr.w r9, [r2, #16]
@ 	ldr.w r10, [r2, #20]
@ 	ldr.w r7, [r2], #8
@ 	add.w r3, r3, r5
@ 	add.w r4, r4, r6
@ 	add.w r7, r7, r9
@ 	add.w r8, r8, r10
@ 	usub8 r11, r3, r12
@ 	sel r3, r11, r3
@ 	usub8 r11, r4, r12
@ 	sel r4, r11, r4
@ 	usub8 r11, r7, r12
@ 	sel r7, r11, r7
@ 	usub8 r11, r8, r12
@ 	sel r8, r11, r8
@ 	str.w r4, [r0, #4]
@ 	str.w r7, [r0, #16]
@ 	str.w r8, [r0, #20]
@ 	str.w r3, [r0], #8
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_32x32_mod3_extend
@ 	sub.w r4, r0, #16
@ 	sub.w r5, r1, #16
@ 	sub.w r6, r2, #16
@ 	add.w r0, r4, #32
@ 	bl.w gf_polymul_16x16_mod3 @ a1b1
@ 	add.w r0, r4, #64
@ 	mov.w r1, r4
@ 	add.w r2, r4, #16
@ 	bl.w gf_polymul_16x16_mod3 @ a0+a1 * b0+b1
@ 	mov.w r0, r4
@ 	mov.w r1, r5
@ 	mov.w r2, r6
@ 	bl.w gf_polymul_16x16_mod3 @ a0b0
@ 	vmov r0, s1
@ 	mov.w r1, r4
@ 	add.w lr, r0, #16
@ 	mov.w r12, #0x03030303
@ gf_polymul_32x32_mod3_output:
@ 	ldr.w r3, [r1, #16] @ a0b0 top
@ 	ldr.w r4, [r1, #32] @ a1b1 bot
@ 	ldr.w r5, [r1, #48] @ a1b1 top
@ 	ldr.w r6, [r1, #64] @ a0+a1 * b0+b1 bot
@ 	ldr.w r7, [r1, #80] @ a0+a1 * b0+b1 top
@ 	ldr.w r2, [r1], #4 @ a0b0 bot
@ 	str.w r5, [r0, #48]
@ 	usub8 r8, r12, r4
@ 	add.w r8, r3, r8
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	usub8 r9, r12, r2
@ 	add.w r9, r8, r9
@ 	usub8 r10, r9, r12
@ 	sel r9, r10, r9
@ 	add.w r9, r9, r6
@ 	usub8 r10, r9, r12
@ 	sel r6, r10, r9
@ 	usub8 r8, r12, r8
@ 	usub8 r9, r12, r5
@ 	add.w r8, r8, r9
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	add.w r8, r8, r7
@ 	usub8 r9, r8, r12
@ 	sel r7, r9, r8
@ 	str.w r7, [r0, #32]
@ 	str.w r6, [r0, #16]
@ 	str.w r2, [r0], #4
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_32x32_mod3_output
@ 	add.w sp, sp, #96
@ 	pop.w {r3-r12, pc}

@ .p2align 2,,3
@ .syntax unified
@ .text
@ .global gf_polymul_64x64_mod3
@ .type gf_polymul_64x64_mod3, %function
@ gf_polymul_64x64_mod3:
@ 	push.w {r3-r12, lr}
@ 	vmov s2, r0
@ 	sub.w sp, sp, #192
@ 	mov.w r0, sp
@ 	mov.w r12, #0x03030303
@ 	add.w lr, r0, #32
@ gf_polymul_64x64_mod3_extend:
@ 	ldr.w r4, [r1, #4]
@ 	ldr.w r5, [r1, #32]
@ 	ldr.w r6, [r1, #36]
@ 	ldr.w r3, [r1], #8
@ 	ldr.w r8, [r2, #4]
@ 	ldr.w r9, [r2, #32]
@ 	ldr.w r10, [r2, #36]
@ 	ldr.w r7, [r2], #8
@ 	add.w r3, r3, r5
@ 	add.w r4, r4, r6
@ 	add.w r7, r7, r9
@ 	add.w r8, r8, r10
@ 	usub8 r11, r3, r12
@ 	sel r3, r11, r3
@ 	usub8 r11, r4, r12
@ 	sel r4, r11, r4
@ 	usub8 r11, r7, r12
@ 	sel r7, r11, r7
@ 	usub8 r11, r8, r12
@ 	sel r8, r11, r8
@ 	str.w r4, [r0, #4]
@ 	str.w r7, [r0, #32]
@ 	str.w r8, [r0, #36]
@ 	str.w r3, [r0], #8
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_64x64_mod3_extend
@ 	sub.w r4, r0, #32
@ 	sub.w r5, r1, #32
@ 	sub.w r6, r2, #32
@ 	add.w r0, r4, #64
@ 	bl.w gf_polymul_32x32_mod3 @ a1b1
@ 	add.w r0, r4, #128
@ 	mov.w r1, r4
@ 	add.w r2, r4, #32
@ 	bl.w gf_polymul_32x32_mod3 @ a0+a1 * b0+b1
@ 	mov.w r0, r4
@ 	mov.w r1, r5
@ 	mov.w r2, r6
@ 	bl.w gf_polymul_32x32_mod3 @ a0b0
@ 	vmov r0, s2
@ 	mov.w r1, r4
@ 	add.w lr, r0, #32
@ 	mov.w r12, #0x03030303
@ gf_polymul_64x64_mod3_output:
@ 	ldr.w r3, [r1, #32] @ a0b0 top
@ 	ldr.w r4, [r1, #64] @ a1b1 bot
@ 	ldr.w r5, [r1, #96] @ a1b1 top
@ 	ldr.w r6, [r1, #128] @ a0+a1 * b0+b1 bot
@ 	ldr.w r7, [r1, #160] @ a0+a1 * b0+b1 top
@ 	ldr.w r2, [r1], #4 @ a0b0 bot
@ 	str.w r5, [r0, #96]
@ 	usub8 r8, r12, r4
@ 	add.w r8, r3, r8
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	usub8 r9, r12, r2
@ 	add.w r9, r8, r9
@ 	usub8 r10, r9, r12
@ 	sel r9, r10, r9
@ 	add.w r9, r9, r6
@ 	usub8 r10, r9, r12
@ 	sel r6, r10, r9
@ 	usub8 r8, r12, r8
@ 	usub8 r9, r12, r5
@ 	add.w r8, r8, r9
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	add.w r8, r8, r7
@ 	usub8 r9, r8, r12
@ 	sel r7, r9, r8
@ 	str.w r7, [r0, #64]
@ 	str.w r6, [r0, #32]
@ 	str.w r2, [r0], #4
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_64x64_mod3_output
@ 	add.w sp, sp, #192
@ 	pop.w {r3-r12, pc}

@ .p2align 2,,3
@ .syntax unified
@ .text
@ .global gf_polymul_128x128_mod3
@ .type gf_polymul_128x128_mod3, %function
@ gf_polymul_128x128_mod3:
@ 	push.w {r3-r12, lr}
@ 	vmov s3, r0
@ 	sub.w sp, sp, #384
@ 	mov.w r0, sp
@ 	mov.w r12, #0x03030303
@ 	add.w lr, r0, #64
@ gf_polymul_128x128_mod3_extend:
@ 	ldr.w r4, [r1, #4]
@ 	ldr.w r5, [r1, #64]
@ 	ldr.w r6, [r1, #68]
@ 	ldr.w r3, [r1], #8
@ 	ldr.w r8, [r2, #4]
@ 	ldr.w r9, [r2, #64]
@ 	ldr.w r10, [r2, #68]
@ 	ldr.w r7, [r2], #8
@ 	add.w r3, r3, r5
@ 	add.w r4, r4, r6
@ 	add.w r7, r7, r9
@ 	add.w r8, r8, r10
@ 	usub8 r11, r3, r12
@ 	sel r3, r11, r3
@ 	usub8 r11, r4, r12
@ 	sel r4, r11, r4
@ 	usub8 r11, r7, r12
@ 	sel r7, r11, r7
@ 	usub8 r11, r8, r12
@ 	sel r8, r11, r8
@ 	str.w r4, [r0, #4]
@ 	str.w r7, [r0, #64]
@ 	str.w r8, [r0, #68]
@ 	str.w r3, [r0], #8
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_128x128_mod3_extend
@ 	sub.w r4, r0, #64
@ 	sub.w r5, r1, #64
@ 	sub.w r6, r2, #64
@ 	add.w r0, r4, #128
@ 	bl.w gf_polymul_64x64_mod3 @ a1b1
@ 	add.w r0, r4, #256
@ 	mov.w r1, r4
@ 	add.w r2, r4, #64
@ 	bl.w gf_polymul_64x64_mod3 @ a0+a1 * b0+b1
@ 	mov.w r0, r4
@ 	mov.w r1, r5
@ 	mov.w r2, r6
@ 	bl.w gf_polymul_64x64_mod3 @ a0b0
@ 	vmov r0, s3
@ 	mov.w r1, r4
@ 	add.w lr, r0, #64
@ 	mov.w r12, #0x03030303
@ gf_polymul_128x128_mod3_output:
@ 	ldr.w r3, [r1, #64] @ a0b0 top
@ 	ldr.w r4, [r1, #128] @ a1b1 bot
@ 	ldr.w r5, [r1, #192] @ a1b1 top
@ 	ldr.w r6, [r1, #256] @ a0+a1 * b0+b1 bot
@ 	ldr.w r7, [r1, #320] @ a0+a1 * b0+b1 top
@ 	ldr.w r2, [r1], #4 @ a0b0 bot
@ 	str.w r5, [r0, #192]
@ 	usub8 r8, r12, r4
@ 	add.w r8, r3, r8
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	usub8 r9, r12, r2
@ 	add.w r9, r8, r9
@ 	usub8 r10, r9, r12
@ 	sel r9, r10, r9
@ 	add.w r9, r9, r6
@ 	usub8 r10, r9, r12
@ 	sel r6, r10, r9
@ 	usub8 r8, r12, r8
@ 	usub8 r9, r12, r5
@ 	add.w r8, r8, r9
@ 	usub8 r9, r8, r12
@ 	sel r8, r9, r8
@ 	add.w r8, r8, r7
@ 	usub8 r9, r8, r12
@ 	sel r7, r9, r8
@ 	str.w r7, [r0, #128]
@ 	str.w r6, [r0, #64]
@ 	str.w r2, [r0], #4
@ 	cmp.w r0, lr
@ 	bne.w gf_polymul_128x128_mod3_output
@ 	add.w sp, sp, #384
@ 	pop.w {r3-r12, pc}

.p2align 2,,3
.syntax unified
.text
.global gf_polymul_256x256_mod3
.type gf_polymul_256x256_mod3, %function
gf_polymul_256x256_mod3:
	push.w {r3-r12, lr}
	vmov s4, r0
	sub.w sp, sp, #768
	mov.w r0, sp
	mov.w r12, #0x03030303
	add.w lr, r0, #128
gf_polymul_256x256_mod3_extend:
	ldr.w r4, [r1, #4]
	ldr.w r5, [r1, #128]
	ldr.w r6, [r1, #132]
	ldr.w r3, [r1], #8
	ldr.w r8, [r2, #4]
	ldr.w r9, [r2, #128]
	ldr.w r10, [r2, #132]
	ldr.w r7, [r2], #8
	add.w r3, r3, r5
	add.w r4, r4, r6
	add.w r7, r7, r9
	add.w r8, r8, r10
	usub8 r11, r3, r12
	sel r3, r11, r3
	usub8 r11, r4, r12
	sel r4, r11, r4
	usub8 r11, r7, r12
	sel r7, r11, r7
	usub8 r11, r8, r12
	sel r8, r11, r8
	str.w r4, [r0, #4]
	str.w r7, [r0, #128]
	str.w r8, [r0, #132]
	str.w r3, [r0], #8
	cmp.w r0, lr
	bne.w gf_polymul_256x256_mod3_extend
	sub.w r4, r0, #128
	sub.w r5, r1, #128
	sub.w r6, r2, #128
	add.w r0, r4, #256
	bl.w gf_polymul_128x128_mod3 @ a1b1
	add.w r0, r4, #512
	mov.w r1, r4
	add.w r2, r4, #128
	bl.w gf_polymul_128x128_mod3 @ a0+a1 * b0+b1
	mov.w r0, r4
	mov.w r1, r5
	mov.w r2, r6
	bl.w gf_polymul_128x128_mod3 @ a0b0
	vmov r0, s4
	mov.w r1, r4
	add.w lr, r0, #128
	mov.w r12, #0x03030303
gf_polymul_256x256_mod3_output:
	ldr.w r3, [r1, #128] @ a0b0 top
	ldr.w r4, [r1, #256] @ a1b1 bot
	ldr.w r5, [r1, #384] @ a1b1 top
	ldr.w r6, [r1, #512] @ a0+a1 * b0+b1 bot
	ldr.w r7, [r1, #640] @ a0+a1 * b0+b1 top
	ldr.w r2, [r1], #4 @ a0b0 bot
	str.w r5, [r0, #384]
	usub8 r8, r12, r4
	add.w r8, r3, r8
	usub8 r9, r8, r12
	sel r8, r9, r8
	usub8 r9, r12, r2
	add.w r9, r8, r9
	usub8 r10, r9, r12
	sel r9, r10, r9
	add.w r9, r9, r6
	usub8 r10, r9, r12
	sel r6, r10, r9
	usub8 r8, r12, r8
	usub8 r9, r12, r5
	add.w r8, r8, r9
	usub8 r9, r8, r12
	sel r8, r9, r8
	add.w r8, r8, r7
	usub8 r9, r8, r12
	sel r7, r9, r8
	str.w r7, [r0, #256]
	str.w r6, [r0, #128]
	str.w r2, [r0], #4
	cmp.w r0, lr
	bne.w gf_polymul_256x256_mod3_output
	add.w sp, sp, #768
	pop.w {r3-r12, pc}

.p2align 2,,3
.syntax unified
.text
.global gf_polymul_512x512_mod3
.type gf_polymul_512x512_mod3, %function
gf_polymul_512x512_mod3:
	push.w {r3-r12, lr}
	vmov s5, r0
	sub.w sp, sp, #1536
	mov.w r0, sp
	mov.w r12, #0x03030303
	add.w lr, r0, #256
gf_polymul_512x512_mod3_extend:
	ldr.w r4, [r1, #4]
	ldr.w r5, [r1, #256]
	ldr.w r6, [r1, #260]
	ldr.w r3, [r1], #8
	ldr.w r8, [r2, #4]
	ldr.w r9, [r2, #256]
	ldr.w r10, [r2, #260]
	ldr.w r7, [r2], #8
	add.w r3, r3, r5
	add.w r4, r4, r6
	add.w r7, r7, r9
	add.w r8, r8, r10
	usub8 r11, r3, r12
	sel r3, r11, r3
	usub8 r11, r4, r12
	sel r4, r11, r4
	usub8 r11, r7, r12
	sel r7, r11, r7
	usub8 r11, r8, r12
	sel r8, r11, r8
	str.w r4, [r0, #4]
	str.w r7, [r0, #256]
	str.w r8, [r0, #260]
	str.w r3, [r0], #8
	cmp.w r0, lr
	bne.w gf_polymul_512x512_mod3_extend
	sub.w r4, r0, #256
	sub.w r5, r1, #256
	sub.w r6, r2, #256
	add.w r0, r4, #512
	bl.w gf_polymul_256x256_mod3 @ a1b1
	add.w r0, r4, #1024
	mov.w r1, r4
	add.w r2, r4, #256
	bl.w gf_polymul_256x256_mod3 @ a0+a1 * b0+b1
	mov.w r0, r4
	mov.w r1, r5
	mov.w r2, r6
	bl.w gf_polymul_256x256_mod3 @ a0b0
	vmov r0, s5
	mov.w r1, r4
	add.w lr, r0, #256
	mov.w r12, #0x03030303
gf_polymul_512x512_mod3_output:
	ldr.w r3, [r1, #256] @ a0b0 top
	ldr.w r4, [r1, #512] @ a1b1 bot
	ldr.w r5, [r1, #768] @ a1b1 top
	ldr.w r6, [r1, #1024] @ a0+a1 * b0+b1 bot
	ldr.w r7, [r1, #1280] @ a0+a1 * b0+b1 top
	ldr.w r2, [r1], #4 @ a0b0 bot
	str.w r5, [r0, #768]
	usub8 r8, r12, r4
	add.w r8, r3, r8
	usub8 r9, r8, r12
	sel r8, r9, r8
	usub8 r9, r12, r2
	add.w r9, r8, r9
	usub8 r10, r9, r12
	sel r9, r10, r9
	add.w r9, r9, r6
	usub8 r10, r9, r12
	sel r6, r10, r9
	usub8 r8, r12, r8
	usub8 r9, r12, r5
	add.w r8, r8, r9
	usub8 r9, r8, r12
	sel r8, r9, r8
	add.w r8, r8, r7
	usub8 r9, r8, r12
	sel r7, r9, r8
	str.w r7, [r0, #512]
	str.w r6, [r0, #256]
	str.w r2, [r0], #4
	cmp.w r0, lr
	bne.w gf_polymul_512x512_mod3_output
	add.w sp, sp, #1536
	pop.w {r3-r12, pc}

.p2align 2,,3
.syntax unified
.text
.global gf_polymul_1024x1024_mod3
.type gf_polymul_1024x1024_mod3, %function
gf_polymul_1024x1024_mod3:
	push.w {r3-r12, lr}
	vmov s6, r0
	sub.w sp, sp, #3072
	mov.w r0, sp
	mov.w r12, #0x03030303
	add.w lr, r0, #512
gf_polymul_1024x1024_mod3_extend:
	ldr.w r4, [r1, #4]
	ldr.w r5, [r1, #512]
	ldr.w r6, [r1, #516]
	ldr.w r3, [r1], #8
	ldr.w r8, [r2, #4]
	ldr.w r9, [r2, #512]
	ldr.w r10, [r2, #516]
	ldr.w r7, [r2], #8
	add.w r3, r3, r5
	add.w r4, r4, r6
	add.w r7, r7, r9
	add.w r8, r8, r10
	usub8 r11, r3, r12
	sel r3, r11, r3
	usub8 r11, r4, r12
	sel r4, r11, r4
	usub8 r11, r7, r12
	sel r7, r11, r7
	usub8 r11, r8, r12
	sel r8, r11, r8
	str.w r4, [r0, #4]
	str.w r7, [r0, #512]
	str.w r8, [r0, #516]
	str.w r3, [r0], #8
	cmp.w r0, lr
	bne.w gf_polymul_1024x1024_mod3_extend
	sub.w r4, r0, #512
	sub.w r5, r1, #512
	sub.w r6, r2, #512
	add.w r0, r4, #1024
	bl.w gf_polymul_512x512_mod3 @ a1b1
	add.w r0, r4, #2048
	mov.w r1, r4
	add.w r2, r4, #512
	bl.w gf_polymul_512x512_mod3 @ a0+a1 * b0+b1
	mov.w r0, r4
	mov.w r1, r5
	mov.w r2, r6
	bl.w gf_polymul_512x512_mod3 @ a0b0
	vmov r0, s6
	mov.w r1, r4
	add.w lr, r0, #512
	mov.w r12, #0x03030303
gf_polymul_1024x1024_mod3_output:
	ldr.w r3, [r1, #512] @ a0b0 top
	ldr.w r4, [r1, #1024] @ a1b1 bot
	ldr.w r5, [r1, #1536] @ a1b1 top
	ldr.w r6, [r1, #2048] @ a0+a1 * b0+b1 bot
	ldr.w r7, [r1, #2560] @ a0+a1 * b0+b1 top
	ldr.w r2, [r1], #4 @ a0b0 bot
	str.w r5, [r0, #1536]
	usub8 r8, r12, r4
	add.w r8, r3, r8
	usub8 r9, r8, r12
	sel r8, r9, r8
	usub8 r9, r12, r2
	add.w r9, r8, r9
	usub8 r10, r9, r12
	sel r9, r10, r9
	add.w r9, r9, r6
	usub8 r10, r9, r12
	sel r6, r10, r9
	usub8 r8, r12, r8
	usub8 r9, r12, r5
	add.w r8, r8, r9
	usub8 r9, r8, r12
	sel r8, r9, r8
	add.w r8, r8, r7
	usub8 r9, r8, r12
	sel r7, r9, r8
	str.w r7, [r0, #1024]
	str.w r6, [r0, #512]
	str.w r2, [r0], #4
	cmp.w r0, lr
	bne.w gf_polymul_1024x1024_mod3_output
	add.w sp, sp, #3072
	pop.w {r3-r12, pc}

