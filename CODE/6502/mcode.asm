* = $9000 "mcode"

	.byte $10
	jmp L_JMP_904C_9001	// BA-2
	jmp L_JMP_906D_9004	// 3-6
	jmp L_JMP_91A5_9007	// 6-1
	jmp L_JMP_91BD_900A	// 9
	jmp L_JMP_914A_900D	// 12-3,7
	jmp L_JMP_9163_9010	// 15-5
sys36883:
	jmp L_JMP_9447_9013	// 18
	jmp L_JMP_95BB_9016	// 21-4
	jmp L_JMP_95EF_9019	// 24
	jmp L_JMP_94D7_901C	// 27
	jmp L_JMP_953A_901F	// 30
	jmp L_JMP_951C_9022	// 33
	jmp L_JMP_94A9_9025	// 36
	jmp L_JMP_9391_9028	// 39
	jmp L_JMP_9624_902B	// 42

	.byte $44,$90	// 902E ve
	.byte $46,$90	// 9030 
	.byte $42,$90	// 9032 
	.byte $4A,$90	// 9034 
	.byte $49,$90	// 9036 
	.byte $4B,$90	// 9038 
	.byte $00,$9C	// 903A 
	.byte $00,$00	// 903C 903C store INT vector
	.byte $00,$00	// 903E 903F 9040 store INT vector
	.byte $00,$00	// 9040 9041 changed to 01
	.byte $00,$00	// 9042 v3,v6
	.byte $00,$00	// 9044 v1 changed to 01,01
	.byte $00,$60	// 9046 v2 changed to 01
	.byte $E0,$00	// 9048 v7,v5
	.byte $00,$00	// 904A v4

L_JMP_904C_9001:

	sei
	jsr L_JSR_907C_904D
	ldx #$01
	stx $9041
	lda $0315
	sta $903D
	lda $0314
	sta $903C
	lda #$90
	sta $0315
	lda #$A0
	sta $0314
	cli
	rts

L_JMP_906D_9004:

	sei
	lda $903D
	sta $0315
	lda $903C
	sta $0314
	cli
	rts

L_JSR_907C_904D:

	lda #$FB
	and $01
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
.break
	jsr L_JSR_9172_9096
	
	lda #$04
	ora $01
	sta $01
	rts

unknown_90a0:

	dec $9041
	bne L_BRS_90AD_90A3
	lda #$14
	sta $9041
	jsr L_JSR_9267_90AA

L_BRS_90AD_90A3:

	jmp ($903C)

BRK_vector:

	pla
	tay
	pla
	tax
	pla
	rti

NMI_vector:

	lda $DC00                          // Data Port A (Keyboard, Joystick, Paddles)
	and #$1F
	sta $903E
	lda $903E
	and #$01
	bne L_BRS_90D4_90C3
	dec $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$34
	bcs L_BRS_90D4_90CD
	ldx #$34
	stx $D001                          // Sprite 0 Y Pos

L_BRS_90D4_90C3:
L_BRS_90D4_90CD:

	lda $903E
	and #$02
	bne L_BRS_90EA_90D9
	inc $D001                          // Sprite 0 Y Pos
	lda $D001                          // Sprite 0 Y Pos
	cmp #$EE
	bcc L_BRS_90EA_90E3
	ldx #$ED
	stx $D001                          // Sprite 0 Y Pos

L_BRS_90EA_90D9:
L_BRS_90EA_90E3:

	lda $903E
	and #$04
	bne L_BRS_9111_90EF
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	beq L_BRS_910A_90F9
	cpy #$00
	bne L_BRS_910E_90FD
	lda #$FE
	and $D010                          // Sprites 0-7 MSB of X coordinate
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_910E_9108

L_BRS_910A_90F9:

	cpy #$18
	bcc L_BRS_9111_910C

L_BRS_910E_90FD:
L_BRS_910E_9108:

	dec $D000                          // Sprite 0 X Pos

L_BRS_9111_90EF:
L_BRS_9111_910C:

	lda $903E
	and #$08
	bne L_BRS_9138_9116
	ldy $D000                          // Sprite 0 X Pos
	lda $D010                          // Sprites 0-7 MSB of X coordinate
	and #$01
	bne L_BRS_9131_9120
	cpy #$FF
	bne L_BRS_9135_9124
	lda #$01
	ora $D010                         // Sprites 0-7 MSB of X coordinate
	sta $D010                          // Sprites 0-7 MSB of X coordinate
	clv
	bvc L_BRS_9135_912F

L_BRS_9131_9120:

	cpy #$4B
	bcs L_BRS_9138_9133

L_BRS_9135_9124:
L_BRS_9135_912F:

	inc $D000                          // Sprite 0 X Pos

L_BRS_9138_9116:
L_BRS_9138_9133:

	lda $903E
	and #$10
	bne L_BRS_9147_913D
	lda $9046
	bne L_BRS_9147_9142
	jsr L_JSR_933D_9144

L_BRS_9147_913D:
L_BRS_9147_9142:

	jmp ($903F)

L_JMP_914A_900D:

	sei
	lda $0315
	sta $9040
	lda $0314
	sta $903F
	lda #$90
	sta $0315
	lda #$B6
	sta $0314
	cli
	rts

L_JMP_9163_9010:

	sei
	lda $9040
	sta $0315
	lda $903F
	sta $0314
	cli
	rts

L_JSR_9172_9096:
L_JSR_9172_94BD:
L_JMP_9172_94D4:
L_JSR_9172_94EB:
L_JSR_9172_9502:
L_JMP_9172_9519:
L_JSR_9172_95D2:
L_JSR_9172_95E9:
L_JSR_9172_9606:
L_JSR_9172_961D:
		// on setup A=$1F,X=$40
		// second loop $03,$E8
	sta v_9182
	stx v_91A1
	ldy #$00
	cmp #$00
	beq L_BRS_9197_917C
	clc
	lda $FC
	adc v_9182:#$00	// 1F,03,08
	sta v_9194

L_BRS_9186_918B:
L_BRS_9186_9195:

	lda ($FB),Y
	sta ($FD),Y
	iny
	bne L_BRS_9186_918B
	inc $FC
	inc $FE
	lda $FC
	cmp v_9194:#$00	// becomes 1F,5F,00
	bcc L_BRS_9186_9195

L_BRS_9197_917C:

	cpx #$00
	beq L_BRS_91A4_9199

L_BRS_919B_91A2:

	lda ($FB),Y
	sta ($FD),Y
	iny
	cpy v_91A1:#$40	// 40,E8
	bcc L_BRS_919B_91A2

L_BRS_91A4_9199:

	rts

L_JMP_91A5_9007:

	lda #$38
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$01
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda #$20
	ora $D011                         // Control Register 1
	sta $D011                          // Control Register 1
	rts

L_JMP_91BD_900A:

	lda #$15
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	ora #$03
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda #$DF
	and $D011                          // Control Register 1
	sta $D011                          // Control Register 1
	rts

L_JSR_91D5_9272:

	lda #$8C
	sta $FE
	lda #$78
	sta $FD
	ldy #$00
	lda ($FD),Y

L_JSR_91E1_9228:

	jsr L_JSR_91F6_91E1

L_BRS_91E4_91F3:

	inx
	cpx #$02
	bcc L_BRS_91EB_91E7
	ldx #$00

L_BRS_91EB_91E7:

	lda $9047,X
	sta ($FD),Y
	iny
	cpy #$28
	bcc L_BRS_91E4_91F3
	rts

L_JSR_91F6_91E1:
L_JSR_91F6_9217:
L_JSR_91F6_9254:
L_JSR_91F6_928F:

	and #$F0
	ldx #$00

L_BRS_91FA_9200:

	cmp $9047,X
	beq L_BRS_9202_91FD
	inx
	bne L_BRS_91FA_9200

L_BRS_9202_91FD:

	rts

L_JSR_9203_9275:

	lda #$8C
	sta $FE
	lda #$A0
	sta $FD
	lda #$8C
	sta $40
	lda #$78
	sta $3F

L_BRS_9213_923E:
L_BRS_9213_9244:

	ldy #$00
	lda ($3F),Y
	jsr L_JSR_91F6_9217
	dex
	bpl L_BRS_921F_921B
	ldx #$01

L_BRS_921F_921B:

	lda $9047,X
	sta ($FD),Y
	ldy #$27
	lda ($3F),Y
	jsr L_JSR_91E1_9228
	lda $FD
	sta $3F
	clc
	adc #$28
	sta $FD
	lda $FE
	sta $40
	adc #$00
	sta $FE
	cmp #$8E
	bne L_BRS_9213_923E
	lda $FD
	cmp #$30
	bne L_BRS_9213_9244
	rts

L_JMP_9247_9280:

	lda #$8E
	sta $FE
	lda #$08
	sta $FD
	ldy #$00
	lda ($FD),Y
	iny
	jsr L_JSR_91F6_9254

L_BRS_9257_9264:

	dex
	bpl L_BRS_925C_9258
	ldx #$01

L_BRS_925C_9258:

	lda $9047,X
	sta ($FD),Y
	iny
	cpy #$28
	bcc L_BRS_9257_9264
	rts

L_JSR_9267_90AA:

	lda $9044
	bne L_BRS_9272_926A
	jsr L_JSR_9283_926C
	clv
	bvc L_BRS_9275_9270

L_BRS_9272_926A:

	jsr L_JSR_91D5_9272

L_BRS_9275_9270:

	jsr L_JSR_9203_9275
	lda $9045
	bne L_BRS_9280_927B
	jmp L_JMP_92C5_927D

L_BRS_9280_927B:

	jmp L_JMP_9247_9280

L_JSR_9283_926C:

	lda #$8C
	sta $FE
	lda #$78
	sta $FD

L_JMP_928B_92CD:

	ldy #$00
	lda ($FD),Y
	jsr L_JSR_91F6_928F

L_BRS_9292_92A2:

	inx
	cpx #$02
	bne L_BRS_9299_9295
	ldx #$00

L_BRS_9299_9295:

	lda $9047,X
	sta ($FD),Y
	iny
	cpy $9042
	bcc L_BRS_9292_92A2

L_BRS_92A4_92AF:
L_BRS_92A4_92B1:

	inx
	cpx #$02
	bne L_BRS_92AB_92A7
	ldx #$00

L_BRS_92AB_92A7:

	iny
	cpy $9043
	bcc L_BRS_92A4_92AF
	beq L_BRS_92A4_92B1

L_BRS_92B3_92C2:

	inx
	cpx #$02
	bne L_BRS_92BA_92B6
	ldx #$00

L_BRS_92BA_92B6:

	lda $9047,X
	sta ($FD),Y
	iny
	cpy #$28
	bcc L_BRS_92B3_92C2
	rts

L_JMP_92C5_927D:

	lda #$8E
	sta $FE
	lda #$08
	sta $FD
	jmp L_JMP_928B_92CD

L_JSR_92D0_93CE:

	ldx $A3
	ldy $A4
	lda #$A0
	sta $04
	lda #$00
	sta $03
	tya
	pha
	and #$F8
	sta $92E7
	ldy #$27

L_BRS_92E5_92ED:

	clc
	adc #$00
	bcc L_BRS_92EC_92E8
	inc $04

L_BRS_92EC_92E8:

	dey
	bne L_BRS_92E5_92ED
	sta $03
	pla
	and #$07
	clc
	adc $03
	sta $03
	bcc L_BRS_92FD_92F9
	inc $04

L_BRS_92FD_92F9:

	txa
	asl
	bcc L_BRS_9303_92FF
	inc $04

L_BRS_9303_92FF:

	clc
	and #$F8
	adc $03
	sta $03
	bcc L_BRS_930E_930A
	inc $04

L_BRS_930E_930A:

	rts
	ldx $A3
	ldy $A4
	lda #$8C
	sta $06
	lda #$00
	sta $05
	tya
	lsr
	lsr
	lsr
	beq L_BRS_9330_931F
	tay

L_BRS_9322_932E:

	lda #$28
	clc
	adc $05
	sta $05
	bcc L_BRS_932D_9329
	inc $06

L_BRS_932D_9329:

	dey
	bne L_BRS_9322_932E

L_BRS_9330_931F:

	txa
	lsr
	lsr
	clc
	adc $05
	sta $05
	bcc L_BRS_933C_9338
	inc $06

L_BRS_933C_9338:

	rts

L_JSR_933D_9144:
L_JSR_933D_9396:

	lda $D001                          // Sprite 0 Y Pos
	sec
	sbc #$2D
	sta $A4
	lda $9042
	ldy #$03
	clc

L_BRS_934B_934F:

	adc $9042
	dey
	bne L_BRS_934B_934F
	adc #$04
	sta $A3
	lda $D001                          // Sprite 0 Y Pos
	ldx #$00
	stx $9049
	sec
	sbc #$2D

L_BRS_9360_9367:

	sbc #$08
	bcc L_BRS_9369_9362
	inc $9049
	bne L_BRS_9360_9367

L_BRS_9369_9362:

	lda #$8C
	sta $06
	lda #$00
	sta $05
	ldx $9049
	beq L_BRS_9384_9374

L_BRS_9376_9382:

	lda #$28
	clc
	adc $05
	sta $05
	bcc L_BRS_9381_937D
	inc $06

L_BRS_9381_937D:

	dex
	bne L_BRS_9376_9382

L_BRS_9384_9374:

	lda $9042
	sec
	adc $05
	sta $05
	bcc L_BRS_9390_938C
	inc $06

L_BRS_9390_938C:

	rts

L_JMP_9391_9028:

	lda #$01
	sta $9046
	jsr L_JSR_933D_9396
	lda $9049
	cmp #$02
	bcc L_BRS_93F2_939E
	beq L_BRS_93E4_93A0
	cmp #$03
	beq L_BRS_93CE_93A4
	tax
	dex
	cpx $904A
	bcs L_BRS_93F2_93AB
	lda $05
	sec
	sbc #$28
	sta $05
	bcs L_BRS_93B8_93B4
	dec $06

L_BRS_93B8_93B4:

	jsr L_JSR_93F8_93B8
	lda $9049
	cmp $904A
	bcs L_BRS_93F2_93C1
	lda $05
	clc
	adc #$28
	sta $05
	bcc L_BRS_93CE_93CA
	inc $06

L_BRS_93CE_93A4:
L_BRS_93CE_93CA:

	jsr L_JSR_92D0_93CE
	jsr L_JSR_9422_93D1
	ldy #$1C
	lda ($03),Y
	pha
	jsr L_JSR_9429_93D9
	pla
	cmp #$FF
	beq L_BRS_93E4_93DF
	jsr L_JSR_9409_93E1

L_BRS_93E4_93A0:
L_BRS_93E4_93DF:

	lda $05
	clc
	adc #$28
	sta $05
	bcc L_BRS_93EF_93EB
	inc $06

L_BRS_93EF_93EB:

	jsr L_JSR_93F8_93EF

L_BRS_93F2_939E:
L_BRS_93F2_93AB:
L_BRS_93F2_93C1:

	lda #$00
	sta $9046
	rts

L_JSR_93F8_93B8:
L_JSR_93F8_93EF:

	lda $9043
	clc
	sbc $9042
	tay
	dey
	lda #$10

L_BRS_9403_9406:

	sta ($05),Y
	dey
	bpl L_BRS_9403_9406
	rts

L_JSR_9409_93E1:

	lda $9043
	clc
	sbc $9042
	tay
	dey
	lda #$01

L_BRS_9414_9417:

	sta ($05),Y
	dey
	bpl L_BRS_9414_9417
	rts

L_JSR_941A_95EF:

	sei
	lda $01
	and #$FC
	sta $01
	rts

L_JSR_9422_93D1:
L_JSR_9422_95BB:

	lda $01
	and #$FE
	sta $01
	rts

L_JSR_9429_93D9:
L_JMP_9429_95EC:
L_JSR_9429_9620:

	lda $01
	ora #$03
	sta $01
	cli
	rts

L_JSR_9431_9581:

	stx $943C
	ldy $02
	beq L_BRS_9446_9436
	lda $FB

L_BRS_943A_9442:

	clc
	adc #$00
	bcc L_BRS_9441_943D
	inc $FC

L_BRS_9441_943D:

	dey
	bne L_BRS_943A_9442
	sta $FB

L_BRS_9446_9436:

	rts

L_JMP_9447_9013:

	jsr $FFE7			// Close All Channels And Files

	lda #$90
	sta $0317			// CBINV - BRK $90B0
	lda #$B0
	sta $0316
	
	lda #$90
	sta $0319			// NMIINV - NMI $90B5
	lda #$B5
	sta $0318

	lda #$EA
	sta $0328			// STOP vector
	
	lda #$00
	jsr $FF90			// Control OS Messages
	
	lda #$05
	ldx $BA
	ldy #$00
	jsr $FFBA			// Set Logical File Parameters
	lda #$05
	ldx #$A1			// "TITLE"
	ldy #$94
	jsr $FFBD			// Set Filename
	lda #$00
	ldx #$00
	ldy #$5C
	jsr $FFD5			// Load RAM From Device
	lda #$05
	ldx $BA
	ldy #$00
	jsr $FFBA			// Set Logical File Parameters
	lda #$03
	ldx #$A6			// "ARR"
	ldy #$94
	jsr $FFBD			// Set Filename
	lda #$00
	ldx #$40
	ldy #$BF
	jsr $FFD5			// Load RAM From Device
	jmp L_JMP_94A9_949E

	.byte $54,$49,$54,$4C,$45,$41,$52,$52	// TITLEARR

L_JMP_94A9_9025:
L_JMP_94A9_949E:

	lda #$60
	sta $FC	// $6000 (from)
	lda #$00
	sta $FB
	lda #$A0
	sta $FE	// $A000 (to)
	lda #$00
	sta $FD

	lda #$1F
	ldx #$40	// plus 3F bytes
	jsr L_JSR_9172_94BD

	lda #$5C	// $5C00
	sta $FC
	lda #$00
	sta $FB
	lda #$8C	// $8C00
	sta $FE
	lda #$00
	sta $FD

	lda #$03
	ldx #$E8	// plus E7 bytes
	jmp L_JMP_9172_94D4

L_JMP_94D7_901C:

	lda #$20
	sta $FC
	lda #$00
	sta $FB
	lda #$E0
	sta $FE
	lda #$00
	sta $FD

	lda #$1F
	ldx #$40
	jsr L_JSR_9172_94EB

	lda #$3F
	sta $FC
	lda #$40
	sta $FB
	lda #$CC
	sta $FE
	lda #$00
	sta $FD

	lda #$03
	ldx #$E8
	jsr L_JSR_9172_9502

	lda #$43
	sta $FC
	lda #$38
	sta $FB
	lda #$D8
	sta $FE
	lda #$00
	sta $FD

	lda #$03
	ldx #$E8
	jmp L_JMP_9172_9519

L_JMP_951C_9022:

	lda #$10
	ora $D016                         // Control Register 2
	sta $D016                          // Control Register 2
	lda #$38
	sta $D018                          // Memory Control Register
	lda $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	and #$FC
	sta $DD00                          // Data Port A (Serial Bus, RS232, VIC Base Mem.)
	lda #$20
	ora $D011                         // Control Register 1
	sta $D011                          // Control Register 1
	rts

L_JMP_953A_901F:

	lda #$A0
	sta $04
	lda #$00
	sta $03
	lda #$9C
	sta $956C
	lda #$00
	sta $956B
	lda #$D8
	sta $9575
	lda #$00
	sta $9574
	lda #$8C
	sta $957C
	lda #$00
	sta $957B
	ldx #$00

L_BRS_9562_95A8:
L_BRS_9562_95B8:

	lda #$C0
	sta $FC
	lda #$00
	sta $FB
	lda $9C00,X
	cmp #$20
	beq L_BRS_958F_956F
	sta $02
	lda $D800,X
	asl
	asl
	asl
	asl
	sta $8C00,X
	txa
	pha
	ldx #$08
	jsr L_JSR_9431_9581
	pla
	tax
	ldy #$07

L_BRS_9588_958D:

	lda ($FB),Y
	sta ($03),Y
	dey
	bpl L_BRS_9588_958D

L_BRS_958F_956F:

	lda $03
	clc
	adc #$08
	sta $03
	bcc L_BRS_959A_9596
	inc $04

L_BRS_959A_9596:

	inx
	lda $956C
	cmp #$9F
	bcc L_BRS_95A6_95A0
	cpx #$E8
	bcs L_BRS_95AA_95A4

L_BRS_95A6_95A0:

	cpx #$00
	bne L_BRS_9562_95A8

L_BRS_95AA_95A4:

	inc $956C
	inc $9575
	inc $957C
	lda $956C
	cmp #$A0
	bcc L_BRS_9562_95B8
	rts

L_JMP_95BB_9016:

	jsr L_JSR_9422_95BB

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
.break
	jsr L_JSR_9172_95D2

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
.break
	jsr L_JSR_9172_95E9
	
	jmp L_JMP_9429_95EC

L_JMP_95EF_9019:

	jsr L_JSR_941A_95EF
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
	jsr L_JSR_9172_9606
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
	jsr L_JSR_9172_961D
	jsr L_JSR_9429_9620
	rts

L_JMP_9624_902B:

	lda #$08
	sta $FC
	lda #$00
	sta $FB
	lda #$00
	ldy #$00

L_BRS_9630_9633:
L_BRS_9630_9637:

	sta ($FB),Y
	iny
	bne L_BRS_9630_9633
	inc $FC
	bne L_BRS_9630_9637
	rts