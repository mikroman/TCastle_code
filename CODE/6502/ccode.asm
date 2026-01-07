* = $9000 "ccode"
	jmp L_JMP_90A5_9000	// 0-1,4
	jmp L_JMP_90E1_9003	// 3-2
	jmp L_JMP_92B6_9006	// 9-3
	jmp L_JMP_92CF_9009
	jmp L_JMP_92DE_900C
	jmp L_JMP_9309_900F
	jmp L_JMP_9327_9012
	jmp L_JMP_93F9_9015
	jmp L_JMP_95E6_9018
	jmp L_JMP_966A_901B
	jmp L_JMP_9697_901E
sys36897:
	jmp L_JMP_96C2_9021
	jmp L_JMP_98BA_9024
	jmp L_JMP_9A0E_9027
	jmp L_JMP_9B09_902A
sys36909:
	jmp L_JMP_9BA7_902D	// 45-3
	jmp L_JMP_9C7F_9030
	jmp L_JMP_9D4E_9033
	jmp L_JMP_9C08_9036
	jmp L_JMP_9D69_9039
	jmp L_JMP_9D80_903C
	jmp L_JMP_9D97_903F
	jmp L_JMP_9D28_9042
table9045:
	.byte $51,$90,$71,$90,$81,$90,$94,$90
	.byte $43,$98,$00,$C0,$98,$98,$52,$B2
	.byte $78,$92,$D3,$66,$CA,$CA,$00,$00
	.byte $78,$92,$00,$00,$98,$98,$00,$26
	.byte $85,$9F,$00,$EC,$CA,$CA,$0E,$38
	.byte $85,$9F,$D3,$EC,$07,$07,$07,$07
	.byte $07,$07,$07,$07,$07,$07,$07,$06
	.byte $07,$07,$07,$04,$00,$00,$00,$C0
	.byte $73,$8D,$CB,$E9,$FF,$29,$3D,$00
	.byte $00,$80,$C0,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $43,$52,$41,$50,$53,$44,$41,$54

L_JMP_90A5_9000:

	sei
	lda #$7F
	sta $DC0D                          // Interrupt (IRQ) Control Register
	jsr L_JSR_90FD_90AB
	lda $D01A                          // Interrupt Mask Register (IMR)
	ora #$01
	sta $D01A                          // Interrupt Mask Register (IMR)
	ldx #$00
	stx $9090
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $9085,X
	sta $D012                          // Raster Position
	lda $0315
	sta $9092
	lda $0314
	sta $9091
	lda #$91
	sta $0315
	lda #$3B
	sta $0314
	cli
	rts

L_JMP_90E1_9003:

	sei
	lda $D01A                          // Interrupt Mask Register (IMR)
	and #$FE
	sta $D01A                          // Interrupt Mask Register (IMR)
	lda #$81
	sta $DC0D                          // Interrupt (IRQ) Control Register
	lda $9092
	sta $0315
	lda $9091
	sta $0314
	cli
	rts

L_JSR_90FD_90AB:

	lda $01
	and #$FB
	sta $01
	
	lda #$D0
	sta $FC
	lda #$00
	sta $FB
	lda #$B8
	sta $FE
	lda #$00
	sta $FD
	
	ldx #$00
	lda #$08
	jsr L_JSR_92DE_9117

	lda $01
	ora #$04
	sta $01
	rts

L_BRS_9121_9140:

	cpy #$06
	bcc L_BRS_9130_9123
	lda $D016                          // Control Register 2
	ora #$10
	sta $D016                          // Control Register 2
	jmp L_JMP_91A4_912D

L_BRS_9130_9123:

	lda $D016                          // Control Register 2
	and #$EF
	sta $D016                          // Control Register 2
	jmp L_JMP_91A4_9138

ccodeIRQ:

	ldy $9090
	cpy #$05
	bcs L_BRS_9121_9140
	cpy #$04
	beq L_BRS_91A4_9144
	lda $9051,Y
	sta $D008                          // Sprite 4 X Pos
	lda $9055,Y
	sta $D009                          // Sprite 4 Y Pos
	lda $9059,Y
	sta $D00A                          // Sprite 5 X Pos
	lda $905D,Y
	sta $D00B                          // Sprite 5 Y Pos
	lda $9061,Y
	sta $D00C                          // Sprite 6 X Pos
	lda $9065,Y
	sta $D00D                          // Sprite 6 Y Pos
	lda $9069,Y
	sta $D00E                          // Sprite 7 X Pos
	lda $906D,Y
	sta $D00F                          // Sprite 7 Y Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$0F
	ora $908C,Y
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda $9071,Y
	sta $D02B                          // Sprite 4 Color
	lda $9075,Y
	sta $D02C                          // Sprite 5 Color
	lda $9079,Y
	sta $D02D                          // Sprite 6 Color
	lda $907D,Y
	sta $D02E                          // Sprite 7 Color
	lda $D015                          // Sprite display Enable
	and #$0F
	ora $9081,Y
	sta $D015                          // Sprite display Enable

L_JMP_91A4_912D:
L_JMP_91A4_9138:
L_BRS_91A4_9144:

	iny
	cpy #$07
	bcc L_BRS_91AB_91A7
	ldy #$00

L_BRS_91AB_91A7:

	sty $9090
	lda $9085,Y
	sta $D012                          // Raster Position
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $D019                          // Interrupt Request Register (IRR)
	ora #$01
	sta $D019                          // Interrupt Request Register (IRR)
	cpy #$05
	bne BRK_vector
	jmp ($9091)

BRK_vector:	// 91CB

	pla
	tay
	pla
	tax
	pla
	rti

NMI_vector:	// 91D0

	lda $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	and #$1F
	sta $9093
	lda $9093
	and #$01
	bne L_BRS_91EF_91DE
	dec $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$3A
	bcs L_BRS_91EF_91E8
	ldx #$3A
	stx $D001                          // Sprite 0 Y Pos

L_BRS_91EF_91DE:
L_BRS_91EF_91E8:

	lda $9093
	and #$02
	bne L_BRS_9205_91F4
	inc $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$EE
	bcc L_BRS_9205_91FE
	ldx #$ED
	stx $D001                          // Sprite 0 Y Pos

L_BRS_9205_91F4:
L_BRS_9205_91FE:

	lda $9093
	and #$04
	bne L_BRS_922C_920A
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	beq L_BRS_9225_9214
	cpy #$00
	bne L_BRS_9229_9218
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$FE
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_9229_9223

L_BRS_9225_9214:

	cpy #$19
	bcc L_BRS_922C_9227

L_BRS_9229_9218:
L_BRS_9229_9223:

	dec $D000                          // Sprite 0 X Pos

L_BRS_922C_920A:
L_BRS_922C_9227:

	lda $9093
	and #$08
	bne L_BRS_9253_9231
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_924C_923B
	cpy #$FF
	bne L_BRS_9250_923F
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ora #$01
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_9250_924A

L_BRS_924C_923B:

	cpy #$4B
	bcs L_BRS_9253_924E

L_BRS_9250_923F:
L_BRS_9250_924A:

	inc $D000                          // Sprite 0 X Pos

L_BRS_9253_9231:
L_BRS_9253_924E:

	lda $9095
	bne L_BRS_9299_9256
	lda $9093
	and #$10
	bne L_BRS_929C_925D
	lda $9094
	bne L_BRS_929C_9262
	lda $D01E                          // Sprite to Sprite Collision Detect
	lsr
	beq L_BRS_929C_9268
	bcc L_BRS_929C_926A
	ldx #$00

L_BRS_926E_9270:

	inx
	lsr
	bcc L_BRS_926E_9270
	lda $9096
	bne L_BRS_9293_9275
	lda $D015                          // Sprite display Enable
	and #$F1
	sta $D015                          // Sprite display Enable
	inc $9096
	lda $D027,X                          // Sprite 0 Color
	sta $D028                          // Sprite 1 Color
	lda $D015                          // Sprite display Enable
	ora #$02
	sta $D015                          // Sprite display Enable
	jsr L_JSR_9347_9290

L_BRS_9293_9275:

	jsr L_JSR_9D4E_9293
	lda $D01E                          // Sprite to Sprite Collision Detect

L_BRS_9299_9256:
L_JMP_9299_92B3:

	jmp ($9097)

L_BRS_929C_925D:
L_BRS_929C_9262:
L_BRS_929C_9268:
L_BRS_929C_926A:

	lda $9096
	beq L_BRS_92B0_929F
	ldy #$00
	sty $9096
	iny
	sty $9094
	jsr L_JSR_93F9_92AA
	jsr L_JSR_9347_92AD

L_BRS_92B0_929F:

	lda $D01E                          // Sprite to Sprite Collision Detect
	jmp L_JMP_9299_92B3

L_JMP_92B6_9006:

	sei
	lda $0315
	sta $9098
	lda $0314
	sta $9097
	lda #$91
	sta $0315
	lda #$D1
	sta $0314
	cli
	rts

L_JMP_92CF_9009:

	sei
	lda $9098
	sta $0315
	lda $9097
	sta $0314
	cli
	rts

L_JMP_92DE_900C:
L_JSR_92DE_9117:
L_JSR_92DE_9754:
L_JSR_92DE_976B:
L_JSR_92DE_9782:
L_JMP_92DE_9D7D:
L_JMP_92DE_9D94:

.break
	sta $92E8		// #$08
	stx $9305		// #$00
	clc
	lda $FC
	adc #$00		// 92E8 becomes 1f,03
	sta $92FC		// #$D8
	ldy #$00

L_BRS_92EE_92F3:
L_BRS_92EE_92FD:

	lda ($FB),Y	// copy CRAM at D000 to B800 ## OR ## copy 8c00-8eff
	sta ($FD),Y
	iny
	bne L_BRS_92EE_92F3
	inc $FC
	inc $FE
	lda $FC
	cmp #$00		// 92FC to bf, c6
	bcc L_BRS_92EE_92FD

L_BRS_92FF_9306:		// 8c00-8fe7 to 5c00-5fe7

	lda ($FB),Y
	sta ($FD),Y
	iny
	cpy #$40		// 9305 is #$40,e8
	bcc L_BRS_92FF_9306
	rts

L_JMP_9309_900F:
L_JMP_9309_9788:

	lda $D016                          // Control Register 2
	ora #$10
	sta $D016                          // Control Register 2
	lda #$38
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda $D011                          // Control Register 1
	ora #$20
	sta $D011                          // Control Register 1
	rts

L_JMP_9327_9012:

	lda $D016                          // Control Register 2
	and #$EF
	sta $D016                          // Control Register 2
	lda #$15
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$03
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda $D011                          // Control Register 1
	and #$DF
	sta $D011                          // Control Register 1
	rts

L_JSR_9347_9290:
L_JSR_9347_92AD:

	lda #$21
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	sta $D408                          // Voice 2: Frequency Control - High-Byte
	lda #$F0
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	sta $D407                          // Voice 2: Frequency Control - Low-Byte
	lda #$68
	sta $D416                          // Filter Cutoff Frequency: High-Byte
	lda #$03
	sta $D417                          // Filter Resonance Control / Voice Input Control
	lda #$08
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	sta $D40C                          // Voice 2: Attack / Decay Cycle Control
	lda #$00
	sta $D406                          // Voice 1: Sustain / Release Cycle Control
	sta $D40D                          // Voice 2: Sustain / Release Cycle Control
	lda #$CF
	sta $D418                          // Select Filter Mode and Volume
	lda #$80
	sta $D404                          // Voice 1: Control Register
	sta $D40B                          // Voice 2: Control Register
	lda #$81
	sta $D404                          // Voice 1: Control Register
	sta $D40B                          // Voice 2: Control Register
	rts

L_JSR_9387_9B15:
L_JSR_9387_9B58:

	lda #$10
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	sta $D408                          // Voice 2: Frequency Control - High-Byte
	lda #$F0
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	sta $D407                          // Voice 2: Frequency Control - Low-Byte
	lda #$17
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	sta $D40C                          // Voice 2: Attack / Decay Cycle Control
	lda #$47
	sta $D406                          // Voice 1: Sustain / Release Cycle Control
	sta $D40D                          // Voice 2: Sustain / Release Cycle Control
	lda #$0B
	sta $D403                          // Voice 1: Pulse Waveform Width - High-Nybble
	sta $D40A                          // Voice 2: Pulse Waveform Width - High-Nybble
	lda #$BB
	sta $D402                          // Voice 1: Pulse Waveform Width - Low-Byte
	sta $D409                          // Voice 2: Pulse Waveform Width - Low-Byte
	lda #$8F
	sta $D418                          // Select Filter Mode and Volume
	lda #$41
	eor $93D6
	sta $D404                          // Voice 1: Control Register
	sta $D40B                          // Voice 2: Control Register
	sta $93D6
	rts

L_JSR_93CB_96C5:
L_JSR_93CB_9A3A:
L_JSR_93CB_9ADE:

	ldy #$18
	lda #$00

L_BRS_93CF_93D3:

	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	dey
	bpl L_BRS_93CF_93D3
	rts
	.byte $00,$08,$10,$18,$1E,$24,$2A,$30
	.byte $36,$3C,$4A,$55,$63,$69,$6F,$75
	.byte $7B,$81,$87,$8F,$97,$FF,$11,$1A
	.byte $27,$44,$51,$5E,$6B,$78,$8D,$99
	.byte $A5,$FF,$00

L_JMP_93F9_9015:
L_JSR_93F9_92AA:

	lda $D010                          // Sprites 0-7 MSB of X coordinate
	lsr
	lda $D000                          // Sprite 0 X Pos
	ror
	sec
	sbc #$08

L_JSR_9404_9574:

	ldx #$00

L_BRS_9406_940C:

	cmp $93D7,X
	bcc L_BRS_940E_9409
	inx
	bne L_BRS_9406_940C

L_BRS_940E_9409:

	stx $A3
	lda $D001                          // Sprite 0 Y Pos
	sec
	sbc #$2D

L_JSR_9416_9583:

	ldy #$00

L_BRS_9418_941E:

	cmp $93EC,Y
	bcc L_BRS_9420_941B
	iny
	bne L_BRS_9418_941E

L_BRS_9420_941B:

	sty $A4
	rts

L_JSR_9423_955E:
L_JSR_9423_95EC:
L_JSR_9423_9673:
L_JSR_9423_96A3:
L_JSR_9423_98D0:
L_JSR_9423_9964:
L_JSR_9423_99EC:
L_JSR_9423_9C1A:
L_JSR_9423_9CAC:
L_JSR_9423_9CF1:

	ldx $A3
	ldy $A4

L_JSR_9427_9BAE:

	lda #$E0
	sta $04
	lda #$00
	sta $03
	tya
	pha
	and #$F8
	sta $943A
	ldy #$27

L_BRS_9438_9440:

	clc
	adc #$00
	bcc L_BRS_943F_943B
	inc $04

L_BRS_943F_943B:

	dey
	bne L_BRS_9438_9440
	sta $03
	pla
	and #$07
	clc
	adc $03
	sta $03
	bcc L_BRS_9450_944C
	inc $04

L_BRS_9450_944C:

	txa
	asl
	bcc L_BRS_9456_9452
	inc $04

L_BRS_9456_9452:

	clc
	and #$F8
	adc $03
	sta $03
	bcc L_BRS_9461_945D
	inc $04

L_BRS_9461_945D:

	rts

L_JSR_9462_95CA:

	ldx $A3
	ldy $A4
	lda #$CC
	sta $06
	lda #$00
	sta $05
	tya
	lsr
	lsr
	lsr
	beq L_BRS_9483_9472
	tay

L_BRS_9475_9481:

	lda #$28
	clc
	adc $05
	sta $05
	bcc L_BRS_9480_947C
	inc $06

L_BRS_9480_947C:

	dey
	bne L_BRS_9475_9481

L_BRS_9483_9472:

	txa
	lsr
	lsr
	clc
	adc $05
	sta $05
	bcc L_BRS_948F_948B
	inc $06

L_BRS_948F_948B:

	rts

L_JSR_9490_94ED:
L_JSR_9490_94F8:

	lda $FB
	clc
	adc #$3F
	sta $FD

L_BRS_9497_94B6:

	ldy #$02
	lda ($FB),Y
	ror
	ldx #$02
	ldy #$00

L_BRS_94A0_94A7:

	lda ($FB),Y
	ror
	sta ($FB),Y
	iny
	dex
	bpl L_BRS_94A0_94A7
	lda $FB
	clc
	adc #$03
	sta $FB
	bcc L_BRS_94B4_94B0
	inc $FC

L_BRS_94B4_94B0:

	cmp $FD
	bne L_BRS_9497_94B6
	rts

L_JSR_94B9_950F:
L_JSR_94B9_951A:

	lda $FB
	clc
	adc #$3F
	sta $FD

L_BRS_94C0_94DC:

	ldy #$00
	lda ($FB),Y
	rol
	ldy #$02

L_BRS_94C7_94CD:

	lda ($FB),Y
	rol
	sta ($FB),Y
	dey
	bpl L_BRS_94C7_94CD
	lda $FB
	clc
	adc #$03
	sta $FB
	bcc L_BRS_94DA_94D6
	inc $FC

L_BRS_94DA_94D6:

	cmp $FD
	bne L_BRS_94C0_94DC
	rts

L_JSR_94DF_95F6:

	ldx $FF
	beq L_BRS_9500_94E1

L_BRS_94E3_94FE:

	txa
	pha
	lda #$CB
	sta $FC
	lda #$80
	sta $FB
	jsr L_JSR_9490_94ED
	lda #$CB
	sta $FC
	lda #$C0
	sta $FB
	jsr L_JSR_9490_94F8
	pla
	tax
	dex
	bne L_BRS_94E3_94FE

L_BRS_9500_94E1:

	rts

L_JSR_9501_962C:

	ldx $FF
	beq L_BRS_9522_9503

L_BRS_9505_9520:

	txa
	pha
	lda #$CB
	sta $FC
	lda #$80
	sta $FB
	jsr L_JSR_94B9_950F
	lda #$CB
	sta $FC
	lda #$C0
	sta $FB
	jsr L_JSR_94B9_951A
	pla
	tax
	dex
	bne L_BRS_9505_9520

L_BRS_9522_9503:

	rts

L_JSR_9523_9624:
L_JSR_9523_98AA:

.break
	sty $9557
	lda $909A
	sta $9547
	lda $9099
	sta $9546
	lda $909C
	sta $954A
	lda $909B
	sta $9549

L_BRS_953E_9567:

	ldy #$00

L_BRS_9540_9558:

	jsr L_JSR_9630_9540
	lda ($03),Y
	and $CB80,X
	ora $CBC0,X
	sta ($03),Y
	jsr L_JSR_9644_954D
	tya
	clc
	adc #$08
	tay
	inx
	cpy #$11
	bcc L_BRS_9540_9558
	txa
	pha
	inc $A4
	jsr L_JSR_9423_955E
	pla
	tax
	dec $02
	lda $02
	bpl L_BRS_953E_9567
	rts

L_JSR_956A_95E6:

	lda $A4
	sta $FC
	lda $A3
	sta $FB
	lda $FB
	jsr L_JSR_9404_9574
	ldx $A3
	cpx #$03
	bcc L_BRS_959A_957B
	cpx #$12
	bcs L_BRS_959A_957F
	lda $FC
	jsr L_JSR_9416_9583
	ldy $A4
	beq L_BRS_959A_9588
	cpy #$05
	bcs L_BRS_959A_958C
	cpy #$01
	beq L_BRS_95B2_9590
	cpx #$09
	bcc L_BRS_95A8_9594
	cpx #$0C
	bcs L_BRS_95A8_9598

L_BRS_959A_957B:
L_BRS_959A_957F:
L_BRS_959A_9588:
L_BRS_959A_958C:
L_BRS_959A_95B4:
L_BRS_959A_95C6:

	lda #$00
	sta $93F8
	lda $FC
	sta $A4
	lda $FB
	sta $A3
	rts

L_BRS_95A8_9594:
L_BRS_95A8_9598:

	cpy #$04
	beq L_BRS_95B2_95AA
	lda $FC
	cmp #$3C
	bcs L_BRS_95C4_95B0

L_BRS_95B2_9590:
L_BRS_95B2_95AA:

	txa
	lsr
	bcc L_BRS_959A_95B4

L_BRS_95B6_95C8:

	lda #$01
	sta $93F8
	lda $FC
	sta $A4
	lda $FB
	sta $A3
	rts

L_BRS_95C4_95B0:

	txa
	lsr
	bcs L_BRS_959A_95C6
	bcc L_BRS_95B6_95C8

L_JSR_95CA_95E9:

L_JSR_95CA_9629:

	jsr L_JSR_9462_95CA
	lda $93F8
	beq L_BRS_95D9_95D0
	lda $06
	clc
	adc #$0C
	sta $06

L_BRS_95D9_95D0:

	ldy #$01
	lda $D028                          // Sprite 1 Color
	and #$0F

L_BRS_95E0_95E3:

	sta ($05),Y
	dey
	bpl L_BRS_95E0_95E3
	rts

L_JMP_95E6_9018:

	jsr L_JSR_956A_95E6
	jsr L_JSR_95CA_95E9
	jsr L_JSR_9423_95EC
	lda $A3
	asl
	and #$06
	sta $FF
	jsr L_JSR_94DF_95F6
	ldy #$06
	sty $02
	lda #$CB
	sta $909A
	lda #$80
	sta $9099
	lda #$CB
	sta $909C
	lda #$C0
	sta $909B
	lda $93F8
	beq L_BRS_9620_9614
	lda #$CB
	sta $909C
	lda #$E1
	sta $909B

L_BRS_9620_9614:

	ldy #$11
	ldx #$03
	jsr L_JSR_9523_9624
	dec $A4
	jsr L_JSR_95CA_9629
	jsr L_JSR_9501_962C
	rts

L_JSR_9630_9540:
L_BRS_9630_9633:
L_JSR_9630_967A:
L_JSR_9630_996C:
L_JSR_9630_9C1F:

	lda $D011                          // Control Register 1
	bpl L_BRS_9630_9633
	sei
	lda $01
	and #$FD
	sta $01
	rts

L_JSR_963D_969C:
L_JSR_963D_973D:
L_JSR_963D_9BA7:

	lda $01
	and #$FE
	sta $01
	rts

L_JSR_9644_954D:
L_JSR_9644_9683:
L_JSR_9644_96BE:
L_JSR_9644_9785:
L_JSR_9644_9979:
L_JSR_9644_9BEE:
L_JSR_9644_9C32:

	lda $01
	ora #$03
	sta $01
	cli
	rts

L_JSR_964C_966C:
L_JSR_964C_9699:

	lda #$00
	sta $FB
	lda #$A0
	sta $FC

L_JSR_9654_986E:
L_JSR_9654_9CBF:

	stx $965F
	ldy $02
	beq L_BRS_9669_9659
	lda $FB

L_BRS_965D_9665:

	clc
	adc #$00
	bcc L_BRS_9664_9660
	inc $FC

L_BRS_9664_9660:

	dey
	bne L_BRS_965D_9665
	sta $FB

L_BRS_9669_9659:

.break
	rts

L_JMP_966A_901B:
L_JSR_966A_9D14:
L_JSR_966A_9D24:

	ldx #$10
	jsr L_JSR_964C_966C
	ldx #$07

L_BRS_9671_9694:

	txa
	pha
	jsr L_JSR_9423_9673
	ldy #$08

L_BRS_9678_968D:

	tya
	pha
	jsr L_JSR_9630_967A
	lda ($03),Y
	ldy #$00
	sta ($FB),Y
	jsr L_JSR_9644_9683
	inc $FB
	pla
	sec
	sbc #$08
	tay
	bcs L_BRS_9678_968D
	inc $A4
	pla
	tax
	dex
	bpl L_BRS_9671_9694
	rts

L_JMP_9697_901E:
L_JSR_9697_9D3A:
L_JSR_9697_9D4A:

	ldx #$10
	jsr L_JSR_964C_9699
	jsr L_JSR_963D_969C
	ldx #$07

L_BRS_96A1_96BC:

	txa
	pha
	jsr L_JSR_9423_96A3
	ldy #$01
	lda ($FB),Y
	dey
	sta ($03),Y
	lda ($FB),Y
	ldy #$08
	sta ($03),Y
	inc $FB
	inc $FB
	inc $A4
	pla
	tax
	dex
	bpl L_BRS_96A1_96BC
	jsr L_JSR_9644_96BE
	rts

L_JMP_96C2_9021:

	jsr $FFE7// Close All Channels And Files
	jsr L_JSR_93CB_96C5		// initsound

	lda #$91			// set BRK
	sta $0317
	lda #$CB
	sta $0316

	lda #$91			// set NMI
	sta $0319
	lda #$D0
	sta $0318

	lda #$EA
	sta $0328			// set STOP

	lda #$00
	jsr $FF90			// Control OS Messages
	
	lda #$05
	ldx $BA
	ldy #$00
	jsr $FFBA			// Set Logical File Parameters
	lda #$08
	ldx #$9D			// "CRAPSDAT"
	ldy #$90
	jsr $FFBD			// Set Filename
	lda #$00
	ldx #$80
	ldy #$C9
	jsr $FFD5			// Load RAM From Device
	lda #$05
	ldx $BA
	ldy #$00
	jsr $FFBA			// Set Logical File Parameters
	lda #$05
	ldx #$8B			// "CRAPS"
	ldy #$97
	jsr $FFBD			// Set Filename
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5			// Load RAM From Device
	jsr L_JSR_973D_971C
	lda #$0
	ldx $BA
	ldy #$00
	jsr $FFBA			// Set Logical File Parameters
	lda #$03
	ldx #$90
	ldy #$97			// "ARR"
	jsr $FFBD			// Set Filename
	lda #$00
	ldx #$40
	ldy #$FF
	jsr $FFD5			// Load RAM From Device
	jmp $FFE7			// Close All Channels And Files

L_JSR_973D_971C:

	jsr L_JSR_963D_973D

	lda #$A0
	sta $FC
	lda #$00
	sta $FB
	lda #$E0
	sta $FE
	lda #$00
	sta $FD

	lda #$1F
	ldx #$40
	jsr L_JSR_92DE_9754

	lda #$BF
	sta $FC
	lda #$40
	sta $FB
	lda #$CC
	sta $FE
	lda #$00
	sta $FD

	lda #$03
	ldx #$E8
	jsr L_JSR_92DE_976B

	lda #$C3
	sta $FC
	lda #$38
	sta $FB
	lda #$D8
	sta $FE
	lda #$00
	sta $FD

	lda #$03
	ldx #$E8
	jsr L_JSR_92DE_9782
	
	jsr L_JSR_9644_9785

	jmp L_JMP_9309_9788

	.byte $43,$52,$41,$50,$53,$41,$52,$52
	.byte $14,$00,$41,$00,$45,$00,$55,$00
	.byte $51,$00,$41,$00,$41,$00,$14,$00
	.byte $04,$00,$14,$00,$04,$00,$04,$00
	.byte $04,$00,$04,$00,$04,$00,$15,$00
	.byte $14,$00,$41,$00,$01,$00,$01,$00
	.byte $14,$00,$40,$00,$40,$00,$55,$00
	.byte $55,$00,$01,$00,$04,$00,$14,$00
	.byte $05,$00,$41,$00,$41,$00,$14,$00
	.byte $04,$00,$14,$00,$44,$00,$44,$00
	.byte $55,$00,$04,$00,$04,$00,$04,$00
	.byte $55,$00,$40,$00,$40,$00,$54,$00
	.byte $01,$00,$01,$00,$41,$00,$14,$00
	.byte $14,$00,$41,$00,$40,$00,$54,$00
	.byte $41,$00,$41,$00,$41,$00,$14,$00
	.byte $55,$00,$41,$00,$01,$00,$04,$00
	.byte $04,$00,$10,$00,$10,$00,$10,$00
	.byte $14,$00,$41,$00,$41,$00,$14,$00
	.byte $41,$00,$41,$00,$41,$00,$14,$00
	.byte $14,$00,$41,$00,$41,$00,$41,$00
	.byte $15,$00,$01,$00,$41,$00,$14,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00

L_JSR_984E_987C:

	lda #$00
	ldx $FF
	beq L_BRS_9859_9852

L_BRS_9854_9857:

	sec
	ror
	dex
	bne L_BRS_9854_9857

L_BRS_9859_9852:

	ldy #$0F

L_BRS_985B_9861:

	eor #$FF
	sta $9833,Y
	dey
	bpl L_BRS_985B_9861
	rts

L_JSR_9864_98CD:

	lda #$97
	sta $FC
	lda #$93
	sta $FB
	ldx #$10
.break
	jsr L_JSR_9654_986E
	lda $FC
	sta $984D
	lda $FB
	sta $984C
	rts

L_JSR_987C_98D3:

	jsr L_JSR_984E_987C
	lda $984D
	sta $909C
	lda $984C
	sta $909B
	lda #$98
	sta $909A
	lda #$33
	sta $9099
	lda $984D
	sta $FC
	lda $984C
	sta $FB
.break
	jsr L_JSR_98F3_989F
.break
	ldy #$07
	sty $02
	ldx #$00
	ldy #$09
	jsr L_JSR_9523_98AA
	lda $984D
	sta $FC
	lda $984C
	sta $FB
	jmp L_JMP_9912_98B7

L_JMP_98BA_9024:

	lda #$08
	sta $A3
	ldy #$00
	sty $FF

L_BRS_98C2_98F0:

	lda #$B8
	sta $A4
	tya
	pha
	lda $9843,Y
	sta $02
.break
	jsr L_JSR_9864_98CD
.break
	jsr L_JSR_9423_98D0
.break
	jsr L_JSR_987C_98D3
.break
	lda $A3
	clc
	adc #$05
	sta $A3
	inc $FF
	inc $FF
	lda $FF
	cmp #$08
	bcc L_BRS_98EB_98E5
	lda #$00
	sta $FF

L_BRS_98EB_98E5:

	pla
	tay
	iny
	cpy #$09
	bcc L_BRS_98C2_98F0
	rts

L_JSR_98F3_989F:

	ldx $FF
	beq L_BRS_9911_98F5

L_BRS_98F7_990F:

	txa
	pha
	ldx #$07
	ldy #$00

L_BRS_98FD_990A:

	lda ($FB),Y
	lsr
	sta ($FB),Y
	iny
	lda ($FB),Y
	ror
	sta ($FB),Y
	iny
	dex
	bpl L_BRS_98FD_990A
	pla
	tax
	dex
	bne L_BRS_98F7_990F

L_BRS_9911_98F5:

	rts

L_JMP_9912_98B7:

	ldx $FF
	beq L_BRS_9930_9914

L_BRS_9916_992E:

	txa
	pha
	ldx #$07
	ldy #$0F

L_BRS_991C_9929:

	lda ($FB),Y
	asl
	sta ($FB),Y
	dey
	lda ($FB),Y
	rol
	sta ($FB),Y
	dey
	dex
	bpl L_BRS_991C_9929
	pla
	tax
	dex
	bne L_BRS_9916_992E

L_BRS_9930_9914:

	rts
	lsr $49
	jmp $5653
	eor $A6A1,Y
	.byte $AB,$00,$00,$00

L_JSR_993D_9967:
L_JSR_993D_99F6:

	ldx $FF
	lda #$7F
	clc

L_BRS_9942_9944:

	ror
	dex
	bpl L_BRS_9942_9944
	sta $993A
	ldx $FF
	lda #$80
	clc

L_BRS_994E_9950:

	ror
	dex
	bpl L_BRS_994E_9950
	sta $993B
	rts

L_JSR_9956_998D:
L_JSR_9956_999E:
L_JSR_9956_99A5:
L_JSR_9956_99B7:
L_JSR_9956_99BE:
L_JSR_9956_99D0:
L_JSR_9956_99D7:

	lda $9937,X
	sta $A4
	lda ($FB),Y
	sta $A3
	asl
	and #$06
	sta $FF
	jsr L_JSR_9423_9964
	jsr L_JSR_993D_9967

L_JSR_996A_9A00:

	ldy #$01

L_BRS_996C_997D:

	jsr L_JSR_9630_996C
	lda ($03),Y
	and $993A
	ora $993B
	sta ($03),Y
	jsr L_JSR_9644_9979
	dey
	bpl L_BRS_996C_997D
	rts

L_JSR_9980_9A1B:
L_JSR_9980_9A2B:

	jsr L_JSR_99DB_9980
	lda $993C
	lsr
	bcc L_BRS_9990_9987
	ldy #$01
	ldx #$01
	jsr L_JSR_9956_998D

L_BRS_9990_9987:

	lda $993C
	and #$FE
	sta $993C
	beq L_BRS_99DA_9998
	ldy #$00
	ldx #$00
	jsr L_JSR_9956_999E
	ldy #$02
	ldx #$02
	jsr L_JSR_9956_99A5
	lda $993C
	sec
	sbc #$03
	sta $993C
	bcc L_BRS_99DA_99B1
	ldy #$00
	ldx #$02
	jsr L_JSR_9956_99B7
	ldy #$02
	ldx #$00
	jsr L_JSR_9956_99BE
	lda $993C
	sec
	sbc #$02
	sta $993C
	bcc L_BRS_99DA_99CA
	ldy #$00
	ldx #$01
	jsr L_JSR_9956_99D0
	ldy #$02
	ldx #$01
	jsr L_JSR_9956_99D7

L_BRS_99DA_9998:
L_BRS_99DA_99B1:
L_BRS_99DA_99CA:

	rts

L_JSR_99DB_9980:

	ldy #$02

L_BRS_99DD_9A0B:

	tya
	pha
	lda ($FB),Y
	sta $A3
	ldx #$02

L_BRS_99E5_9A06:

	txa
	pha
	lda $9937,X
	sta $A4
	jsr L_JSR_9423_99EC
	lda $A3
	asl
	and #$06
	sta $FF
	jsr L_JSR_993D_99F6
	lda $993B
	asl
	sta $993B
	jsr L_JSR_996A_9A00
	pla
	tax
	dex
	bpl L_BRS_99E5_9A06
	pla
	tay
	dey
	bpl L_BRS_99DD_9A0B
	rts

L_JMP_9A0E_9027:
L_JMP_9A0E_9BA2:

	lda $F9
	sta $993C
	lda #$99
	sta $FC
	lda #$31
	sta $FB
	jsr L_JSR_9980_9A1B
	lda $FA
	sta $993C
	lda #$99
	sta $FC
	lda #$34
	sta $FB
	jsr L_JSR_9980_9A2B
	rts
	.byte $00,$00,$00,$00,$00,$00

L_JSR_9A35_9B09:

	lda #$00
	sta $D015                          // Sprite display Enable
	jsr L_JSR_93CB_9A3A
	lda #$80
	sta $D418                          // Select Filter Mode and Volume
	lda #$81
	sta $D412                          // Voice 3: Control Register
	lda #$AA
	sta $D40E                          // Voice 3: Frequency Control - Low-Byte
	lda #$55
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	lda $D005                          // Sprite 2 Y Pos
	sta $9A32
	lda $D004                          // Sprite 2 X Pos
	sta $9A31
	lda $D007                          // Sprite 3 Y Pos
	sta $9A34
	lda $D006                          // Sprite 3 X Pos
	sta $9A33
	lda #$18
	sta $D004                          // Sprite 2 X Pos
	clc
	adc #$0A
	sta $D006                          // Sprite 3 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	sta $02
	ora #$0C
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda #$73
	sta $D005                          // Sprite 2 Y Pos
	sec
	sbc #$05
	sta $D007                          // Sprite 3 Y Pos
	jsr L_JSR_9AF6_9A89
	lda #$00
	sta $D025                          // Sprite Multi-Color Register 0
	lda #$01
	sta $D026                          // Sprite Multi-Color Register 1
	lda $D02A                          // Sprite 3 Color
	sta $9A30
	lda $D029                          // Sprite 2 Color
	sta $9A2F
	lda #$0C
	sta $D029                          // Sprite 2 Color
	sta $D02A                          // Sprite 3 Color
	lda #$0C
	sta $D015                          // Sprite display Enable
	rts

L_JMP_9AB0_9B7E:

	lda #$01
	sta $D015                          // Sprite display Enable
	lda $02
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda $9A30
	sta $D02A                          // Sprite 3 Color
	lda $9A2F
	sta $D029                          // Sprite 2 Color
	lda $9A32
	sta $D005                          // Sprite 2 Y Pos
	lda $9A31
	sta $D004                          // Sprite 2 X Pos
	lda $9A34
	sta $D007                          // Sprite 3 Y Pos
	lda $9A33
	sta $D006                          // Sprite 3 X Pos
	jsr L_JSR_93CB_9ADE
	lda #$FE
	sta $CFFA
	sta $CFFB
	rts

L_JSR_9AEA_9AF6:
L_JSR_9AEA_9AFF:
L_JSR_9AEA_9B8C:
L_JSR_9AEA_9B97:

	lda $D41B                          // Oscillator 3 Output

L_BRS_9AED_9AF3:

	cmp #$08
	bcc L_BRS_9AF5_9AEF
	sbc #$07
	bcs L_BRS_9AED_9AF3

L_BRS_9AF5_9AEF:

	rts

L_JSR_9AF6_9A89:
L_JSR_9AF6_9B0C:
L_JSR_9AF6_9B4F:

	jsr L_JSR_9AEA_9AF6
	clc
	adc #$26
	sta $CFFA
	jsr L_JSR_9AEA_9AFF
	clc
	adc #$26
	sta $CFFB
	rts

L_JMP_9B09_902A:

	jsr L_JSR_9A35_9B09

L_BRS_9B0C_9B46:
L_BRS_9B0C_9B4D:

	jsr L_JSR_9AF6_9B0C
	inc $D005                          // Sprite 2 Y Pos
	inc $D007                          // Sprite 3 Y Pos
	jsr L_JSR_9387_9B15
	lda $D004                          // Sprite 2 X Pos
	sec
	sbc #$04
	sta $D004                          // Sprite 2 X Pos
	bcs L_BRS_9B2B_9B21
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$FB
	sta $D010                          // Sprites 0-7 MSB of X coordinate

L_BRS_9B2B_9B21:

	lda $D006                          // Sprite 3 X Pos
	sec
	sbc #$04
	sta $D006                          // Sprite 3 X Pos
	bcs L_BRS_9B3E_9B34
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$F7
	sta $D010                          // Sprites 0-7 MSB of X coordinate

L_BRS_9B3E_9B34:

	jsr L_JSR_9B81_9B3E
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$04
	bne L_BRS_9B0C_9B46
	lda $D004                          // Sprite 2 X Pos
	cmp #$29
	bcs L_BRS_9B0C_9B4D

L_BRS_9B4F_9B71:

	jsr L_JSR_9AF6_9B4F
	inc $D005                          // Sprite 2 Y Pos
	inc $D007                          // Sprite 3 Y Pos
	jsr L_JSR_9387_9B58
	lda $D004                          // Sprite 2 X Pos
	clc
	adc #$04
	sta $D004                          // Sprite 2 X Pos
	adc #$0A
	sta $D006                          // Sprite 3 X Pos
	jsr L_JSR_9B81_9B69
	lda $D005                          // Sprite 2 Y Pos
	cmp #$D0
	bcc L_BRS_9B4F_9B71
	lda #$00
	sta $D015                          // Sprite display Enable
	sta $D418                          // Select Filter Mode and Volume
	jsr L_JSR_9B8C_9B7B
	jmp L_JMP_9AB0_9B7E

L_JSR_9B81_9B3E:
L_JSR_9B81_9B69:

	ldx #$25
	ldy #$00

L_BRS_9B85_9B86:
L_BRS_9B85_9B89:

	dey
	bne L_BRS_9B85_9B86
	dex
	bne L_BRS_9B85_9B89
	rts

L_JSR_9B8C_9B7B:
L_BRS_9B8C_9B91:

	jsr L_JSR_9AEA_9B8C
	cmp #$06
	bcs L_BRS_9B8C_9B91
	tax
	inx
	stx $F9

L_BRS_9B97_9B9C:

	jsr L_JSR_9AEA_9B97
	cmp #$06
	bcs L_BRS_9B97_9B9C
	tax
	inx
	stx $FA
	jmp L_JMP_9A0E_9BA2
	.byte $00,$00

L_JMP_9BA7_902D:

	jsr L_JSR_963D_9BA7
	ldy #$00
	ldx #$00
	jsr L_JSR_9427_9BAE
	ldx #$00

L_BRS_9BB3_9BEC:

	lda #$B8
	sta $FC
	lda #$00
	sta $FB
	lda $C000,X
	sta $02
	ldy #$07

L_BRS_9BC2_9BCA:

	clc
	adc $02
	bcc L_BRS_9BC9_9BC5
	inc $FC

L_BRS_9BC9_9BC5:

	dey
	bne L_BRS_9BC2_9BCA
	clc
	adc $FB
	sta $FB
	bcc L_BRS_9BD5_9BD1
	inc $FC

L_BRS_9BD5_9BD1:

	ldy #$07

L_BRS_9BD7_9BDC:

	lda ($FB),Y
	sta ($03),Y
	dey
	bpl L_BRS_9BD7_9BDC
	lda $03
	clc
	adc #$08
	sta $03
	bcc L_BRS_9BE9_9BE5
	inc $04

L_BRS_9BE9_9BE5:

	inx
	cpx #$28
	bcc L_BRS_9BB3_9BEC
	jsr L_JSR_9644_9BEE
	rts

L_JSR_9BF2_9C13:

	lda #$00
	ldx $FF
	beq L_BRS_9BFD_9BF6

L_BRS_9BF8_9BFB:

	sec
	ror
	dex
	bne L_BRS_9BF8_9BFB

L_BRS_9BFD_9BF6:

	sta $9BA5
	eor #$FF
	lsr
	lsr
	sta $9BA6
	rts

L_JMP_9C08_9036:

	ldy $A4
	sty $02
	lda $A3
	asl
	and #$06
	sta $FF
	jsr L_JSR_9BF2_9C13
	ldx #$07

L_BRS_9C18_9C3A:

	txa
	pha
	jsr L_JSR_9423_9C1A
	ldy #$00
	jsr L_JSR_9630_9C1F
	lda ($03),Y
	and $9BA5
	sta ($03),Y
	ldy #$08
	lda ($03),Y
	and $9BA6
	sta ($03),Y
	jsr L_JSR_9644_9C32
	inc $A4
	pla
	tax
	dex
	bpl L_BRS_9C18_9C3A
	rts
	.byte $00,$02,$60,$CE,$60,$32,$60,$32
	.byte $60,$FE,$60,$32,$60,$32,$60,$CE
	.byte $60,$80,$98,$B3,$98,$8C,$98,$8C
	.byte $98,$BF,$98,$8C,$98,$8C,$98,$B3
	.byte $98,$60,$26,$6C,$E6,$63,$26,$63
	.byte $26,$6F,$E6,$63,$26,$63,$26,$6C
	.byte $E6,$98,$09,$9B,$39,$98,$C9,$98
	.byte $C9,$9B,$F9,$98,$C9,$98,$C9,$9B
	.byte $39,$00

L_JMP_9C7F_9030:

	jsr L_JSR_9D28_9C7F
	lda #$1A
	ldy $FF
	ldx #$00
	cpy #$05
	bne L_BRS_9C8E_9C8A
	ldx #$01

L_BRS_9C8E_9C8A:

	stx $9C3D
	cpy #$00
	beq L_BRS_9C9B_9C93

L_BRS_9C95_9C99:

	clc
	adc #$06
	dey
	bne L_BRS_9C95_9C99

L_BRS_9C9B_9C93:

	sta $A3
	sta $9C7E
	pha
	jsr L_JSR_9D0C_9CA1
	pla
	sta $A3

L_BRS_9CA7_9D09:

	pha
	ldy #$1D
	sty $A4
	jsr L_JSR_9423_9CAC
	lda #$9C
	sta $FC
	lda #$3E
	sta $FB
	pla
	pha
	and #$03
	sta $02
	ldx #$10
	jsr L_JSR_9654_9CBF
	lda $FC
	sta $9CDC
	lda $FB
	sta $9CDB
	lda $FC
	sta $9CE9
	lda $FB
	sta $9CE8
	ldx #$00

L_BRS_9CD8_9CF8:

	ldy #$00
	lda $9C3E,X
	sta ($03),Y
	inx
	lda $9C3D
	bne L_BRS_9CEC_9CE3
	ldy #$08
	lda $9C3E,X
	sta ($03),Y

L_BRS_9CEC_9CE3:

	inc $A4
	inx
	txa
	pha
	jsr L_JSR_9423_9CF1
	pla
	tax
	cpx #$10
	bcc L_BRS_9CD8_9CF8
	pla
	cmp #$4B
	bcs L_BRS_9D0B_9CFD
	clc
	adc #$4B
	sta $A3
	ldy #$00
	sty $9C3D
	bcc L_BRS_9CA7_9D09

L_BRS_9D0B_9CFD:

	rts

L_JSR_9D0C_9CA1:

	lda #$00
	sta $02
	lda #$1D
	sta $A4
	jsr L_JSR_966A_9D14
	inc $02
	lda $A3
	clc
	adc #$4B
	sta $A3
	lda #$1D
	sta $A4
	jsr L_JSR_966A_9D24
	rts

L_JMP_9D28_9042:
L_JSR_9D28_9C7F:

	lda $9C7E
	beq L_BRS_9D4D_9D2B
	sta $A3
	ldy #$1D
	sty $A4
	lda #$00
	sta $02
	sta $9C7E
	jsr L_JSR_9697_9D3A
	inc $02
	ldy #$1D
	sty $A4
	lda $A3
	clc
	adc #$4B
	sta $A3
	jsr L_JSR_9697_9D4A

L_BRS_9D4D_9D2B:

	rts

L_JMP_9D4E_9033:
L_JSR_9D4E_9293:

	lda $D000                          // Sprite 0 X Pos
	sta $D002                          // Sprite 1 X Pos
	lda $D001                          // Sprite 0 Y Pos
	sta $D003                          // Sprite 1 Y Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	lsr
	php
	php
	lsr
	plp
	rol
	plp
	rol
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	rts

L_JMP_9D69_9039:

	lda #$D8
	sta $FC
	lda #$00
	sta $FB
	lda #$C5
	sta $FE
	lda #$80
	sta $FD
	lda #$03
	ldx #$E8
	jmp L_JMP_92DE_9D7D

L_JMP_9D80_903C:

	lda #$C5
	sta $FC
	lda #$80
	sta $FB
	lda #$D8
	sta $FE
	lda #$00
	sta $FD
	lda #$03
	ldx #$E8
	jmp L_JMP_92DE_9D94

L_JMP_9D97_903F:
L_BRS_9D97_9D9A:

	ldy $D011                          // Control Register 1
	bpl L_BRS_9D97_9D9A
	lda $D015                          // Sprite display Enable
	and #$F0
	ora $02
	sta $D015                          // Sprite display Enable
	rts
