*=$0801

	.byte $1A,$08,$01,$00,$9E,$32,$30,$37
	.byte $36,$14,$14,$14,$14,$14,$14,$14
	.byte $14,$14,$42,$4C,$49,$54
Table_0817:
	.byte $5A,$21,$00,$00,$00
begin:
	jmp L_JMP_0C92_081C
	jmp L_JMP_0EA7_081F
	jmp L_JMP_0E81_0822

	.byte $09,$09,$1E,$1B,$1B,$1C
Table_082B:
	.byte $1C,$0C,$0C,$18,$18,$1D,$1D,$1C
	.byte $1C,$1D,$0C,$1D,$15,$15,$15,$15
	.byte $15,$15,$15,$15,$15,$15,$15,$15
	.byte $15,$15,$15,$15,$15,$15,$14,$16
	.byte $17,$17,$17,$1D,$1D,$1D,$0E,$19
	.byte $18,$18,$18,$19,$19,$19,$19,$18
	.byte $19,$19,$16,$0E,$16,$0E,$18,$18
	.byte $18,$18,$0E,$0E,$1A,$1A,$1C,$1A
	.byte $1B,$1A,$0D,$1A,$1D,$19,$1A,$1A
	.byte $1A,$1E,$1E,$1E,$1F,$19,$1F
Table_087A:
	.byte $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1F,$1F,$1F,$1F,$97,$AE
	.byte $07,$74,$62,$2A,$0A,$80,$A6,$32
	.byte $56,$1C,$0F,$E3,$E3,$30,$A0,$72
	.byte $66,$49,$36,$24,$24,$95,$24,$24
	.byte $24,$24,$24,$24,$24,$24,$85,$9A
	.byte $FD,$C8,$FE,$7A,$74,$74,$41,$8D
	.byte $C2,$43,$CB,$60,$DA,$DA,$DA,$9E
	.byte $6D,$6D,$BA,$DA,$BA,$B0,$CD,$08
	.byte $B4,$9A,$6B,$6B,$32,$32,$9D,$A0
	.byte $12,$5C,$CC
Table_08CD:
	.byte $1D,$1A,$1D,$FE,$5C,$5C,$FD,$06
	.byte $00,$09,$A0,$A2,$9F,$3D,$DA,$75
	.byte $75,$75,$76,$75,$75,$75,$75,$75
	.byte $75,$75,$74,$75,$75,$77,$00,$07
	.byte $0E,$15,$1C,$23,$2A,$31,$38,$3F
	.byte $46,$4D,$54,$5B,$62,$69,$70,$77
	.byte $7E,$85,$8C,$93,$9A,$A1,$A8,$AF
	.byte $B6,$BD,$C4,$CB,$D2,$D9,$27,$03
	.byte $00,$00,$10,$E8,$64,$0A,$6A,$53
	.byte $2B,$12,$7B,$B8,$B8,$BA,$BB,$BF

L_JSR_091D_165D:
L_JSR_091D_193B:

	ldy #$02
	lda #$20
	bit $64
	bpl L_BRS_092A_0923
	jsr L_JSR_0DC9_0925
	lda #$2D

L_BRS_092A_0923:

	sta $00FE,Y
	sty $71
	ldx #$00
	stx $62
	lda $64
	beq L_BRS_0943_0935
	cmp #$27
	bcs L_BRS_094E_0939
	inx
	cmp #$03
	bcs L_BRS_094E_093E
	inx
	bcc L_BRS_094E_0941

L_BRS_0943_0935:

	lda $65
	beq L_BRS_0992_0945
	ldx #$02
	cmp #$64
	bcs L_BRS_094E_094B
	inx

L_BRS_094E_0939:
L_BRS_094E_093E:
L_BRS_094E_0941:
L_BRS_094E_094B:
L_BRS_094E_098C:

	lda $090B,X
	sta $22
	lda $090F,X
	sta $23
	ldy #$FF
	sec

L_BRS_095B_0968:

	iny
	lda $65
	sbc $23
	sta $65
	lda $64
	sbc $22
	sta $64
	bcs L_BRS_095B_0968
	lda $65
	adc $23
	sta $65
	lda $64
	adc $22
	sta $64
	lda $62
	bne L_BRS_097F_0978
	tya
	beq L_BRS_0989_097B
	inc $62

L_BRS_097F_0978:

	tya
	ora #$30
	ldy $71
	sta $00FF,Y
	inc $71

L_BRS_0989_097B:

	inx
	cpx #$04
	bcc L_BRS_094E_098C
	ldy $71
	lda $65

L_BRS_0992_0945:

	ora #$30
	jmp $BF04
	lda $0E
	bpl L_BRS_09A1_0999
	jsr L_JSR_0DC9_099B
	jmp L_JMP_0ECB_099E

L_BRS_09A1_0999:

	lda $61
	beq L_BRS_09AB_09A3
	lda $66
	eor #$FF
	sta $66

L_BRS_09AB_09A3:

	jmp L_JMP_0ECB_09AB
	lda $0E
	bmi L_BRS_09B5_09B0
	jsr L_JSR_1442_09B2

L_BRS_09B5_09B0:

	lda $64
	eor #$FF
	sta $64
	lda $65
	eor #$FF
	sta $65
	jmp L_JMP_0ECB_09C1

L_BRS_09C4_09E1:

	jmp $B658

L_JMP_09C7_0E6C:

	tax
	bne L_BRS_09CE_09C8
	ldx $6F
	bne L_BRS_09D4_09CC

L_BRS_09CE_09C8:

	ldx $65
	bne L_BRS_09D6_09D0
	ldx $64

L_BRS_09D4_09CC:

	stx $16

L_BRS_09D6_09D0:

	lda $61
	sta $6E
	lda ($6F),Y
	sta $69
	clc
	adc $61
	bcs L_BRS_09C4_09E1
	sta $61
	beq L_BRS_0A4D_09E5
	lda $33
	ldy $34
	sec
	sbc $61
	bcs L_BRS_09F1_09EE
	dey

L_BRS_09F1_09EE:

	cpy $32
	bne L_BRS_09F7_09F3
	cmp $31

L_BRS_09F7_09F3:

	bcs L_BRS_09FC_09F7
	jsr L_JSR_1F7A_09F9

L_BRS_09FC_09F7:

	sta $33
	sta $62
	sta $35
	sty $34
	sty $63
	sty $36
	ldy #$02
	lda ($6F),Y
	sta $23
	dey
	lda ($6F),Y
	sta $22
	ldy $69
	beq L_BRS_0A30_0A15
	dey
	beq L_BRS_0A21_0A18

L_BRS_0A1A_0A1F:

	lda ($22),Y
	sta ($35),Y
	dey
	bne L_BRS_0A1A_0A1F

L_BRS_0A21_0A18:

	lda ($22),Y
	sta ($35),Y
	lda $69
	clc
	adc $35
	sta $35
	bcc L_BRS_0A30_0A2C
	inc $36

L_BRS_0A30_0A15:
L_BRS_0A30_0A2C:

	ldy #$02
	lda ($64),Y
	sta $23
	dey
	lda ($64),Y
	sta $22
	ldy $6E
	beq L_BRS_0A4D_0A3D
	dey
	beq L_BRS_0A49_0A40

L_BRS_0A42_0A47:

	lda ($22),Y
	sta ($35),Y
	dey
	bne L_BRS_0A42_0A47

L_BRS_0A49_0A40:

	lda ($22),Y
	sta ($35),Y

L_BRS_0A4D_09E5:
L_BRS_0A4D_0A3D:

	jmp L_JMP_180C_0A4D

L_JMP_0A50_0E69:

	ldx $65
	bne L_BRS_0A71_0A52
	ldx $64
	stx $16
	ldx $63
	cpx $34
	bne L_BRS_0A71_0A5C
	ldx $62
	cpx $33
	bne L_BRS_0A71_0A62
	lda $61
	beq L_BRS_0A71_0A66
	clc
	adc $33
	sta $33
	bcc L_BRS_0A71_0A6D
	inc $34

L_BRS_0A71_0A52:
L_BRS_0A71_0A5C:
L_BRS_0A71_0A62:
L_BRS_0A71_0A66:
L_BRS_0A71_0A6D:

	lda ($6F),Y
	tax
	iny
	lda ($6F),Y
	sta $6A
	iny
	lda ($6F),Y
	sta $6B
	lda $70
	bne L_BRS_0A9E_0A80
	lda $6F
	sta $16
	lda $6B
	cmp $34
	bne L_BRS_0A9E_0A8A
	lda $6A
	cmp $33
	bne L_BRS_0A9E_0A90
	txa
	beq L_BRS_0A9E_0A93
	clc
	adc $6A
	sta $33
	bcc L_BRS_0A9E_0A9A
	inc $34

L_BRS_0A9E_0A80:
L_BRS_0A9E_0A8A:
L_BRS_0A9E_0A90:
L_BRS_0A9E_0A93:
L_BRS_0A9E_0A9A:

	cpx $61
	beq L_BRS_0AAA_0AA0
	ldy #$04
	bcc L_BRS_0AAA_0AA4
	ldy #$01
	ldx $61

L_BRS_0AAA_0AA0:
L_BRS_0AAA_0AA4:

	sty $66
	ldy #$FF
	inx

L_BRS_0AAF_0AB7:

	iny
	dex
	beq L_BRS_0AD3_0AB1
	lda ($6A),Y
	cmp ($62),Y
	beq L_BRS_0AAF_0AB7
	lda #$01
	bcs L_BRS_0ABF_0ABB
	lda #$04

L_BRS_0ABF_0ABB:
L_BRS_0ABF_0AD5:

	and $3C
	beq L_BRS_0AC5_0AC1
	lda #$FF

L_BRS_0AC5_0AC1:

	sta $64
	sta $65
	lda #$80
	sta $0E
	asl
	sta $0D
	jmp L_JMP_0EC9_0AD0

L_BRS_0AD3_0AB1:

	lda $66
	bpl L_BRS_0ABF_0AD5

L_JMP_0AD7_0B7E:

	ldy $69
	bne L_BRS_0AFD_0AD9
	ldy $61
	beq L_BRS_0AE7_0ADD

L_BRS_0ADF_0B0B:
L_BRS_0ADF_0B2D:

	lda $66
	bmi L_BRS_0AEA_0AE1

L_BRS_0AE3_0B03:

	lda #$04
	bne L_BRS_0AEC_0AE5

L_BRS_0AE7_0ADD:
L_BRS_0AE7_0B2B:

	lda #$02
	.byte $2C

L_BRS_0AEA_0AE1:
L_BRS_0AEA_0B05:

	lda #$01

L_BRS_0AEC_0AE5:

	and $3C
	beq L_BRS_0AF2_0AEE
	lda #$FF

L_BRS_0AF2_0AEE:

	sta $64
	sta $65
	lda #$80
	sta $0E
	jmp L_JMP_0EC9_0AFA

L_BRS_0AFD_0AD9:

	lda $61
	bne L_BRS_0B07_0AFF

L_BRS_0B01_0B2F:

	lda $6E
	bmi L_BRS_0AE3_0B03
	bpl L_BRS_0AEA_0B05

L_BRS_0B07_0AFF:

	lda $66
	eor $6E
	bmi L_BRS_0ADF_0B0B
	cpy $61
	bne L_BRS_0B2D_0B0F
	lda $6A
	cmp $62
	bne L_BRS_0B2D_0B15
	lda $6B
	cmp $63
	bne L_BRS_0B2D_0B1B
	lda $6C
	cmp $64
	bne L_BRS_0B2D_0B21
	lda #$7F
	cmp $70
	lda $6D
	sbc $65
	beq L_BRS_0AE7_0B2B

L_BRS_0B2D_0B0F:
L_BRS_0B2D_0B15:
L_BRS_0B2D_0B1B:
L_BRS_0B2D_0B21:

	bcc L_BRS_0ADF_0B2D
	bcs L_BRS_0B01_0B2F

L_JMP_0B31_0C27:
L_JMP_0B31_0E56:

	ldy #$00
	sty $69
	sty $6A
	sty $6B
	ldx #$90
	lda $6C
	sta $6E
	bpl L_BRS_0B53_0B3F
	eor #$FF
	sta $6C
	lda $6D
	eor #$FF
	sta $6D
	inc $6D
	bne L_BRS_0B51_0B4D
	inc $6C

L_BRS_0B51_0B4D:

	lda $6C

L_BRS_0B53_0B3F:

	bne L_BRS_0B5D_0B53
	ldx #$88
	lda $6D
	beq L_BRS_0B71_0B59
	sty $6D

L_BRS_0B5D_0B53:

	bmi L_BRS_0B65_0B5D

L_BRS_0B5F_0B63:

	dex
	asl $6D
	rol
	bpl L_BRS_0B5F_0B63

L_BRS_0B65_0B5D:

	sta $6A
	lda $6D
	sta $6B
	stx $69
	sty $6C
	sty $6D

L_BRS_0B71_0B59:
L_JMP_0B71_0E34:

	lda $0E
	bpl L_BRS_0B78_0B73
	jsr L_JSR_13FF_0B75

L_BRS_0B78_0B73:

	ldy $3C
	cpy #$07
	bcs L_BRS_0B81_0B7C
	jmp L_JMP_0AD7_0B7E

L_BRS_0B81_0B7C:

	lda $090C,Y
	sta $55
	lda $0911,Y
	sta $56
	lda $6E
	eor $66
	sta $6F
	lda $61
	jsr $0054
	jmp L_JMP_0EC9_0B96

L_JMP_0B99_0C21:
L_JMP_0B99_0E50:

	ldx #$02
	lda $6C
	cmp $64
	bne L_BRS_0BA7_0B9F
	ldy $6D
	cpy $65
	beq L_BRS_0BB0_0BA5

L_BRS_0BA7_0B9F:

	dex
	eor $64
	bmi L_BRS_0BBE_0BAA
	bcs L_BRS_0BB0_0BAC

L_BRS_0BAE_0BBE:

	ldx #$04

L_BRS_0BB0_0BA5:
L_BRS_0BB0_0BAC:
L_BRS_0BB0_0BC0:

	txa
	and $3C
	beq L_BRS_0BB7_0BB3
	lda #$FF

L_BRS_0BB7_0BB3:

	sta $64
	sta $65
	jmp L_JMP_0EC9_0BBB

L_BRS_0BBE_0BAA:

	bcs L_BRS_0BAE_0BBE
	bcc L_BRS_0BB0_0BC0

L_JMP_0BC2_0E5C:

	lda $61
	bne L_BRS_0BCA_0BC4
	sta $64
	beq L_BRS_0C0E_0BC8

L_BRS_0BCA_0BC4:

	bit $70
	bpl L_BRS_0BD1_0BCC
	jsr $BC1B                         // Round FAC#1

L_BRS_0BD1_0BCC:

	lda $64
	ora $65
	bne L_BRS_0C27_0BD5
	lda $61
	cmp #$81
	bcc L_BRS_0C27_0BDB
	sbc #$90
	bpl L_BRS_0C27_0BDF
	cmp #$F9
	bcs L_BRS_0BFB_0BE3
	adc #$07
	tax
	lda $63
	bne L_BRS_0C27_0BEA
	lda $62
	inx
	beq L_BRS_0BF7_0BEF

L_BRS_0BF1_0BF5:

	lsr
	bcs L_BRS_0C27_0BF2
	inx
	bne L_BRS_0BF1_0BF5

L_BRS_0BF7_0BEF:

	stx $64
	beq L_BRS_0C0E_0BF9

L_BRS_0BFB_0BE3:

	tax
	lda $63
	sta $28
	lda $62

L_BRS_0C02_0C08:

	lsr
	ror $28
	bcs L_BRS_0C27_0C05
	inx
	bne L_BRS_0C02_0C08
	sta $64
	lda $28

L_BRS_0C0E_0BC8:
L_BRS_0C0E_0BF9:

	sta $65
	bit $66
	bpl L_BRS_0C17_0C12
	jsr L_JSR_0DC9_0C14

L_BRS_0C17_0C12:

	lda #$80
	sta $0E
	ldx $3C
	cpx #$07
	bcs L_BRS_0C24_0C1F
	jmp L_JMP_0B99_0C21

L_BRS_0C24_0C1F:

	jmp L_JMP_0CFE_0C24

L_BRS_0C27_0BD5:
L_BRS_0C27_0BDB:
L_BRS_0C27_0BDF:
L_BRS_0C27_0BEA:
L_BRS_0C27_0BF2:
L_BRS_0C27_0C05:

	jmp L_JMP_0B31_0C27

L_JMP_0C2A_0E37:

	jsr L_JSR_0C5C_0C2A

L_JMP_0C2D_0E59:

	lda $0E
	bmi L_BRS_0C34_0C2F
	jsr L_JSR_1442_0C31

L_BRS_0C34_0C2F:

	lsr $3C
	bcs L_BRS_0C44_0C36
	lda $6C
	and $64
	sta $64
	lda $6D
	and $65
	bcc L_BRS_0C4E_0C42

L_BRS_0C44_0C36:

	lda $6C
	ora $64
	sta $64
	lda $6D
	ora $65

L_BRS_0C4E_0C42:

	sta $65
	jmp L_JMP_0EC9_0C50

L_BRS_0C53_0C64:

	jmp $B248                         // ?ILLEGAL QUANTITY

L_BRS_0C56_0C60:

	lda #$00
	sta $6B
	beq L_BRS_0C6F_0C5A

L_JSR_0C5C_0C2A:
L_JSR_0C5C_11E8:
L_JSR_0C5C_121D:

	lda $69
	cmp #$81
	bcc L_BRS_0C56_0C60
	sbc #$90
	bpl L_BRS_0C53_0C64
	tax
	lda $6A

L_BRS_0C69_0C6D:

	lsr
	ror $6B
	inx
	bne L_BRS_0C69_0C6D

L_BRS_0C6F_0C5A:

	asl $6E
	bcc L_BRS_0C75_0C71
	eor #$FF

L_BRS_0C75_0C71:

	sta $6C
	lda $6B
	bcc L_BRS_0C7D_0C79
	eor #$FF

L_BRS_0C7D_0C79:

	sta $6D
	rts

jmp_0c80:

	jsr $FFE7                         // Close All Channels And Files

L_JMP_0C83_19F7:

	jsr L_JSR_0CB1_0C83
	lda $39
	sta $50
	lda $3A
	sta $51
	ldy #$06
	bne L_BRS_0C97_0C90

L_JMP_0C92_081C:

	jsr L_JSR_0CE4_0C92
	ldy #$0A

L_BRS_0C97_0C90:
			// points to
			// Y=#$0A - $1FA1
			// Y=#$06 - $1F9F
	lda $1F93,Y
	ldx $1F94,Y
	jmp L_JMP_1D23_0C9D

	jsr L_JSR_0CF3_0CA0
	jmp L_JMP_0EAC_0CA3

jmp_0Ca6:

	lda $50
	sta $39
	lda $51
	sta $3A
	jmp L_JMP_0EAC_0CAE

L_JSR_0CB1_0C83:

	ldx #$05

L_BRS_0CB3_0CB9:	// VARTAB,ARYTAB,STREND

	lda $1F93,X	// all point to >$1FA9
	sta $2D,X
	dex
	bpl L_BRS_0CB3_0CB9
	ldx $2E

L_BRS_0CBD_0CDA:

	stx $60

L_BRS_0CBF_0CD7:

	sta $5F
	cpx $30
	bne L_BRS_0CC9_0CC3
	cmp $2F
	beq L_BRS_0CDC_0CC7

L_BRS_0CC9_0CC3:

	ldy #$01
	lda #$00

L_BRS_0CCD_0CD2:

	iny
	sta ($5F),Y
	cpy #$06
	bne L_BRS_0CCD_0CD2
	tya
	adc $5F
	bcc L_BRS_0CBF_0CD7
	inx
	bcs L_BRS_0CBD_0CDA

L_BRS_0CDC_0CC7:

	lda $37
	ldy $38
	sta $33
	sty $34

L_JSR_0CE4_0C92:	// set stack and ready BASIC ptrs

	pla
	tay
	pla
	ldx #$F8
	txs
	pha
	tya
	pha
	lda #$00	// #### BZB
	sta $3B		// OLDLIN lb
	sta $11		// INPFLG

L_JSR_0CF3_0CA0:	// DATPTR: program address where DATA is currently being READ

	lda $1F9B	// points to $1FA0
	sta $41	// DATPTR hb
	lda $1F9C
	sta $42	// DATPTR lb
	rts

L_JMP_0CFE_0C24:
L_JMP_0CFE_0E53:

	beq L_BRS_0D11_0CFE
	cpx #$08
	bne L_BRS_0D52_0D02
	lda $6D
	sbc $65
	sta $65
	lda $6C
	sbc $64
	jmp L_JMP_0D1C_0D0E

L_BRS_0D11_0CFE:

	clc
	lda $6D
	adc $65
	sta $65
	lda $6C
	adc $64

L_JMP_0D1C_0D0E:

	sta $64
	bvs L_BRS_0D23_0D1E
	jmp L_JMP_0EC9_0D20

L_BRS_0D23_0D1E:

	ldx #$00
	stx $62
	stx $63
	stx $66
	bcc L_BRS_0D32_0D2B
	dec $66
	jsr L_JSR_0DC9_0D2F

L_BRS_0D32_0D2B:
L_BRS_0D32_0D42:
L_BRS_0D32_0D46:

	lda #$00
	sta $0E
	sta $70
	jsr $BCDB
	jmp L_JMP_0EC9_0D3B

L_BRS_0D3E_0D9E:

	lda $62
	ora $63
	bne L_BRS_0D32_0D42
	lda $64
	bmi L_BRS_0D32_0D46
	lda $66
	bpl L_BRS_0D4F_0D4A
	jsr L_JSR_0DC9_0D4C

L_BRS_0D4F_0D4A:

	jmp L_JMP_0EC9_0D4F

L_BRS_0D52_0D02:

	lda $64
	eor $6C
	sta $66
	lda $64
	bpl L_BRS_0D5F_0D5A
	jsr L_JSR_0DC9_0D5C

L_BRS_0D5F_0D5A:

	lda $6C
	bpl L_BRS_0D73_0D61
	eor #$FF
	sta $6C
	lda $6D
	eor #$FF
	sta $6D
	inc $6D
	bne L_BRS_0D73_0D6F
	inc $6C

L_BRS_0D73_0D61:
L_BRS_0D73_0D6F:

	lda $64
	ldx $65
	cmp $6C
	bcc L_BRS_0D85_0D79
	ldy $6C
	sta $6C
	lda $6D
	stx $6D
	tax
	tya

L_BRS_0D85_0D79:

	ldy #$00
	sty $62
	sty $63
	sty $64
	sty $65
	sty $6A
	sty $6B
	tay
	beq L_BRS_0DDC_0D94
	sta $28
	stx $29

L_BRS_0D9A_0DC7:

	lda $28
	ora $29

L_BRS_0D9E_0DDD:

	beq L_BRS_0D3E_0D9E
	lsr $28
	ror $29
	bcc L_BRS_0DBF_0DA4
	clc
	lda $65
	adc $6D
	sta $65
	lda $64
	adc $6C
	sta $64
	lda $63
	adc $6B
	sta $63
	lda $62
	adc $6A
	sta $62

L_BRS_0DBF_0DA4:

	asl $6D
	rol $6C
	rol $6B
	rol $6A
	bcc L_BRS_0D9A_0DC7

L_JSR_0DC9_0925:
L_JSR_0DC9_099B:
L_JSR_0DC9_0C14:
L_JSR_0DC9_0D2F:
L_JSR_0DC9_0D4C:
L_JSR_0DC9_0D5C:
L_JSR_0DC9_0FAC:
L_JSR_0DC9_1413:
L_JSR_0DC9_1543:
L_JSR_0DC9_165A:
L_JSR_0DC9_1938:

	lda $64
	eor #$FF
	sta $64
	lda $65
	eor #$FF
	sta $65
	inc $65
	bne L_BRS_0DDB_0DD7
	inc $64

L_BRS_0DDB_0DD7:

	rts

L_BRS_0DDC_0D94:
L_BRS_0DDC_0DFC:

	txa
	beq L_BRS_0D9E_0DDD
	lsr
	tax
	bcc L_BRS_0DF6_0DE1
	clc
	lda $65
	adc $6D
	sta $65
	lda $64
	adc $6C
	sta $64
	lda $63
	adc $6B
	sta $63

L_BRS_0DF6_0DE1:

	asl $6D
	rol $6C
	rol $6B
	bcc L_BRS_0DDC_0DFC
	lda #$19
	sta $16
	jsr $A9E0
	jmp L_JMP_0EAC_0E05



	lda $39
	ldx $3A
	sta $7A
	stx $7B
	sta $3D
	stx $3E
	jmp $A7E1                         // Prepare to execute statement

L_BRS_0E17_0E72:

	sta $3C
	pla
	bmi L_BRS_0E3A_0E1A
	bne L_BRS_0E5F_0E1C
	pla
	sta $6E
	pla
	sta $69
	pla
	sta $6A
	pla
	sta $6B
	pla
	sta $6C
	pla
	sta $6D
	cpx #$0C
	bcs L_BRS_0E37_0E32
	jmp L_JMP_0B71_0E34

L_BRS_0E37_0E32:

	jmp L_JMP_0C2A_0E37

L_BRS_0E3A_0E1A:

	pla
	sta $6C
	pla
	sta $6D
	cpx #$0C
	bcs L_BRS_0E59_0E42
	cpx #$0A
	bcs L_BRS_0E56_0E46
	ldy $0E
	bpl L_BRS_0E5C_0E4A
	cpx #$07
	bcs L_BRS_0E53_0E4E
	jmp L_JMP_0B99_0E50

L_BRS_0E53_0E4E:

	jmp L_JMP_0CFE_0E53

L_BRS_0E56_0E46:

	jmp L_JMP_0B31_0E56

L_BRS_0E59_0E42:

	jmp L_JMP_0C2D_0E59

L_BRS_0E5C_0E4A:

	jmp L_JMP_0BC2_0E5C

L_BRS_0E5F_0E1C:

	pla
	sta $6F
	pla
	sta $70
	cpx #$07
	bcs L_BRS_0E6C_0E67
	jmp L_JMP_0A50_0E69

L_BRS_0E6C_0E67:

	jmp L_JMP_09C7_0E6C

L_BRS_0E6F_0ED1:

	tax
	cmp #$0E
	bcc L_BRS_0E17_0E72
	lda $087A,X
	sta $55
	lda $0817,X
	sta $56
.break
	jmp ($0055)

L_JMP_0E81_0822:

	pla
	pla
	pla
	pla

L_JMP_0E85_1868:

	lda $7A
	ldx $7B
	sta $39
	stx $3A
	bit $11
	bvc L_BRS_0EB0_0E8F

L_BRS_0E91_0EAE:

	lda $91
	cmp #$7F
	bne L_BRS_0EB0_0E95
	jsr $ABB7
	sec
	bcs L_BRS_0EA1_0E9B

L_JMP_0E9D_1B50:

	jsr $A644
	clc

L_BRS_0EA1_0E9B:

	jsr $A841
	jsr $ABB7

L_JMP_0EA7_081F:

	pla
	pla
	jsr $A868

L_JMP_0EAC_0CA3:
L_JMP_0EAC_0CAE:
L_JMP_0EAC_0E05:
L_JMP_0EAC_170A:
L_JMP_0EAC_1853:
L_JMP_0EAC_19B7:
L_JMP_0EAC_19EC:
L_JMP_0EAC_1A0F:
L_JMP_0EAC_1A1A:
L_JMP_0EAC_1A59:
L_JMP_0EAC_1AA7:
L_JMP_0EAC_1C02:
L_JMP_0EAC_1CB8:
L_JMP_0EAC_1EC2:
L_JMP_0EAC_1F6E:

	bit $11
	bvs L_BRS_0E91_0EAE

L_BRS_0EB0_0E8F:
L_BRS_0EB0_0E95:

	ldy #$00
	sty $3B
	inc $39
	bne L_BRS_0ECF_0EB6
	inc $3A
	bne L_BRS_0ECF_0EBA

L_JMP_0EBC_1D03:
L_JMP_0EBC_1D8A:
L_JMP_0EBC_1E99:

	ldy #$00

L_JMP_0EBE_10D6:
L_JMP_0EBE_10FD:

	clc

L_JMP_0EBF_1CDA:
L_JMP_0EBF_1D80:

	adc $39
	sta $39
	bcc L_BRS_0ECF_0EC3

L_BRS_0EC5_0ECD:

	inc $3A
	bne L_BRS_0ECF_0EC7

L_JMP_0EC9_0AD0:
L_JMP_0EC9_0AFA:
L_JMP_0EC9_0B96:
L_JMP_0EC9_0BBB:
L_JMP_0EC9_0C50:
L_JMP_0EC9_0D20:
L_JMP_0EC9_0D3B:
L_JMP_0EC9_0D4F:
L_JMP_0EC9_1148:
L_JMP_0EC9_1156:
L_JMP_0EC9_1167:
L_JMP_0EC9_1173:
L_JMP_0EC9_1533:
L_JMP_0EC9_155D:
L_JMP_0EC9_15C5:
L_JMP_0EC9_1B57:

	ldy #$00

L_JMP_0ECB_099E:
L_JMP_0ECB_09AB:
L_JMP_0ECB_09C1:
L_JMP_0ECB_0F26:
L_JMP_0ECB_0FEF:
L_JMP_0ECB_101B:
L_JMP_0ECB_1058:
L_JMP_0ECB_10B3:
L_JMP_0ECB_12A5:
L_JMP_0ECB_12C8:
L_JMP_0ECB_1305:
L_JMP_0ECB_1359:
L_JMP_0ECB_13C5:
L_JMP_0ECB_153C:
L_JMP_0ECB_1546:
L_JMP_0ECB_1563:
L_JMP_0ECB_1592:
L_JMP_0ECB_15FA:
L_JMP_0ECB_16CA:
L_JMP_0ECB_182C:
L_JMP_0ECB_199A:
L_JMP_0ECB_19D7:
L_JMP_0ECB_1CA5:
L_JMP_0ECB_1CC9:
L_JMP_0ECB_1D68:
L_JMP_0ECB_1D6F:

	inc $39
	beq L_BRS_0EC5_0ECD

L_BRS_0ECF_0EB6:
L_BRS_0ECF_0EBA:
L_BRS_0ECF_0EC3:
L_BRS_0ECF_0EC7:
L_JMP_0ECF_1D29:
L_JMP_0ECF_1D59:

	lda ($39),Y
	bpl L_BRS_0E6F_0ED1
	cmp #$C0
	bcc L_BRS_0F4E_0ED5
	cmp #$E0
	bcs L_BRS_0F36_0ED9
	tax
	ldy $082B,X
	lda ($2D),Y
	bpl L_BRS_0EEE_0EE1
	iny
	lda $0E
	bmi L_BRS_0F18_0EE6
	jsr L_JSR_1442_0EE8
	jmp L_JMP_0F18_0EEB

L_BRS_0EEE_0EE1:

	iny
	lda ($2D),Y
	bmi L_BRS_0F29_0EF1
	lda $0E
	bpl L_BRS_0EFE_0EF5
	sty $22
	jsr L_JSR_13FF_0EF9
	ldy $22

L_BRS_0EFE_0EF5:

	iny
	bit $70
	bpl L_BRS_0F06_0F01
	jsr $BC1B                         // Round FAC#1

L_BRS_0F06_0F01:

	lda $61
	sta ($2D),Y
	iny
	lda $66
	ora #$7F
	and $62
	sta ($2D),Y
	iny
	lda $63
	sta ($2D),Y

L_BRS_0F18_0EE6:
L_JMP_0F18_0EEB:

	iny
	lda $64
	sta ($2D),Y
	iny
	lda $65
	sta ($2D),Y
	ldy #$00
	sty $3B
	jmp L_JMP_0ECB_0F26

L_BRS_0F29_0EF1:

	tya
	sec
	adc $2D
	sta $49
	lda $2E
	adc #$00
	jmp L_JMP_1361_0F33

L_BRS_0F36_0ED9:

	cmp #$E6
	bcs L_BRS_0F4E_0F38
	sta $3B
	inc $39
	beq L_BRS_0F4A_0F3E

L_BRS_0F40_0F4C:

	cmp #$E4
	bcc L_BRS_0F47_0F42
	jmp L_JMP_119F_0F44

L_BRS_0F47_0F42:

	jmp L_JMP_1065_0F47

L_BRS_0F4A_0F3E:

	inc $3A
	bne L_BRS_0F40_0F4C

L_BRS_0F4E_0ED5:
L_BRS_0F4E_0F38:

	ldx $3B
	sta $3B
	beq L_BRS_0FD2_0F52
	ldy $0E
	bne L_BRS_0FC8_0F56
	lda $61
	bne L_BRS_0F60_0F5A
	sta $64
	beq L_BRS_0FA4_0F5E

L_BRS_0F60_0F5A:

	bit $70
	bpl L_BRS_0F67_0F62
	jsr $BC1B                         // Round FAC#1

L_BRS_0F67_0F62:

	lda $64
	ora $65
	bne L_BRS_0FB2_0F6B
	lda $61
	cmp #$81
	bcc L_BRS_0FB2_0F71
	sbc #$90
	bpl L_BRS_0FB2_0F75
	cmp #$F9
	bcs L_BRS_0F91_0F79
	adc #$07
	tax
	lda $63
	bne L_BRS_0FB2_0F80
	lda $62
	inx
	beq L_BRS_0F8D_0F85

L_BRS_0F87_0F8B:

	lsr
	bcs L_BRS_0FB2_0F88
	inx
	bne L_BRS_0F87_0F8B

L_BRS_0F8D_0F85:

	stx $64
	beq L_BRS_0FA4_0F8F

L_BRS_0F91_0F79:

	tax
	lda $63
	sta $28
	lda $62

L_BRS_0F98_0F9E:

	lsr
	ror $28
	bcs L_BRS_0FB2_0F9B
	inx
	bne L_BRS_0F98_0F9E
	sta $64
	lda $28

L_BRS_0FA4_0F5E:
L_BRS_0FA4_0F8F:

	sta $65
	ldy #$80
	bit $66
	bpl L_BRS_0FCA_0FAA
	jsr L_JSR_0DC9_0FAC
	jmp L_JMP_0FC8_0FAF

L_BRS_0FB2_0F6B:
L_BRS_0FB2_0F71:
L_BRS_0FB2_0F75:
L_BRS_0FB2_0F80:
L_BRS_0FB2_0F88:
L_BRS_0FB2_0F9B:

	lda $65
	pha
	lda $64
	pha
	lda $63
	pha
	lda $62
	pha
	lda $61
	pha
	lda $66
	pha
	tya
	pha
	beq L_BRS_0FD0_0FC6

L_BRS_0FC8_0F56:
L_JMP_0FC8_0FAF:

	lda $65

L_BRS_0FCA_0FAA:

	pha
	lda $64
	pha
	tya
	pha

L_BRS_0FD0_0FC6:

	lda $3B

L_BRS_0FD2_0F52:

	cmp #$A0
	bcs L_BRS_101E_0FD4
	tax
	ldy $086B,X
	lda ($2D),Y
	bpl L_BRS_0FF2_0FDC
	sta $0E
	iny
	iny
	lda ($2D),Y
	sta $64
	iny
	lda ($2D),Y
	sta $65
	ldy #$00
	sty $0D
	jmp L_JMP_0ECB_0FEF

L_BRS_0FF2_0FDC:

	iny
	lda ($2D),Y
	bpl L_BRS_1033_0FF5
	sta $0D
	tya
	sec
	adc $2D
	sta $49
	sta $64
	lda $2E
	adc #$00
	sta $4A
	sta $65
	ldy #$02
	lda ($49),Y
	sta $63
	dey
	sty $0E
	lda ($49),Y
	sta $62
	dey
	lda ($49),Y
	sta $61
	jmp L_JMP_0ECB_101B

L_BRS_101E_0FD4:

	cmp #$A6
	bcs L_BRS_109F_1020
	inc $39
	beq L_BRS_102F_1024

L_BRS_1026_1031:

	ldy #$00
	cmp #$A4
	bcc L_BRS_1065_102A
	jmp L_JMP_119F_102C

L_BRS_102F_1024:

	inc $3A
	bne L_BRS_1026_1031

L_BRS_1033_0FF5:

	iny
	lda ($2D),Y
	sta $61
	iny
	lda ($2D),Y
	sta $66
	ora #$80
	sta $62
	iny
	lda ($2D),Y
	sta $63
	iny
	lda ($2D),Y
	sta $64
	iny
	lda ($2D),Y
	sta $65
	ldy #$00
	sty $0E
	sty $0D
	sty $70
	jmp L_JMP_0ECB_1058

L_BRS_105B_1069:

	lda ($39),Y
	inc $39
	bne L_BRS_106B_105F
	inc $3A
	bne L_BRS_106B_1063

L_JMP_1065_0F47:
L_BRS_1065_102A:

	and #$03
	cmp #$03
	beq L_BRS_105B_1069

L_BRS_106B_105F:
L_BRS_106B_1063:

	sta $48
	sta $60
	lda ($39),Y
	sta $47
	asl
	rol $60
	asl
	rol $60
	asl
	rol $60
	sec
	sbc $47
	tay
	lda $60
	sbc $48
	tax
	tya
	clc
	adc $2D
	sta $5F
	txa
	adc $2E
	sta $60
	lda $5F
	adc #$02
	sta $49
	lda $60
	adc #$00
	sta $4A
	jmp L_JMP_1308_109C

L_BRS_109F_1020:

	cmp #$E7
	bcs L_BRS_1112_10A1
	cmp #$B0
	bcc L_BRS_10B6_10A5
	sta $0E
	and #$0F

L_BRS_10AB_1104:

	sta $65
	ldy #$00
	sty $64
	sty $0D
	jmp L_JMP_0ECB_10B3

L_BRS_10B6_10A5:

	ldx #$00
	cmp #$AA
	bcs L_BRS_1139_10BA
	ldy #$01
	sta $0E
	cmp #$A7
	bcc L_BRS_10CA_10C2
	bne L_BRS_10D9_10C4
	lda ($39),Y
	tax
	iny

L_BRS_10CA_10C2:

	lda ($39),Y
	sta $65
	stx $64
	iny
	tya
	ldy #$00
	sty $0D
	jmp L_JMP_0EBE_10D6

L_BRS_10D9_10C4:

	lda ($39),Y
	sta $61
	iny
	lda ($39),Y
	sta $66
	ora #$80
	sta $62
	iny
	lda ($39),Y
	sta $63
	iny
	lda ($39),Y
	sta $64
	iny
	lda ($39),Y
	sta $65
	ldy #$00
	sty $0D
	sty $0E
	lda #$06
	jmp L_JMP_0EBE_10FD

L_BRS_1100_1116:

	sta $0E
	and #$1F
	bpl L_BRS_10AB_1104

L_BRS_1106_1112:

	ldy #$01
	lda ($39),Y
	inc $39
	bne L_BRS_111C_110C
	inc $3A
	bne L_BRS_111C_1110

L_BRS_1112_10A1:

	beq L_BRS_1106_1112
	cmp #$F0
	bcs L_BRS_1100_1116
	and #$07
	ldy #$01

L_BRS_111C_110C:
L_BRS_111C_1110:

	sta $61
	sty $0E
	lda $39
	tax
	clc
	adc $61
	sta $39
	ldy $3A
	bcc L_BRS_112E_112A
	inc $3A

L_BRS_112E_112A:

	inx
	bne L_BRS_1132_112F
	iny

L_BRS_1132_112F:

	stx $62
	sty $63
	jmp L_JMP_180C_1136

L_BRS_1139_10BA:

	stx $0D
	beq L_BRS_116A_113B
	cmp #$AC
	bcc L_BRS_115C_113F
	bne L_BRS_114B_1141
	stx $0E
	jsr $AF7B
	jmp L_JMP_0EC9_1148

L_BRS_114B_1141:

	cmp #$AF
	bcc L_BRS_1159_114D
	jsr $AF48                         // Convert TI to ASCII String
	ldy #$01
	sty $0E
	jmp L_JMP_0EC9_1156

L_BRS_1159_114D:

	jmp $AF08                         // Output ?SYNTAX Error

L_BRS_115C_113F:

	sta $0E
	lda $90
	bpl L_BRS_1163_1160
	dex

L_BRS_1163_1160:

	stx $64
	sta $65
	jmp L_JMP_0EC9_1167

L_BRS_116A_113B:

	stx $0E
	lda #$A8
	ldy #$AE
	jsr $BBA2                         // Load FAC#1 From Memory
	jmp L_JMP_0EC9_1173

L_BRS_1176_119F:

	lda ($39),Y
	clc
	adc $2F
	sta $69
	iny
	lda ($39),Y
	adc $30
	sta $6A
	inc $39
	bne L_BRS_118A_1186
	inc $3A

L_BRS_118A_1186:

	ldy #$00
	lda ($69),Y
	tax
	clc
	adc $2F
	sta $5F
	iny
	txa
	ora ($69),Y
	beq L_BRS_1200_1198
	lda ($69),Y
	jmp L_JMP_11B4_119C

L_JMP_119F_0F44:
L_JMP_119F_102C:

	bne L_BRS_1176_119F
	lda ($39),Y
	tay
	clc
	lda ($2F),Y
	tax
	adc $2F
	sta $5F
	iny
	txa
	ora ($2F),Y
	beq L_BRS_1200_11B0
	lda ($2F),Y

L_JMP_11B4_119C:

	adc $30
	sta $60
	ldy #$01
	lda ($5F),Y
	sta $46
	dey
	lda ($5F),Y
	sta $45
	ldy #$04
	lda ($5F),Y
	sta $0B
	asl
	adc #$05
	adc $5F
	sta $58
	lda #$00
	adc $60
	sta $59
	iny
	pla
	bmi L_BRS_11F1_11D8
	pla
	sta $6E
	pla
	sta $69
	pla
	sta $6A
	pla
	sta $6B
	pla
	pla
	jsr L_JSR_0C5C_11E8
	lda $6D
	pha
	lda $6C
	pha

L_BRS_11F1_11D8:

	pla
	sta $72
	cmp ($5F),Y
	bcc L_BRS_1203_11F6
	bne L_BRS_1200_11F8
	iny
	pla
	cmp ($5F),Y
	bcc L_BRS_1205_11FE

L_BRS_1200_1198:
L_BRS_1200_11B0:
L_BRS_1200_11F8:

	jmp $B245                         // ?BAD SUBSCRIPT

L_BRS_1203_11F6:

	iny
	pla

L_BRS_1205_11FE:

	sta $71
	dec $0B
	beq L_BRS_1259_1209

L_BRS_120B_1256:

	iny
	pla
	bmi L_BRS_1226_120D
	pla
	sta $6E
	pla
	sta $69
	pla
	sta $6A
	pla
	sta $6B
	pla
	pla
	jsr L_JSR_0C5C_121D
	lda $6D
	pha
	lda $6C
	pha

L_BRS_1226_120D:

	pla
	sta $6C
	cmp ($5F),Y
	bcc L_BRS_1238_122B
	bne L_BRS_1235_122D
	iny
	pla
	cmp ($5F),Y
	bcc L_BRS_123A_1233

L_BRS_1235_122D:

	jmp $B245                         // ?BAD SUBSCRIPT

L_BRS_1238_122B:

	iny
	pla

L_BRS_123A_1233:

	sta $6D
	tax
	lda $72
	ora $71
	clc
	beq L_BRS_124E_1242
	jsr $B34C                         // Number of Bytes in Subscript
	txa
	adc $6D
	tax
	tya
	ldy $22

L_BRS_124E_1242:

	adc $6C
	stx $71
	sta $72
	dec $0B
	bne L_BRS_120B_1256
	txa

L_BRS_1259_1209:

	ldx $72
	asl
	rol $72
	bit $45
	bmi L_BRS_12A8_1260
	bit $46
	bmi L_BRS_12D6_1264
	asl
	rol $72
	adc $71
	bcc L_BRS_126F_126B
	inx
	clc

L_BRS_126F_126B:

	adc $58
	sta $49
	txa
	adc $72
	adc $59
	sta $4A
	bit $3B
	bvc L_BRS_1281_127C
	jmp L_JMP_1329_127E

L_BRS_1281_127C:
L_JMP_1281_1326:

	ldy #$04
	lda ($49),Y
	sta $65
	dey
	lda ($49),Y
	sta $64
	dey
	lda ($49),Y
	sta $63
	dey
	lda ($49),Y
	sta $66
	ora #$80
	sta $62
	dey
	lda ($49),Y
	sta $61
	sty $0D
	sty $0E
	sty $70
	jmp L_JMP_0ECB_12A5

L_BRS_12A8_1260:

	adc $58
	sta $49
	lda $72
	adc $59
	sta $4A
	ldy #$00
	bit $3B

L_BRS_12B6_130E:

	bvs L_BRS_12CB_12B6
	iny
	lda ($49),Y
	sta $65
	dey
	lda ($49),Y
	sta $64
	lda #$80
	sta $0E
	sty $0D
	jmp L_JMP_0ECB_12C8

L_BRS_12CB_12B6:

	lda $0E
	bmi L_BRS_134C_12CD

L_JMP_12CF_18A5:

	jsr L_JSR_1442_12CF
	ldy #$00
	beq L_BRS_134C_12D4

L_BRS_12D6_1264:

	adc $71
	bcc L_BRS_12DC_12D8
	inx
	clc

L_BRS_12DC_12D8:

	adc $58
	sta $49
	bit $3B
	bvs L_BRS_135C_12E2
	sta $64
	txa
	adc $72
	adc $59
	sta $4A
	sta $65
	lda #$FF
	sta $0D

L_JMP_12F3_1321:

	ldy #$02
	lda ($64),Y
	sta $63
	dey
	sty $0E
	lda ($64),Y
	sta $62
	dey
	lda ($64),Y
	sta $61
	jmp L_JMP_0ECB_1305

L_JMP_1308_109C:

	ldy #$00
	bit $3B
	lda ($5F),Y
	bmi L_BRS_12B6_130E
	iny
	lda ($5F),Y
	bpl L_BRS_1324_1313
	bvs L_BRS_1363_1315
	sta $0D
	ldx $49
	lda $4A
	stx $64
	sta $65
	jmp L_JMP_12F3_1321

L_BRS_1324_1313:

	bvs L_BRS_1329_1324
	jmp L_JMP_1281_1326

L_JMP_1329_127E:
L_BRS_1329_1324:

	lda $0E

L_JMP_132B_1E04:

	bpl L_BRS_1330_132B

L_JMP_132D_16EE:

	jsr L_JSR_13FF_132D

L_BRS_1330_132B:
L_JMP_1330_18A2:

	lda $70
	bpl L_BRS_1337_1332
	jsr $BC1B                         // Round FAC#1

L_BRS_1337_1332:

	ldy #$00
	lda $61
	sta ($49),Y
	iny
	lda $66
	ora #$7F
	and $62
	sta ($49),Y
	iny
	lda $63
	sta ($49),Y
	iny

L_BRS_134C_12CD:
L_BRS_134C_12D4:
L_JMP_134C_16F1:

	lda $64
	sta ($49),Y
	iny
	lda $65
	sta ($49),Y
	ldy #$00
	sty $3B
	jmp L_JMP_0ECB_1359

L_BRS_135C_12E2:

	txa
	adc $72
	adc $59

L_JMP_1361_0F33:

	sta $4A

L_BRS_1363_1315:

	lda #$19
	sta $16
	lda $61
	beq L_BRS_13B3_1369
	ldy $63
	cpy $34
	bne L_BRS_1375_136F
	ldy $62
	cpy $33

L_BRS_1375_136F:

	bcc L_BRS_13B3_1375
	lda $65
	beq L_BRS_13B3_1379

L_JMP_137B_1AE0:

	ldy $34
	lda $33
	sec
	sbc $61
	bcs L_BRS_1385_1382
	dey

L_BRS_1385_1382:

	cpy $32
	bne L_BRS_138B_1387
	cmp $31

L_BRS_138B_1387:

	bcs L_BRS_1390_138B
	jsr L_JSR_1F7A_138D

L_BRS_1390_138B:

	sta $62
	sta $33
	sty $63
	sty $34
	ldy #$02
	lda ($64),Y
	sta $23
	dey
	lda ($64),Y
	sta $22
	ldy $61
	dey
	beq L_BRS_13AF_13A6

L_BRS_13A8_13AD:

	lda ($22),Y
	sta ($33),Y
	dey
	bne L_BRS_13A8_13AD

L_BRS_13AF_13A6:

	lda ($22),Y
	sta ($33),Y

L_BRS_13B3_1369:
L_BRS_13B3_1375:
L_BRS_13B3_1379:
L_JMP_13B3_173E:
L_JMP_13B3_1897:
L_JMP_13B3_1AE3:

	ldy #$02
	lda $63
	sta ($49),Y
	dey
	lda $62
	sta ($49),Y
	dey
	lda $61
	sta ($49),Y
	sty $3B
	jmp L_JMP_0ECB_13C5

L_JSR_13C8_1B68:
L_JSR_13C8_1B91:
L_JSR_13C8_1E74:
L_JSR_13C8_1F61:

	pla
	clc
	adc #$01
	sta $55
	pla
	adc #$00
	sta $56
	pla
	sta $0E
	bne L_BRS_13E6_13D6
	sta $70
	pla
	sta $66
	pla
	sta $61
	pla
	sta $62
	pla
	sta $63

L_BRS_13E6_13D6:

	pla
	sta $64
	pla
	sta $65
.break
	jmp ($0055)

L_BRS_13EF_144D:

	ldx #$00
	lda $66
	bpl L_BRS_13F6_13F3
	dex

L_BRS_13F6_13F3:

	stx $64
	stx $65
	lda #$80
	sta $0E
	rts

L_JSR_13FF_0B75:
L_JSR_13FF_0EF9:
L_JSR_13FF_132D:
L_BRS_13FF_1440:
L_JSR_13FF_1528:

	ldy #$00
	sty $0E
	sty $70
	sty $61
	sty $62
	sty $63
	ldx #$90
	lda $64
	sta $66
	bpl L_BRS_1418_1411
	jsr L_JSR_0DC9_1413
	lda $64

L_BRS_1418_1411:

	bne L_BRS_1422_1418
	ldx #$88
	lda $65
	beq L_BRS_1436_141E
	sty $65

L_BRS_1422_1418:

	bmi L_BRS_142A_1422

L_BRS_1424_1428:

	dex
	asl $65
	rol
	bpl L_BRS_1424_1428

L_BRS_142A_1422:

	sta $62
	lda $65
	sta $63
	stx $61
	sty $64
	sty $65

L_BRS_1436_141E:
L_BRS_1436_143D:

	rts

L_JSR_1437_1B6B:
L_JSR_1437_1B94:

	lda $0E
	and #$80
	cmp $0C
	beq L_BRS_1436_143D
	tax
	bmi L_BRS_13FF_1440

L_JSR_1442_09B2:
L_JSR_1442_0C31:
L_JSR_1442_0EE8:
L_JSR_1442_12CF:
L_JSR_1442_1560:

	bit $70
	bpl L_BRS_1449_1444
	jsr $BC1B                         // Round FAC#1

L_BRS_1449_1444:

	lda $61
	cmp #$81
	bcc L_BRS_13EF_144D
	sbc #$90
	bpl L_BRS_1498_1451
	ldx $66
	bmi L_BRS_147F_1455
	cmp #$F9
	bcs L_BRS_146B_1459
	adc #$07
	tax
	lda $62
	inx
	beq L_BRS_1467_1461

L_BRS_1463_1465:

	lsr
	inx
	bne L_BRS_1463_1465

L_BRS_1467_1461:

	stx $64
	beq L_BRS_1478_1469

L_BRS_146B_1459:

	tax
	lda $62

L_BRS_146E_1472:

	lsr
	ror $63
	inx
	bne L_BRS_146E_1472

L_BRS_1474_148C:

	sta $64
	lda $63

L_BRS_1478_1469:

	sta $65
	lda #$80
	sta $0E
	rts

L_BRS_147F_1455:

	tax
	jsr $B94D
	lda $62

L_BRS_1485_148A:

	sec
	ror
	ror $63
	inx
	bne L_BRS_1485_148A
	beq L_BRS_1474_148C

L_JSR_148E_1585:
L_JSR_148E_1834:
L_JSR_148E_1862:
L_JSR_148E_1E77:

	lda $0E
	bpl L_BRS_149B_1490
	ldx $65
	lda $64
	bpl L_BRS_14C3_1496

L_BRS_1498_1451:
L_BRS_1498_149D:
L_BRS_1498_14B3:
L_BRS_1498_14D0:
L_BRS_1498_14DC:
L_BRS_1498_14E6:
L_BRS_1498_1500:

	jmp $B248                         // ?ILLEGAL QUANTITY

L_BRS_149B_1490:

	lda $66
	bmi L_BRS_1498_149D
	bit $70
	bpl L_BRS_14A6_14A1
	jsr $BC1B                         // Round FAC#1

L_BRS_14A6_14A1:

	lda $61
	cmp #$81
	bcs L_BRS_14B1_14AA
	lda #$00
	tax
	beq L_BRS_14C3_14AF

L_BRS_14B1_14AA:

	sbc #$91
	bpl L_BRS_1498_14B3
	tax
	lda $62
	inx
	beq L_BRS_14C1_14B9

L_BRS_14BB_14BF:

	lsr
	ror $63
	inx
	bne L_BRS_14BB_14BF

L_BRS_14C1_14B9:

	ldx $63

L_BRS_14C3_1496:
L_BRS_14C3_14AF:

	sta $15
	stx $14
	rts

L_JMP_14C8_1F06:

	lda $0E
	bpl L_BRS_14D3_14CA
	ldx $65
	lda $64
	bne L_BRS_1498_14D0
	rts

L_BRS_14D3_14CA:
L_JSR_14D3_1685:
L_JSR_14D3_16C0:
L_JSR_14D3_1745:
L_JSR_14D3_1781:
L_JSR_14D3_1973:
L_JSR_14D3_19C7:
L_JSR_14D3_19DE:
L_JSR_14D3_1CF3:

	bit $70
	bpl L_BRS_14DA_14D5
	jsr $BC1B                         // Round FAC#1

L_BRS_14DA_14D5:

	lda $66
	bmi L_BRS_1498_14DC
	lda $61
	cmp #$81
	bcc L_BRS_14FA_14E2
	sbc #$89
	bpl L_BRS_1498_14E6
	tax
	lda $62
	inx
	beq L_BRS_14F2_14EC

L_BRS_14EE_14F0:

	lsr
	inx
	bne L_BRS_14EE_14F0

L_BRS_14F2_14EC:

	tax

L_BRS_14F3_14FC:

	stx $65
	lda #$00
	sta $64
	rts

L_BRS_14FA_14E2:

	ldx #$00
	beq L_BRS_14F3_14FC
	ldx $61
	beq L_BRS_1498_1500
	ldx $65
	bne L_BRS_151F_1504
	lda $64
	sta $16
	ldx $63
	cpx $34
	bne L_BRS_151F_150E
	lda $62
	cmp $33
	bne L_BRS_151F_1514
	clc
	adc $61
	sta $33
	bcc L_BRS_151F_151B
	inc $34

L_BRS_151F_1504:
L_BRS_151F_150E:
L_BRS_151F_1514:
L_BRS_151F_151B:

	lda ($62),Y
	jmp L_JMP_15BB_1521
	lda $0E
	beq L_BRS_152B_1526
	jsr L_JSR_13FF_1528

L_BRS_152B_1526:

	lda ($39),Y
	asl
	adc #$28
	jsr $AFD5
	jmp L_JMP_0EC9_1533
	lda $0E
	bmi L_BRS_153F_1538
	sta $66
	jmp L_JMP_0ECB_153C

L_BRS_153F_1538:

	lda $64
	bpl L_BRS_1546_1541
	jsr L_JSR_0DC9_1543

L_BRS_1546_1541:
L_BRS_1546_154B:

	jmp L_JMP_0ECB_1546
	lda $0E
	bmi L_BRS_1546_154B
	lda $61
	cmp #$90
	bcc L_BRS_1560_1551
	bit $70
	bpl L_BRS_155A_1555
	jsr $BC1B                         // Round FAC#1

L_BRS_155A_1555:

	jsr $BCCC                         // Evaluate <int>
	jmp L_JMP_0EC9_155D

L_BRS_1560_1551:

	jsr L_JSR_1442_1560
	jmp L_JMP_0ECB_1563
	lda $0E
	bpl L_BRS_157F_1568
	ldy #$FF
	lda $64
	bmi L_BRS_1576_156E
	iny
	ora $65
	beq L_BRS_1576_1573
	iny

L_BRS_1576_156E:
L_BRS_1576_1573:

	tya

L_JMP_1577_1582:

	ldy #$00
	tax
	bpl L_BRS_15BD_157A
	dey
	bmi L_BRS_15BD_157D

L_BRS_157F_1568:

	jsr $BC2B                         // Check Sign of FAC#1
	jmp L_JMP_1577_1582
	jsr L_JSR_148E_1585
	lda ($14),Y

L_JMP_158A_1597:

	sta $65
	sty $64
	lda #$80
	sta $0E
	jmp L_JMP_0ECB_1592
	lda $D3
	jmp L_JMP_158A_1597
	ldx $65
	bne L_BRS_15B7_159C
	lda $64
	sta $16
	ldx $63
	cpx $34
	bne L_BRS_15B7_15A6
	lda $62
	cmp $33
	bne L_BRS_15B7_15AC
	clc
	adc $61
	sta $33
	bcc L_BRS_15B7_15B3
	inc $34

L_BRS_15B7_159C:
L_BRS_15B7_15A6:
L_BRS_15B7_15AC:
L_BRS_15B7_15B3:

	lda $61

L_BRS_15B9_15DA:
L_BRS_15B9_15EF:

	ldy #$00

L_JMP_15BB_1521:

	sty $0D

L_BRS_15BD_157A:
L_BRS_15BD_157D:

	sta $65
	sty $64
	lda #$80
	sta $0E
	jmp L_JMP_0EC9_15C5
	ldy $62
	ldx $63
	stx $23
	sty $22
	lda $65
	bne L_BRS_15ED_15D2
	lda $64
	sta $16
	lda $61
	beq L_BRS_15B9_15DA
	cpx $34
	bne L_BRS_15ED_15DE
	cpy $33
	bne L_BRS_15ED_15E2
	clc
	adc $62
	sta $33
	bcc L_BRS_15ED_15E9
	inc $34

L_BRS_15ED_15D2:
L_BRS_15ED_15DE:
L_BRS_15ED_15E2:
L_BRS_15ED_15E9:

	lda $61
	beq L_BRS_15B9_15EF
	jsr $B7B0
	ldy #$00
	sty $0D
	sty $0E
	jmp L_JMP_0ECB_15FA
	lda $0E
	bmi L_BRS_165D_15FF
	lda $61
	bne L_BRS_1609_1603
	sta $64
	beq L_BRS_1654_1607

L_BRS_1609_1603:

	bit $70
	bpl L_BRS_1610_160B
	jsr $BC1B                         // Round FAC#1

L_BRS_1610_160B:

	lda $64
	ora $65
	bne L_BRS_164F_1614
	lda $61
	cmp #$81
	bcc L_BRS_164F_161A
	sbc #$90
	bpl L_BRS_164F_161E
	cmp #$F9
	bcs L_BRS_163A_1622
	adc #$07
	tax
	lda $63
	bne L_BRS_164F_1629
	lda $62
	inx
	beq L_BRS_1636_162E

L_BRS_1630_1634:

	lsr
	bcs L_BRS_164F_1631
	inx
	bne L_BRS_1630_1634

L_BRS_1636_162E:

	stx $64
	beq L_BRS_1654_1638

L_BRS_163A_1622:

	tax
	lda $63
	sta $28
	lda $62

L_BRS_1641_1647:

	lsr
	ror $28
	bcs L_BRS_164F_1644
	inx
	bne L_BRS_1641_1647
	sta $64
	lda $28
	bcc L_BRS_1654_164D

L_BRS_164F_1614:
L_BRS_164F_161A:
L_BRS_164F_161E:
L_BRS_164F_1629:
L_BRS_164F_1631:
L_BRS_164F_1644:

	jsr $BDDD                         // Convert FAC#1 to ASCII String
	bne L_BRS_1660_1652

L_BRS_1654_1607:
L_BRS_1654_1638:
L_BRS_1654_164D:

	sta $65
	bit $66
	bpl L_BRS_165D_1658
	jsr L_JSR_0DC9_165A

L_BRS_165D_15FF:
L_BRS_165D_1658:

	jsr L_JSR_091D_165D

L_BRS_1660_1652:

	sty $6D
	sta $51
	sta $6E
	sta $6C
	lda #$6B
	sta $50
	sty $0E
	dey

L_BRS_166F_1673:

	iny
	lda $0100,Y
	bne L_BRS_166F_1673
	sty $61
	jmp L_JMP_17CB_1677
	lda $0E
	bpl L_BRS_1685_167C
	lda $64
	beq L_BRS_1688_1680

L_BRS_1682_16BE:

	jmp $B248                         // ?ILLEGAL QUANTITY

L_BRS_1685_167C:

	jsr L_JSR_14D3_1685

L_BRS_1688_1680:

	lda #$01
	sta $61
	sta $0E
	lda $33
	ldy $34
	sec
	sbc #$01
	bcs L_BRS_1698_1695
	dey

L_BRS_1698_1695:

	cpy $32
	bne L_BRS_169E_169A
	cmp $31

L_BRS_169E_169A:

	bcs L_BRS_16A3_169E
	jsr L_JSR_1F7A_16A0

L_BRS_16A3_169E:

	sta $33
	sty $34
	sta $62
	sty $63
	ldy #$00
	lda $65
	sta ($62),Y
	jmp L_JMP_180C_16B1
	lda $0E
	bpl L_BRS_16C0_16B6
	ldx $65
	lda $64
	beq L_BRS_16C3_16BC
	bne L_BRS_1682_16BE

L_BRS_16C0_16B6:

	jsr L_JSR_14D3_16C0

L_BRS_16C3_16BC:

	stx $13
	jsr $FFC6                         // Set Input
	sty $3B
	jmp L_JMP_0ECB_16CA
	sty $13
	jsr $FFE4                         // Get From Keyboad
	pha
	jsr $FFCC                         // Restore I/O Vector
	ldy $0D
	bmi L_BRS_16F4_16D8
	pla
	cmp #$30
	bcc L_BRS_16E3_16DD
	cmp #$3A
	bcc L_BRS_16E4_16E1

L_BRS_16E3_16DD:

	tya

L_BRS_16E4_16E1:

	and #$0F
	sta $65
	sty $64
	bit $0E
	bmi L_BRS_16F1_16EC
	jmp L_JMP_132D_16EE

L_BRS_16F1_16EC:

	jmp L_JMP_134C_16F1

L_BRS_16F4_16D8:

	pla
	beq L_BRS_170D_16F5
	ldy $61
	dey
	bne L_BRS_1715_16FA
	ldx $63
	cpx $34
	bne L_BRS_1706_1700
	ldx $62
	cpx $33

L_BRS_1706_1700:

	bcc L_BRS_1715_1706
	sta ($62),Y

L_BRS_170A_170F:

	jmp L_JMP_0EAC_170A

L_BRS_170D_16F5:

	ldx $61
	beq L_BRS_170A_170F
	sta $61
	bne L_BRS_173E_1713

L_BRS_1715_16FA:
L_BRS_1715_1706:

	sta $69
	lda #$01
	sta $61
	lda $33
	ldy $34
	sec
	sbc #$01
	bcs L_BRS_1725_1722
	dey

L_BRS_1725_1722:

	cpy $32
	bne L_BRS_172B_1727
	cmp $31

L_BRS_172B_1727:

	bcs L_BRS_1730_172B
	jsr L_JSR_1F7A_172D

L_BRS_1730_172B:

	sta $33
	sty $34
	sta $62
	sty $63
	lda $69
	ldy #$00
	sta ($62),Y

L_BRS_173E_1713:

	jmp L_JMP_13B3_173E
	lda $0E
	bmi L_BRS_1748_1743
	jsr L_JSR_14D3_1745

L_BRS_1748_1743:

	lda $64
	bne L_BRS_177E_174A
	pla
	bpl L_BRS_1758_174D
	pla
	bne L_BRS_177E_1750
	pla
	tax
	bne L_BRS_1784_1754
	beq L_BRS_177E_1756

L_BRS_1758_174D:

	pla
	bmi L_BRS_177E_1759
	pla
	sec
	sbc #$89
	bpl L_BRS_177E_175F
	tay
	pla
	tax
	pla
	pla
	pla
	txa
	iny
	beq L_BRS_1784_1769

L_BRS_176B_176D:

	lsr
	iny
	bne L_BRS_176B_176D
	tax
	bne L_BRS_1784_1770
	beq L_BRS_177E_1772
	lda $0E
	bpl L_BRS_1781_1776
	ldx $65
	lda $64
	beq L_BRS_1784_177C

L_BRS_177E_174A:
L_BRS_177E_1750:
L_BRS_177E_1756:
L_BRS_177E_1759:
L_BRS_177E_175F:
L_BRS_177E_1772:

	jmp $B248                         // ?ILLEGAL QUANTITY

L_BRS_1781_1776:

	jsr L_JSR_14D3_1781

L_BRS_1784_1754:
L_BRS_1784_1769:
L_BRS_1784_1770:
L_BRS_1784_177C:

	pla
	sta $0E
	pla
	sta $50
	pla
	sta $51
	bne L_BRS_1793_178D
	lda $50
	sta $16

L_BRS_1793_178D:

	lda ($50),Y
	sta $69
	lda ($39),Y
	cmp #$35
	bcc L_BRS_17C0_179B
	beq L_BRS_17B5_179D
	dex
	txa
	sta $6E
	ldx #$00
	clc
	sbc $69
	bcs L_BRS_17C9_17A8
	eor #$FF
	tax
	cpx $65
	bcc L_BRS_17C9_17AF
	ldx $65
	bcs L_BRS_17C9_17B3

L_BRS_17B5_179D:

	txa
	clc
	sbc $69
	eor #$FF
	bcc L_BRS_17C7_17BB
	tya
	bcs L_BRS_17C5_17BE

L_BRS_17C0_179B:

	tya
	cpx $69
	bcc L_BRS_17C7_17C3

L_BRS_17C5_17BE:

	ldx $69

L_BRS_17C7_17BB:
L_BRS_17C7_17C3:

	sta $6E

L_BRS_17C9_17A8:
L_BRS_17C9_17AF:
L_BRS_17C9_17B3:

	stx $61

L_JMP_17CB_1677:

	lda $61
	beq L_BRS_180C_17CD
	lda $33
	ldy $34
	sec
	sbc $61
	bcs L_BRS_17D9_17D6
	dey

L_BRS_17D9_17D6:

	cpy $32
	bne L_BRS_17DF_17DB
	cmp $31

L_BRS_17DF_17DB:

	bcs L_BRS_17E4_17DF
	jsr L_JSR_1F7A_17E1

L_BRS_17E4_17DF:

	sta $62
	sta $33
	sty $63
	sty $34
	ldy #$01
	lda ($50),Y
	clc
	adc $6E
	sta $22
	iny
	lda ($50),Y
	adc #$00
	sta $23
	ldy $61
	dey
	beq L_BRS_1808_17FF

L_BRS_1801_1806:

	lda ($22),Y
	sta ($62),Y
	dey
	bne L_BRS_1801_1806

L_BRS_1808_17FF:

	lda ($22),Y
	sta ($62),Y

L_JMP_180C_0A4D:
L_JMP_180C_1136:
L_JMP_180C_16B1:
L_BRS_180C_17CD:

	ldx $16
	cpx #$1F
	bcs L_BRS_182F_1810
	lda $61
	sta $00,X
	lda $62
	sta $01,X
	lda $63
	sta $02,X
	ldy #$FF
	sty $0D
	iny
	stx $64
	sty $65
	txa
	adc #$03
	sta $16
	jmp L_JMP_0ECB_182C

L_BRS_182F_1810:

	jmp $B4D0



	stx $3C
	jsr L_JSR_148E_1834
	jsr L_JSR_1F0C_1837
	lda $3C
	cmp #$4C
	bcc L_BRS_1850_183E
	stx $49
	bne L_BRS_1848_1842
	ldx #$00
	beq L_BRS_184B_1846

L_BRS_1848_1842:

	jsr L_JSR_1F0C_1848

L_BRS_184B_1846:

	jsr $B83C
	bne L_BRS_1853_184E

L_BRS_1850_183E:

	txa
	sta ($14),Y

L_BRS_1853_184E:

	jmp L_JMP_0EAC_1853
	lda $39
	adc #$00
	sta $7A
	lda $3A
	adc #$00
	sta $7B
	jsr L_JSR_148E_1862
	jsr $E130
	jmp L_JMP_0E85_1868
	stx $3C
	lda ($41),Y
	bpl L_BRS_1876_186F
	ldx #$2A
	jmp $A437                         // Error Routine

L_BRS_1876_186F:

	tax
	lda $41
	adc #$00
	sta $62
	sta $22
	lda $42
	adc #$00
	sta $63
	sta $23
	sec
	txa
	adc $41
	sta $41
	bcc L_BRS_1891_188D
	inc $42

L_BRS_1891_188D:

	stx $61
	lsr $3C
	bcs L_BRS_189A_1895
	jmp L_JMP_13B3_1897

L_BRS_189A_1895:

	txa
	jsr $B7B0

L_JMP_189E_1AD1:

	bit $0E
	bmi L_BRS_18A5_18A0
	jmp L_JMP_1330_18A2

L_BRS_18A5_18A0:

	jmp L_JMP_12CF_18A5

L_BRS_18A8_18DE:

	ldx $65
	bne L_BRS_18C9_18AA
	lda #$19
	sta $16
	ldx $61
	beq L_BRS_18D7_18B2
	lda $63
	cmp $34
	bne L_BRS_18C9_18B8
	lda $62
	cmp $33
	bne L_BRS_18C9_18BE
	clc
	adc $61
	sta $33
	bcc L_BRS_18C9_18C5
	inc $34

L_BRS_18C9_18AA:
L_BRS_18C9_18B8:
L_BRS_18C9_18BE:
L_BRS_18C9_18C5:

	cpy $61
	beq L_BRS_18D7_18CB

L_BRS_18CD_18D5:

	lda ($62),Y
	jsr $FFD2                         // Output Vector, chrout
	iny
	cpy $61
	bne L_BRS_18CD_18D5

L_BRS_18D7_18B2:
L_BRS_18D7_18CB:

	jmp L_JMP_1956_18D7


	
	lda $0E
	bmi L_BRS_193B_18DC
	bne L_BRS_18A8_18DE
	lda $61
	bne L_BRS_18E8_18E2
	sta $64
	beq L_BRS_1932_18E6

L_BRS_18E8_18E2:

	bit $70
	bpl L_BRS_18EF_18EA
	jsr $BC1B                         // Round FAC#1

L_BRS_18EF_18EA:

	lda $64
	ora $65
	bne L_BRS_192D_18F3
	lda $61
	bpl L_BRS_192D_18F7
	sec
	sbc #$90
	bpl L_BRS_192D_18FC
	cmp #$F9
	bcs L_BRS_1918_1900
	adc #$07
	tax
	lda $63
	bne L_BRS_192D_1907
	lda $62
	inx
	beq L_BRS_1914_190C

L_BRS_190E_1912:

	lsr
	bcs L_BRS_192D_190F
	inx
	bne L_BRS_190E_1912

L_BRS_1914_190C:

	stx $64
	beq L_BRS_1932_1916

L_BRS_1918_1900:

	tax
	lda $63
	sta $28
	lda $62

L_BRS_191F_1925:

	lsr
	ror $28
	bcs L_BRS_192D_1922
	inx
	bne L_BRS_191F_1925
	sta $64
	lda $28
	bcc L_BRS_1932_192B

L_BRS_192D_18F3:
L_BRS_192D_18F7:
L_BRS_192D_18FC:
L_BRS_192D_1907:
L_BRS_192D_190F:
L_BRS_192D_1922:

	jsr $BDDD                         // Convert FAC#1 to ASCII String
	bne L_BRS_193E_1930

L_BRS_1932_18E6:
L_BRS_1932_1916:
L_BRS_1932_192B:

	sta $65
	bit $66
	bpl L_BRS_193B_1936
	jsr L_JSR_0DC9_1938

L_BRS_193B_18DC:
L_BRS_193B_1936:

	jsr L_JSR_091D_193B

L_BRS_193E_1930:

	ldx #$00

L_BRS_1940_1949:

	lda $0100,X
	beq L_BRS_194B_1943
	jsr $FFD2                         // Output Vector, chrout
	inx
	bne L_BRS_1940_1949

L_BRS_194B_1943:

	lda #$1D
	ldx $13
	beq L_BRS_1953_194F
	lda #$20

L_BRS_1953_194F:

	jsr $FFD2                         // Output Vector, chrout

L_JMP_1956_18D7:

	ldy #$00
	lda ($39),Y
	cmp #$3D
	bcc L_BRS_1998_195C
	bne L_BRS_199D_195E
	lda $D3
	sec

L_BRS_1963_1965:

	sbc #$0A
	bcs L_BRS_1963_1965
	eor #$FF
	adc #$01
	bpl L_BRS_1984_196B
	stx $3C
	lda $0E
	bmi L_BRS_1976_1971
	jsr L_JSR_14D3_1973

L_BRS_1976_1971:

	lda $64
	bne L_BRS_19C4_1978
	lda $65
	lsr $3C
	bcc L_BRS_1984_197E
	sbc $D3
	bcc L_BRS_1998_1982

L_BRS_1984_196B:
L_BRS_1984_197E:

	tax
	beq L_BRS_1998_1985
	ldy #$1D
	lda $13
	beq L_BRS_198F_198B
	ldy #$20

L_BRS_198F_198B:
L_BRS_198F_1994:

	tya
	jsr $FFD2                         // Output Vector, chrout
	dex
	bne L_BRS_198F_1994
	ldy #$00

L_BRS_1998_195C:
L_BRS_1998_1982:
L_BRS_1998_1985:

	sty $3B
	jmp L_JMP_0ECB_199A

L_BRS_199D_195E:
L_BRS_199D_19D3:

	tax
	lda #$0D
	jsr $FFD2                         // Output Vector, chrout
	lda $13
	bpl L_BRS_19AC_19A5
	lda #$0A
	jsr $FFD2                         // Output Vector, chrout

L_BRS_19AC_19A5:

	cpx #$43
	bcc L_BRS_19B7_19AE
	jsr $FFCC                         // Restore I/O Vector
	lda #$00
	sta $13

L_BRS_19B7_19AE:

	jmp L_JMP_0EAC_19B7
	lda $0E
	beq L_BRS_19C7_19BC
	ldx $65
	lda $64
	beq L_BRS_19CA_19C2

L_BRS_19C4_1978:
L_BRS_19C4_19E3:

	jmp $B248                         // ?ILLEGAL QUANTITY

L_BRS_19C7_19BC:

	jsr L_JSR_14D3_19C7

L_BRS_19CA_19C2:

	stx $13
	jsr $FFC9                         // Set Output
	lda ($39),Y
	cmp #$44
	bcs L_BRS_199D_19D3
	sty $3B
	jmp L_JMP_0ECB_19D7
	lda $0E
	bmi L_BRS_19E1_19DC
	jsr L_JSR_14D3_19DE

L_BRS_19E1_19DC:

	lda $64
	bne L_BRS_19C4_19E3
	lda $65
	jsr $FFC3                         // Close Vector
	bcs L_BRS_19EF_19EA
	jmp L_JMP_0EAC_19EC

L_BRS_19EF_19EA:
L_JMP_19EF_1F71:

	cmp #$F0
	bne L_BRS_19FA_19F1
	sty $38
	stx $37
	jmp L_JMP_0C83_19F7

L_BRS_19FA_19F1:

	jmp $E104
	lda #$40
	bit $80A9
	ora $11
	bne L_BRS_1A0D_1A04
	lda #$BF
	bit $7FA9
	and $11

L_BRS_1A0D_1A04:

	sta $11
	jmp L_JMP_0EAC_1A0F
	lda $39
	sta $3D
	lda $3A
	sta $3E
	jmp L_JMP_0EAC_1A1A
	stx $3C
	lda $13
	beq L_BRS_1A4A_1A21

L_BRS_1A23_1A48:
L_BRS_1A23_1A6B:

	ldx #$00

L_BRS_1A25_1A32:

	jsr $FFCF                         // Input Vector, chrin
	cmp #$0D
	beq L_BRS_1A37_1A2A
	sta $0200,X
	inx
	cpx #$59
	bne L_BRS_1A25_1A32
	jmp $A571

L_BRS_1A37_1A2A:

	lda #$00
	sta $0200,X
	tay
	lda $90
	and #$03
	bne L_BRS_1A54_1A41
	lda $0200
	bne L_BRS_1A76_1A46
	beq L_BRS_1A23_1A48

L_BRS_1A4A_1A21:
L_BRS_1A4A_1A73:

	jsr $ABF9                         // Do Input Prompt
	ldy #$00
	lda $0200
	bne L_BRS_1A76_1A52

L_BRS_1A54_1A41:

	sty $43
	jsr $ABB7

L_BRS_1A59_1A6E:

	jmp L_JMP_0EAC_1A59
	stx $3C
	ldy $43
	lda $0200,Y
	beq L_BRS_1A69_1A63
	cmp #$3A
	bne L_BRS_1A75_1A67

L_BRS_1A69_1A63:

	lda $13
	bne L_BRS_1A23_1A6B
	tya
	beq L_BRS_1A59_1A6E
	jsr $AB45
	bne L_BRS_1A4A_1A73

L_BRS_1A75_1A67:
L_BRS_1A75_1A7B:

	iny

L_BRS_1A76_1A46:
L_BRS_1A76_1A52:

	lda $0200,Y
	cmp #$20
	beq L_BRS_1A75_1A7B
	sty $7A
	ldx #$02
	stx $7B
	bit $0D
	bmi L_BRS_1AE6_1A85
	jsr $0079
	jsr $BCF3                         // Convert ASCII String to a Number in FAC
	ldy $7A

L_JMP_1A8F_1B17:

	lda $0200,Y
	beq L_BRS_1AAA_1A92
	cmp #$3A
	beq L_BRS_1AAA_1A96
	cmp #$2C
	beq L_BRS_1AAA_1A9A
	jsr $AB62
	lda $3D
	ldy $3E
	sta $39
	sty $3A
	jmp L_JMP_0EAC_1AA7

L_BRS_1AAA_1A92:
L_BRS_1AAA_1A96:
L_BRS_1AAA_1A9A:

	sty $43
	ldx $3C
	cpx #$55
	bcs L_BRS_1ACD_1AB0
	ldx $13
	beq L_BRS_1ABD_1AB4
	jsr $FFCC                         // Restore I/O Vector
	lda #$00
	sta $13

L_BRS_1ABD_1AB4:

	tax
	beq L_BRS_1ACD_1ABE
	ldy #$00

L_BRS_1AC2_1ACB:

	lda $ACFC,Y                          // Input Error Messages
	beq L_BRS_1ACD_1AC5
	jsr $FFD2                         // Output Vector, chrout
	iny
	bne L_BRS_1AC2_1ACB

L_BRS_1ACD_1AB0:
L_BRS_1ACD_1ABE:
L_BRS_1ACD_1AC5:

	bit $0D
	bmi L_BRS_1AD4_1ACF
	jmp L_JMP_189E_1AD1

L_BRS_1AD4_1ACF:

	ldy $61
	beq L_BRS_1AE3_1AD6
	lda #$00
	sta $65
	lda #$69
	sta $64
	jmp L_JMP_137B_1AE0

L_BRS_1AE3_1AD6:

	jmp L_JMP_13B3_1AE3

L_BRS_1AE6_1A85:

	stx $6B
	sty $6A
	tax
	beq L_BRS_1B11_1AEB
	cmp #$22
	bne L_BRS_1B09_1AEF
	inc $6A
	inc $7A

L_BRS_1AF5_1AFD:

	iny
	lda $0200,Y
	beq L_BRS_1B11_1AF9
	cmp #$22
	bne L_BRS_1AF5_1AFD
	tya
	iny
	bne L_BRS_1B12_1B01

L_BRS_1B03_1B0F:

	iny
	lda $0200,Y
	beq L_BRS_1B11_1B07

L_BRS_1B09_1AEF:

	cmp #$3A
	beq L_BRS_1B11_1B0B
	cmp #$2C
	bne L_BRS_1B03_1B0F

L_BRS_1B11_1AEB:
L_BRS_1B11_1AF9:
L_BRS_1B11_1B07:
L_BRS_1B11_1B0B:

	tya

L_BRS_1B12_1B01:

	sec
	sbc $6A
	sta $61
	jmp L_JMP_1A8F_1B17
	stx $3C
	txa
	adc #$92
	sta $3D
	ldx #$05
	stx $55

L_BRS_1B25_1B4E:

	ldy #$EF
	lda $0201
	sta ($3C),Y
	lda #$40
	ldy #$FB
	sta ($3C),Y
	ldx $0202

L_BRS_1B35_1B4A:

	lda #$01
	jsr L_JSR_1B5A_1B37
	asl
	bne L_BRS_1B4C_1B3B
	bcc L_BRS_1B4C_1B3D
	rol
	jsr L_JSR_1B5A_1B40
	bmi L_BRS_1B4C_1B43
	dex
	beq L_BRS_1B53_1B46
	cmp #$00
	beq L_BRS_1B35_1B4A

L_BRS_1B4C_1B3B:
L_BRS_1B4C_1B3D:
L_BRS_1B4C_1B43:
L_BRS_1B4C_1B55:

	dec $55
	bne L_BRS_1B25_1B4E
	jmp L_JMP_0E9D_1B50

L_BRS_1B53_1B46:

	cmp $65
	bne L_BRS_1B4C_1B55
	jmp L_JMP_0EC9_1B57

L_JSR_1B5A_1B37:
L_JSR_1B5A_1B40:

	sta ($3C),Y
	lsr
	sta ($3C),Y
	lda ($3C),Y
	rts
	lda $0E
	and #$80
	sta $0C
	jsr L_JSR_13C8_1B68
	jsr L_JSR_1437_1B6B
	jsr $BC0F
	jmp L_JMP_1B91_1B71
	lda #$01
	ldx $0E
	bmi L_BRS_1B87_1B78
	lda #$81
	sta $69
	lda #$80
	sta $6A
	asl
	sta $6E
	sta $6B

L_BRS_1B87_1B78:

	sta $6D
	lsr
	sta $6C
	txa
	and #$80
	sta $0C

L_JMP_1B91_1B71:

	jsr L_JSR_13C8_1B91
	jsr L_JSR_1437_1B94
	tsx

L_BRS_1B98_1BB9:

	lda $0101,X
	asl
	bne L_BRS_1BBC_1B9C
	ldy #$09
	bcs L_BRS_1BA4_1BA0
	ldy #$10

L_BRS_1BA4_1BA0:

	sty $0B
	lda $4A
	cmp $0103,X
	bne L_BRS_1BB2_1BAB
	lda $49
	cmp $0102,X

L_BRS_1BB2_1BAB:

	php
	txa
	clc
	adc $0B
	tax
	plp
	bne L_BRS_1B98_1BB9
	txs

L_BRS_1BBC_1B9C:

	tsx
	cpx #$40
	bcs L_BRS_1BC4_1BBF
	jmp $A435                         // Output ?OUT OF MEMORY Error

L_BRS_1BC4_1BBF:

	lda $0C
	beq L_BRS_1BD7_1BC6
	lda $65
	pha
	lda $64
	pha
	lda $6D
	pha
	lda $6C
	pha
	jmp L_JMP_1BF3_1BD4

L_BRS_1BD7_1BC6:

	lda $66
	ora #$7F
	and $62
	sta $62
	lda #$EA
	ldy #$1B
	sta $22
	sty $23
	jmp $AE43
	jsr $BBFC                         // Copy FAC#2 into FAC#1
	jsr $BC2B                         // Check Sign of FAC#1
	jsr $AE38

L_JMP_1BF3_1BD4:

	lda $3A
	pha
	lda $39
	pha
	lda $4A
	pha
	lda $49
	pha
	lda $0C
	pha
	jmp L_JMP_0EAC_1C02

L_BRS_1C05_1C20:

	adc #$08
	tax
	bne L_BRS_1C0B_1C08
	tsx

L_BRS_1C0B_1C08:
L_BRS_1C0B_1C25:

	lda $4A
	cmp $0103,X
	bne L_BRS_1C19_1C10
	lda $49
	cmp $0102,X
	beq L_BRS_1C35_1C17

L_BRS_1C19_1C10:

	lda $0101,X
	asl
	bne L_BRS_1C27_1C1D
	txa
	bcs L_BRS_1C05_1C20
	adc #$10
	tax
	bne L_BRS_1C0B_1C25

L_BRS_1C27_1C1D:
L_BRS_1C27_1C39:

	jmp $AD30
	tsx
	lda $0103,X
	sta $4A
	lda $0102,X
	sta $49

L_BRS_1C35_1C17:

	lda $0101,X
	asl
	bne L_BRS_1C27_1C39
	txs
	iny
	bcs L_BRS_1C65_1C3D
	txa
	adc #$06
	pha
	adc #$06
	sta $24
	pla
	jsr $BBA2                         // Load FAC#1 From Memory
	tsx
	lda $010B,X
	sta $66
	sta $0C
	lda $49
	ldy $4A
	jsr $B867                         // Perform Addition
	jsr $BBD0
	ldy #$01
	jsr $BC5D
	jmp L_JMP_1CA8_1C62

L_BRS_1C65_1C3D:

	lda $0107,X
	clc
	adc ($49),Y
	sta ($49),Y
	sta $65
	sty $0C
	dey
	lda $0106,X
	bpl L_BRS_1C79_1C75
	sty $0C

L_BRS_1C79_1C75:

	adc ($49),Y
	sta ($49),Y
	sta $64
	lda $0109,X
	tay
	lda $0108,X
	cmp $64
	bne L_BRS_1C8E_1C88
	cpy $65
	beq L_BRS_1CAE_1C8C

L_BRS_1C8E_1C88:

	ldy #$00
	eor $64
	bmi L_BRS_1CBB_1C92
	bcs L_BRS_1C98_1C94

L_BRS_1C96_1CBB:

	ldy #$01

L_BRS_1C98_1C94:
L_BRS_1C98_1CBD:

	cpy $0C
	bne L_BRS_1CAE_1C9A
	txa
	adc #$08
	tax
	txs
	ldy #$00
	sty $3B
	jmp L_JMP_0ECB_1CA5

L_JMP_1CA8_1C62:

	sec
	tsx
	sbc $0C
	beq L_BRS_1CBF_1CAC

L_BRS_1CAE_1C8C:
L_BRS_1CAE_1C9A:

	lda $0105,X
	sta $3A
	lda $0104,X
	sta $39
	jmp L_JMP_0EAC_1CB8

L_BRS_1CBB_1C92:

	bcs L_BRS_1C96_1CBB
	bcc L_BRS_1C98_1CBD

L_BRS_1CBF_1CAC:

	txa
	clc
	adc #$10
	tax
	txs
	ldy #$00
	sty $3B
	jmp L_JMP_0ECB_1CC9
	sty $3B
	lda $0E
	bpl L_BRS_1CDD_1CD0
	lda $64
	ora $65
	bne L_BRS_1D1C_1CD6

L_BRS_1CD8_1CE1:

	lda #$02
	jmp L_JMP_0EBF_1CDA

L_BRS_1CDD_1CD0:

	lda $61
	bne L_BRS_1D1C_1CDF
	beq L_BRS_1CD8_1CE1
	sty $3B
	iny
	stx $3C
	lda $0E
	beq L_BRS_1CF3_1CEA
	lda $64
	beq L_BRS_1CF6_1CEE
	jmp $B248                         // ?ILLEGAL QUANTITY

L_BRS_1CF3_1CEA:

	jsr L_JSR_14D3_1CF3

L_BRS_1CF6_1CEE:

	lda ($39),Y
	tax
	lda $65
	beq L_BRS_1D02_1CFB
	asl
	cmp ($39),Y
	bcc L_BRS_1D06_1D00

L_BRS_1D02_1CFB:

	txa
	jmp L_JMP_0EBC_1D03

L_BRS_1D06_1D00:

	tay
	lsr $3C
	bcs L_BRS_1D1D_1D09
	dey
	txa
	bne L_BRS_1D11_1D0D
	lda #$02

L_BRS_1D11_1D0D:

	adc $39
	pha
	lda $3A
	adc #$00
	pha
	lda #$8D
	pha

L_BRS_1D1C_1CD6:
L_BRS_1D1C_1CDF:

	iny

L_BRS_1D1D_1D09:

	lda ($39),Y
	tax
	iny
	lda ($39),Y

L_JMP_1D23_0C9D:

	sta $39	// A1
	stx $3A	// 1F
	ldy #$00
	jmp L_JMP_0ECF_1D29

L_BRS_1D2C_1D3A:

	adc #$0F

L_BRS_1D2E_1D3E:

	tax
	txs

L_BRS_1D30_1D66:
L_BRS_1D30_1D6D:

	pla
	cmp #$8D
	beq L_BRS_1D53_1D33
	asl
	bne L_BRS_1D40_1D36
	tsx
	txa
	bcc L_BRS_1D2C_1D3A
	adc #$07
	bne L_BRS_1D2E_1D3E

L_BRS_1D40_1D36:

	jmp $A8E0
	pla
	sta $49
	pla
	sta $4A

L_BRS_1D49_1D4F:

	pla
	sta ($49),Y
	iny
	cpy #$05
	bne L_BRS_1D49_1D4F
	ldy #$00

L_BRS_1D53_1D33:

	pla
	sta $3A
	pla
	sta $39
	jmp L_JMP_0ECF_1D59
	sty $3B
	lda $0E
	bpl L_BRS_1D6B_1D60
	lda $64
	ora $65
	bne L_BRS_1D30_1D66
	jmp L_JMP_0ECB_1D68

L_BRS_1D6B_1D60:

	lda $61
	bne L_BRS_1D30_1D6D
	jmp L_JMP_0ECB_1D6F
	sty $3B
	lda $0E
	bpl L_BRS_1D83_1D76
	lda $64
	ora $65
	beq L_BRS_1D87_1D7C

L_BRS_1D7E_1D85:

	lda #$01
	jmp L_JMP_0EBF_1D80

L_BRS_1D83_1D76:

	lda $61
	bne L_BRS_1D7E_1D85

L_BRS_1D87_1D7C:

	iny

L_BRS_1D88_1DC0:

	lda ($39),Y
	jmp L_JMP_0EBC_1D8A
	iny
	lda ($39),Y
	clc
	adc $2D
	sta $64
	iny
	lda ($39),Y
	adc $2E
	sta $65
	iny
	lda ($39),Y
	adc $2D
	sta $6C
	iny
	lda ($39),Y
	adc $2E
	sta $6D
	lda #$05
	adc $39
	sta $6A
	lda $3A
	adc #$00
	sta $6B

L_BRS_1DB6_1DBC:

	lda $006A,Y
	sta ($64),Y
	dey
	bpl L_BRS_1DB6_1DBC
	ldy #$05
	bne L_BRS_1D88_1DC0
	ldy #$02
	lda ($39),Y
	clc
	adc $2D
	sta $47
	dey
	lda ($39),Y
	adc $2E
	sta $48
	lda $39
	adc #$03
	pha
	lda $3A
	adc #$00
	pha
	lda ($47),Y
	bne L_BRS_1DE3_1DDE
	jmp $B3AE                         // ?UNDEFD FUNCTION

L_BRS_1DE3_1DDE:

	sta $3A
	dey
	lda ($47),Y
	sta $39
	ldy #$02
	lda ($47),Y
	sta $49
	iny
	lda ($47),Y
	sta $4A
	iny

L_BRS_1DF6_1DFA:

	lda ($49),Y
	pha
	dey
	bpl L_BRS_1DF6_1DFA
	lda $4A
	pha
	lda $49
	pha
	lda $0E
	jmp L_JMP_132B_1E04
	iny
	lda ($39),Y
	sty $0C
	sta $0B
	iny
	lda ($39),Y
	sta $45
	iny
	lda ($39),Y
	sta $46
	lda $31
	sta $5F
	sbc $2F
	sta $69
	lda $32
	sta $60
	sbc $30
	tax
	ora $69
	beq L_BRS_1E4C_1E29
	ldy #$05
	clc
	lda ($39),Y
	adc $2F
	sta $6B
	dey
	lda ($39),Y
	adc $30
	sta $6C
	ldy #$01
	lda ($6B),Y
	dey
	ora ($6B),Y
	bne L_BRS_1E9C_1E42
	lda $69
	sta ($6B),Y
	iny
	txa
	sta ($6B),Y

L_BRS_1E4C_1E29:

	jsr $B194                         // Allocate Array Pointer Space
	jsr $A408                         // Check Memory Overlap
	ldy #$00
	sty $3B
	sty $72
	ldx #$05
	lda $45
	sta ($5F),Y
	bpl L_BRS_1E61_1E5E
	dex

L_BRS_1E61_1E5E:

	iny
	lda $46
	sta ($5F),Y
	bpl L_BRS_1E6A_1E66
	dex
	dex

L_BRS_1E6A_1E66:

	stx $71
	lda $0B
	ldy #$04
	sta ($5F),Y
	bne L_BRS_1E77_1E72

L_BRS_1E74_1E92:

	jsr L_JSR_13C8_1E74

L_BRS_1E77_1E72:

	jsr L_JSR_148E_1E77
	iny
	inx
	bne L_BRS_1E81_1E7C
	clc
	adc #$01

L_BRS_1E81_1E7C:

	sta ($5F),Y
	iny
	txa
	sta ($5F),Y
	jsr $B34C                         // Number of Bytes in Subscript
	ldy $22
	stx $71
	sta $72
	dec $0B
	bne L_BRS_1E74_1E92
	jsr $B2AA
	lda #$06
	jmp L_JMP_0EBC_1E99

L_BRS_1E9C_1E42:

	jmp $B24D                         // ?REDIMD ARRAY


	iny	// #### ?

jmp_1ea0:
	
	sty $0A			// Load/Verify-Flag
	jsr L_JSR_1EDF_1EA2
	lsr $0C			// Flag: Default Array dimension
	tax
	beq L_BRS_1EBF_1EA8
	jsr $E25A
	dec $0B			// Input Buffer Pointer/Number of Subscripts
	beq L_BRS_1EBF_1EAF
	jsr L_JSR_1F02_1EB1

jmp_1eb4:
	
	stx $BA			// Current File - First Address (Device number)
	dec $0B
	beq L_BRS_1EBF_1EB8
	jsr L_JSR_1F02_1EBA
	stx $B9			// Current File - Secondary Address

L_BRS_1EBF_1EA8:
L_BRS_1EBF_1EAF:
L_BRS_1EBF_1EB8:

	jsr L_JSR_1EC5_1EBF
	jmp L_JMP_0EAC_1EC2

L_JSR_1EC5_1EBF:

	lda $3C
	cmp #$5E
	bcc L_BRS_1ED0_1EC9
	bne L_BRS_1EDC_1ECB
	jmp $E159

L_BRS_1ED0_1EC9:

	lda $B9
	bne L_BRS_1ED6_1ED2
	inc $B9

L_BRS_1ED6_1ED2:

	lda #$A7
	pha
	lda #$AD
	pha

L_BRS_1EDC_1ECB:

	jmp $E16F		// LOAD

L_JSR_1EDF_1EA2:
L_JSR_1EDF_1F3D:

	stx $3C
	ldy #$01
	ldx #$00
	stx $B7
	stx $17
	stx $B9
	stx $90
	sty $0C
	sty $BA
	sty $7B
	lda #$19
	sta $16
	lda ($39),Y
	sta $0B
	inc $39
	bne L_BRS_1F01_1EFD
	inc $3A

L_BRS_1F01_1EFD:

	rts

L_JSR_1F02_1EB1:
L_JSR_1F02_1EBA:
L_JSR_1F02_1F40:
L_JSR_1F02_1F49:
L_JSR_1F02_1F58:

	lsr $0C
	bcc L_BRS_1F0C_1F04
	jmp L_JMP_14C8_1F06

L_BRS_1F09_1F1B:
L_BRS_1F09_1F25:
L_BRS_1F09_1F2B:

	jmp $B248                         // ?ILLEGAL QUANTITY

L_JSR_1F0C_1837:
L_JSR_1F0C_1848:
L_BRS_1F0C_1F04:

	pla
	clc
	adc #$01
	sta $45
	pla
	adc #$00
	sta $46
	pla
	bpl L_BRS_1F24_1F18
	pla
	bne L_BRS_1F09_1F1B
	pla

L_BRS_1F1E_1F35:
L_BRS_1F1E_1F3B:

	sta $65
	tax
.break
	jmp ($0045)

L_BRS_1F24_1F18:

	pla
	bmi L_BRS_1F09_1F25
	pla
	sec
	sbc #$89
	bpl L_BRS_1F09_1F2B
	tay
	pla
	tax
	pla
	pla
	pla
	txa
	iny
	beq L_BRS_1F1E_1F35

L_BRS_1F37_1F39:

	lsr
	iny
	bne L_BRS_1F37_1F39
	beq L_BRS_1F1E_1F3B
	jsr L_JSR_1EDF_1F3D
	jsr L_JSR_1F02_1F40
	stx $B8
	dec $0B
	beq L_BRS_1F69_1F47
	jsr L_JSR_1F02_1F49
	stx $BA
	cpx #$03
	bcc L_BRS_1F54_1F50
	dec $B9

L_BRS_1F54_1F50:

	dec $0B
	beq L_BRS_1F69_1F56
	jsr L_JSR_1F02_1F58
	stx $B9
	dec $0B
	beq L_BRS_1F69_1F5F
	jsr L_JSR_13C8_1F61
	dec $0D
	jsr $E25A

L_BRS_1F69_1F47:
L_BRS_1F69_1F56:
L_BRS_1F69_1F5F:

	jsr $FFC0                         // Open Vector
	bcs L_BRS_1F71_1F6C
	jmp L_JMP_0EAC_1F6E

L_BRS_1F71_1F6C:

	jmp L_JMP_19EF_1F71
	nop
	nop
	nop
	jmp $AF08                         // Output ?SYNTAX Error

L_JSR_1F7A_09F9:
L_JSR_1F7A_138D:
L_JSR_1F7A_16A0:
L_JSR_1F7A_172D:
L_JSR_1F7A_17E1:

	jsr $B526                         // Garbage Collection
	lda $33
	ldy $34
	sec
	sbc $61
	bcs L_BRS_1F87_1F84
	dey

L_BRS_1F87_1F84:

	cpy $32
	bne L_BRS_1F8D_1F89
	cmp $31

L_BRS_1F8D_1F89:

	bcc L_BRS_1F90_1F8D
	rts

L_BRS_1F90_1F8D:

	jmp $A435                         // Output ?OUT OF MEMORY Error
//1F93
	.byte $A9,$1F
	.byte $A9,$1F
	.byte $A9,$1F
	.byte $9F,$1F
//1F9B
	.byte $A0,$1F
//	.byte $00,$08
	.byte $A1,$1F
	.byte $16
//1FA0
	.byte $FF
	// 
	.byte $15,$B8,$EA,$54,$43,$5D,$02,$4F
	.byte $00,$00,$00

// C64Debugger.exe\" -prg ${fileDirname}\\bin\\${fileBasenameNoExtension}.prg -d64 ${fileDirname}\\bin\\dinoeggs.d64"
// -d64 "C:\Users\Mike\Desktop\TCastle\d64\tcastlea.d64"