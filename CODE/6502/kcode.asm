	jmp L_JMP_904C_9000
	jmp L_JMP_9090_9003
	jmp L_JMP_9290_9006
	jmp L_JMP_92AE_9009
	jmp L_JMP_94EA_900C
	jmp L_JMP_986D_900F
	jmp L_JMP_9BA0_9012
	jmp L_JMP_9BB7_9015
	jmp L_JMP_9966_9018
	jmp L_JMP_9BEC_901B
	jmp L_JMP_9B85_901E
	jmp L_JMP_9E37_9021
	jmp L_JMP_9BD9_9024
	jmp L_JMP_95C0_9027
	jmp L_JMP_9F5E_902A
	.byte $81,$7F,$59,$7F,$0C,$98,$D1,$7F
	.byte $E5,$7F,$42,$90,$FF,$7F,$F9,$14
	.byte $3A,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00

L_JMP_904C_9000:
L_JMP_904C_9DD2:

	jsr L_JSR_9235_904C

L_BRS_904F_9052:

	lda $D011                          // Control Register 1
	bpl L_BRS_904F_9052
	sei 
	lda #$7F
	sta $DC0D                          // Interrupt (IRQ) Control Register
	jsr L_JSR_90BC_905A
	lda $D01A                          // Interrupt Mask Register (IMR)
	ora #$01
	sta $D01A                          // Interrupt Mask Register (IMR)
	ldx #$00
	stx $903E 
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $903B,X 
	sta $D012                          // Raster Position
	lda $0315 
	sta $9040 
	lda $0314 
	sta $903F 
	lda #$90
	sta $0315 
	lda #$E0
	sta $0314 
	cli 
	rts 

L_JMP_9090_9003:
L_BRS_9090_9093:
L_JSR_9090_9D14:

	lda $D011                          // Control Register 1
	bpl L_BRS_9090_9093
	sei 
	lda $D01A                          // Interrupt Mask Register (IMR)
	and #$FE
	sta $D01A                          // Interrupt Mask Register (IMR)
	lda $D016                          // Control Register 2
	and #$EF
	sta $D016                          // Control Register 2
	lda #$81
	sta $DC0D                          // Interrupt (IRQ) Control Register
	lda $9040 
	sta $0315 
	lda $903F 
	sta $0314 
	cli 
	jsr L_JSR_924E_90B8
	rts 

L_JSR_90BC_905A:

	lda $01 
	and #$FB
	sta $01 
	lda #$D0
	sta $FC 
	lda #$00
	sta $FB 
	lda #$C0
	sta $FE 
	lda #$00
	sta $FD 
	ldx #$00
	lda #$08
	jsr L_JSR_925D_90D6
	lda $01 
	ora #$04
	sta $01 
	rts 
	ldy $903E 
	beq L_BRS_90FB_90E3
	cpy #$02
	bcc L_BRS_90F3_90E7
	lda $D016                          // Control Register 2
	ora #$10
	sta $D016                          // Control Register 2
	bcs L_BRS_90FB_90F1

L_BRS_90F3_90E7:

	lda $D016                          // Control Register 2
	and #$EF
	sta $D016                          // Control Register 2

L_BRS_90FB_90E3:
L_BRS_90FB_90F1:

	iny 
	cpy #$03
	bcc L_BRS_9102_90FE
	ldy #$00

L_BRS_9102_90FE:

	sty $903E 
	lda $903B,Y 
	sta $D012                          // Raster Position
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $D019                          // Interrupt Request Register (IRR)
	ora #$01
	sta $D019                          // Interrupt Request Register (IRR)
	cpy #$01
	bne L_BRS_9122_911D
	jmp ($903F) 

L_BRS_9122_911D:
L_JMP_9122_9C4A:

	pla 
	tay 
	pla 
	tax 
	pla 
	rti 
	lda $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	and #$1F
	sta $9041 
	lda $9041 
	and #$01
	bne L_BRS_9146_9135
	dec $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$3A
	bcs L_BRS_9146_913F
	ldx #$3A
	stx $D001                          // Sprite 0 Y Pos

L_BRS_9146_9135:
L_BRS_9146_913F:

	lda $9041 
	and #$02
	bne L_BRS_915C_914B
	inc $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$EE
	bcc L_BRS_915C_9155
	ldx #$ED
	stx $D001                          // Sprite 0 Y Pos

L_BRS_915C_914B:
L_BRS_915C_9155:

	lda $9041 
	and #$04
	bne L_BRS_9183_9161
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	beq L_BRS_917C_916B
	cpy #$00
	bne L_BRS_9180_916F
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$FE
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_9180_917A

L_BRS_917C_916B:

	cpy #$19
	bcc L_BRS_9183_917E

L_BRS_9180_916F:
L_BRS_9180_917A:

	dec $D000                          // Sprite 0 X Pos

L_BRS_9183_9161:
L_BRS_9183_917E:

	lda $9041 
	and #$08
	bne L_BRS_91AA_9188
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_91A3_9192
	cpy #$FF
	bne L_BRS_91A7_9196
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ora #$01
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_91A7_91A1

L_BRS_91A3_9192:

	cpy #$4B
	bcs L_BRS_91AA_91A5

L_BRS_91A7_9196:
L_BRS_91A7_91A1:

	inc $D000                          // Sprite 0 X Pos

L_BRS_91AA_9188:
L_BRS_91AA_91A5:

	lda $9041 
	and #$10
	bne L_BRS_91F8_91AF
	lda $9042 
	bne L_BRS_91F2_91B4
	lda $7FFF 
	beq L_BRS_91C3_91B9
	jsr L_JSR_9B82_91BB
	lda #$00
	sta $7FFF 

L_BRS_91C3_91B9:

	lda $D01E                          // Sprite to Sprite Collision Detect
	lsr 
	beq L_BRS_9210_91C7
	bcc L_BRS_9210_91C9
	ldx #$00

L_BRS_91CD_91CF:

	inx 
	lsr 
	bcc L_BRS_91CD_91CF
	lda $9043 
	bne L_BRS_91EF_91D4
	lda #$01
	sta $D015                          // Sprite display Enable
	lda $D027,X                          // Sprite 0 Color
	sta $D028                          // Sprite 1 Color
	inc $9043 
	lda $D015                          // Sprite display Enable
	ora #$02
	sta $D015                          // Sprite display Enable
	jsr L_JSR_92CE_91EC

L_BRS_91EF_91D4:

	jsr L_JSR_9B85_91EF

L_BRS_91F2_91B4:
L_BRS_91F2_9200:
L_JMP_91F2_920D:
L_BRS_91F2_9213:
L_BRS_91F2_921A:
L_BRS_91F2_921E:
L_BRS_91F2_9222:
L_BRS_91F2_9226:
L_BRS_91F2_922A:
L_JMP_91F2_9232:

	lda $D01E                          // Sprite to Sprite Collision Detect
	jmp ($9045) 

L_BRS_91F8_91AF:

	lda #$00
	sta $904B 
	lda $9043 
	beq L_BRS_91F2_9200
	ldy #$00
	sty $9043 
	jsr L_JSR_99AB_9207
	jsr L_JSR_92CE_920A
	jmp L_JMP_91F2_920D

L_BRS_9210_91C7:
L_BRS_9210_91C9:

	lda $904B 
	bne L_BRS_91F2_9213
	jsr L_JSR_935E_9215
	ldx $A3 
	beq L_BRS_91F2_921A
	ldy $A4 
	beq L_BRS_91F2_921E
	cpx #$0B
	bcs L_BRS_91F2_9222
	cpy #$0A
	bcs L_BRS_91F2_9226
	cpy #$05
	beq L_BRS_91F2_922A
	inc $9044 
	inc $904B 
	jmp L_JMP_91F2_9232

L_JSR_9235_904C:

	sei 
	lda $0315 
	sta $9046 
	lda $0314 
	sta $9045 
	lda #$91
	sta $0315 
	lda #$28
	sta $0314 
	cli 
	rts 

L_JSR_924E_90B8:

	sei 
	lda $9046 
	sta $0315 
	lda $9045 
	sta $0314 
	cli 
	rts 

L_JSR_925D_90D6:
L_JSR_925D_9699:
L_JSR_925D_96B0:
L_JSR_925D_96C7:
L_JSR_925D_96DE:
L_JSR_925D_96F5:
L_JSR_925D_9725:
L_JSR_925D_973C:
L_JSR_925D_9753:
L_JMP_925D_9BB4:
L_JMP_925D_9BCB:
L_JSR_925D_9D58:
L_JSR_925D_9D6F:
L_JSR_925D_9D86:

	sta $926D 
	stx $928C 
	ldy #$00
	cmp #$00
	beq L_BRS_9282_9267
	clc 
	lda $FC 
	adc #$00
	sta $927F 

L_BRS_9271_9276:
L_BRS_9271_9280:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	bne L_BRS_9271_9276
	inc $FC 
	inc $FE 
	lda $FC 
	cmp #$00
	bcc L_BRS_9271_9280

L_BRS_9282_9267:

	cpx #$00
	beq L_BRS_928F_9284

L_BRS_9286_928D:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	cpy #$40
	bcc L_BRS_9286_928D

L_BRS_928F_9284:

	rts 

L_JMP_9290_9006:
L_JMP_9290_9759:

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

L_JMP_92AE_9009:

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

L_JSR_92CE_91EC:
L_JSR_92CE_920A:

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

L_JSR_930E_9CB8:

	lda #$27
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	lda #$DF
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	lda #$78
	sta $D416                          // Filter Cutoff Frequency: High-Byte
	lda #$01
	sta $D417                          // Filter Resonance Control / Voice Input Control
	lda #$14
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	lda #$21
	sta $D406                          // Voice 1: Sustain / Release Cycle Control
	lda #$DF
	sta $D418                          // Select Filter Mode and Volume
	lda #$10
	sta $D404                          // Voice 1: Control Register
	lda #$11
	sta $D404                          // Voice 1: Control Register
	rts 

L_JMP_933C_9CAB:

	ldy #$18
	lda #$00

L_BRS_9340_9344:

	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	dey 
	bpl L_BRS_9340_9344
	rts 
	.byte $1C,$28,$34,$40,$4C,$58,$64,$70
	.byte $7C,$88,$94,$FF,$30,$40,$50,$60
	.byte $70,$88,$98,$A8,$B8,$C8,$FF

L_JSR_935E_9215:

	lda $D010                          // Sprites 0-7 MSB of X coordinate
	lsr 
	lda $D000                          // Sprite 0 X Pos
	ror 
	sec 
	sbc #$08
	ldx #$00

L_BRS_936B_9371:

	cmp $9347,X 
	bcc L_BRS_9373_936E
	inx 
	bne L_BRS_936B_9371

L_BRS_9373_936E:

	stx $A3 
	lda $D001                          // Sprite 0 Y Pos
	sec 
	sbc #$2D
	ldy #$00

L_BRS_937D_9383:

	cmp $9353,Y 
	bcc L_BRS_9385_9380
	iny 
	bne L_BRS_937D_9383

L_BRS_9385_9380:

	sty $A4 
	rts 

L_JSR_9388_9912:
L_JSR_9388_993B:
L_JSR_9388_9955:
L_JSR_9388_9A73:
L_JSR_9388_9AA4:
L_JSR_9388_9ADA:
L_JSR_9388_9AFB:

	lda #$A0
	sta $04 
	lda #$00
	sta $03 
	ldx $A3 
	ldy $A4 
	clv
	bvc L_BRS_93A3_9395

L_JSR_9397_947F:
L_JSR_9397_94A4:

	ldx $A3 
	ldy $A4 

L_JSR_939B_996A:

	lda #$E0
	sta $04 
	lda #$00
	sta $03 

L_BRS_93A3_9395:

	tya 
	pha 
	and #$F8
	sta $93AE 
	ldy #$27

L_BRS_93AC_93B4:

	clc 
	adc #$00
	bcc L_BRS_93B3_93AF
	inc $04 

L_BRS_93B3_93AF:

	dey 
	bne L_BRS_93AC_93B4
	sta $03 
	pla 
	and #$07
	clc 
	adc $03 
	sta $03 
	bcc L_BRS_93C4_93C0
	inc $04 

L_BRS_93C4_93C0:

	txa 
	asl 
	bcc L_BRS_93CA_93C6
	inc $04 

L_BRS_93CA_93C6:

	clc 
	and #$F8
	adc $03 
	sta $03 
	bcc L_BRS_93D5_93D1
	inc $04 

L_BRS_93D5_93D1:

	rts 

L_JSR_93D6_9F1E:

	lda #$8C
	sta $06 
	lda #$00
	sta $05 
	clv
	bvc L_BRS_93ED_93DF

L_JSR_93E1_95E8:
L_JSR_93E1_9B6E:
L_JSR_93E1_9F6F:

	ldx $A3 
	ldy $A4 
	lda #$CC
	sta $06 
	lda #$00
	sta $05 

L_BRS_93ED_93DF:

	tya 
	lsr 
	lsr 
	lsr 
	beq L_BRS_9402_93F1
	tay 

L_BRS_93F4_9400:

	lda #$28
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_93FF_93FB
	inc $06 

L_BRS_93FF_93FB:

	dey 
	bne L_BRS_93F4_9400

L_BRS_9402_93F1:

	txa 
	lsr 
	lsr 
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_940E_940A
	inc $06 

L_BRS_940E_940A:

	rts 

L_JSR_940F_98AD:

	sty $9416 
	lda $FB 
	clc 
	adc #$00
	sta $FD 

L_BRS_9419_9438:

	ldy #$01
	lda ($FB),Y 
	ror 
	ldx #$01
	ldy #$00

L_BRS_9422_9429:

	lda ($FB),Y 
	ror 
	sta ($FB),Y 
	iny 
	dex 
	bpl L_BRS_9422_9429
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_9436_9432
	inc $FC 

L_BRS_9436_9432:

	cmp $FD 
	bne L_BRS_9419_9438
	rts 

L_JSR_943B_98C8:

	sty $9442 
	lda $FB 
	clc 
	adc #$00
	sta $FD 

L_BRS_9445_9461:

	ldy #$00
	lda ($FB),Y 
	rol 
	ldy #$01

L_BRS_944C_9452:

	lda ($FB),Y 
	rol 
	sta ($FB),Y 
	dey 
	bpl L_BRS_944C_9452
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_945F_945B
	inc $FC 

L_BRS_945F_945B:

	cmp $FD 
	bne L_BRS_9445_9461
	rts 

L_JSR_9464_9867:

	sty $949D 
	lda $9048 
	sta $948D 
	lda $9047 
	sta $948C 
	lda $904A 
	sta $9490 
	lda $9049 
	sta $948F 
	jsr L_JSR_9397_947F
	ldx #$00

L_BRS_9484_94AD:

	ldy #$00

L_BRS_9486_949E:

	jsr L_JSR_94B8_9486
	lda ($03),Y 
	and $97FC,X 
	ora $975C,X
	sta ($03),Y 
	jsr L_JSR_94CC_9493
	tya 
	clc 
	adc #$08
	tay 
	inx 
	cpy #$11
	bcc L_BRS_9486_949E
	txa 
	pha 
	inc $A4 
	jsr L_JSR_9397_94A4
	pla 
	tax 
	dec $A5 
	lda $A5 
	bne L_BRS_9484_94AD
	rts 

L_JSR_94B0_9871:

	lda $A3 
	asl 
	and #$06
	sta $FF 
	rts 

L_JSR_94B8_9486:
L_BRS_94B8_94BB:

	lda $D011                          // Control Register 1
	bpl L_BRS_94B8_94BB
	sei 
	lda $01 
	and #$FC
	sta $01 
	rts 

L_JSR_94C5_9682:
L_JSR_94C5_970E:
L_JSR_94C5_9A76:

	lda $01 
	and #$FE
	sta $01 
	rts 

L_JSR_94CC_9493:
L_JSR_94CC_96F8:
L_JSR_94CC_9756:
L_JMP_94CC_9ABB:

	lda $01 
	ora #$03
	sta $01 
	cli 
	rts 

L_JSR_94D4_9837:
L_JSR_94D4_9905:
L_JSR_94D4_992E:
L_JSR_94D4_9A97:
L_JSR_94D4_9AB5:

	stx $94DF 
	ldy $02 
	beq L_BRS_94E9_94D9
	lda $FB 

L_BRS_94DD_94E5:

	clc 
	adc #$00
	bcc L_BRS_94E4_94E0
	inc $FC 

L_BRS_94E4_94E0:

	dey 
	bne L_BRS_94DD_94E5
	sta $FB 

L_BRS_94E9_94D9:

	rts 

L_JMP_94EA_900C:

	jsr $FFE7                         // Close All Channels And Files
	ldy #$A7
	lda #$00

L_BRS_94F1_94F5:

	sta $7F58,Y 
	dey 
	bne L_BRS_94F1_94F5
	lda #$91
	sta $0317 
	lda #$22
	sta $0316 
	lda #$91
	sta $0319 
	lda #$27
	sta $0318 
	lda #$EA
	sta $0328 
	lda #$00
	jsr $FF90                         // Control OS Messages
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$04
	ldx #$7E
	ldy #$96
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_970E_9530
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$05
	ldx #$72
	ldy #$96
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_9682_954E
	lda #$00
	jsr $FF90                         // Control OS Messages
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$04
	ldx #$6E
	ldy #$96
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$40
	ldy #$BF
	jsr $FFD5                         // Load RAM From Device
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$03
	ldx #$6E
	ldy #$96
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$40
	ldy #$FF
	jsr $FFD5                         // Load RAM From Device
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$07
	ldx #$77
	ldy #$96
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$20
	ldy #$84
	jsr $FFD5                         // Load RAM From Device
	jsr $FFE7                         // Close All Channels And Files
	ldx #$FF
	stx $8FFF 
	stx $8FFE 
	stx $8FFD 
	dex 
	txa 
	ldy #$04

L_BRS_95B9_95BD:

	sta $8FF8,Y 
	dey 
	bpl L_BRS_95B9_95BD
	rts 

L_JMP_95C0_9027:

	ldx $A3 
	ldy $A4 
	txa 
	pha 
	tya 
	pha 
	lda #$20
	dex 
	beq L_BRS_95D3_95CB
	clc 

L_BRS_95CE_95D1:

	adc #$0C
	dex 
	bne L_BRS_95CE_95D1

L_BRS_95D3_95CB:

	sta $A3 
	lda #$38
	cpy #$06
	bcc L_BRS_95DD_95D9
	lda #$40

L_BRS_95DD_95D9:

	dey 
	beq L_BRS_95E6_95DE
	clc 

L_BRS_95E1_95E4:

	adc #$10
	dey 
	bne L_BRS_95E1_95E4

L_BRS_95E6_95DE:

	sta $A4 
	jsr L_JSR_93E1_95E8
	ldy #$00
	ldx $7FE5 
	cpx #$0F
	bcc L_BRS_9601_95F2
	lda ($05),Y 
	and #$F0
	cmp #$90
	bne L_BRS_9601_95FA
	pla 
	pla 
	clv
	bvc L_BRS_9638_95FF

L_BRS_9601_95F2:
L_BRS_9601_95FA:

	lda ($05),Y 
	eor #$80
	sta ($05),Y 
	and #$F0
	cmp #$90
	beq L_BRS_9613_960B
	jsr L_JSR_963E_960D
	clv
	bvc L_BRS_9616_9611

L_BRS_9613_960B:

	jsr L_JSR_9656_9613

L_BRS_9616_9611:

	pla 
	tay 
	pla 
	tax 
	cpy #$06
	bcc L_BRS_961F_961C
	dey 

L_BRS_961F_961C:

	lda #$00
	dey 
	beq L_BRS_962A_9622
	clc 

L_BRS_9625_9628:

	adc #$0A
	dey 
	bne L_BRS_9625_9628

L_BRS_962A_9622:

	tay 

L_BRS_962B_962D:

	iny 
	dex 
	bne L_BRS_962B_962D
	dey 
	lda $7F81,Y 
	eor #$01
	sta $7F81,Y 

L_BRS_9638_95FF:

	lda #$00
	sta $9044 
	rts 

L_JSR_963E_960D:

	inc $7FE5 
	inc $7F7F 
	lda $7F7F 
	cmp #$3A
	bcc L_BRS_9653_9649
	inc $7F7E 
	lda #$30
	sta $7F7F 

L_BRS_9653_9649:

	jmp L_JMP_9966_9653

L_JSR_9656_9613:

	dec $7FE5 
	dec $7F7F 
	lda $7F7F 
	cmp #$30
	bcs L_BRS_966B_9661
	dec $7F7E 
	lda #$39
	sta $7F7F 

L_BRS_966B_9661:

	jmp L_JMP_9966_966B
	.byte $41,$52,$52,$33,$4D,$49,$58,$45
	.byte $52,$4B,$45,$4E,$4F,$44,$41,$54
	.byte $4B,$45,$4E,$4F

L_JSR_9682_954E:

	jsr L_JSR_94C5_9682
	lda #$A0
	sta $FC 
	lda #$00
	sta $FB 
	lda #$A0
	sta $FE 
	lda #$00
	sta $FD 
	lda #$1F
	ldx #$40
	jsr L_JSR_925D_9699
	lda #$BF
	sta $FC 
	lda #$40
	sta $FB 
	lda #$8C
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jsr L_JSR_925D_96B0
	lda #$C3
	sta $FC 
	lda #$38
	sta $FB 
	lda #$80
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jsr L_JSR_925D_96C7
	lda #$A1
	sta $FC 
	lda #$40
	sta $FB 
	lda #$85
	sta $FE 
	lda #$C0
	sta $FD 
	lda #$06
	ldx #$40
	jsr L_JSR_925D_96DE
	lda #$BF
	sta $FC 
	lda #$68
	sta $FB 
	lda #$84
	sta $FE 
	lda #$F8
	sta $FD 
	lda #$00
	ldx #$C8
	jsr L_JSR_925D_96F5
	jsr L_JSR_94CC_96F8
	lda #$FF
	ldy #$05

L_BRS_96FF_9703:

	sta $8FF8,Y 
	dey 
	bpl L_BRS_96FF_9703
	lda #$FE
	sta $8FFE 
	sta $8FFF 
	rts 

L_JSR_970E_9530:

	jsr L_JSR_94C5_970E
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
	jsr L_JSR_925D_9725
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
	jsr L_JSR_925D_973C
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
	jsr L_JSR_925D_9753
	jsr L_JSR_94CC_9756
	jmp L_JMP_9290_9759
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

L_JSR_9817_9845:

	lda #$00
	ldx $FF 
	beq L_BRS_9822_981B

L_BRS_981D_9820:

	sec 
	ror 
	dex 
	bne L_BRS_981D_9820

L_BRS_9822_981B:

	ldy #$0F

L_BRS_9824_982A:

	eor #$FF
	sta $97FC,Y 
	dey 
	bpl L_BRS_9824_982A
	rts 

L_JSR_982D_9881:

	lda #$97
	sta $FC 
	lda #$5C
	sta $FB 
	ldx #$10
	jsr L_JSR_94D4_9837
	lda $FC 
	sta $9816 
	lda $FB 
	sta $9815 
	rts 

L_JSR_9845_9884:

	jsr L_JSR_9817_9845
	lda $9816 
	sta $904A 
	lda $9815 
	sta $9049 
	lda #$97
	sta $9048 
	lda #$FC
	sta $9047 
	jsr L_JSR_989B_985E
	ldy #$08
	sty $A5 
	ldy #$09
	jsr L_JSR_9464_9867
	jmp L_JMP_98B6_986A

L_JMP_986D_900F:

	lda #$64
	sta $A3 
	jsr L_JSR_94B0_9871
	ldy #$00

L_BRS_9876_9898:

	lda #$20
	sta $A4 
	tya 
	pha 
	lda $980C,Y 
	sta $02 
	jsr L_JSR_982D_9881
	jsr L_JSR_9845_9884
	lda $A3 
	clc 
	adc #$05
	sta $A3 
	asl 
	and #$06
	sta $FF 
	pla 
	tay 
	iny 
	cpy #$09
	bcc L_BRS_9876_9898
	rts 

L_JSR_989B_985E:

	ldx $FF 
	beq L_BRS_98B5_989D

L_BRS_989F_98B3:

	txa 
	pha 
	ldy #$10
	lda $9816 
	sta $FC 
	lda $9815 
	sta $FB 
	jsr L_JSR_940F_98AD
	pla 
	tax 
	dex 
	bne L_BRS_989F_98B3

L_BRS_98B5_989D:

	rts 

L_JMP_98B6_986A:

	ldx $FF 
	beq L_BRS_98D0_98B8

L_BRS_98BA_98CE:

	txa 
	pha 
	ldy #$10
	lda $9816 
	sta $FC 
	lda $9815 
	sta $FB 
	jsr L_JSR_943B_98C8
	pla 
	tax 
	dex 
	bne L_BRS_98BA_98CE

L_BRS_98D0_98B8:

	rts 
	.byte $00,$00,$1C,$A0,$74,$A0

L_JSR_98D7_9C05:

	dec $98D1 
	bne L_BRS_9941_98DA
	lda $7FFE 
	beq L_BRS_98E7_98DF
	inc $98D1 
	clv
	bvc L_BRS_9941_98E5

L_BRS_98E7_98DF:

	lda #$14
	sta $98D1 
	ldy $98D2 
	iny 
	cpy #$03
	bcc L_BRS_98F6_98F2
	ldy #$00

L_BRS_98F6_98F2:

	sty $98D2 
	sty $02 
	lda #$84
	sta $FC 
	lda #$20
	sta $FB 
	ldx #$48
	jsr L_JSR_94D4_9905
	lda $98D4 
	sta $A4 
	lda $98D3 
	sta $A3 
	jsr L_JSR_9388_9912
	jsr L_JSR_9942_9915
	ldy $98D2 
	iny 
	cpy #$03
	bcc L_BRS_9922_991E
	ldy #$00

L_BRS_9922_991E:

	sty $02 
	lda #$84
	sta $FC 
	lda #$20
	sta $FB 
	ldx #$48
	jsr L_JSR_94D4_992E
	lda $98D6 
	sta $A4 
	lda $98D5 
	sta $A3 
	jsr L_JSR_9388_993B
	jsr L_JSR_9942_993E

L_BRS_9941_98DA:
L_BRS_9941_98E5:

	rts 

L_JSR_9942_9915:
L_JSR_9942_993E:

	lda #$02

L_BRS_9944_9963:

	pha 
	ldy #$17

L_BRS_9947_994C:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_9947_994C
	lda $A4 
	clc 
	adc #$08
	sta $A4 
	jsr L_JSR_9388_9955
	lda $FB 
	clc 
	adc #$18
	sta $FB 
	pla 
	tax 
	dex 
	txa 
	bpl L_BRS_9944_9963
	rts 

L_JMP_9966_9018:
L_JMP_9966_9653:
L_JMP_9966_966B:
L_JMP_9966_9F91:

	ldy #$00
	ldx #$00
	jsr L_JSR_939B_996A
	ldx #$00

L_BRS_996F_99A8:

	lda #$C0
	sta $FC 
	lda #$00
	sta $FB 
	lda $7F59,X 
	sta $A5 
	ldy #$07

L_BRS_997E_9986:

	clc 
	adc $A5 
	bcc L_BRS_9985_9981
	inc $FC 

L_BRS_9985_9981:

	dey 
	bne L_BRS_997E_9986
	clc 
	adc $FB 
	sta $FB 
	bcc L_BRS_9991_998D
	inc $FC 

L_BRS_9991_998D:

	ldy #$07

L_BRS_9993_9998:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_9993_9998
	lda $03 
	clc 
	adc #$08
	sta $03 
	bcc L_BRS_99A5_99A1
	inc $04 

L_BRS_99A5_99A1:

	inx 
	cpx #$28
	bcc L_BRS_996F_99A8
	rts 

L_JSR_99AB_9207:

	lda #$01
	sta $9042 
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_99D8_99B5
	ldx $D002                          // Sprite 1 X Pos
	ldy $D003                          // Sprite 1 Y Pos
	cpx #$1E
	bcc L_BRS_99D8_99BF
	cpx #$32
	bcs L_BRS_99D8_99C3
	cpy #$CD
	bcc L_BRS_99D8_99C7
	cpy #$DC
	bcs L_BRS_99D8_99CB
	lda $D028                          // Sprite 1 Color
	sta $DB21 
	sta $DB22 
	bne L_BRS_99E3_99D6

L_BRS_99D8_99B5:
L_BRS_99D8_99BF:
L_BRS_99D8_99C3:
L_BRS_99D8_99C7:
L_BRS_99D8_99CB:

	lda #$07
	sta $D028                          // Sprite 1 Color
	sta $DB21 
	sta $DB22 

L_BRS_99E3_99D6:

	lda $D015                          // Sprite display Enable
	and #$FD
	sta $D015                          // Sprite display Enable
	rts 
	.byte $FC,$FC,$FC,$FC,$FC,$FC,$0F,$CF
	.byte $CF,$CF,$CF,$0F,$FF,$FC,$FF,$FF
	.byte $FF,$FC,$3F,$3F,$3F,$3F,$3F,$0F
	.byte $FC,$FF,$FC,$FC,$FC,$FC,$0F,$CF
	.byte $0F,$FF,$FF,$0F,$FC,$FF,$FC,$FF
	.byte $FF,$FC,$0F,$CF,$0F,$CF,$CF,$0F
	.byte $FC,$FC,$FC,$FF,$FF,$FF,$CF,$CF
	.byte $0F,$CF,$CF,$CF,$FC,$FC,$FC,$FF
	.byte $FF,$FC,$0F,$FF,$0F,$CF,$CF,$0F
	.byte $FC,$FC,$FC,$FC,$FC,$FC,$0F,$FF
	.byte $0F,$CF,$CF,$0F,$FC,$FF,$FF,$FF
	.byte $FF,$FF,$0F,$CF,$3F,$3F,$3F,$3F
	.byte $FC,$FC,$FC,$FC,$FC,$FC,$0F,$CF
	.byte $0F,$CF,$CF,$0F,$FC,$FC,$FC,$FF
	.byte $FF,$FC,$0F,$CF,$0F,$CF,$CF,$0F

L_JMP_9A64_9F33:

	ldy $A5 
	lda $9F36,Y 
	sta $A3 
	lda $9F4A,Y 
	clc 
	adc #$05
	sta $A4 
	jsr L_JSR_9388_9A73
	jsr L_JSR_94C5_9A76
	ldy $A5 
	lda $7FD1,Y 
	ldy #$00
	sec 

L_BRS_9A81_9A84:

	sbc #$0A
	iny 
	bcs L_BRS_9A81_9A84
	dey 
	sty $02 
	adc #$0A
	sta $F9 
	lda #$99
	sta $FC 
	lda #$EC
	sta $FB 
	ldx #$0C
	jsr L_JSR_94D4_9A97
	jsr L_JSR_9ABE_9A9A
	lda $A3 
	sec 
	sbc #$04
	sta $A3 
	jsr L_JSR_9388_9AA4
	lda $F9 
	sta $02 
	lda #$99
	sta $FC 
	lda #$EC
	sta $FB 
	ldx #$0C
	jsr L_JSR_94D4_9AB5
	jsr L_JSR_9ABE_9AB8
	jmp L_JMP_94CC_9ABB

L_JSR_9ABE_9A9A:
L_JSR_9ABE_9AB8:

	lda $FC 
	sta $9AD3 
	lda $FB 
	sta $9AD2 
	lda #$01

L_BRS_9ACA_9B02:

	pha 
	ldx #$05

L_BRS_9ACD_9AE8:

	ldy #$00
	lda ($03),Y 
	and $99EC 
	sta ($03),Y 
	inc $A4 
	txa 
	pha 
	jsr L_JSR_9388_9ADA
	inc $9AD2 
	bne L_BRS_9AE5_9AE0
	inc $9AD3 

L_BRS_9AE5_9AE0:

	pla 
	tax 
	dex 
	bpl L_BRS_9ACD_9AE8
	lda $A3 
	clc 
	adc #$04
	sta $A3 
	ldy $A5 
	lda $9F4A,Y 
	clc 
	adc #$05
	sta $A4 
	jsr L_JSR_9388_9AFB
	pla 
	tax 
	dex 
	txa 
	bpl L_BRS_9ACA_9B02
	rts 

L_JSR_9B05_9B79:

	lda #$01

L_BRS_9B07_9B32:

	pha 
	ldy #$02

L_BRS_9B0A_9B21:

	lda ($FB),Y 
	cmp #$99
	bne L_BRS_9B15_9B0E
	lda #$33
	clv
	bvc L_BRS_9B1E_9B13

L_BRS_9B15_9B0E:

	cmp #$19
	bne L_BRS_9B1E_9B17
	lda #$13
	clv
	bvc L_BRS_9B1E_9B1C

L_BRS_9B1E_9B13:
L_BRS_9B1E_9B17:
L_BRS_9B1E_9B1C:

	sta ($FB),Y 
	dey 
	bpl L_BRS_9B0A_9B21
	lda $FB 
	clc 
	adc #$28
	sta $FB 
	bcc L_BRS_9B2E_9B2A
	inc $FC 

L_BRS_9B2E_9B2A:

	pla 
	tay 
	dey 
	tya 
	bpl L_BRS_9B07_9B32
	rts 

L_JSR_9B35_9DB7:

	ldy #$13

L_BRS_9B37_9B7F:

	tya 
	pha 
	lda $7FD1,Y 
	clc 
	sbc #$00
	ldy #$00
	sec 

L_BRS_9B42_9B45:

	sbc #$0A
	iny 
	bcs L_BRS_9B42_9B45
	dey 
	adc #$0A
	sta $F9 
	lda #$30
	cpy #$04
	bcc L_BRS_9B54_9B50
	lda #$48

L_BRS_9B54_9B50:

	cpy #$00
	beq L_BRS_9B5E_9B56

L_BRS_9B58_9B5C:

	clc 
	adc #$10
	dey 
	bne L_BRS_9B58_9B5C

L_BRS_9B5E_9B56:

	sta $A4 
	lda #$1C
	ldx $F9 
	beq L_BRS_9B6C_9B64

L_BRS_9B66_9B6A:

	clc 
	adc #$0C
	dex 
	bne L_BRS_9B66_9B6A

L_BRS_9B6C_9B64:

	sta $A3 
	jsr L_JSR_93E1_9B6E
	lda $06 
	sta $FC 
	lda $05 
	sta $FB 
	jsr L_JSR_9B05_9B79
	pla 
	tay 
	dey 
	bpl L_BRS_9B37_9B7F
	rts 

L_JSR_9B82_91BB:

	jmp L_JMP_9BD9_9B82

L_JMP_9B85_901E:
L_JSR_9B85_91EF:

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

L_JMP_9BA0_9012:
L_JSR_9BA0_9D3B:

	lda #$D8
	sta $FC 
	lda #$00
	sta $FB 

L_JMP_9BA8_9BD6:

	lda #$C8
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_925D_9BB4

L_JMP_9BB7_9015:
L_JSR_9BB7_9DAE:

	lda #$C8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$D8
	sta $FE 
	lda #$00
	sta $FD 

L_JMP_9BC7_9BE9:

	lda #$03
	ldx #$E8
	jmp L_JMP_925D_9BCB

L_JSR_9BCE_9DB1:

	lda #$CC
	sta $FC 
	lda #$00
	sta $FB 
	jmp L_JMP_9BA8_9BD6

L_JMP_9BD9_9024:
L_JMP_9BD9_9B82:

	lda #$C8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$CC
	sta $FE 
	lda #$00
	sta $FD 
	jmp L_JMP_9BC7_9BE9

L_JMP_9BEC_901B:
L_BRS_9BEC_9BEF:

	ldy $D011                          // Control Register 1
	bpl L_BRS_9BEC_9BEF
	lda $02 
	sta $D015                          // Sprite display Enable
	rts 
	and ($B0),Y 
	lda #$A5
	ldy $903E 
	cpy #$01
	bcc L_BRS_9C14_9C00
	jsr L_JSR_9CAE_9C02
	jsr L_JSR_98D7_9C05
	lda #$FE
	sta $8FF8 
	lda #$00
	sta $D01C                          // Sprites Multi-Color Mode Select
	beq L_BRS_9C2A_9C12

L_BRS_9C14_9C00:

	lda $9BFA 
	sta $D001                          // Sprite 0 Y Pos
	lda $9BF9 
	sta $D000                          // Sprite 0 X Pos
	lda #$FD
	sta $8FF8 
	lda #$01
	sta $D01C                          // Sprites Multi-Color Mode Select

L_BRS_9C2A_9C12:

	iny 
	cpy #$02
	bcc L_BRS_9C31_9C2D
	ldy #$00

L_BRS_9C31_9C2D:

	sty $903E 
	lda $9BF7,Y 
	sta $D012                          // Raster Position
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $D019                          // Interrupt Request Register (IRR)
	ora #$01
	sta $D019                          // Interrupt Request Register (IRR)
	jmp L_JMP_9122_9C4A

L_JSR_9C4D_9D93:

	sei 
	lda #$7F
	sta $DC0D                          // Interrupt (IRQ) Control Register
	lda $D01A                          // Interrupt Mask Register (IMR)
	ora #$01
	sta $D01A                          // Interrupt Mask Register (IMR)
	ldx #$01
	stx $903E 
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $9BF7,X 
	sta $D012                          // Raster Position
	lda $0315 
	sta $9040 
	lda $0314 
	sta $903F 
	lda #$9B
	sta $0315 
	lda #$FB
	sta $0314 
	lda #$01
	sta $9D11 
	lda #$14
	sta $98D1 
	cli 
	rts 

L_JSR_9C90_9DA6:

	sei 
	lda $D01A                          // Interrupt Mask Register (IMR)
	and #$FE
	sta $D01A                          // Interrupt Mask Register (IMR)
	lda #$81
	sta $DC0D                          // Interrupt (IRQ) Control Register
	lda $9040 
	sta $0315 
	lda $903F 
	sta $0314 
	cli 
	jmp L_JMP_933C_9CAB

L_JSR_9CAE_9C02:

	dec $9D11 
	bne L_BRS_9D02_9CB1
	lda #$05
	sta $9D11 
	jsr L_JSR_930E_9CB8
	ldy #$0E
	lda $7FFE 
	beq L_BRS_9CC4_9CC0
	dey 
	dey 

L_BRS_9CC4_9CC0:
L_BRS_9CC4_9CF3:

	lda $D41B                          // Oscillator 3 Output
	and #$3F
	asl 
	adc #$54
	sta $D000,Y                          // Sprite 0 X Pos
	lda $D41B                          // Oscillator 3 Output
	and #$16
	asl 
	adc $D000,Y                          // Sprite 0 X Pos
	sta $D000,Y                          // Sprite 0 X Pos
	lda $D41B                          // Oscillator 3 Output
	pha 
	and #$1F
	clc 
	adc #$B7
	sta $D001,Y                          // Sprite 0 Y Pos
	pla 
	and #$20
	lsr 
	adc $D001,Y                          // Sprite 0 Y Pos
	sta $D001,Y                          // Sprite 0 Y Pos
	dey 
	dey 
	bpl L_BRS_9CC4_9CF3
	lda $D001                          // Sprite 0 Y Pos
	sta $9D13 
	lda $D000                          // Sprite 0 X Pos
	sta $9D12 

L_BRS_9D01_9D0F:

	rts 

L_BRS_9D02_9CB1:

	lda $9D13 
	sta $D001                          // Sprite 0 Y Pos
	lda $9D12 
	sta $D000                          // Sprite 0 X Pos
	clv
	bvc L_BRS_9D01_9D0F
	.byte $00,$00,$00

L_JSR_9D14_9E37:

	jsr L_JSR_9090_9D14
	lda $D016                          // Control Register 2
	ora #$10
	sta $D016                          // Control Register 2
	lda #$00
	sta $D015                          // Sprite display Enable
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda #$80
	sta $D418                          // Select Filter Mode and Volume
	lda #$81
	sta $D412                          // Voice 3: Control Register
	lda #$AA
	sta $D40E                          // Voice 3: Frequency Control - Low-Byte
	lda #$55
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	jsr L_JSR_9BA0_9D3B
	jsr L_JSR_9DD5_9D3E
	jsr L_JSR_9E70_9D41
	lda #$80
	sta $FC 
	lda #$00
	sta $FB 
	lda #$D8
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jsr L_JSR_925D_9D58
	lda #$85
	sta $FC 
	lda #$C0
	sta $FB 
	lda #$A1
	sta $FE 
	lda #$40
	sta $FD 
	lda #$06
	ldx #$40
	jsr L_JSR_925D_9D6F
	lda #$84
	sta $FC 
	lda #$F8
	sta $FB 
	lda #$8C
	sta $FE 
	lda #$28
	sta $FD 
	lda #$00
	ldx #$C8
	jsr L_JSR_925D_9D86
	lda #$06
	sta $D025                          // Sprite Multi-Color Register 0
	lda #$02
	sta $D026                          // Sprite Multi-Color Register 1
	jsr L_JSR_9C4D_9D93
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$01
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda #$FF
	sta $D015                          // Sprite display Enable
	rts 

L_JMP_9DA6_9E57:

	jsr L_JSR_9C90_9DA6
	lda #$00
	sta $D025                          // Sprite Multi-Color Register 0
	jsr L_JSR_9BB7_9DAE
	jsr L_JSR_9BCE_9DB1
	inc $7FFF 
	jsr L_JSR_9B35_9DB7
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	jsr L_JSR_9DEC_9DC2
	jsr L_JSR_9E81_9DC5
	lda #$FE
	sta $D01C                          // Sprites Multi-Color Mode Select
	lda #$F9
	sta $D015                          // Sprite display Enable
	jmp L_JMP_904C_9DD2

L_JSR_9DD5_9D3E:

	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ror 
	lda $D000                          // Sprite 0 X Pos
	ror 
	sta $7FE6 
	ldy #$0E

L_BRS_9DE2_9DE9:

	lda $D001,Y                          // Sprite 0 Y Pos
	sta $7FE7,Y 
	dey 
	bpl L_BRS_9DE2_9DE9
	rts 

L_JSR_9DEC_9DC2:

	lda $7FE6 
	rol 
	sta $D000                          // Sprite 0 X Pos
	lda #$00
	rol 
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	ldy #$0E

L_BRS_9DFB_9E02:

	lda $7FE7,Y 
	sta $D001,Y                          // Sprite 0 Y Pos
	dey 
	bpl L_BRS_9DFB_9E02
	rts 

L_JSR_9E05_9E3A:

	ldy #$13
	lda #$00

L_BRS_9E09_9E0D:

	sta $7FD1,Y 
	dey 
	bpl L_BRS_9E09_9E0D
	ldy #$13

L_BRS_9E11_9E2B:
L_BRS_9E11_9E34:

	lda $D41B                          // Oscillator 3 Output
	pha 
	and #$3F
	sta $F9 
	pla 
	and #$40
	lsr 
	lsr 
	ora #$01
	adc $F9 
	cpy #$13
	beq L_BRS_9E30_9E24
	ldx #$13

L_BRS_9E28_9E2E:

	cmp $7FD1,X 
	beq L_BRS_9E11_9E2B
	dex 
	bpl L_BRS_9E28_9E2E

L_BRS_9E30_9E24:

	sta $7FD1,Y 
	dey 
	bpl L_BRS_9E11_9E34
	rts 

L_JMP_9E37_9021:

	jsr L_JSR_9D14_9E37
	jsr L_JSR_9E05_9E3A
	ldy #$13
	sty $A5 
	jsr L_JSR_9E5B_9E41
	jsr L_JSR_9E5B_9E44

L_BRS_9E47_9E4F:

	jsr L_JSR_9E5B_9E47
	jsr L_JSR_9E90_9E4A
	dec $A5 
	bpl L_BRS_9E47_9E4F
	jsr L_JSR_9E5B_9E51
	jsr L_JSR_9E5B_9E54
	jmp L_JMP_9DA6_9E57
	.byte $00

L_JSR_9E5B_9E41:
L_JSR_9E5B_9E44:
L_JSR_9E5B_9E47:
L_JSR_9E5B_9E51:
L_JSR_9E5B_9E54:

	lda #$02
	sta $9E5A 
	ldx #$00
	ldy #$00

L_BRS_9E64_9E65:
L_BRS_9E64_9E68:
L_BRS_9E64_9E6D:

	dey 
	bne L_BRS_9E64_9E65
	dex 
	bne L_BRS_9E64_9E68
	dec $9E5A 
	bne L_BRS_9E64_9E6D
	rts 

L_JSR_9E70_9D41:

	ldy #$07

L_BRS_9E72_9E7E:

	lda $D027,Y                          // Sprite 0 Color
	sta $7FF6,Y 
	lda #$01
	sta $D027,Y                          // Sprite 0 Color
	dey 
	bpl L_BRS_9E72_9E7E
	rts 

L_JSR_9E81_9DC5:

	ldy #$07

L_BRS_9E83_9E8A:

	lda $7FF6,Y 
	sta $D027,Y                          // Sprite 0 Color
	dey 
	bpl L_BRS_9E83_9E8A
	rts 
	.byte $AA,$C8,$00

L_JSR_9E90_9E4A:

	lda #$01
	sta $7FFE 
	lda #$C6
	sta $9BF9 
	lda #$00
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda #$FE
	sta $8FFF 
	lda $9E8E 
	sta $D00F                          // Sprite 7 Y Pos
	lda $9E8D 
	sta $D00E                          // Sprite 7 X Pos
	ldy $A5 

L_BRS_9EB2_9EC3:

	dec $D00F                          // Sprite 7 Y Pos
	ldx #$00

L_BRS_9EB7_9EB8:

	dex 
	bne L_BRS_9EB7_9EB8
	lda $D00F                          // Sprite 7 Y Pos
	sec 
	sbc #$33
	cmp $9F4A,Y 
	bcs L_BRS_9EB2_9EC3
	lda #$49
	sta $9E8F 

L_BRS_9ECA_9EEF:

	cmp $9F36,Y 
	beq L_BRS_9EF1_9ECD
	bcc L_BRS_9ED6_9ECF
	dec $9E8F 
	bne L_BRS_9ED9_9ED4

L_BRS_9ED6_9ECF:

	inc $9E8F 

L_BRS_9ED9_9ED4:

	lda $9E8F 
	pha 
	asl 
	clc 
	adc #$18
	sta $D00E                          // Sprite 7 X Pos
	pla 
	cmp #$73
	bcs L_BRS_9EF1_9EE7

L_BRS_9EE9_9EEA:

	dex 
	bne L_BRS_9EE9_9EEA
	lda $9E8F 
	bne L_BRS_9ECA_9EEF

L_BRS_9EF1_9ECD:
L_BRS_9EF1_9EE7:

	jsr L_JSR_9F16_9EF1

L_BRS_9EF4_9EF7:

	lda $D011                          // Control Register 1
	bpl L_BRS_9EF4_9EF7
	lda #$7F
	sta $D015                          // Sprite display Enable
	lda #$00
	sta $7FFE 
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	lda #$FF
	sta $8FFF 
	lda #$A9
	sta $9BF9 
	lda #$FF
	sta $D015                          // Sprite display Enable
	rts 

L_JSR_9F16_9EF1:

	lda $9F36,Y 
	tax 
	lda $9F4A,Y 
	tay 
	jsr L_JSR_93D6_9F1E
	lda #$11
	ldy #$02

L_BRS_9F25_9F28:

	sta ($05),Y 
	dey 
	bpl L_BRS_9F25_9F28
	ldy #$2A

L_BRS_9F2C_9F31:

	sta ($05),Y 
	dey 
	cpy #$28
	bcs L_BRS_9F2C_9F31
	jmp L_JMP_9A64_9F33
	.byte $55,$61,$6D,$79,$85,$3D,$31,$25
	.byte $19,$0D,$55,$61,$6D,$79,$85,$3D
	.byte $31,$25,$19,$0D,$20,$20,$20,$20
	.byte $20,$20,$20,$20,$20,$20,$08,$08
	.byte $08,$08,$08,$08,$08,$08,$08,$08

L_JMP_9F5E_902A:

	lda #$00
	sta $7FE5 
	ldy #$4F

L_BRS_9F65_9F69:

	sta $7F81,Y 
	dey 
	bpl L_BRS_9F65_9F69
	sta $A3 
	sta $A4 
	jsr L_JSR_93E1_9F6F
	ldy #$F0

L_BRS_9F74_9F7F:
L_BRS_9F74_9F87:

	lda ($05),Y 
	cmp #$19
	bne L_BRS_9F7E_9F78
	lda #$99
	sta ($05),Y 

L_BRS_9F7E_9F78:

	iny 
	bne L_BRS_9F74_9F7F
	inc $06 
	lda $06 
	cmp #$D0
	bcc L_BRS_9F74_9F87
	lda #$30
	sta $7F7E 
	sta $7F7F 
	jmp L_JMP_9966_9F91 
