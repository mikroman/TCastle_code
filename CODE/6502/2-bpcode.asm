	jmp L_JMP_9153_9000
	jmp L_JMP_916F_9003
	jmp L_JMP_91B1_9006
	jmp L_JMP_91C9_9009
	jmp L_JMP_942B_900C
	jmp L_JMP_96AC_900F
	jmp L_JMP_93F8_9012
	jmp L_JMP_9D01_9015
	jmp L_JMP_9D0C_9018
	jmp L_JMP_981C_901B
	jmp L_JMP_9EB6_901E
	jmp L_JMP_9AAD_9021
	jmp L_JMP_9D1B_9024
	jmp L_JMP_9F12_9027
	jmp L_JMP_9F2C_902A
	jmp L_JMP_9F3C_902D
	jmp L_JMP_9714_9030
	jmp L_JMP_9813_9033
	.byte $4B,$96,$63,$9F,$41,$90,$42,$90
	.byte $49,$90,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00

L_JSR_904A_9154:

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
	jsr L_JSR_917E_9064
	lda $01 
	ora #$04
	sta $01 
	rts 
	pla 
	tay 
	pla 
	tax 
	pla 
	rti 
	lda $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	and #$1F
	sta $9040 
	lda $9040 
	and #$01
	bne L_BRS_9092_9081
	dec $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$3A
	bcs L_BRS_9092_908B
	ldx #$3A
	stx $D001                          // Sprite 0 Y Pos

L_BRS_9092_9081:
L_BRS_9092_908B:

	lda $9040 
	and #$02
	bne L_BRS_90A8_9097
	inc $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$EE
	bcc L_BRS_90A8_90A1
	ldx #$ED
	stx $D001                          // Sprite 0 Y Pos

L_BRS_90A8_9097:
L_BRS_90A8_90A1:

	lda $9040 
	and #$04
	bne L_BRS_90CF_90AD
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	beq L_BRS_90C8_90B7
	cpy #$00
	bne L_BRS_90CC_90BB
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$FE
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_90CC_90C6

L_BRS_90C8_90B7:

	cpy #$19
	bcc L_BRS_90CF_90CA

L_BRS_90CC_90BB:
L_BRS_90CC_90C6:

	dec $D000                          // Sprite 0 X Pos

L_BRS_90CF_90AD:
L_BRS_90CF_90CA:

	lda $9040 
	and #$08
	bne L_BRS_90F6_90D4
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_90EF_90DE
	cpy #$FF
	bne L_BRS_90F3_90E2
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ora #$01
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_90F3_90ED

L_BRS_90EF_90DE:

	cpy #$4B
	bcs L_BRS_90F6_90F1

L_BRS_90F3_90E2:
L_BRS_90F3_90ED:

	inc $D000                          // Sprite 0 X Pos

L_BRS_90F6_90D4:
L_BRS_90F6_90F1:

	lda $9040 
	and #$10
	bne L_BRS_913C_90FB
	lda $9041 
	bne L_BRS_9136_9100
	lda $D01E                          // Sprite to Sprite Collision Detect
	and #$7F
	lsr 
	beq L_BRS_913C_9108
	bcc L_BRS_913C_910A
	ldx #$00

L_BRS_910E_9110:

	inx 
	lsr 
	bcc L_BRS_910E_9110
	lda $9042 
	bne L_BRS_9133_9115
	lda $D015                          // Sprite display Enable
	and #$81
	sta $D015                          // Sprite display Enable
	lda $D027,X                          // Sprite 0 Color
	sta $D028                          // Sprite 1 Color
	inc $9042 
	lda $D015                          // Sprite display Enable
	ora #$02
	sta $D015                          // Sprite display Enable
	jsr L_JSR_91E1_9130

L_BRS_9133_9115:

	jsr L_JSR_9AAD_9133

L_BRS_9136_9100:
L_BRS_9136_913F:
L_JMP_9136_9150:

	lda $D01E                          // Sprite to Sprite Collision Detect
	jmp ($9043) 

L_BRS_913C_90FB:
L_BRS_913C_9108:
L_BRS_913C_910A:

	lda $9042 
	beq L_BRS_9136_913F
	ldy #$00
	sty $9042 
	iny 
	sty $9041 
	jsr L_JSR_9872_914A
	jsr L_JSR_91E1_914D
	jmp L_JMP_9136_9150

L_JMP_9153_9000:

	sei 
	jsr L_JSR_904A_9154
	lda $0315 
	sta $9044 
	lda $0314 
	sta $9043 
	lda #$90
	sta $0315 
	lda #$74
	sta $0314 
	cli 
	rts 

L_JMP_916F_9003:

	sei 
	lda $9044 
	sta $0315 
	lda $9043 
	sta $0314 
	cli 
	rts 

L_JSR_917E_9064:
L_JSR_917E_94F8:
L_JSR_917E_950F:
L_JSR_917E_952F:
L_JMP_917E_9549:
L_JSR_917E_9563:
L_JMP_917E_957D:

	sta $918E 
	stx $91AD 
	ldy #$00
	cmp #$00
	beq L_BRS_91A3_9188
	clc 
	lda $FC 
	adc #$00
	sta $91A0 

L_BRS_9192_9197:
L_BRS_9192_91A1:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	bne L_BRS_9192_9197
	inc $FC 
	inc $FE 
	lda $FC 
	cmp #$00
	bcc L_BRS_9192_91A1

L_BRS_91A3_9188:

	cpx #$00
	beq L_BRS_91B0_91A5

L_BRS_91A7_91AE:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	cpy #$40
	bcc L_BRS_91A7_91AE

L_BRS_91B0_91A5:

	rts 

L_JMP_91B1_9006:
L_JMP_91B1_9515:

	lda #$38
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$01
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda $D011                          // Control Register 1
	ora #$20
	sta $D011                          // Control Register 1
	rts 

L_JMP_91C9_9009:

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

L_JSR_91E1_9130:
L_JSR_91E1_914D:

	jsr L_JSR_9252_91E1
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

L_JSR_9224_9813:
L_JSR_9224_9997:

	lda #$10
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	lda #$C3
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	lda #$60
	sta $D416                          // Filter Cutoff Frequency: High-Byte
	lda #$01
	sta $D417                          // Filter Resonance Control / Voice Input Control
	lda #$90
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	lda #$00
	sta $D406                          // Voice 1: Sustain / Release Cycle Control
	lda #$CF
	sta $D418                          // Select Filter Mode and Volume
	lda #$80
	sta $D404                          // Voice 1: Control Register
	lda #$81
	sta $D404                          // Voice 1: Control Register
	rts 

L_JSR_9252_91E1:
L_JSR_9252_9717:
L_JSR_9252_9771:
L_JSR_9252_9F3C:

	ldy #$18
	lda #$00

L_BRS_9256_925A:

	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	dey 
	bpl L_BRS_9256_925A
	rts 

L_JSR_925D_9762:

	dec $929A 
	bne L_BRS_9299_9260
	lda #$02
	sta $929A 
	lda #$0F
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	lda #$43
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	lda #$09
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	lda #$8B
	sta $D40E                          // Voice 3: Frequency Control - Low-Byte
	lda #$96
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	lda #$F1
	sta $D417                          // Filter Resonance Control / Voice Input Control
	lda #$42
	sta $D416                          // Filter Cutoff Frequency: High-Byte
	lda #$EF
	sta $D418                          // Select Filter Mode and Volume
	lda #$14
	sta $D404                          // Voice 1: Control Register
	lda #$15
	sta $D404                          // Voice 1: Control Register

L_BRS_9299_9260:

	rts 
	.byte $02,$A9,$E0,$85,$04,$A9,$00,$85
	.byte $03,$A6,$A3,$A4,$A4
	clv
	bvc L_BRS_92B6_92A8

L_JSR_92AA_9392:
L_JSR_92AA_93B7:
L_JSR_92AA_99C9:
L_JSR_92AA_9A65:
L_JSR_92AA_9BD1:
L_JSR_92AA_9C32:
L_JSR_92AA_9C9D:
L_JSR_92AA_9CD8:
L_JSR_92AA_9F1F:

	ldx $A3 
	ldy $A4 

L_JSR_92AE_9820:
L_JSR_92AE_9935:
L_JSR_92AE_9957:

	lda #$A0
	sta $04 
	lda #$00
	sta $03 

L_BRS_92B6_92A8:

	tya 
	pha 
	and #$F8
	sta $92C1 
	ldy #$27

L_BRS_92BF_92C7:

	clc 
	adc #$00
	bcc L_BRS_92C6_92C2
	inc $04 

L_BRS_92C6_92C2:

	dey 
	bne L_BRS_92BF_92C7
	sta $03 
	pla 
	and #$07
	clc 
	adc $03 
	sta $03 
	bcc L_BRS_92D7_92D3
	inc $04 

L_BRS_92D7_92D3:

	txa 
	asl 
	bcc L_BRS_92DD_92D9
	inc $04 

L_BRS_92DD_92D9:

	clc 
	and #$F8
	adc $03 
	sta $03 
	bcc L_BRS_92E8_92E4
	inc $04 

L_BRS_92E8_92E4:

	rts 
	lda #$CC
	sta $06 
	lda #$00
	sta $05 
	clv
	bvc L_BRS_9300_92F2

L_JSR_92F4_99CC:
L_JSR_92F4_9A2C:
L_JSR_92F4_9A68:
L_JSR_92F4_9BE7:

	ldx $A3 
	ldy $A4 

L_JSR_92F8_9827:

	lda #$8C
	sta $06 
	lda #$00
	sta $05 

L_BRS_9300_92F2:

	tya 
	lsr 
	lsr 
	lsr 
	beq L_BRS_9315_9304
	tay 

L_BRS_9307_9313:

	lda #$28
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_9312_930E
	inc $06 

L_BRS_9312_930E:

	dey 
	bne L_BRS_9307_9313

L_BRS_9315_9304:

	txa 
	lsr 
	lsr 
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_9321_931D
	inc $06 

L_BRS_9321_931D:

	rts 

L_JSR_9322_96F0:

	sty $9329 
	lda $FB 
	clc 
	adc #$00
	sta $FD 

L_BRS_932C_934B:

	ldy #$01
	lda ($FB),Y 
	ror 
	ldx #$01
	ldy #$00

L_BRS_9335_933C:

	lda ($FB),Y 
	ror 
	sta ($FB),Y 
	iny 
	dex 
	bpl L_BRS_9335_933C
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_9349_9345
	inc $FC 

L_BRS_9349_9345:

	cmp $FD 
	bne L_BRS_932C_934B
	rts 

L_JSR_934E_970B:

	sty $9355 
	lda $FB 
	clc 
	adc #$00
	sta $FD 

L_BRS_9358_9374:

	ldy #$00
	lda ($FB),Y 
	rol 
	ldy #$01

L_BRS_935F_9365:

	lda ($FB),Y 
	rol 
	sta ($FB),Y 
	dey 
	bpl L_BRS_935F_9365
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_9372_936E
	inc $FC 

L_BRS_9372_936E:

	cmp $FD 
	bne L_BRS_9358_9374
	rts 

L_JSR_9377_96A6:

	sty $93B0 
	lda $9046 
	sta $93A0 
	lda $9045 
	sta $939F 
	lda $9048 
	sta $93A3 
	lda $9047 
	sta $93A2 
	jsr L_JSR_92AA_9392
	ldx #$00

L_BRS_9397_93C0:

	ldy #$00

L_BRS_9399_93B1:

	jsr L_JSR_93CB_9399
	lda ($03),Y 
	and $963B,X 
	ora $959B,X
	sta ($03),Y 
	jsr L_JSR_93DA_93A6
	tya 
	clc 
	adc #$08
	tay 
	inx 
	cpy #$11
	bcc L_BRS_9399_93B1
	txa 
	pha 
	inc $A4 
	jsr L_JSR_92AA_93B7
	pla 
	tax 
	dec $A5 
	lda $A5 
	bne L_BRS_9397_93C0
	rts 

L_JSR_93C3_96B3:

	lda $A3 
	asl 
	and #$06
	sta $FF 
	rts 

L_JSR_93CB_9399:
L_JSR_93CB_94E1:
L_JSR_93CB_9518:
L_JSR_93CB_954C:
L_JSR_93CB_9A89:

	sei 
	lda $01 
	and #$FC
	sta $01 
	rts 

L_JSR_93D3_9938:

	lda $01 
	and #$FE
	sta $01 
	rts 

L_JSR_93DA_93A6:
L_JSR_93DA_9532:
L_JSR_93DA_9566:
L_JMP_93DA_996A:
L_JSR_93DA_9A95:

	lda $01 
	ora #$03
	sta $01 
	cli 
	rts 

L_JSR_93E2_9676:
L_JSR_93E2_9945:
L_JSR_93E2_9964:
L_JSR_93E2_9C21:
L_JSR_93E2_9C85:
L_JSR_93E2_9C90:
L_JSR_93E2_9CD1:
L_JSR_93E2_9F1C:

	stx $93ED 
	ldy $02 
	beq L_BRS_93F7_93E7
	lda $FB 

L_BRS_93EB_93F3:

	clc 
	adc #$00
	bcc L_BRS_93F2_93EE
	inc $FC 

L_BRS_93F2_93EE:

	dey 
	bne L_BRS_93EB_93F3
	sta $FB 

L_BRS_93F7_93E7:

	rts 

L_JMP_93F8_9012:

	jsr $FFE7                         // Close All Channels And Files
	lda #$00
	jsr $FF90                         // Control OS Messages
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$05
	ldx #$8C
	ldy #$95
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_94E1_941B
	lda #$6C
	sta $9599 
	lda #$A8
	sta $959A 
	jmp L_JMP_9491_9428

L_JMP_942B_900C:

	jsr $FFE7                         // Close All Channels And Files
	lda #$00
	jsr $FF90                         // Control OS Messages
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$09
	ldx #$83
	ldy #$95
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_94E1_944E
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$05
	ldx #$91
	ldy #$95
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$7F
	jsr $FFD5                         // Load RAM From Device
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$03
	ldx #$96
	ldy #$95
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$40
	ldy #$FF
	jsr $FFD5                         // Load RAM From Device
	lda #$04
	sta $9599 
	lda #$B0
	sta $959A 

L_JMP_9491_9428:

	lda #$90
	sta $0317 
	lda #$6E
	sta $0316 
	lda #$90
	sta $0319 
	lda #$73
	sta $0318 
	lda #$EA
	sta $0328 
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$03
	ldx #$80
	ldy #$95
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$84
	jsr $FFD5                         // Load RAM From Device
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$03
	ldx #$96
	ldy #$95
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$40
	ldy #$BF
	jsr $FFD5                         // Load RAM From Device
	rts 

L_JSR_94E1_941B:
L_JSR_94E1_944E:

	jsr L_JSR_93CB_94E1
	lda #$A0
	sta $FC 
	lda #$00
	sta $FB 
	lda #$CC
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jsr L_JSR_917E_94F8
	lda #$A4
	sta $FC 
	lda #$00
	sta $FB 
	lda #$E0
	sta $FE 
	lda #$00
	sta $FD 
	lda #$1F
	ldx #$40
	jsr L_JSR_917E_950F
	jsr L_JSR_954C_9512
	jmp L_JMP_91B1_9515

L_JSR_9518_998B:

	jsr L_JSR_93CB_9518
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
	jsr L_JSR_917E_952F
	jsr L_JSR_93DA_9532
	lda #$8C
	sta $FC 
	lda #$00
	sta $FB 
	lda #$CC
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_917E_9549

L_JSR_954C_9512:

	jsr L_JSR_93CB_954C
	lda #$E0
	sta $FC 
	lda #$00
	sta $FB 
	lda #$A0
	sta $FE 
	lda #$00
	sta $FD 
	lda #$1F
	ldx #$40
	jsr L_JSR_917E_9563
	jsr L_JSR_93DA_9566
	lda #$CC
	sta $FC 
	lda #$00
	sta $FB 
	lda #$8C
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_917E_957D
	.byte $4A,$51,$4B,$42,$4C,$41,$43,$4B
	.byte $4A,$41,$43,$4B,$50,$4F,$4B,$45
	.byte $52,$42,$4A,$44,$41,$54,$41,$52
	.byte $52,$00,$00,$3C,$00,$C3,$00,$CF
	.byte $00,$FF,$00,$F3,$00,$C3,$00,$C3
	.byte $00,$3C,$00,$0C,$00,$3C,$00,$0C
	.byte $00,$0C,$00,$0C,$00,$0C,$00,$0C
	.byte $00,$3F,$00,$3C,$00,$C3,$00,$03
	.byte $00,$03,$00,$3C,$00,$C0,$00,$C0
	.byte $00,$FF,$00,$FF,$00,$03,$00,$0C
	.byte $00,$3C,$00,$0F,$00,$C3,$00,$C3
	.byte $00,$3C,$00,$0C,$00,$3C,$00,$CC
	.byte $00,$CC,$00,$FF,$00,$0C,$00,$0C
	.byte $00,$0C,$00,$FF,$00,$C0,$00,$C0
	.byte $00,$FC,$00,$03,$00,$03,$00,$C3
	.byte $00,$3C,$00,$3C,$00,$C3,$00,$C0
	.byte $00,$FC,$00,$C3,$00,$C3,$00,$C3
	.byte $00,$3C,$00,$FF,$00,$C3,$00,$03
	.byte $00,$0C,$00,$0C,$00,$30,$00,$30
	.byte $00,$30,$00,$3C,$00,$C3,$00,$C3
	.byte $00,$3C,$00,$C3,$00,$C3,$00,$C3
	.byte $00,$3C,$00,$3C,$00,$C3,$00,$C3
	.byte $00,$C3,$00,$3E,$00,$03,$00,$C3
	.byte $00,$3C,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00

L_JSR_9656_9684:

	lda #$00
	ldx $FF 
	beq L_BRS_9661_965A

L_BRS_965C_965F:

	sec 
	ror 
	dex 
	bne L_BRS_965C_965F

L_BRS_9661_965A:

	ldy #$0F

L_BRS_9663_9669:

	eor #$FF
	sta $963B,Y 
	dey 
	bpl L_BRS_9663_9669
	rts 

L_JSR_966C_96C4:

	lda #$95
	sta $FC 
	lda #$9B
	sta $FB 
	ldx #$10
	jsr L_JSR_93E2_9676
	lda $FC 
	sta $9655 
	lda $FB 
	sta $9654 
	rts 

L_JSR_9684_96C7:

	jsr L_JSR_9656_9684
	lda $9655 
	sta $9048 
	lda $9654 
	sta $9047 
	lda #$96
	sta $9046 
	lda #$3B
	sta $9045 
	jsr L_JSR_96DE_969D
	ldy #$08
	sty $A5 
	ldy #$09
	jsr L_JSR_9377_96A6
	jmp L_JMP_96F9_96A9

L_JMP_96AC_900F:

	ldy #$00
	lda $9599 
	sta $A3 
	jsr L_JSR_93C3_96B3
	ldy #$00

L_BRS_96B8_96DB:

	lda $959A 
	sta $A4 
	tya 
	pha 
	lda $964B,Y 
	sta $02 
	jsr L_JSR_966C_96C4
	jsr L_JSR_9684_96C7
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
	bcc L_BRS_96B8_96DB
	rts 

L_JSR_96DE_969D:

	ldx $FF 
	beq L_BRS_96F8_96E0

L_BRS_96E2_96F6:

	txa 
	pha 
	ldy #$10
	lda $9655 
	sta $FC 
	lda $9654 
	sta $FB 
	jsr L_JSR_9322_96F0
	pla 
	tax 
	dex 
	bne L_BRS_96E2_96F6

L_BRS_96F8_96E0:

	rts 

L_JMP_96F9_96A9:

	ldx $FF 
	beq L_BRS_9713_96FB

L_BRS_96FD_9711:

	txa 
	pha 
	ldy #$10
	lda $9655 
	sta $FC 
	lda $9654 
	sta $FB 
	jsr L_JSR_934E_970B
	pla 
	tax 
	dex 
	bne L_BRS_96FD_9711

L_BRS_9713_96FB:

	rts 

L_JMP_9714_9030:

	jsr L_JSR_97B6_9714
	jsr L_JSR_9252_9717
	lda #$80
	sta $D418                          // Select Filter Mode and Volume
	lda #$81
	sta $D412                          // Voice 3: Control Register
	lda #$AA
	sta $D40E                          // Voice 3: Frequency Control - Low-Byte
	lda #$55
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	lda #$FF
	ldy #$07

L_BRS_9732_9736:

	sta $8FF8,Y 
	dey 
	bpl L_BRS_9732_9736
	lda $02 
	sta $D015                          // Sprite display Enable
	lda #$00
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	ldy #$0A
	sty $A5 

L_BRS_9746_976F:

	ldx #$0F

L_BRS_9748_9760:

	lda $D41B                          // Oscillator 3 Output
	and #$07
	clc 
	adc #$CF
	sta $D000,X                          // Sprite 0 X Pos
	dex 
	lda $D41B                          // Oscillator 3 Output
	and #$1F
	clc 
	adc #$A0
	sta $D000,X                          // Sprite 0 X Pos
	dex 
	bpl L_BRS_9748_9760
	jsr L_JSR_925D_9762
	ldy #$20

L_BRS_9767_9768:
L_BRS_9767_976B:

	dex 
	bne L_BRS_9767_9768
	dey 
	bne L_BRS_9767_976B
	dec $A5 
	bne L_BRS_9746_976F
	jsr L_JSR_9252_9771
	jmp L_JMP_97F1_9774
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00

L_JSR_97B6_9714:

	ldy #$2E

L_BRS_97B8_97BF:

	lda $D000,Y                          // Sprite 0 X Pos
	sta $9777,Y 
	dey 
	bpl L_BRS_97B8_97BF
	ldy #$07

L_BRS_97C3_97CA:

	lda $8FF8,Y 
	sta $97A6,Y 
	dey 
	bpl L_BRS_97C3_97CA
	ldy #$07

L_BRS_97CE_97D5:

	lda $D027,Y                          // Sprite 0 Color
	sta $97AE,Y 
	dey 
	bpl L_BRS_97CE_97D5
	lda #$FF
	ldy #$07

L_BRS_97DB_97DF:

	sta $8FF8,Y 
	dey 
	bpl L_BRS_97DB_97DF
	lda #$07
	ldy #$07

L_BRS_97E5_97E9:

	sta $D027,Y                          // Sprite 0 Color
	dey 
	bpl L_BRS_97E5_97E9
	lda #$00
	sta $D01C                          // Sprites Multi-Color Mode Select
	rts 

L_JMP_97F1_9774:

	ldy #$2E

L_BRS_97F3_97FA:

	lda $9777,Y 
	sta $D000,Y                          // Sprite 0 X Pos
	dey 
	bpl L_BRS_97F3_97FA
	ldy #$07

L_BRS_97FE_9805:

	lda $97A6,Y 
	sta $8FF8,Y 
	dey 
	bpl L_BRS_97FE_9805
	ldy #$07

L_BRS_9809_9810:

	lda $97AE,Y 
	sta $D027,Y                          // Sprite 0 Color
	dey 
	bpl L_BRS_9809_9810
	rts 

L_JMP_9813_9033:

	jsr L_JSR_9224_9813
	jsr L_JSR_9977_9816
	jmp L_JMP_9D1B_9819

L_JMP_981C_901B:

	ldy $A4 
	ldx #$00
	jsr L_JSR_92AE_9820
	ldy $A4 
	ldx #$00
	jsr L_JSR_92F8_9827
	ldx #$00

L_BRS_982C_986F:

	lda #$C0
	sta $FC 
	lda #$00
	sta $FB 
	lda $9F63,X 
	cmp #$20
	beq L_BRS_9861_9839
	sta $A5 
	ldy #$07

L_BRS_983F_9847:

	clc 
	adc $A5 
	bcc L_BRS_9846_9842
	inc $FC 

L_BRS_9846_9842:

	dey 
	bne L_BRS_983F_9847
	clc 
	adc $FB 
	sta $FB 
	bcc L_BRS_9852_984E
	inc $FC 

L_BRS_9852_984E:

	ldy #$07

L_BRS_9854_9859:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_9854_9859
	txa 
	tay 
	lda $02 
	sta ($05),Y 

L_BRS_9861_9839:

	lda $03 
	clc 
	adc #$08
	sta $03 
	bcc L_BRS_986C_9868
	inc $04 

L_BRS_986C_9868:

	inx 
	cpx #$28
	bcc L_BRS_982C_986F
	rts 

L_JSR_9872_914A:

	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_98A4_9877
	ldx $D002                          // Sprite 1 X Pos
	ldy $D003                          // Sprite 1 Y Pos
	cpx #$A0
	bcc L_BRS_98A4_9881
	cpx #$CD
	bcs L_BRS_98A4_9885
	cpy #$6E
	bcc L_BRS_98A4_9889
	cpy #$8C
	bcs L_BRS_98A4_988D
	lda $9049 
	bne L_BRS_98AE_9892
	lda $D028                          // Sprite 1 Color
	asl 
	asl 
	asl 
	asl 
	sta $8DA3 
	sta $8DA4 
	clv
	bvc L_BRS_98AE_98A2

L_BRS_98A4_9877:
L_BRS_98A4_9881:
L_BRS_98A4_9885:
L_BRS_98A4_9889:
L_BRS_98A4_988D:

	lda $D028                          // Sprite 1 Color
	sta $A5 
	lda #$00
	sta $D028                          // Sprite 1 Color

L_BRS_98AE_9892:
L_BRS_98AE_98A2:

	lda $D015                          // Sprite display Enable
	and #$FD
	sta $D015                          // Sprite display Enable
	rts 
	.byte $0C,$1E,$33,$3F,$33,$33,$1E,$23
	.byte $07,$0E,$1C,$3F,$3F,$06,$0C,$06
	.byte $33,$1E,$0E,$1E,$36,$3F,$06,$06
	.byte $3F,$30,$3E,$03,$33,$1E,$1E,$30
	.byte $3E,$33,$33,$1E,$3F,$03,$06,$0C
	.byte $0C,$0C,$1E,$33,$1E,$33,$33,$1E
	.byte $1E,$33,$1F,$03,$06,$0C,$2F,$29
	.byte $29,$29,$29,$2F,$CC,$CC,$FC,$CC
	.byte $78,$30,$FC,$38,$70,$E0,$C4,$78
	.byte $78,$CC,$60,$30,$60,$FC,$60,$60
	.byte $FC,$6C,$78,$70,$78,$CC,$C0,$7C
	.byte $0C,$FC,$78,$CC,$CC,$7C,$0C,$78
	.byte $30,$30,$30,$60,$C0,$FC,$78,$CC
	.byte $CC,$78,$CC,$78,$30,$60,$C0,$F8
	.byte $CC,$78,$F4,$94,$94,$94,$94,$F4

L_JSR_992F_9D61:

	ldx $A3 
	ldy $A4 
	iny 
	iny 
	jsr L_JSR_92AE_9935
	jsr L_JSR_93D3_9938
	lda #$98
	sta $FC 
	lda #$B7
	sta $FB 
	ldx #$06
	jsr L_JSR_93E2_9945
	jsr L_JSR_996D_9948
	lda $A3 
	clc 
	adc #$0C
	tax 
	lda $A4 
	clc 
	adc #$20
	tay 
	jsr L_JSR_92AE_9957
	lda #$98
	sta $FC 
	lda #$F3
	sta $FB 
	ldx #$06
	jsr L_JSR_93E2_9964
	jsr L_JSR_996D_9967
	jmp L_JMP_93DA_996A

L_JSR_996D_9948:
L_JSR_996D_9967:

	ldy #$05

L_BRS_996F_9974:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_996F_9974
	rts 

L_JSR_9977_9816:
L_JSR_9977_9991:
L_JSR_9977_999A:

	ldx #$00
	ldy #$00

L_BRS_997B_997C:
L_BRS_997B_997F:

	dey 
	bne L_BRS_997B_997C
	dex 
	bne L_BRS_997B_997F
	rts 

L_JSR_9982_9D12:

	lda $D015                          // Sprite display Enable
	pha 
	and #$80
	sta $D015                          // Sprite display Enable
	jsr L_JSR_9518_998B
	jsr L_JSR_99A5_998E
	jsr L_JSR_9977_9991
	jsr L_JSR_9A0D_9994
	jsr L_JSR_9224_9997
	jsr L_JSR_9977_999A
	jsr L_JSR_9A59_999D
	pla 
	sta $D015                          // Sprite display Enable
	rts 

L_JSR_99A5_998E:

	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	ldy #$09
	sty $A5 
	lda #$6C
	sta $A3 
	lda #$00
	sta $A4 
	lda #$7F
	sta $FC 
	lda #$00
	sta $FB 
	lda #$82
	sta $FE 
	lda #$60
	sta $FD 

L_BRS_99C9_9A00:

	jsr L_JSR_92AA_99C9
	jsr L_JSR_92F4_99CC
	ldy #$5F

L_BRS_99D1_99D6:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_99D1_99D6
	ldy #$0B

L_BRS_99DA_99DF:

	lda ($FD),Y 
	sta ($05),Y 
	dey 
	bpl L_BRS_99DA_99DF
	lda $A4 
	clc 
	adc #$08
	sta $A4 
	lda $FB 
	clc 
	adc #$60
	sta $FB 
	bcc L_BRS_99F3_99EF
	inc $FC 

L_BRS_99F3_99EF:

	lda $FD 
	clc 
	adc #$0C
	sta $FD 
	bcc L_BRS_99FE_99FA
	inc $FE 

L_BRS_99FE_99FA:

	dec $A5 
	bne L_BRS_99C9_9A00
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$01
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	rts 

L_JSR_9A0D_9994:

	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	jsr L_JSR_9A59_9A15
	ldy #$09
	sty $A5 
	lda #$6C
	sta $A3 
	lda #$00
	sta $A4 
	lda #$82
	sta $FC 
	lda #$CC
	sta $FB 

L_BRS_9A2C_9A4C:

	jsr L_JSR_92F4_9A2C
	ldy #$0B

L_BRS_9A31_9A36:

	lda ($FB),Y 
	sta ($05),Y 
	dey 
	bpl L_BRS_9A31_9A36
	lda $A4 
	clc 
	adc #$08
	sta $A4 
	lda $FB 
	clc 
	adc #$0C
	sta $FB 
	bcc L_BRS_9A4A_9A46
	inc $FC 

L_BRS_9A4A_9A46:

	dec $A5 
	bne L_BRS_9A2C_9A4C
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$01
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	rts 

L_JSR_9A59_999D:
L_JSR_9A59_9A15:

	ldy #$09
	sty $A5 
	ldx #$6C
	stx $A3 
	ldy #$00
	sty $A4 

L_BRS_9A65_9AAA:

	jsr L_JSR_92AA_9A65
	jsr L_JSR_92F4_9A68
	lda $04 
	sta $FC 
	lda $03 
	sta $FB 
	lda $06 
	sta $FE 
	lda $05 
	sta $FD 
	lda $FC 
	clc 
	adc #$40
	sta $FC 
	lda $FE 
	clc 
	adc #$40
	sta $FE 
	jsr L_JSR_93CB_9A89
	ldy #$5F

L_BRS_9A8E_9A93:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_9A8E_9A93
	jsr L_JSR_93DA_9A95
	ldy #$12

L_BRS_9A9A_9A9F:

	lda ($FD),Y 
	sta ($05),Y 
	dey 
	bpl L_BRS_9A9A_9A9F
	lda $A4 
	clc 
	adc #$08
	sta $A4 
	dec $A5 
	bne L_BRS_9A65_9AAA
	rts 

L_JMP_9AAD_9021:
L_JSR_9AAD_9133:

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
	.byte $00,$00,$00,$00,$01,$00,$03,$80
	.byte $07,$C0,$0F,$E0,$1F,$F0,$0F,$E0
	.byte $07,$C0,$03,$80,$01,$00,$00,$00
	.byte $00,$00,$00,$00,$0C,$60,$1E,$F0
	.byte $3F,$F8,$3F,$F8,$1F,$F0,$0F,$E0
	.byte $07,$C0,$03,$80,$01,$00,$00,$00
	.byte $03,$80,$07,$C0,$07,$C0,$07,$C0
	.byte $03,$80,$1D,$70,$3F,$F8,$3F,$F8
	.byte $3F,$F8,$1D,$70,$01,$00,$07,$C0
	.byte $01,$00,$03,$80,$07,$C0,$0F,$E0
	.byte $1F,$F0,$3F,$F8,$3F,$F8,$1F,$F0
	.byte $0D,$60,$01,$00,$01,$00,$07,$C0
	.byte $04,$0E,$1F,$0E,$04,$01,$00,$03
	.byte $80,$07,$C0,$03,$80,$01,$00,$20
	.byte $70,$F8,$70,$20,$0A,$1F,$1F,$0E
	.byte $04,$02,$80,$07,$C0,$07,$C0,$03
	.byte $80,$01,$00,$50,$F8,$F8,$70,$20
	.byte $0E,$1F,$1B,$04,$04,$03,$80,$07
	.byte $C0,$06,$C0,$01,$00,$01,$00,$70
	.byte $F8,$D8,$20,$20,$04,$0E,$1F,$04
	.byte $0E,$01,$00,$03,$80,$07,$C0,$01
	.byte $00,$03,$80,$20,$70,$F8,$20,$70
	.byte $04,$0E,$1F,$0E,$04,$01,$00,$03
	.byte $80,$07,$C0,$03,$80,$01,$00,$20
	.byte $70,$F8,$70,$20,$04,$0E,$1F,$1F
	.byte $0A,$01,$00,$03,$80,$07,$C0,$07
	.byte $C0,$02,$80,$20,$70,$F8,$F8,$50
	.byte $04,$04,$1B,$1F,$0E,$01,$00,$01
	.byte $00,$06,$C0,$07,$C0,$03,$80,$20
	.byte $20,$D8,$F8,$70,$0E,$04,$1F,$0E
	.byte $04,$03,$80,$01,$00,$07,$C0,$03
	.byte $80,$01,$00,$70,$20,$F8,$70,$20

L_JMP_9BC8_9D09:
L_JSR_9BC8_9D36:
L_JSR_9BC8_9EC2:

	lda $A3 
	pha 
	lda $A4 
	pha 
	lda #$05

L_BRS_9BD0_9BFE:

	pha 
	jsr L_JSR_92AA_9BD1
	ldy #$1F
	lda $02 
	beq L_BRS_9BDE_9BD8
	ldx #$FF
	stx $02 

L_BRS_9BDE_9BD8:
L_BRS_9BDE_9BE3:

	sta ($03),Y 
	eor $02 
	dey 
	bpl L_BRS_9BDE_9BE3
	sta $02 
	jsr L_JSR_92F4_9BE7
	lda $A5 
	ldy #$03

L_BRS_9BEE_9BF1:

	sta ($05),Y 
	dey 
	bpl L_BRS_9BEE_9BF1
	lda #$08
	clc 
	adc $A4 
	sta $A4 
	pla 
	tay 
	dey 
	tya 
	bne L_BRS_9BD0_9BFE
	pla 
	sta $A4 
	pla 
	sta $A3 
	rts 

L_JMP_9C07_9D6B:

	lda $A3 
	pha 
	clc 
	adc #$04
	sta $A3 
	lda $A4 
	pha 
	clc 
	adc #$0E
	sta $A4 
	lda #$9A
	sta $FC 
	lda #$C8
	sta $FB 
	ldx #$18
	jsr L_JSR_93E2_9C21
	lda #$0B
	sta $A5 
	jsr L_JSR_9C32_9C28
	pla 
	sta $A4 
	pla 
	sta $A3 
	rts 

L_JSR_9C32_9C28:
L_BRS_9C32_9C53:
L_JSR_9C32_9CB4:

	jsr L_JSR_92AA_9C32
	ldy #$01
	lda ($FB),Y 
	ldy #$08
	sta ($03),Y 
	ldy #$00
	lda ($FB),Y 
	sta ($03),Y 
	inc $FB 
	inc $FB 
	lda $FB 
	cmp #$02
	bcs L_BRS_9C4F_9C4B
	inc $FC 

L_BRS_9C4F_9C4B:

	inc $A4 
	dec $A5 
	bne L_BRS_9C32_9C53
	rts 

L_JSR_9C56_9D9D:
L_JSR_9C56_9DAA:
L_JSR_9C56_9DB7:
L_JSR_9C56_9DC4:
L_JMP_9C56_9DDC:
L_JSR_9C56_9DF0:
L_JSR_9C56_9DFD:
L_JSR_9C56_9E11:
L_JMP_9C56_9E24:
L_JSR_9C56_9E31:
L_JSR_9C56_9E3E:
L_JMP_9C56_9E51:
L_JSR_9C56_9E5F:
L_JSR_9C56_9E6C:
L_JSR_9C56_9E79:
L_JSR_9C56_9E86:
L_JSR_9C56_9E99:
L_JMP_9C56_9EA6:
L_JMP_9C56_9EB3:

	lda $A3 
	pha 
	lda $A4 
	pha 
	lda $AD 
	sec 
	sbc #$14
	lda #$9B
	sta $FC 
	lda #$28
	sta $FB 
	bcc L_BRS_9C73_9C69
	lda #$9B
	sta $FC 
	lda #$78
	sta $FB 

L_BRS_9C73_9C69:

	lda $AC 
	clc 
	adc $A3 
	sta $A3 
	lda $AD 
	adc $A4 
	sta $A4 
	lda $02 
	pha 
	ldx #$14
	jsr L_JSR_93E2_9C85
	lda $AC 
	lsr 
	lsr 
	sta $02 
	ldx #$05
	jsr L_JSR_93E2_9C90
	ldx $AC 
	ldy #$05
	sty $A5 
	cpx #$04
	beq L_BRS_9CB4_9C9B

L_BRS_9C9D_9CB0:

	jsr L_JSR_92AA_9C9D
	ldy #$00
	lda ($FB),Y 
	sta ($03),Y 
	inc $FB 
	bne L_BRS_9CAC_9CA8
	inc $FC 

L_BRS_9CAC_9CA8:

	inc $A4 
	dec $A5 
	bne L_BRS_9C9D_9CB0
	beq L_BRS_9CB7_9CB2

L_BRS_9CB4_9C9B:

	jsr L_JSR_9C32_9CB4

L_BRS_9CB7_9CB2:

	pla 
	sta $02 
	pla 
	sta $A4 
	pla 
	sta $A3 
	rts 

L_JMP_9CC1_9D5A:

	lda $A3 
	pha 
	lda $A4 
	pha 
	lda #$84
	sta $FC 
	lda #$00
	sta $FB 
	ldx #$A0
	jsr L_JSR_93E2_9CD1
	lda #$05
	sta $A5 

L_BRS_9CD8_9CF8:

	jsr L_JSR_92AA_9CD8
	ldy #$1F

L_BRS_9CDD_9CE2:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_9CDD_9CE2
	lda #$08
	clc 
	adc $A4 
	sta $A4 
	lda $FB 
	clc 
	adc #$20
	sta $FB 
	bcc L_BRS_9CF6_9CF2
	inc $FC 

L_BRS_9CF6_9CF2:

	dec $A5 
	bne L_BRS_9CD8_9CF8
	pla 
	sta $A4 
	pla 
	sta $A3 
	rts 

L_JMP_9D01_9015:
L_JMP_9D01_9D21:

	lda #$50
	sta $A5 
	lda #$AA
	sta $02 
	jmp L_JMP_9BC8_9D09

L_JMP_9D0C_9018:

	lda $A3 
	pha 
	lda $A4 
	pha 
	jsr L_JSR_9982_9D12
	pla 
	sta $A4 
	pla 
	sta $A3 

L_JMP_9D1B_9024:
L_JMP_9D1B_9819:

	lda $F9 
	cmp #$34
	bcc L_BRS_9D24_9D1F
	jmp L_JMP_9D01_9D21

L_BRS_9D24_9D1F:

	lda #$01
	sta $A5 
	lda #$00
	sta $02 
	lda $F9 
	cmp #$1A
	bcs L_BRS_9D36_9D30
	lda #$21
	sta $A5 

L_BRS_9D36_9D30:

	jsr L_JSR_9BC8_9D36
	ldy #$00

L_BRS_9D3B_9D47:

	lda $F9 
	cmp #$0D
	bcc L_BRS_9D49_9D3F
	sec 
	sbc #$0D
	sta $F9 
	iny 
	bne L_BRS_9D3B_9D47

L_BRS_9D49_9D3F:

	cmp #$0A
	bcc L_BRS_9D5D_9D4B
	sec 
	sbc #$0A
	asl 
	asl 
	sta $02 
	tya 
	clc 
	adc $02 
	sta $02 
	jmp L_JMP_9CC1_9D5A

L_BRS_9D5D_9D4B:

	sta $02 
	tya 
	pha 
	jsr L_JSR_992F_9D61
	pla 
	sta $02 
	lda $F9 
	bne L_BRS_9D8C_9D69
	jmp L_JMP_9C07_9D6B
	.byte $00,$08,$04,$08,$0C,$08,$00,$1A
	.byte $04,$1A,$0C,$1A,$04,$11,$00,$11
	.byte $0C,$11,$04,$0B,$04,$17,$00,$0E
	.byte $00,$14,$0C,$0E,$0C,$14

L_BRS_9D8C_9D69:

	cmp #$03
	bcs L_BRS_9D93_9D8E
	jmp L_JMP_9E27_9D90

L_BRS_9D93_9D8E:

	lda $9D6F 
	sta $AD 
	lda $9D6E 
	sta $AC 
	jsr L_JSR_9C56_9D9D
	lda $9D75 
	sta $AD 
	lda $9D74 
	sta $AC 
	jsr L_JSR_9C56_9DAA
	lda $9D73 
	sta $AD 
	lda $9D72 
	sta $AC 
	jsr L_JSR_9C56_9DB7
	lda $9D79 
	sta $AD 
	lda $9D78 
	sta $AC 
	jsr L_JSR_9C56_9DC4
	lda $F9 
	cmp #$03
	bne L_BRS_9DCE_9DCB
	rts 

L_BRS_9DCE_9DCB:

	cmp #$04
	bne L_BRS_9DDF_9DD0
	lda $9D7B 
	sta $AD 
	lda $9D7A 
	sta $AC 
	jmp L_JMP_9C56_9DDC

L_BRS_9DDF_9DD0:

	cmp #$08
	bcc L_BRS_9DE6_9DE1
	jmp L_JMP_9E55_9DE3

L_BRS_9DE6_9DE1:

	lda $9D7D 
	sta $AD 
	lda $9D7C 
	sta $AC 
	jsr L_JSR_9C56_9DF0
	lda $9D7F 
	sta $AD 
	lda $9D7E 
	sta $AC 
	jsr L_JSR_9C56_9DFD
	lda $F9 
	cmp #$05
	bne L_BRS_9E07_9E04

L_BRS_9E06_9E18:

	rts 

L_BRS_9E07_9E04:

	lda $9D81 
	sta $AD 
	lda $9D80 
	sta $AC 
	jsr L_JSR_9C56_9E11
	lda $F9 
	cmp #$06
	beq L_BRS_9E06_9E18
	lda $9D83 
	sta $AD 
	lda $9D82 
	sta $AC 
	jmp L_JMP_9C56_9E24

L_JMP_9E27_9D90:

	lda $9D71 
	sta $AD 
	lda $9D70 
	sta $AC 
	jsr L_JSR_9C56_9E31
	lda $9D77 
	sta $AD 
	lda $9D76 
	sta $AC 
	jsr L_JSR_9C56_9E3E
	lda $F9 
	cmp #$01
	beq L_BRS_9E54_9E45
	lda $9D7B 
	sta $AD 
	lda $9D7A 
	sta $AC 
	jmp L_JMP_9C56_9E51

L_BRS_9E54_9E45:

	rts 

L_JMP_9E55_9DE3:

	lda $9D85 
	sta $AD 
	lda $9D84 
	sta $AC 
	jsr L_JSR_9C56_9E5F
	lda $9D87 
	sta $AD 
	lda $9D86 
	sta $AC 
	jsr L_JSR_9C56_9E6C
	lda $9D89 
	sta $AD 
	lda $9D88 
	sta $AC 
	jsr L_JSR_9C56_9E79
	lda $9D8B 
	sta $AD 
	lda $9D8A 
	sta $AC 
	jsr L_JSR_9C56_9E86
	lda $F9 
	cmp #$08
	beq L_BRS_9EA9_9E8D
	lda $9D81 
	sta $AD 
	lda $9D80 
	sta $AC 
	jsr L_JSR_9C56_9E99
	lda $9D83 
	sta $AD 
	lda $9D82 
	sta $AC 
	jmp L_JMP_9C56_9EA6

L_BRS_9EA9_9E8D:

	lda $9D7B 
	sta $AD 
	lda $9D7A 
	sta $AC 
	jmp L_JMP_9C56_9EB3

L_JMP_9EB6_901E:

	ldy $A5 

L_BRS_9EB8_9ECF:

	tya 
	pha 
	lda #$05
	sta $A5 
	lda #$00
	sta $02 
	jsr L_JSR_9BC8_9EC2
	lda $A3 
	clc 
	adc #$08
	sta $A3 
	pla 
	tay 
	dey 
	bne L_BRS_9EB8_9ECF
	rts 
	.byte $00,$66,$66,$66,$7E,$66,$66,$66
	.byte $00,$7E,$66,$66,$66,$66,$66,$7E
	.byte $00,$60,$60,$60,$60,$60,$60,$7E
	.byte $00,$78,$6C,$66,$66,$66,$6C,$78
	.byte $FF,$87,$93,$99,$99,$99,$93,$87
	.byte $FF,$87,$93,$99,$93,$87,$93,$99
	.byte $FF,$E7,$C3,$99,$99,$81,$99,$99
	.byte $FF,$9C,$9C,$9C,$94,$94,$C1,$E3

L_JMP_9F12_9027:

	lda #$9E
	sta $FC 
	lda #$D2
	sta $FB 
	ldx #$20
	jsr L_JSR_93E2_9F1C
	jsr L_JSR_92AA_9F1F
	ldy #$1F

L_BRS_9F24_9F29:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_9F24_9F29
	rts 

L_JMP_9F2C_902A:
L_BRS_9F2C_9F2F:

	lda $D011                          // Control Register 1
	bpl L_BRS_9F2C_9F2F
	lda $D015                          // Sprite display Enable
	and #$80
	ora $A5
	sta $D015                          // Sprite display Enable
	rts 

L_JMP_9F3C_902D:

	jsr L_JSR_9252_9F3C
	lda #$C1
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	lda #$2C
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	lda #$09
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	lda #$9C
	sta $D40E                          // Voice 3: Frequency Control - Low-Byte
	lda #$1A
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	lda #$8F
	sta $D418                          // Select Filter Mode and Volume
	lda #$15
	sta $D404                          // Voice 1: Control Register
	rts
