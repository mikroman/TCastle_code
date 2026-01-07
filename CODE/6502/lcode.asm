	.byte $20
	jmp L_JMP_C00F_C001
	.byte $0A,$C0,$0B,$C0,$0C,$C0,$00,$00
	.byte $00,$00,$00

L_JMP_C00F_C001:

	lda $C00E 
	bne L_BRS_C017_C012
	jsr L_JSR_C0EE_C014

L_BRS_C017_C012:

	lda $D41B                          // Oscillator 3 Output
	and #$1F
	sta $C00A 
	lda $D41B                          // Oscillator 3 Output
	and #$0F
	sta $C00B 
	lda #$00
	sta $C00C 
	sta $C00D 
	lda #$30
	clc 
	adc $C00A 
	adc $C00B 
	sta $C00C 
	lda $C00A 
	asl 
	clc 
	adc $C00C 
	sta $C00C 
	bcc L_BRS_C04B_C046
	inc $C00D 

L_BRS_C04B_C046:

	lda $C00B 
	asl 
	asl 
	clc 
	adc $C00C 
	sta $C00C 
	bcc L_BRS_C05C_C057
	inc $C00D 

L_BRS_C05C_C057:

	lda $C00B 
	beq L_BRS_C074_C05F
	tay 
	lda $C00A 
	dey 
	beq L_BRS_C074_C066

L_BRS_C068_C072:

	clc 
	adc $C00A 
	bcc L_BRS_C071_C06C
	inc $C00D 

L_BRS_C071_C06C:

	dey 
	bne L_BRS_C068_C072

L_BRS_C074_C05F:
L_BRS_C074_C066:

	clc 
	adc $C00C 
	sta $C00C 
	bcc L_BRS_C080_C07B
	inc $C00D 

L_BRS_C080_C07B:

	lda $C00D 
	eor $C00C 
	clc 
	adc #$30
	and #$7F
	cmp #$30
	bcs L_BRS_C092_C08D
	clc 
	adc #$30

L_BRS_C092_C08D:

	cmp #$7A
	bcc L_BRS_C099_C094
	sec 
	sbc #$04

L_BRS_C099_C094:

	cmp #$60
	bne L_BRS_C09F_C09B
	lda #$52

L_BRS_C09F_C09B:

	cmp #$41
	bcc L_BRS_C0AA_C0A1
	cmp #$5B
	bcs L_BRS_C0B4_C0A5
	clc 
	adc #$20

L_BRS_C0AA_C0A1:
L_BRS_C0AA_C0B6:
L_BRS_C0AA_C0BA:
L_BRS_C0AA_C0BF:

	cmp #$7B
	bne L_BRS_C0B0_C0AC
	lda #$28

L_BRS_C0B0_C0AC:

	sta $C00C 
	rts 

L_BRS_C0B4_C0A5:

	cmp #$61
	bcc L_BRS_C0AA_C0B6
	cmp #$7B
	bcs L_BRS_C0AA_C0BA
	sec 
	sbc #$20
	bne L_BRS_C0AA_C0BF

L_JSR_C0C1_C0F1:

	ldy #$18
	lda #$00

L_BRS_C0C5_C0C9:

	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	dey 
	bpl L_BRS_C0C5_C0C9
	rts 
	pla 
	tay 
	pla 
	tax 
	pla 
	rti 

L_JSR_C0D2_C0EE:

	sei 
	lda #$C0
	sta $0317 
	lda #$CC
	sta $0316 
	lda #$C0
	sta $0319 
	lda #$D1
	sta $0318 
	lda #$EA
	sta $0328 
	cli 
	rts 

L_JSR_C0EE_C014:

	jsr L_JSR_C0D2_C0EE
	jsr L_JSR_C0C1_C0F1
	lda #$80
	sta $D418                          // Select Filter Mode and Volume
	lda #$81
	sta $D412                          // Voice 3: Control Register
	lda #$55
	sta $D40E                          // Voice 3: Frequency Control - Low-Byte
	lda #$AA
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	inc $C00E 
	lda #$0A
	sta $A5 
	ldy #$00
	ldx #$00

L_BRS_C113_C114:
L_BRS_C113_C117:
L_BRS_C113_C11B:

	dex 
	bne L_BRS_C113_C114
	dey 
	bne L_BRS_C113_C117
	dec $A5 
	bne L_BRS_C113_C11B
	rts
