	jmp L_JMP_7072_7000
	jmp L_JMP_70B6_7003
	jmp L_JMP_725A_7006
	jmp L_JMP_727A_7009
	jmp L_JMP_7513_700C
	jmp L_JMP_788E_700F
	jmp L_JMP_75F3_7012
	jmp L_JMP_7FC0_7015
	jmp L_JMP_7998_7018
	jmp L_JMP_79E6_701B
	jmp L_JMP_72E5_701E
	jmp L_JMP_7750_7021
	jmp L_JMP_7ADB_7024
	jmp L_JMP_7AF2_7027
	jmp L_JMP_7900_702A
	jmp L_JMP_71FF_702D
	jmp L_JMP_7218_7030
	.byte $2C,$78,$95,$7D,$7F,$80,$37,$78
	.byte $40,$70,$98,$9A,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00

L_JSR_7048_7080:

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
	jsr L_JSR_7227_7062
	lda $01 
	ora #$04
	sta $01 
	rts 
	.byte $F9,$14,$3A,$00,$00,$00

L_JMP_7072_7000:

	jsr L_JSR_71FF_7072

L_BRS_7075_7078:

	lda $D011                          // Control Register 1
	bpl L_BRS_7075_7078
	sei 
	lda #$7F
	sta $DC0D                          // Interrupt (IRQ) Control Register
	jsr L_JSR_7048_7080
	lda $D01A                          // Interrupt Mask Register (IMR)
	ora #$01
	sta $D01A                          // Interrupt Mask Register (IMR)
	ldx #$00
	stx $706F 
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $706C,X 
	sta $D012                          // Raster Position
	lda $0315 
	sta $7071 
	lda $0314 
	sta $7070 
	lda #$70
	sta $0315 
	lda #$E1
	sta $0314 
	cli 
	rts 

L_JMP_70B6_7003:
L_BRS_70B6_70B9:

	lda $D011                          // Control Register 1
	bpl L_BRS_70B6_70B9
	sei 
	lda $D01A                          // Interrupt Mask Register (IMR)
	and #$FE
	sta $D01A                          // Interrupt Mask Register (IMR)
	lda $D016                          // Control Register 2
	and #$EF
	sta $D016                          // Control Register 2
	lda #$81
	sta $DC0D                          // Interrupt (IRQ) Control Register
	lda $7071 
	sta $0315 
	lda $7070 
	sta $0314 
	cli 
	jmp L_JMP_7218_70DE
	ldy $706F 
	beq L_BRS_70FC_70E4
	cpy #$02
	bcc L_BRS_70F4_70E8
	lda $D016                          // Control Register 2
	ora #$10
	sta $D016                          // Control Register 2
	bcs L_BRS_70FC_70F2

L_BRS_70F4_70E8:

	lda $D016                          // Control Register 2
	and #$EF
	sta $D016                          // Control Register 2

L_BRS_70FC_70E4:
L_BRS_70FC_70F2:

	iny 
	cpy #$03
	bcc L_BRS_7103_70FF
	ldy #$00

L_BRS_7103_70FF:

	sty $706F 
	lda $706C,Y 
	sta $D012                          // Raster Position
	lda $D011                          // Control Register 1
	and #$7F
	sta $D011                          // Control Register 1
	lda $D019                          // Interrupt Request Register (IRR)
	ora #$01
	sta $D019                          // Interrupt Request Register (IRR)
	cpy #$01
	bne L_BRS_7123_711E
	jmp ($7070) 

L_BRS_7123_711E:

	pla 
	tay 
	pla 
	tax 
	pla 
	rti 
	lda $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	and #$1F
	sta $703F 
	lda $703F 
	and #$01
	bne L_BRS_7147_7136
	dec $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$3A
	bcs L_BRS_7147_7140
	ldx #$3A
	stx $D001                          // Sprite 0 Y Pos

L_BRS_7147_7136:
L_BRS_7147_7140:

	lda $703F 
	and #$02
	bne L_BRS_715D_714C
	inc $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$EE
	bcc L_BRS_715D_7156
	ldx #$ED
	stx $D001                          // Sprite 0 Y Pos

L_BRS_715D_714C:
L_BRS_715D_7156:

	lda $703F 
	and #$04
	bne L_BRS_7184_7162
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	beq L_BRS_717D_716C
	cpy #$00
	bne L_BRS_7181_7170
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$FE
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_7181_717B

L_BRS_717D_716C:

	cpy #$19
	bcc L_BRS_7184_717F

L_BRS_7181_7170:
L_BRS_7181_717B:

	dec $D000                          // Sprite 0 X Pos

L_BRS_7184_7162:
L_BRS_7184_717F:

	lda $703F 
	and #$08
	bne L_BRS_71AB_7189
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_71A4_7193
	cpy #$FF
	bne L_BRS_71A8_7197
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	ora #$01
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_71A8_71A2

L_BRS_71A4_7193:

	cpy #$4B
	bcs L_BRS_71AB_71A6

L_BRS_71A8_7197:
L_BRS_71A8_71A2:

	inc $D000                          // Sprite 0 X Pos

L_BRS_71AB_7189:
L_BRS_71AB_71A6:

	lda $703F 
	and #$10
	bne L_BRS_71EC_71B0
	lda $7040 
	bne L_BRS_71E6_71B5
	lda $D01E                          // Sprite to Sprite Collision Detect
	lsr 
	beq L_BRS_71EC_71BB
	bcc L_BRS_71EC_71BD
	ldx #$00

L_BRS_71C1_71C3:

	inx 
	lsr 
	bcc L_BRS_71C1_71C3
	lda $7041 
	bne L_BRS_71E3_71C8
	lda #$01
	sta $D015                          // Sprite display Enable
	lda $D027,X                          // Sprite 0 Color
	sta $D028                          // Sprite 1 Color
	inc $7041 
	lda $D015                          // Sprite display Enable
	ora #$02
	sta $D015                          // Sprite display Enable
	jsr L_JSR_72A5_71E0

L_BRS_71E3_71C8:

	jsr L_JSR_7B09_71E3

L_BRS_71E6_71B5:
L_BRS_71E6_71EF:
L_JMP_71E6_71FC:

	lda $D01E                          // Sprite to Sprite Collision Detect
	jmp ($7042) 

L_BRS_71EC_71B0:
L_BRS_71EC_71BB:
L_BRS_71EC_71BD:

	lda $7041 
	beq L_BRS_71E6_71EF
	ldy #$00
	sty $7041 
	jsr L_JSR_7956_71F6
	jsr L_JSR_72A5_71F9
	jmp L_JMP_71E6_71FC

L_JMP_71FF_702D:
L_JSR_71FF_7072:

	sei 
	lda $0315 
	sta $7043 
	lda $0314 
	sta $7042 
	lda #$71
	sta $0315 
	lda #$29
	sta $0314 
	cli 
	rts 

L_JMP_7218_7030:
L_JMP_7218_70DE:

	sei 
	lda $7043 
	sta $0315 
	lda $7042 
	sta $0314 
	cli 
	rts 

L_JSR_7227_7062:
L_JSR_7227_7585:
L_JSR_7227_759C:
L_JSR_7227_75B3:
L_JSR_7227_76ED:
L_JMP_7227_7704:
L_JMP_7227_7AEF:
L_JMP_7227_7B06:

	sta $7237 
	stx $7256 
	ldy #$00
	cmp #$00
	beq L_BRS_724C_7231
	clc 
	lda $FC 
	adc #$00
	sta $7249 

L_BRS_723B_7240:
L_BRS_723B_724A:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	bne L_BRS_723B_7240
	inc $FC 
	inc $FE 
	lda $FC 
	cmp #$00
	bcc L_BRS_723B_724A

L_BRS_724C_7231:

	cpx #$00
	beq L_BRS_7259_724E

L_BRS_7250_7257:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	cpy #$40
	bcc L_BRS_7250_7257

L_BRS_7259_724E:

	rts 

L_JMP_725A_7006:
L_JSR_725A_75C5:
L_JSR_725A_767C:

	lda #$38
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$01
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda $D016                          // Control Register 2
	ora #$10
	sta $D016                          // Control Register 2
	lda $D011                          // Control Register 1
	ora #$20
	sta $D011                          // Control Register 1
	rts 

L_JMP_727A_7009:
L_JSR_727A_7758:

	lda #$15
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$03
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda $D016                          // Control Register 2
	and #$EF
	sta $D016                          // Control Register 2
	lda $D011                          // Control Register 1
	and #$DF
	sta $D011                          // Control Register 1
	rts 

L_JSR_729A_72E5:
L_JSR_729A_79E9:
L_JSR_729A_7A43:
L_JSR_729A_7FC0:
L_JMP_729A_807B:

	ldy #$18
	lda #$00

L_BRS_729E_72A2:

	sta $D400,Y                          // Voice 1: Frequency Control - Low-Byte
	dey 
	bpl L_BRS_729E_72A2
	rts 

L_JSR_72A5_71E0:
L_JSR_72A5_71F9:

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

L_JMP_72E5_701E:

	jsr L_JSR_729A_72E5
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

L_JSR_730C_7FF8:
L_JSR_730C_803F:

	lda #$0C
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	sta $D407                          // Voice 2: Frequency Control - Low-Byte
	lda #$01
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	sta $D408                          // Voice 2: Frequency Control - High-Byte
	lda #$17
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	sta $D40C                          // Voice 2: Attack / Decay Cycle Control
	lda #$47
	sta $D406                          // Voice 1: Sustain / Release Cycle Control
	sta $D40D                          // Voice 2: Sustain / Release Cycle Control
	lda #$C0
	sta $D402                          // Voice 1: Pulse Waveform Width - Low-Byte
	sta $D409                          // Voice 2: Pulse Waveform Width - Low-Byte
	lda #$04
	sta $D416                          // Filter Cutoff Frequency: High-Byte
	lda #$03
	sta $D417                          // Filter Resonance Control / Voice Input Control
	lda #$AF
	sta $D418                          // Select Filter Mode and Volume
	lda #$44
	sta $D404                          // Voice 1: Control Register
	sta $D40B                          // Voice 2: Control Register
	lda #$45
	sta $D404                          // Voice 1: Control Register
	sta $D40B                          // Voice 2: Control Register
	rts 

L_JSR_7354_8053:

	lda #$C3
	sta $D400                          // Voice 1: Frequency Control - Low-Byte
	lda #$10
	sta $D401                          // Voice 1: Frequency Control - High-Byte
	lda #$08
	sta $D405                          // Voice 1: Attack / Decay Cycle Control
	lda #$00
	sta $D406                          // Voice 1: Sustain / Release Cycle Control
	lda #$8F
	sta $D418                          // Select Filter Mode and Volume
	lda #$80
	sta $D404                          // Voice 1: Control Register
	lda #$81
	sta $D404                          // Voice 1: Control Register
	rts 

L_JSR_7378_7A34:

	dec $73B5 
	bne L_BRS_73B4_737B
	lda #$02
	sta $73B5 
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

L_BRS_73B4_737B:

	rts 
	.byte $02,$A9,$E0,$85,$04,$A9,$00,$85
	.byte $03,$A6,$A3,$A4,$A4,$B8,$50,$0C

L_JSR_73C5_74AD:
L_JSR_73C5_74D2:
L_JSR_73C5_7B6B:
L_JSR_73C5_7E2B:
L_JSR_73C5_7E63:
L_JSR_73C5_7EF2:
L_JSR_73C5_7F67:

	ldx $A3 
	ldy $A4 

L_JSR_73C9_7904:

	lda #$A0
	sta $04 
	lda #$00
	sta $03 
	tya 
	pha 
	and #$F8
	sta $73DC 
	ldy #$27

L_BRS_73DA_73E2:

	clc 
	adc #$00
	bcc L_BRS_73E1_73DD
	inc $04 

L_BRS_73E1_73DD:

	dey 
	bne L_BRS_73DA_73E2
	sta $03 
	pla 
	and #$07
	clc 
	adc $03 
	sta $03 
	bcc L_BRS_73F2_73EE
	inc $04 

L_BRS_73F2_73EE:

	txa 
	asl 
	bcc L_BRS_73F8_73F4
	inc $04 

L_BRS_73F8_73F4:

	clc 
	and #$F8
	adc $03 
	sta $03 
	bcc L_BRS_7403_73FF
	inc $04 

L_BRS_7403_73FF:

	rts 
	lda #$CC
	sta $06 
	lda #$00
	sta $05 
	clv
	bvc L_BRS_741B_740D

L_JSR_740F_79BA:
L_JSR_740F_7DEF:
L_JSR_740F_7E2E:
L_JSR_740F_7E66:
L_JSR_740F_7EF5:
L_JSR_740F_7F6A:

	ldx $A3 
	ldy $A4 

L_JSR_7413_790B:

	lda #$8C
	sta $06 
	lda #$00
	sta $05 

L_BRS_741B_740D:

	tya 
	lsr 
	lsr 
	lsr 
	beq L_BRS_7430_741F
	tay 

L_BRS_7422_742E:

	lda #$28
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_742D_7429
	inc $06 

L_BRS_742D_7429:

	dey 
	bne L_BRS_7422_742E

L_BRS_7430_741F:

	txa 
	lsr 
	lsr 
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_743C_7438
	inc $06 

L_BRS_743C_7438:

	rts 

L_JSR_743D_78DC:

	sty $7444 
	lda $FB 
	clc 
	adc #$00
	sta $FD 

L_BRS_7447_7466:

	ldy #$01
	lda ($FB),Y 
	ror 
	ldx #$01
	ldy #$00

L_BRS_7450_7457:

	lda ($FB),Y 
	ror 
	sta ($FB),Y 
	iny 
	dex 
	bpl L_BRS_7450_7457
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_7464_7460
	inc $FC 

L_BRS_7464_7460:

	cmp $FD 
	bne L_BRS_7447_7466
	rts 

L_JSR_7469_78F7:

	sty $7470 
	lda $FB 
	clc 
	adc #$00
	sta $FD 

L_BRS_7473_748F:

	ldy #$00
	lda ($FB),Y 
	rol 
	ldy #$01

L_BRS_747A_7480:

	lda ($FB),Y 
	rol 
	sta ($FB),Y 
	dey 
	bpl L_BRS_747A_7480
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_748D_7489
	inc $FC 

L_BRS_748D_7489:

	cmp $FD 
	bne L_BRS_7473_748F
	rts 

L_JSR_7492_7888:

	sty $74CB 
	lda $7045 
	sta $74BB 
	lda $7044 
	sta $74BA 
	lda $7047 
	sta $74BE 
	lda $7046 
	sta $74BD 
	jsr L_JSR_73C5_74AD
	ldx #$00

L_BRS_74B2_74DB:

	ldy #$00

L_BRS_74B4_74CC:

	jsr L_JSR_74E6_74B4
	lda ($03),Y 
	and $781C,X 
	ora $777C,X
	sta ($03),Y 
	jsr L_JSR_74F5_74C1
	tya 
	clc 
	adc #$08
	tay 
	inx 
	cpy #$11
	bcc L_BRS_74B4_74CC
	txa 
	pha 
	inc $A4 
	jsr L_JSR_73C5_74D2
	pla 
	tax 
	dec $A5 
	lda $A5 
	bne L_BRS_74B2_74DB
	rts 

L_JSR_74DE_7899:

	lda $A3 
	asl 
	and #$06
	sta $FF 
	rts 

L_JSR_74E6_74B4:

	sei 
	lda $01 
	and #$FC
	sta $01 
	rts 

L_JSR_74EE_756E:
L_JSR_74EE_7EE7:

	lda $01 
	and #$FE
	sta $01 
	rts 

L_JSR_74F5_74C1:
L_JSR_74F5_75B6:
L_JSR_74F5_7F50:

	lda $01 
	ora #$03
	sta $01 
	cli 
	rts 

L_JSR_74FD_7858:
L_JSR_74FD_7DAE:
L_JSR_74FD_7DCC:
L_JMP_74FD_7DE4:
L_JSR_74FD_7EBB:
L_JSR_74FD_7FB3:

	stx $7508 
	ldy $02 
	beq L_BRS_7512_7502
	lda $FB 

L_BRS_7506_750E:

	clc 
	adc #$00
	bcc L_BRS_750D_7509
	inc $FC 

L_BRS_750D_7509:

	dey 
	bne L_BRS_7506_750E
	sta $FB 

L_BRS_7512_7502:

	rts 

L_JMP_7513_700C:

	jsr $FFE7                         // Close All Channels And Files
	lda #$00
	jsr $FF90                         // Control OS Messages
	lda #$71
	sta $0317 
	lda #$23
	sta $0316 
	lda #$71
	sta $0319 
	lda #$28
	sta $0318 
	lda #$EA
	sta $0328 
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$07
	ldx #$D1
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_756E_754F
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$03
	ldx #$D8
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$40
	ldy #$FF
	jsr $FFD5                         // Load RAM From Device
	rts 

L_JSR_756E_754F:

	jsr L_JSR_74EE_756E
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
	jsr L_JSR_7227_7585
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
	jsr L_JSR_7227_759C
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
	jsr L_JSR_7227_75B3
	jsr L_JSR_74F5_75B6
	lda $C328 
	sta $D020                          // Border Color
	lda $C329 
	sta $D021                          // Background Color 0
	jsr L_JSR_725A_75C5
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	rts 
	.byte $53,$4C,$4F,$54,$53,$45,$4C,$41
	.byte $52,$52,$53,$4C,$30,$43,$4F,$4C
	.byte $30,$4E,$41,$4D,$30,$48,$41,$4E
	.byte $30,$53,$4C,$44,$41,$54,$50,$41
	.byte $59,$30

L_JMP_75F3_7012:

	lda $FF 
	sec 

L_BRS_75F6_75F8:

	sbc #$03
	bcs L_BRS_75F6_75F8
	adc #$03
	bne L_BRS_7600_75FC
	adc #$02

L_BRS_7600_75FC:

	tax 

L_BRS_7601_7608:

	inc $75DD 
	inc $75E9 
	dex 
	bne L_BRS_7601_7608
	ldx $FF 

L_BRS_760C_7613:

	inc $75E1 
	inc $75E5 
	dex 
	bne L_BRS_760C_7613
	lda $75E9 
	cmp #$33
	bne L_BRS_761F_761A
	inc $7BA5 

L_BRS_761F_761A:

	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$03
	ldx #$DB
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5                         // Load RAM From Device
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$04
	ldx #$DE
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$C8
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_76D9_7655
	lda $FF 
	cmp #$01
	beq L_BRS_767C_765C
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$04
	ldx #$E2
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$C8
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_7707_7679

L_BRS_767C_765C:

	jsr L_JSR_725A_767C
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$05
	ldx #$EA
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$90
	jsr $FFD5                         // Load RAM From Device
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$04
	ldx #$E6
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$60
	ldy #$93
	jsr $FFD5                         // Load RAM From Device
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$03
	ldx #$D8
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$40
	ldy #$BF
	jsr $FFD5                         // Load RAM From Device
	jsr L_JSR_7DE7_76D0
	jsr L_JSR_7D9C_76D3
	jmp L_JMP_7E1F_76D6

L_JSR_76D9_7655:

	lda #$C8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$8C
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jsr L_JSR_7227_76ED
	lda #$CC
	sta $FC 
	lda #$00
	sta $FB 
	lda #$D8
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_7227_7704

L_JSR_7707_7679:

	lda #$04
	sta $A5 
	lda #$C8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$A7
	sta $FE 
	lda #$C8
	sta $FD 
	lda $75DD 
	cmp #$33
	beq L_BRS_772A_7720
	lda #$A7
	sta $FE 
	lda #$D8
	sta $FD 

L_BRS_772A_7720:
L_BRS_772A_774D:

	ldy #$7F

L_BRS_772C_7731:

	lda ($FB),Y 
	sta ($FD),Y 
	dey 
	bpl L_BRS_772C_7731
	lda $FB 
	clc 
	adc #$80
	sta $FB 
	bcc L_BRS_773E_773A
	inc $FC 

L_BRS_773E_773A:

	lda $FD 
	clc 
	adc #$40
	sta $FD 
	lda $FE 
	adc #$01
	sta $FE 
	dec $A5 
	bne L_BRS_772A_774D
	rts 

L_JMP_7750_7021:

	lda $02 
	clc 
	adc #$30
	sta $75F2 
	jsr L_JSR_727A_7758
	lda #$00
	sta $D015                          // Sprite display Enable
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA                         // Set Logical File Parameters
	lda #$04
	ldx #$EF
	ldy #$75
	jsr $FFBD                         // Set Filename
	lda #$00
	ldx #$00
	ldy #$04
	jsr $FFD5                         // Load RAM From Device
	rts 
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
	.byte $00,$00,$00,$00

L_JSR_7838_7866:

	lda #$00
	ldx $FF 
	beq L_BRS_7843_783C

L_BRS_783E_7841:

	sec 
	ror 
	dex 
	bne L_BRS_783E_7841

L_BRS_7843_783C:

	ldy #$0F

L_BRS_7845_784B:

	eor #$FF
	sta $781C,Y 
	dey 
	bpl L_BRS_7845_784B
	rts 

L_JSR_784E_78B0:

	lda #$77
	sta $FC 
	lda #$7C
	sta $FB 
	ldx #$10
	jsr L_JSR_74FD_7858
	lda $FC 
	sta $7836 
	lda $FB 
	sta $7835 
	rts 

L_JSR_7866_78B3:

	jsr L_JSR_7838_7866
	lda $7836 
	sta $7047 
	lda $7835 
	sta $7046 
	lda #$78
	sta $7045 
	lda #$1C
	sta $7044 
	jsr L_JSR_78CA_787F
	ldy #$08
	sty $A5 
	ldy #$09
	jsr L_JSR_7492_7888
	jmp L_JMP_78E5_788B

L_JMP_788E_700F:

	lda #$56
	ldy $7837 
	beq L_BRS_7897_7893
	lda #$2E

L_BRS_7897_7893:

	sta $A3 
	jsr L_JSR_74DE_7899
	ldy #$00

L_BRS_789E_78C7:

	lda #$B0
	ldx $7837 
	beq L_BRS_78A7_78A3
	lda #$1A

L_BRS_78A7_78A3:

	sta $A4 
	tya 
	pha 
	lda $782C,Y 
	sta $02 
	jsr L_JSR_784E_78B0
	jsr L_JSR_7866_78B3
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
	bcc L_BRS_789E_78C7
	rts 

L_JSR_78CA_787F:

	ldx $FF 
	beq L_BRS_78E4_78CC

L_BRS_78CE_78E2:

	txa 
	pha 
	ldy #$10
	lda $7836 
	sta $FC 
	lda $7835 
	sta $FB 
	jsr L_JSR_743D_78DC
	pla 
	tax 
	dex 
	bne L_BRS_78CE_78E2

L_BRS_78E4_78CC:

	rts 

L_JMP_78E5_788B:

	ldx $FF 
	beq L_BRS_78FF_78E7

L_BRS_78E9_78FD:

	txa 
	pha 
	ldy #$10
	lda $7836 
	sta $FC 
	lda $7835 
	sta $FB 
	jsr L_JSR_7469_78F7
	pla 
	tax 
	dex 
	bne L_BRS_78E9_78FD

L_BRS_78FF_78E7:

	rts 

L_JMP_7900_702A:

	ldy $A4 
	ldx #$00
	jsr L_JSR_73C9_7904
	ldy $A4 
	ldx #$00
	jsr L_JSR_7413_790B
	ldx #$00

L_BRS_7910_7953:

	lda #$C0
	sta $FC 
	lda #$00
	sta $FB 
	lda $9A98,X 
	cmp #$20
	beq L_BRS_7945_791D
	sta $A5 
	ldy #$07

L_BRS_7923_792B:

	clc 
	adc $A5 
	bcc L_BRS_792A_7926
	inc $FC 

L_BRS_792A_7926:

	dey 
	bne L_BRS_7923_792B
	clc 
	adc $FB 
	sta $FB 
	bcc L_BRS_7936_7932
	inc $FC 

L_BRS_7936_7932:

	ldy #$07

L_BRS_7938_793D:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_7938_793D
	txa 
	tay 
	lda $02 
	sta ($05),Y 

L_BRS_7945_791D:

	lda $03 
	clc 
	adc #$08
	sta $03 
	bcc L_BRS_7950_794C
	inc $04 

L_BRS_7950_794C:

	inx 
	cpx #$28
	bcc L_BRS_7910_7953
	rts 

L_JSR_7956_71F6:

	inc $7040 
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_797B_795E
	ldx $D002                          // Sprite 1 X Pos
	ldy $D003                          // Sprite 1 Y Pos
	lda $7BA5 
	bne L_BRS_7989_7969
	cpx #$C8
	bcc L_BRS_797B_796D
	cpx #$FA
	bcs L_BRS_797B_7971
	cpy #$96
	bcc L_BRS_797B_7975
	cpy #$B9
	bcc L_BRS_7980_7979

L_BRS_797B_795E:
L_BRS_797B_796D:
L_BRS_797B_7971:
L_BRS_797B_7975:
L_BRS_797B_798B:
L_BRS_797B_798F:
L_BRS_797B_7993:

	lda #$00
	sta $D028                          // Sprite 1 Color

L_BRS_7980_7979:
L_BRS_7980_7996:

	lda $D015                          // Sprite display Enable
	and #$FD
	sta $D015                          // Sprite display Enable
	rts 

L_BRS_7989_7969:

	cpx #$F0
	bcc L_BRS_797B_798B
	cpy #$73
	bcc L_BRS_797B_798F
	cpy #$7E
	bcs L_BRS_797B_7993
	clv
	bvc L_BRS_7980_7996

L_JMP_7998_7018:

	lda $02 
	ldy #$50
	cmp #$04
	beq L_BRS_79B4_799E
	ldy #$90
	cmp #$05
	beq L_BRS_79B4_79A4
	tax 
	ldy #$60
	dex 
	beq L_BRS_79B4_79AA
	tya 
	clc 

L_BRS_79AE_79B1:

	adc #$10
	dex 
	bne L_BRS_79AE_79B1
	tay 

L_BRS_79B4_799E:
L_BRS_79B4_79A4:
L_BRS_79B4_79AA:

	sty $A4 
	ldx #$10
	stx $A3 
	jsr L_JSR_740F_79BA
	lda $06 
	clc 
	adc #$4C
	sta $06 
	ldy #$05

L_BRS_79C6_79CD:

	lda ($05),Y 
	eor #$0A
	sta ($05),Y 
	dey 
	bpl L_BRS_79C6_79CD
	lda $05 
	clc 
	adc #$28
	sta $05 
	bcc L_BRS_79DA_79D6
	inc $06 

L_BRS_79DA_79D6:

	ldy #$05

L_BRS_79DC_79E3:

	lda ($05),Y 
	eor #$0A
	sta ($05),Y 
	dey 
	bpl L_BRS_79DC_79E3
	rts 

L_JMP_79E6_701B:

	jsr L_JSR_7A76_79E6
	jsr L_JSR_729A_79E9
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

L_BRS_7A04_7A08:

	sta $8FF8,Y 
	dey 
	bpl L_BRS_7A04_7A08
	lda $02 
	sta $D015                          // Sprite display Enable
	lda #$00
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	ldy #$0A
	sty $A5 

L_BRS_7A18_7A41:

	ldx #$0F

L_BRS_7A1A_7A32:

	lda $D41B                          // Oscillator 3 Output
	and #$07
	clc 
	adc #$D6
	sta $D000,X                          // Sprite 0 X Pos
	dex 
	lda $D41B                          // Oscillator 3 Output
	and #$1F
	clc 
	adc #$7C
	sta $D000,X                          // Sprite 0 X Pos
	dex 
	bpl L_BRS_7A1A_7A32
	jsr L_JSR_7378_7A34
	ldy #$20

L_BRS_7A39_7A3A:
L_BRS_7A39_7A3D:

	dex 
	bne L_BRS_7A39_7A3A
	dey 
	bne L_BRS_7A39_7A3D
	dec $A5 
	bne L_BRS_7A18_7A41
	jsr L_JSR_729A_7A43
	jmp L_JMP_7AB1_7A46
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00

L_JSR_7A76_79E6:

	ldy #$1C

L_BRS_7A78_7A7F:

	lda $D000,Y                          // Sprite 0 X Pos
	sta $7A49,Y 
	dey 
	bpl L_BRS_7A78_7A7F
	ldy #$07

L_BRS_7A83_7A8A:

	lda $8FF8,Y 
	sta $7A66,Y 
	dey 
	bpl L_BRS_7A83_7A8A
	ldy #$07

L_BRS_7A8E_7A95:

	lda $D027,Y                          // Sprite 0 Color
	sta $7A6E,Y 
	dey 
	bpl L_BRS_7A8E_7A95
	lda #$FF
	ldy #$07

L_BRS_7A9B_7A9F:

	sta $8FF8,Y 
	dey 
	bpl L_BRS_7A9B_7A9F
	lda #$07
	ldy #$07

L_BRS_7AA5_7AA9:

	sta $D027,Y                          // Sprite 0 Color
	dey 
	bpl L_BRS_7AA5_7AA9
	lda #$00
	sta $D01C                          // Sprites Multi-Color Mode Select
	rts 

L_JMP_7AB1_7A46:

	ldy #$15

L_BRS_7AB3_7ABA:

	lda $7A49,Y 
	sta $D000,Y                          // Sprite 0 X Pos
	dey 
	bpl L_BRS_7AB3_7ABA
	ldy #$1C
	lda $7A49,Y 
	sta $D000,Y                          // Sprite 0 X Pos
	ldy #$07

L_BRS_7AC6_7ACD:

	lda $7A66,Y 
	sta $8FF8,Y 
	dey 
	bpl L_BRS_7AC6_7ACD
	ldy #$07

L_BRS_7AD1_7AD8:

	lda $7A6E,Y 
	sta $D027,Y                          // Sprite 0 Color
	dey 
	bpl L_BRS_7AD1_7AD8
	rts 

L_JMP_7ADB_7024:

	lda #$D8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$C8
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_7227_7AEF

L_JMP_7AF2_7027:

	lda #$C8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$D8
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_7227_7B06

L_JSR_7B09_71E3:

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

L_JSR_7B24_7B3A:
L_JSR_7B24_7B48:

	ldy #$00
	ldx #$00

L_BRS_7B28_7B29:
L_BRS_7B28_7B2C:

	dex 
	bne L_BRS_7B28_7B29
	dey 
	bne L_BRS_7B28_7B2C
	rts 

L_JSR_7B2F_7FDF:

	lda #$95
	sta $FC 
	lda #$C8
	sta $FB 
	jsr L_JSR_7B56_7B37
	jsr L_JSR_7B24_7B3A
	lda #$98
	sta $FC 
	lda #$30
	sta $FB 
	jsr L_JSR_7B56_7B45
	jsr L_JSR_7B24_7B48
	lda #$93
	sta $FC 
	lda #$60
	sta $FB 
	jmp L_JMP_7B56_7B53

L_JSR_7B56_7B37:
L_JSR_7B56_7B45:
L_JMP_7B56_7B53:

	lda #$0B
	sta $A5 
	ldx #$6C
	ldy #$40
	lda $7BA5 
	beq L_BRS_7B67_7B61
	ldx #$78
	ldy #$38

L_BRS_7B67_7B61:

	stx $A3 
	sty $A4 
	jsr L_JSR_73C5_7B6B

L_BRS_7B6E_7BA2:

	ldx $7BA5 
	ldy #$2F

L_BRS_7B73_7B78:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_7B73_7B78
	lda $03 
	clc 
	adc #$40
	sta $03 
	lda $04 
	adc #$01
	sta $04 
	lda $FB 
	adc #$30
	sta $FB 
	bcc L_BRS_7B91_7B8D
	inc $FC 

L_BRS_7B91_7B8D:

	cpx #$00
	bne L_BRS_7BA0_7B93
	lda $FB 
	clc 
	adc #$08
	sta $FB 
	bcc L_BRS_7BA0_7B9C
	inc $FC 

L_BRS_7BA0_7B93:
L_BRS_7BA0_7B9C:

	dec $A5 
	bne L_BRS_7B6E_7BA2
	rts 
	.byte $00,$00,$01,$02,$03,$04,$05,$06
	.byte $07,$08,$09,$FF,$01,$06,$07,$00
	.byte $08,$03,$05,$04,$09,$02,$FF,$06
	.byte $08,$07,$01,$03,$02,$00,$05,$04
	.byte $09,$FF,$FE,$FF,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$FE,$FF,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$01,$02,$03,$04,$05,$06,$07
	.byte $08,$09,$FF,$01,$06,$07,$00,$08
	.byte $03,$05,$04,$09,$02,$FF,$06,$08
	.byte $07,$01,$03,$02,$00,$05,$04,$09
	.byte $FF,$FE,$FF,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$FE,$FF,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$02,$03,$04,$05,$06,$07,$08
	.byte $09,$FF,$01,$06,$07,$00,$08,$03
	.byte $05,$04,$09,$02,$FF,$06,$08,$07
	.byte $01,$03,$02,$00,$05,$04,$09,$FF
	.byte $09,$05,$04,$06,$02,$07,$01,$08
	.byte $00,$03,$FF,$07,$02,$05,$08,$09
	.byte $00,$01,$03,$06,$04,$FF,$0C,$0D
	.byte $0C,$0C,$0E,$0C,$FF,$00,$00,$00
	.byte $00,$0D,$0D,$0E,$0D,$0D,$0C,$FF
	.byte $00,$00,$00,$00,$0D,$0E,$0C,$0E
	.byte $0E,$0E,$FF,$00,$00,$00,$00,$FE
	.byte $FF,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$FE,$FF,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$01,$0F
	.byte $03,$04,$05,$06,$07,$08,$09,$FF
	.byte $01,$06,$07,$00,$08,$03,$05,$04
	.byte $09,$0F,$FF,$06,$08,$07,$01,$03
	.byte $0F,$00,$05,$04,$09,$FF,$FE,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$FE,$FF,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$01,$0F,$03
	.byte $04,$05,$06,$07,$08,$09,$FF,$01
	.byte $06,$07,$00,$08,$03,$05,$04,$09
	.byte $0F,$FF,$06,$08,$07,$01,$03,$0F
	.byte $00,$05,$04,$09,$FF,$09,$05,$04
	.byte $06,$0F,$07,$01,$08,$00,$03,$FF
	.byte $07,$0F,$05,$08,$09,$00,$01,$03
	.byte $06,$04,$FF,$0A,$05,$05,$0B,$05
	.byte $0B,$05,$05,$FF,$00,$00,$0B,$0B
	.byte $0A,$05,$0B,$0B,$05,$05,$FF,$00
	.byte $00,$0B,$0A,$05,$0A,$0A,$0A,$05
	.byte $0A,$FF,$00,$00,$FE,$FF,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$FE
	.byte $FF,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$0A,$05,$05,$0B,$05,$0B
	.byte $05,$05,$FF,$00,$00,$0B,$0B,$0A
	.byte $05,$0B,$0B,$05,$05,$FF,$00,$00
	.byte $0B,$0A,$05,$0A,$0A,$0A,$05,$0A
	.byte $FF,$00,$00,$FE,$FF,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$FE,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$0A,$05,$05,$0B,$05,$0B,$05
	.byte $05,$FF,$00,$00,$0B,$0B,$0A,$05
	.byte $0B,$0B,$05,$05,$FF,$00,$00,$0B
	.byte $0A,$05,$0A,$0A,$0A,$05,$0A,$FF
	.byte $00,$00,$0B,$0B,$0A,$05,$0B,$0B
	.byte $05,$05,$FF,$00,$00,$0A,$05,$05
	.byte $0B,$05,$0B,$05,$05,$FF,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00

L_JSR_7D9C_76D3:

	lda #$7B
	sta $FC 
	lda #$A6
	sta $FB 
	lda $75E1 
	sec 
	sbc #$31
	sta $02 
	ldx #$37
	jsr L_JSR_74FD_7DAE
	lda $FC 
	sta $7D9B 
	lda $FB 
	sta $7D9A 
	rts 

L_JSR_7DBC_7E31:
L_JSR_7DBC_7F6D:
L_JSR_7DBC_8015:

	lda $7D9B 
	sta $FC 
	lda $7D9A 
	sta $FB 
	ldy $A5 
	sty $02 
	ldx #$0B
	jsr L_JSR_74FD_7DCC
	lda $FC 
	sta $AD 
	lda $FB 
	sta $AC 
	rts 

L_JSR_7DD8_7E56:
L_JSR_7DD8_7F8A:

	sta $02 
	lda #$90
	sta $FC 
	lda #$00
	sta $FB 
	ldx #$30
	jmp L_JMP_74FD_7DE4

L_JSR_7DE7_76D0:

	ldx #$2C
	stx $A3 
	ldy #$60
	sty $A4 
	jsr L_JSR_740F_7DEF
	lda $06 
	clc 
	adc #$4C
	sta $06 
	lda #$06
	sta $A5 

L_BRS_7DFD_7E1C:

	lda #$01
	ldy #$08
	ldx $75DD 
	cpx #$33
	bne L_BRS_7E0A_7E06
	ldy #$0E

L_BRS_7E0A_7E06:
L_BRS_7E0A_7E0D:

	sta ($05),Y 
	dey 
	bpl L_BRS_7E0A_7E0D
	lda $05 
	clc 
	adc #$28
	sta $05 
	bcc L_BRS_7E1A_7E16
	inc $06 

L_BRS_7E1A_7E16:

	dec $A5 
	bne L_BRS_7DFD_7E1C
	rts 

L_JMP_7E1F_76D6:
L_JSR_7E1F_803C:

	ldy #$00
	sty $A5 
	lda #$2C
	sta $A3 

L_BRS_7E27_7E84:

	lda #$60
	sta $A4 
	jsr L_JSR_73C5_7E2B
	jsr L_JSR_740F_7E2E
	jsr L_JSR_7DBC_7E31
	ldy $A5 
	ldx $A5 
	lda $7D95,Y 
	pha 

L_BRS_7E3C_7E74:

	pla 
	tay 

L_BRS_7E3E_7E46:

	lda ($AC),Y 
	cmp #$FF
	bne L_BRS_7E48_7E42
	ldy #$00
	beq L_BRS_7E3E_7E46

L_BRS_7E48_7E42:

	sta $807F,X 
	iny 
	stx $A6 
	tax 
	tya 
	pha 
	txa 
	cmp #$FE
	beq L_BRS_7E5C_7E54
	jsr L_JSR_7DD8_7E56
	jsr L_JSR_7E87_7E59

L_BRS_7E5C_7E54:

	lda $A4 
	clc 
	adc #$10
	sta $A4 
	jsr L_JSR_73C5_7E63
	jsr L_JSR_740F_7E66
	ldx $A6 
	inx 
	inx 
	inx 
	inx 
	inx 
	lda $A4 
	cmp #$90
	bcc L_BRS_7E3C_7E74
	pla 
	lda $A3 
	clc 
	adc #$0C
	sta $A3 
	inc $A5 
	ldy $A5 
	cpy #$05
	bcc L_BRS_7E27_7E84
	rts 

L_JSR_7E87_7E59:

	ldy #$17

L_BRS_7E89_7E8E:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_7E89_7E8E
	lda $03 
	clc 
	adc #$40
	sta $03 
	lda $04 
	adc #$01
	sta $04 
	lda $FB 
	clc 
	adc #$18
	sta $FB 
	bcc L_BRS_7EA8_7EA4
	inc $FC 

L_BRS_7EA8_7EA4:

	ldy #$17

L_BRS_7EAA_7EAF:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_7EAA_7EAF
	lda #$93
	sta $FC 
	lda #$00
	sta $FB 
	ldx #$06
	jsr L_JSR_74FD_7EBB
	ldy #$02

L_BRS_7EC0_7EC5:

	lda ($FB),Y 
	sta ($05),Y 
	dey 
	bpl L_BRS_7EC0_7EC5
	lda $05 
	clc 
	adc #$28
	sta $05 
	bcc L_BRS_7ED2_7ECE
	inc $06 

L_BRS_7ED2_7ECE:

	lda $FB 
	clc 
	adc #$03
	sta $FB 
	bcc L_BRS_7EDD_7ED9
	inc $FC 

L_BRS_7EDD_7ED9:

	ldy #$02

L_BRS_7EDF_7EE4:

	lda ($FB),Y 
	sta ($05),Y 
	dey 
	bpl L_BRS_7EDF_7EE4
	rts 

L_JSR_7EE7_7FF5:

	jsr L_JSR_74EE_7EE7
	lda #$60
	sta $A4 
	lda #$05
	sta $A5 
	jsr L_JSR_73C5_7EF2
	jsr L_JSR_740F_7EF5

L_BRS_7EF8_7F4E:

	lda $03 
	clc 
	adc #$40
	sta $FB 
	lda $04 
	adc #$01
	sta $FC 
	lda $05 
	clc 
	adc #$28
	sta $FD 
	lda $06 
	adc #$00
	sta $FE 
	lda #$68
	sec 
	sbc $A3 
	ldx $7BA5 
	bne L_BRS_7F1E_7F1A
	sbc #$18

L_BRS_7F1E_7F1A:

	pha 
	asl 
	tay 
	dey 

L_BRS_7F22_7F27:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_7F22_7F27
	pla 
	lsr 
	lsr 
	tay 
	dey 

L_BRS_7F2E_7F33:

	lda ($FD),Y 
	sta ($05),Y 
	dey 
	bpl L_BRS_7F2E_7F33
	lda $03 
	clc 
	adc #$40
	sta $03 
	lda $04 
	adc #$01
	sta $04 
	lda $05 
	adc #$28
	sta $05 
	bcc L_BRS_7F4C_7F48
	inc $06 

L_BRS_7F4C_7F48:

	dec $A5 
	bne L_BRS_7EF8_7F4E
	jsr L_JSR_74F5_7F50
	ldy #$00
	lda $A3 
	sec 
	sbc #$2C
	beq L_BRS_7F61_7F5A

L_BRS_7F5C_7F5F:

	iny 
	sbc #$0C
	bne L_BRS_7F5C_7F5F

L_BRS_7F61_7F5A:

	sty $A5 

L_BRS_7F63_7F9D:

	lda #$88
	sta $A4 
	jsr L_JSR_73C5_7F67
	jsr L_JSR_740F_7F6A
	jsr L_JSR_7DBC_7F6D
	ldy $A5 
	lda $7D95,Y 
	tay 
	ldx #$03

L_BRS_7F78_7F84:

	iny 
	lda ($AC),Y 
	cmp #$FF
	bne L_BRS_7F83_7F7D
	ldy #$00
	lda ($AC),Y 

L_BRS_7F83_7F7D:

	dex 
	bne L_BRS_7F78_7F84
	cmp #$FE
	beq L_BRS_7F90_7F88
	jsr L_JSR_7DD8_7F8A
	jsr L_JSR_7FA0_7F8D

L_BRS_7F90_7F88:

	lda $A3 
	clc 
	adc #$0C
	sta $A3 
	inc $A5 
	ldy $A5 
	cpy #$05
	bcc L_BRS_7F63_7F9D
	rts 

L_JSR_7FA0_7F8D:

	ldy #$17

L_BRS_7FA2_7FA7:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_7FA2_7FA7
	lda #$93
	sta $FC 
	lda #$00
	sta $FB 
	ldx #$06
	jsr L_JSR_74FD_7FB3
	ldy #$02

L_BRS_7FB8_7FBD:

	lda ($FB),Y 
	sta ($05),Y 
	dey 
	bpl L_BRS_7FB8_7FBD
	rts 

L_JMP_7FC0_7015:

	jsr L_JSR_729A_7FC0
	lda #$80
	sta $D418                          // Select Filter Mode and Volume
	lda #$81
	sta $D412                          // Voice 3: Control Register
	lda #$AA
	sta $D40E                          // Voice 3: Frequency Control - Low-Byte
	lda #$55
	sta $D40F                          // Voice 3: Frequency Control - High-Byte
	lda #$00
	sta $807E 
	sta $D015                          // Sprite display Enable
	jsr L_JSR_7B2F_7FDF
	lda #$2C
	sta $A3 

L_JMP_7FE6_8069:
L_JMP_7FE6_8070:

	lda $D41B                          // Oscillator 3 Output
	and #$1F
	clc 
	adc #$0F

L_BRS_7FEE_8051:

	pha 
	lda $A3 
	pha 
	lda $A4 
	pha 
	jsr L_JSR_7EE7_7FF5
	jsr L_JSR_730C_7FF8
	pla 
	lda $A4 
	pla 
	sta $A3 
	ldx #$00

L_BRS_8003_8004:

	dex 
	bne L_BRS_8003_8004
	ldx #$04
	stx $A5 

L_BRS_800A_8013:

	inc $7D95,X 
	dex 
	bmi L_BRS_8015_800E
	cpx $807E 
	bcs L_BRS_800A_8013

L_BRS_8015_800E:
L_BRS_8015_8034:

	jsr L_JSR_7DBC_8015
	ldy $A5 
	lda $7D95,Y 
	tay 
	lda ($AC),Y 
	cmp #$FF
	bne L_BRS_802B_8022
	ldy $A5 
	lda #$00
	sta $7D95,Y 

L_BRS_802B_8022:

	dec $A5 
	bmi L_BRS_8036_802D
	ldx $A5 
	cpx $807E 
	bcs L_BRS_8015_8034

L_BRS_8036_802D:

	lda $A3 
	pha 
	lda $A4 
	pha 
	jsr L_JSR_7E1F_803C
	jsr L_JSR_730C_803F
	pla 
	sta $A4 
	pla 
	sta $A3 
	ldx #$00

L_BRS_804A_804B:

	dex 
	bne L_BRS_804A_804B
	pla 
	tay 
	dey 
	tya 
	bne L_BRS_7FEE_8051
	jsr L_JSR_7354_8053
	inc $807E 
	lda #$0C
	clc 
	adc $A3 
	sta $A3 
	ldx $7BA5 
	bne L_BRS_806C_8063
	cmp #$50
	bcs L_BRS_8073_8067
	jmp L_JMP_7FE6_8069

L_BRS_806C_8063:

	cmp #$68
	bcs L_BRS_8073_806E
	jmp L_JMP_7FE6_8070

L_BRS_8073_8067:
L_BRS_8073_806E:

	lda #$01
	sta $D015                          // Sprite display Enable
	sta $807E 
	jmp L_JMP_729A_807B
