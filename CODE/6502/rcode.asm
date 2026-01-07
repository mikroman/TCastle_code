	jmp L_JMP_7060_7000
	jmp L_JMP_70A1_7003
	jmp L_JMP_722F_7006
	jmp L_JMP_7248_7009
	jmp L_JMP_7257_700C
	jmp L_JMP_728A_700F
	jmp L_JMP_72A8_7012
	jmp L_JMP_7382_7015
	jmp L_JMP_74EC_7018
	jmp L_JMP_7580_701B
	jmp L_JMP_75A5_701E
	jmp L_JMP_75D0_7021
	jmp L_JMP_7898_7024
	jmp L_JMP_7C8A_7027
	jmp L_JMP_7CA1_702A
	jmp L_JMP_79D5_702D
	jmp L_JMP_7CB8_7030
	jmp L_JMP_7C6F_7033
	jmp L_JMP_7E33_7036
	jmp L_JMP_7904_7039
	.byte $C0,$CA,$76,$7F,$37,$78,$4D,$70
	.byte $2C,$75,$00,$31,$3A,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$52,$4F,$55,$4C,$45,$54,$54
	.byte $45,$44,$41,$54

L_JMP_7060_7000:
L_BRS_7060_7063:

	lda $D011 
	bpl L_BRS_7060_7063
	sei 
	lda #$7F
	sta $DC0D 
	jsr L_JSR_70CA_706B
	lda $D01A 
	ora #$01
	sta $D01A 
	ldx #$00
	stx $7049 
	lda $D011 
	and #$7F
	sta $D011 
	lda $7046,X 
	sta $D012 
	lda $0315 
	sta $704B 
	lda $0314 
	sta $704A 
	lda #$70
	sta $0315 
	lda #$EE
	sta $0314 
	cli 
	rts 

L_JMP_70A1_7003:
L_BRS_70A1_70A4:

	lda $D011 
	bpl L_BRS_70A1_70A4
	sei 
	lda $D01A 
	and #$FE
	sta $D01A 
	lda $D016 
	and #$EF
	sta $D016 
	lda #$81
	sta $DC0D 
	lda $704B 
	sta $0315 
	lda $704A 
	sta $0314 
	cli 
	rts 

L_JSR_70CA_706B:

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
	jsr L_JSR_7257_70E4
	lda $01 
	ora #$04
	sta $01 
	rts 

	ldy $7049 
	beq L_BRS_7109_70F1
	cpy #$02
	bcc L_BRS_7101_70F5
	lda $D016 
	ora #$10
	sta $D016 
	bcs L_BRS_7109_70FF

L_BRS_7101_70F5:

	lda $D016 
	and #$EF
	sta $D016 

L_BRS_7109_70F1:
L_BRS_7109_70FF:

	iny 
	cpy #$03
	bcc L_BRS_7110_710C
	ldy #$00

L_BRS_7110_710C:

	sty $7049 
	lda $7046,Y 
	sta $D012 
	lda $D011 
	and #$7F
	sta $D011 
	lda $D019 
	ora #$01
	sta $D019 
	cpy #$01
	bne L_BRS_7130_712B
	jmp ($704A) 

L_BRS_7130_712B:
L_JMP_7130_7212:

	pla 
	tay 
	pla 
	tax 
	pla 
	rti 

	lda $DC00 
	and #$1F
	sta $704C 
	lda $704C 
	and #$01
	bne L_BRS_7154_7143
	dec $D001 
	lda $D001 
	cmp #$3A
	bcs L_BRS_7154_714D
	ldx #$3A
	stx $D001 

L_BRS_7154_7143:
L_BRS_7154_714D:

	lda $704C 
	and #$02
	bne L_BRS_716A_7159
	inc $D001 
	lda $D001 
	cmp #$EE
	bcc L_BRS_716A_7163
	ldx #$ED
	stx $D001 

L_BRS_716A_7159:
L_BRS_716A_7163:

	lda $704C 
	and #$04
	bne L_BRS_7191_716F
	ldy $D000 
	lda $D010 
	and #$01
	beq L_BRS_718A_7179
	cpy #$00
	bne L_BRS_718E_717D
	lda $D010 
	and #$FE
	sta $D010 
	clv
	bvc L_BRS_718E_7188

L_BRS_718A_7179:

	cpy #$19
	bcc L_BRS_7191_718C

L_BRS_718E_717D:
L_BRS_718E_7188:

	dec $D000 

L_BRS_7191_716F:
L_BRS_7191_718C:

	lda $704C 
	and #$08
	bne L_BRS_71B8_7196
	ldy $D000 
	lda $D010 
	and #$01
	bne L_BRS_71B1_71A0
	cpy #$FF
	bne L_BRS_71B5_71A4
	lda $D010 
	ora #$01
	sta $D010 
	clv
	bvc L_BRS_71B5_71AF

L_BRS_71B1_71A0:

	cpy #$4B
	bcs L_BRS_71B8_71B3

L_BRS_71B5_71A4:
L_BRS_71B5_71AF:

	inc $D000 

L_BRS_71B8_7196:
L_BRS_71B8_71B3:

	lda $704C 
	and #$10
	bne L_BRS_7215_71BD
	lda $704D 
	bne L_BRS_7215_71C2
	lda $D01E 
	and #$7F
	lsr 
	beq L_BRS_7209_71CA
	bcc L_BRS_7209_71CC
	ldx #$00

L_BRS_71D0_71D2:

	inx 
	lsr 
	bcc L_BRS_71D0_71D2
	lda $CFF8,X 
	cmp #$FF
	beq L_BRS_7209_71D9
	lda $704E 
	bne L_BRS_71FE_71DE
	lda $D015 
	and #$81
	sta $D015 
	lda #$07
	sta $D028 
	lda #$FE
	sta $D01C 
	lda $CFF8,X 
	sta $CFF9 
	jsr L_JSR_72C8_71F8
	inc $704E 

L_BRS_71FE_71DE:

	jsr L_JSR_7C6F_71FE
	lda $D015 
	ora #$02
	sta $D015 

L_BRS_7209_71CA:
L_BRS_7209_71CC:
L_BRS_7209_71D9:
L_JMP_7209_722C:

	lda $01 
	and #$02
	beq L_BRS_7212_720D
	jmp ($704F) 

L_BRS_7212_720D:

	jmp L_JMP_7130_7212

L_BRS_7215_71BD:
L_BRS_7215_71C2:

	lda $704E 
	beq L_BRS_7229_7218
	ldy #$00
	sty $704E 
	iny 
	sty $704D 
	jsr L_JSR_7382_7223
	jsr L_JSR_72C8_7226

L_BRS_7229_7218:

	lda $D01E 
	jmp L_JMP_7209_722C

L_JMP_722F_7006:

	sei 
	lda $0315 
	sta $7050 
	lda $0314 
	sta $704F 
	lda #$71
	sta $0315 
	lda #$36
	sta $0314 
	cli 
	rts 

L_JMP_7248_7009:

	sei 
	lda $7050 
	sta $0315 
	lda $704F 
	sta $0314 
	cli 
	rts 

L_JMP_7257_700C:
L_JSR_7257_70E4:
L_JSR_7257_771C:
L_JSR_7257_7733:
L_JSR_7257_7750:
L_JSR_7257_7767:
L_JSR_7257_777E:
L_JMP_7257_7C9E:
L_JMP_7257_7CB5:
L_JSR_7257_7D92:
L_JSR_7257_7DEE:
L_JSR_7257_7EF2:
L_JSR_7257_7F0F:
L_JSR_7257_7F29:
L_JMP_7257_7F4D:

	sta $7265 
	stx $7286 
	cmp #$00
	beq L_BRS_727C_725F
	clc 
	lda $FC 
	adc #$00
	sta $7279 
	ldy #$00

L_BRS_726B_7270:
L_BRS_726B_727A:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	bne L_BRS_726B_7270
	inc $FC 
	inc $FE 
	lda $FC 
	cmp #$00
	bcc L_BRS_726B_727A

L_BRS_727C_725F:

	cpx #$00
	beq L_BRS_7289_727E

L_BRS_7280_7287:

	lda ($FB),Y 
	sta ($FD),Y 
	iny 
	cpy #$40
	bcc L_BRS_7280_7287

L_BRS_7289_727E:

	rts 

L_JMP_728A_700F:
L_JMP_728A_7784:

	lda $D016 
	ora #$10
	sta $D016 
	lda #$38
	sta $D018 
	lda $DD00 
	and #$FC
	sta $DD00 
	lda $D011 
	ora #$20
	sta $D011 
	rts 

L_JMP_72A8_7012:

	lda $D016 
	and #$EF
	sta $D016 
	lda #$15
	sta $D018 
	lda $DD00 
	and #$FC
	ora #$03
	sta $DD00 
	lda $D011 
	and #$DF
	sta $D011 
	rts 

L_JSR_72C8_71F8:
L_JSR_72C8_7226:

	lda #$21
	sta $D401 
	sta $D408 
	lda #$F0
	sta $D400 
	sta $D407 
	lda #$68
	sta $D416 
	lda #$03
	sta $D417 
	lda #$08
	sta $D405 
	sta $D40C 
	lda #$00
	sta $D406 
	sta $D40D 
	lda #$CF
	sta $D418 
	lda #$80
	sta $D404 
	sta $D40B 
	lda #$81
	sta $D404 
	sta $D40B 
	rts 

L_JMP_7308_7E30:

	lda #$10
	sta $D401 
	sta $D408 
	lda #$F0
	sta $D400 
	sta $D407 
	lda #$17
	sta $D405 
	sta $D40C 
	lda #$47
	sta $D406 
	sta $D40D 
	lda #$0B
	sta $D403 
	sta $D40A 
	lda #$BB
	sta $D402 
	sta $D409 
	lda #$8F
	sta $D418 
	lda #$41
	eor $734C 
	sta $D404 
	sta $D40B 
	sta $734C 
	rts 

	.byte $00

L_JSR_734D_75F1:
L_JSR_734D_7D4B:
L_JSR_734D_7DA5:

	ldy #$18
	lda #$00

L_BRS_7351_7355:

	sta $D400,Y 
	dey 
	bpl L_BRS_7351_7355
	rts 

	.byte $0B,$14,$1A,$1F,$23,$28,$2C,$31
	.byte $35,$3B,$40,$45,$49,$4E,$52,$57
	.byte $5B,$61,$66,$6B,$6F,$74,$78,$7D
	.byte $81,$87,$89,$95,$FF,$32,$39,$52
	.byte $59,$62,$69,$72,$79,$92,$99,$A9
	.byte $B9,$FF

L_JMP_7382_7015:
L_JSR_7382_7223:

	lda $D010 
	lsr 
	lda $D000 
	ror 
	sec 
	sbc #$08
	ldx #$00

L_BRS_738F_7395:

	cmp $7358,X 
	bcc L_BRS_7397_7392
	inx 
	bne L_BRS_738F_7395

L_BRS_7397_7392:

	stx $A3 
	lda $D001 
	sec 
	sbc #$2D
	ldy #$00

L_BRS_73A1_73A7:

	cmp $7375,Y 
	bcc L_BRS_73A9_73A4
	iny 
	bne L_BRS_73A1_73A7

L_BRS_73A9_73A4:

	sty $A4 
	rts 

L_JSR_73AC_74BB:
L_JSR_73AC_74E0:

	ldx $A3 
	ldy $A4 

L_JSR_73B0_79D9:

	lda #$E0
	sta $04 
	lda #$00
	sta $03 
	tya 
	pha 
	and #$F8
	sta $73C3 
	ldy #$27

L_BRS_73C1_73C9:

	clc 
	adc #$00
	bcc L_BRS_73C8_73C4
	inc $04 

L_BRS_73C8_73C4:

	dey 
	bne L_BRS_73C1_73C9
	sta $03 
	pla 
	and #$07
	clc 
	adc $03 
	sta $03 
	bcc L_BRS_73D9_73D5
	inc $04 

L_BRS_73D9_73D5:

	txa 
	asl 
	bcc L_BRS_73DF_73DB
	inc $04 

L_BRS_73DF_73DB:

	clc 
	and #$F8
	adc $03 
	sta $03 
	bcc L_BRS_73EA_73E6
	inc $04 

L_BRS_73EA_73E6:

	rts 

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
	beq L_BRS_740C_73FB
	tay 

L_BRS_73FE_740A:

	lda #$28
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_7409_7405
	inc $06 

L_BRS_7409_7405:

	dey 
	bne L_BRS_73FE_740A

L_BRS_740C_73FB:

	txa 
	lsr 
	lsr 
	clc 
	adc $05 
	sta $05 
	bcc L_BRS_7418_7414
	inc $06 

L_BRS_7418_7414:

	rts 

L_JSR_7419_747E:
L_JSR_7419_78E0:

	sty $7420 
	lda $FB 
	clc 
	adc #$54
	sta $FD 

L_BRS_7423_7442:

	ldy #$01
	lda ($FB),Y 
	ror 
	ldx #$01
	ldy #$00

L_BRS_742C_7433:

	lda ($FB),Y 
	ror 
	sta ($FB),Y 
	iny 
	dex 
	bpl L_BRS_742C_7433
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_7440_743C
	inc $FC 

L_BRS_7440_743C:

	cmp $FD 
	bne L_BRS_7423_7442
	rts 

L_JSR_7445_7497:
L_JSR_7445_78FB:

	sty $744C 
	lda $FB 
	clc 
	adc #$54
	sta $FD 

L_BRS_744F_746B:

	ldy #$00
	lda ($FB),Y 
	rol 
	ldy #$01

L_BRS_7456_745C:

	lda ($FB),Y 
	rol 
	sta ($FB),Y 
	dey 
	bpl L_BRS_7456_745C
	lda $FB 
	clc 
	adc #$02
	sta $FB 
	bcc L_BRS_7469_7465
	inc $FC 

L_BRS_7469_7465:

	cmp $FD 
	bne L_BRS_744F_746B
	rts 

L_JSR_746E_74EF:

	ldx $FF 
	beq L_BRS_7486_7470

L_BRS_7472_7484:

	txa 
	pha 
	ldy #$54
	lda #$CA
	sta $FC 
	lda #$6C
	sta $FB 
	jsr L_JSR_7419_747E
	pla 
	tax 
	dex 
	bne L_BRS_7472_7484

L_BRS_7486_7470:

	rts 

L_JSR_7487_7508:

	ldx $FF 
	beq L_BRS_749F_7489

L_BRS_748B_749D:

	txa 
	pha 
	ldy #$54
	lda #$CA
	sta $FC 
	lda #$6C
	sta $FB 
	jsr L_JSR_7445_7497
	pla 
	tax 
	dex 
	bne L_BRS_748B_749D

L_BRS_749F_7489:

	rts 

L_JSR_74A0_7505:
L_JMP_74A0_75CD:
L_JSR_74A0_7892:

	sty $74D9 
	lda $7052 
	sta $74C9 
	lda $7051 
	sta $74C8 
	lda $7054 
	sta $74CC 
	lda $7053 
	sta $74CB 
	jsr L_JSR_73AC_74BB
	ldx #$00

L_BRS_74C0_74E9:

	ldy #$00

L_BRS_74C2_74DA:

	jsr L_JSR_7547_74C2
	lda ($03),Y 
	and $CAB2,X 
	ora $CA6C,X
	sta ($03),Y 
	jsr L_JSR_755B_74CF
	tya 
	clc 
	adc #$08
	tay 
	inx 
	cpy #$11
	bcc L_BRS_74C2_74DA
	txa 
	pha 
	inc $A4 
	jsr L_JSR_73AC_74E0
	pla 
	tax 
	dec $02 
	lda $02 
	bne L_BRS_74C0_74E9
	rts 

L_JMP_74EC_7018:

	jsr L_JSR_753F_74EC
	jsr L_JSR_746E_74EF
	lda #$CA
	sta $7052 
	lda #$B2
	sta $7051 
	jsr L_JSR_750C_74FC
	ldy #$07
	sty $02 
	ldy #$09
	jsr L_JSR_74A0_7505
	jsr L_JSR_7487_7508
	rts 

L_JSR_750C_74FC:

	lda #$CA
	sta $FC 
	lda #$6C
	sta $FB 
	ldx #$0E
	lda $CFF9 
	sec 
	sbc #$2B
	sta $02 
	jsr L_JSR_756B_751E
	lda $FC 
	sta $7054 
	lda $FB 
	sta $7053 
	rts 

	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00

L_JSR_753F_74EC:
L_JSR_753F_7A1A:

	lda $A3 
	asl 
	and #$06
	sta $FF 
	rts 

L_JSR_7547_74C2:
L_BRS_7547_754A:
L_JSR_7547_7EED:
L_JSR_7547_7F0A:

	lda $D011 
	bpl L_BRS_7547_754A
	sei 
	lda $01 
	and #$FC
	sta $01 
	rts 

L_JSR_7554_7705:
L_JSR_7554_7739:

	lda $01 
	and #$FE
	sta $01 
	rts 

L_JSR_755B_74CF:
L_JMP_755B_7736:
L_JSR_755B_7781:
L_JSR_755B_7EF5:
L_JSR_755B_7F12:

	lda $01 
	ora #$03
	sta $01 
	cli 
	rts 

L_JSR_7563_75AD:

	lda #$80
	sta $FC 
	lda #$00
	sta $FB 

L_JSR_756B_751E:
L_JSR_756B_7862:
L_JMP_756B_7D48:
L_JSR_756B_7F3E:

	stx $7576 
	ldy $02 
	beq L_BRS_7580_7570
	lda $FB 

L_BRS_7574_757C:

	clc 
	adc #$00
	bcc L_BRS_757B_7577
	inc $FC 

L_BRS_757B_7577:

	dey 
	bne L_BRS_7574_757C
	sta $FB 

L_JMP_7580_701B:
L_BRS_7580_7570:

	rts 

L_JSR_7581_75B0:

	lda $79D3 
	eor #$FF
	sta $79D3 
	lda $79D4 
	eor #$FF
	sta $79D4 
	ldx #$01
	ldy #$0F

L_BRS_7595_75A2:

	lda ($FB),Y 
	and $79D3,X 
	sta $752D,Y 
	txa 
	eor #$01
	tax 
	dey 
	bpl L_BRS_7595_75A2
	rts 

L_JMP_75A5_701E:

	jsr L_JSR_7A1A_75A5
	jsr L_JSR_76D5_75A8
	ldx #$10
	jsr L_JSR_7563_75AD
	jsr L_JSR_7581_75B0
	ldy #$07
	sty $02 
	lda #$75
	sta $7054 
	lda #$2D
	sta $7053 
	lda #$78
	sta $7052 
	lda #$27
	sta $7051 
	ldy #$09
	jmp L_JMP_74A0_75CD

L_JMP_75D0_7021:

	jsr $FFE7
	lda #$71
	sta $0317 
	lda #$30
	sta $0316 
	lda #$71
	sta $0319 
	lda #$35
	sta $0318 
	lda #$EA
	sta $0328 
	lda #$00
	jsr $FF90
	jsr L_JSR_734D_75F1
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$0B
	ldx #$55			// "ROULETTEDAT"
	ldy #$70
	jsr $FFBD
	lda #$00
	ldx #$6C
	ldy #$CA
	jsr $FFD5
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$08
	ldx #$F9			// "ROULETTE"
	ldy #$76
	jsr $FFBD
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5
	jsr L_JSR_7739_762A
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$08
	ldx #$EC			// "WHEELDAT"
	ldy #$76
	jsr $FFBD
	lda #$00
	ldx #$00
	ldy #$A0
	jsr $FFD5
	jsr L_JSR_7705_7648
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$05
	ldx #$E7			// "RBUFF"
	ldy #$76
	jsr $FFBD
	lda #$00
	ldx #$00
	ldy #$80
	jsr $FFD5
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$09
	ldx #$EC			// "WHEELDAT2"
	ldy #$76
	jsr $FFBD
	lda #$00
	ldx #$00
	ldy #$5B
	jsr $FFD5
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$04
	ldx #$F5			// "ARR2"
	ldy #$76
	jsr $FFBD
	lda #$00
	ldx #$40
	ldy #$BF
	jsr $FFD5
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$03
	ldx #$F5			// "ARR"
	ldy #$76
	jsr $FFBD
	lda #$00
	ldx #$40
	ldy #$FF
	jsr $FFD5
	lda #$05
	ldx $BA 
	ldy #$00
	jsr $FFBA
	lda #$04
	ldx #$01			// "HDAT"
	ldy #$77
	jsr $FFBD
	lda #$00
	ldx #$00
	ldy #$94
	jsr $FFD5
	jmp $FFE7

L_JSR_76D5_75A8:

	ldx #$01
	ldy #$0F

L_BRS_76D9_76E4:

	lda $79D3,X 
	sta $7827,Y 
	txa 
	eor #$01
	tax 
	dey 
	bpl L_BRS_76D9_76E4
	rts 

	.byte $52,$42,$55,$46,$46,$57,$48,$45
	.byte $45,$4C,$44,$41,$54,$32,$41,$52
	.byte $52,$32,$52,$4F,$55,$4C,$45,$54
	.byte $54,$45,$48,$44,$41,$54

L_JSR_7705_7648:

	jsr L_JSR_7554_7705
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
	jsr L_JSR_7257_771C
	lda #$C3
	sta $FC 
	lda #$38
	sta $FB 
	lda #$90
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jsr L_JSR_7257_7733
	jmp L_JMP_755B_7736

L_JSR_7739_762A:

	jsr L_JSR_7554_7739
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
	jsr L_JSR_7257_7750
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
	jsr L_JSR_7257_7767
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
	jsr L_JSR_7257_777E
	jsr L_JSR_755B_7781
	jmp L_JMP_728A_7784
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

L_JSR_7842_7870:

	lda #$00
	ldx $FF 
	beq L_BRS_784D_7846

L_BRS_7848_784B:

	sec 
	ror 
	dex 
	bne L_BRS_7848_784B

L_BRS_784D_7846:

	ldy #$0F

L_BRS_784F_7855:

	eor #$FF
	sta $7827,Y 
	dey 
	bpl L_BRS_784F_7855
	rts 

L_JSR_7858_78AB:

	lda #$77
	sta $FC 
	lda #$87
	sta $FB 
	ldx #$10
	jsr L_JSR_756B_7862
	lda $FC 
	sta $7841 
	lda $FB 
	sta $7840 
	rts 

L_JSR_7870_78AE:

	jsr L_JSR_7842_7870
	lda $7841 
	sta $7054 
	lda $7840 
	sta $7053 
	lda #$78
	sta $7052 
	lda #$27
	sta $7051 
	jsr L_JSR_78CE_7889
	ldy #$08
	sty $02 
	ldy #$09
	jsr L_JSR_74A0_7892
	jmp L_JMP_78E9_7895

L_JMP_7898_7024:

	lda #$70
	sta $A3 
	ldy #$00
	sty $FF 

L_BRS_78A0_78CB:

	lda #$11
	sta $A4 
	tya 
	pha 
	lda $7837,Y 
	sta $02 
	jsr L_JSR_7858_78AB
	jsr L_JSR_7870_78AE
	lda $A3 
	clc 
	adc #$05
	sta $A3 
	inc $FF 
	inc $FF 
	lda $FF 
	cmp #$08
	bcc L_BRS_78C6_78C0
	lda #$00
	sta $FF 

L_BRS_78C6_78C0:

	pla 
	tay 
	iny 
	cpy #$09
	bcc L_BRS_78A0_78CB
	rts 

L_JSR_78CE_7889:

	ldx $FF 
	beq L_BRS_78E8_78D0

L_BRS_78D2_78E6:

	txa 
	pha 
	ldy #$10
	lda $7841 
	sta $FC 
	lda $7840 
	sta $FB 
	jsr L_JSR_7419_78E0
	pla 
	tax 
	dex 
	bne L_BRS_78D2_78E6

L_BRS_78E8_78D0:

	rts 

L_JMP_78E9_7895:

	ldx $FF 
	beq L_BRS_7903_78EB

L_BRS_78ED_7901:

	txa 
	pha 
	ldy #$10
	lda $7841 
	sta $FC 
	lda $7840 
	sta $FB 
	jsr L_JSR_7445_78FB
	pla 
	tax 
	dex 
	bne L_BRS_78ED_7901

L_BRS_7903_78EB:

	rts 

L_JMP_7904_7039:

	lda $79D2 
	beq L_BRS_790A_7907
	rts 

L_BRS_790A_7907:

	inc $79D2 
	ldy #$47

L_BRS_790F_7916:

	lda $9400,Y 
	sta $E1B0,Y 
	dey 
	bpl L_BRS_790F_7916
	ldy #$47

L_BRS_791A_7921:

	lda $9448,Y 
	sta $E2F0,Y 
	dey 
	bpl L_BRS_791A_7921
	ldy #$47

L_BRS_7925_792C:

	lda $9490,Y 
	sta $E430,Y 
	dey 
	bpl L_BRS_7925_792C
	ldy #$47

L_BRS_7930_7937:

	lda $94D8,Y 
	sta $E570,Y 
	dey 
	bpl L_BRS_7930_7937
	lda #$79
	sta $FC 
	lda #$AA
	sta $FB 
	lda #$CC
	sta $FE 
	lda #$38
	sta $FD 
	jsr L_JSR_7982_7949
	lda #$79
	sta $FC 
	lda #$AA
	sta $FB 
	lda #$8C
	sta $FE 
	lda #$38
	sta $FD 
	jsr L_JSR_7982_795C
	lda #$79
	sta $FC 
	lda #$BE
	sta $FB 
	lda #$90
	sta $FE 
	lda #$38
	sta $FD 
	jsr L_JSR_7982_796F
	lda #$79
	sta $FC 
	lda #$BE
	sta $FB 
	lda #$D8
	sta $FE 
	lda #$38
	sta $FD 

L_JSR_7982_7949:
L_JSR_7982_795C:
L_JSR_7982_796F:

	ldx #$04

L_BRS_7984_79A7:

	ldy #$04

L_BRS_7986_798B:

	lda ($FB),Y 
	sta ($FD),Y 
	dey 
	bpl L_BRS_7986_798B
	lda $FB 
	clc 
	adc #$05
	sta $FB 
	lda $FC 
	adc #$00
	sta $FC 
	lda $FD 
	adc #$28
	sta $FD 
	lda $FE 
	adc #$00
	sta $FE 
	dex 
	bne L_BRS_7984_79A7
	rts 

	.byte $05,$05,$05,$05,$05,$0F,$0F,$F1
	.byte $F0,$F0,$00,$70,$17,$71,$CF,$07
	.byte $17,$17,$17,$1C,$01,$01,$07,$01
	.byte $01,$00,$01,$00,$01,$0C,$07,$01
	.byte $00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00

L_JMP_79D5_702D:

	ldy #$00
	ldx #$00
	jsr L_JSR_73B0_79D9
	ldx #$00

L_BRS_79DE_7A17:

	lda #$C0
	sta $FC 
	lda #$00
	sta $FB 
	lda $7F76,X 
	sta $02 
	ldy #$07

L_BRS_79ED_79F5:

	clc 
	adc $02 
	bcc L_BRS_79F4_79F0
	inc $FC 

L_BRS_79F4_79F0:

	dey 
	bne L_BRS_79ED_79F5
	clc 
	adc $FB 
	sta $FB 
	bcc L_BRS_7A00_79FC
	inc $FC 

L_BRS_7A00_79FC:

	ldy #$07

L_BRS_7A02_7A07:

	lda ($FB),Y 
	sta ($03),Y 
	dey 
	bpl L_BRS_7A02_7A07
	lda $03 
	clc 
	adc #$08
	sta $03 
	bcc L_BRS_7A14_7A10
	inc $04 

L_BRS_7A14_7A10:

	inx 
	cpx #$28
	bcc L_BRS_79DE_7A17
	rts 

L_JSR_7A1A_75A5:

	jsr L_JSR_753F_7A1A
	ldx $FF 
	lda $752C 
	and #$01
	beq L_BRS_7A28_7A24
	inx 
	inx 

L_BRS_7A28_7A24:

	lda #$00
	cpx #$00
	beq L_BRS_7A33_7A2C

L_BRS_7A2E_7A31:

	sec 
	ror 
	dex 
	bne L_BRS_7A2E_7A31

L_BRS_7A33_7A2C:

	sta $79D3 
	ldx $FF 
	lda $752C 
	and #$02
	bne L_BRS_7A41_7A3D
	inx 
	inx 

L_BRS_7A41_7A3D:

	lda #$FF
	cpx #$00
	beq L_BRS_7A4B_7A45

L_BRS_7A47_7A49:

	lsr 
	dex 
	bne L_BRS_7A47_7A49

L_BRS_7A4B_7A45:

	sta $79D4 
	rts 

L_JSR_7A4F_7E59:

	lda $D41B 
	pha 
	and #$1F
	sta $F9 
	pla 
	and #$C0
	clc 
	rol 
	rol 
	rol 
	rol 
	adc $F9 
	sta $F9 
	jmp L_JMP_7D04_7A63

L_JMP_7A66_7DB6:

	ldy $F9 
	lda $7BD6,Y 
	ldy #$01

L_BRS_7A6D_7A74:

	sta $D828,Y 
	sta $D831,Y 
	dey 
	bpl L_BRS_7A6D_7A74
	ldy #$03

L_BRS_7A78_7A7F:

	sta $D850,Y 
	sta $D857,Y 
	dey 
	bpl L_BRS_7A78_7A7F
	ldy #$0A

L_BRS_7A83_7A8D:

	sta $D878,Y 
	sta $D8A0,Y 
	sta $D8C8,Y 
	dey 
	bpl L_BRS_7A83_7A8D
	rts 

L_JSR_7A90_7E3F:

	ldx $7F9F 
	cpx #$10
	bcs L_BRS_7AEC_7A95
	ldx $7C6D 
	lda $7BFC,X 
	beq L_BRS_7AC1_7A9D
	clc 
	adc #$0C
	asl 
	sta $D000 
	lda #$00
	rol 
	sta $D010 
	lda $7C0B,X 
	clc 
	adc #$32
	sta $D001 
	lda $D015 
	ora #$01
	sta $D015 
	inc $7C6D 
	rts 

L_BRS_7AC1_7A9D:
L_BRS_7AC1_7AF3:
L_BRS_7AC1_7B05:
L_JMP_7AC1_7B68:
L_JMP_7AC1_7B7C:

	lda $D015 
	and #$01
	beq L_BRS_7AD4_7AC6
	inx 
	stx $7C6E 
	lda $D015 
	and #$FE
	sta $D015 

L_BRS_7AD4_7AC6:

	dec $7C6E 
	bne L_BRS_7AEB_7AD7
	lda $7C19 
	beq L_BRS_7AE6_7ADC
	dec $7C19 
	inc $7C6D 
	bne L_BRS_7AEB_7AE4

L_BRS_7AE6_7ADC:

	lda #$00
	sta $7C6D 

L_BRS_7AEB_7AD7:
L_BRS_7AEB_7AE4:

	rts 

L_BRS_7AEC_7A95:
L_JMP_7AEC_7B60:

	cpx #$30
	bcs L_BRS_7B63_7AEE
	lda $7C19 
	bne L_BRS_7AC1_7AF3
	lda $7C6E 
	bne L_BRS_7B48_7AF8

L_BRS_7AFA_7B0F:

	ldx $7C6D 
	cpx #$05
	bne L_BRS_7B07_7AFF
	dex 
	inc $7C19 
	bne L_BRS_7AC1_7B05

L_BRS_7B07_7AFF:

	lda $7C1B,X 
	bne L_BRS_7B11_7B0A
	sta $7C6D 
	beq L_BRS_7AFA_7B0F

L_BRS_7B11_7B0A:

	clc 
	adc #$0C
	asl 
	sta $D000 
	lda #$00
	rol 
	sta $D010 
	lda $7C30,X 
	clc 
	adc #$32
	sta $D001 
	inc $7C6D 
	lda $D015 
	ora #$01
	sta $D015 
	lda #$FF
	sta $8FF8 
	sta $7C1A 
	cpx #$0D
	bcc L_BRS_7B47_7B3C
	cpx #$12
	bcs L_BRS_7B47_7B40
	lda #$FE
	sta $8FF8 

L_BRS_7B47_7B3C:
L_BRS_7B47_7B40:

	rts 

L_BRS_7B48_7AF8:

	sec 
	sbc #$18
	eor #$FF
	tax 
	cpx #$06
	bcc L_BRS_7B58_7B50
	cpx #$0A
	bcs L_BRS_7B58_7B54
	ldx #$05

L_BRS_7B58_7B50:
L_BRS_7B58_7B54:

	stx $7C6D 
	lda #$00
	sta $7C6E 
	jmp L_JMP_7AEC_7B60

L_BRS_7B63_7AEE:
L_JMP_7B63_7BD3:

	lda $7C19 
	beq L_BRS_7B6B_7B66
	jmp L_JMP_7AC1_7B68

L_BRS_7B6B_7B66:

	lda $7C1A 
	bne L_BRS_7BC0_7B6E

L_BRS_7B70_7B87:

	ldx $7C6D 
	cpx #$0E
	bne L_BRS_7B7F_7B75
	ldx #$04
	inc $7C19 
	jmp L_JMP_7AC1_7B7C

L_BRS_7B7F_7B75:

	lda $7C44,X 
	bne L_BRS_7B89_7B82
	sta $7C6D 
	beq L_BRS_7B70_7B87

L_BRS_7B89_7B82:

	clc 
	adc #$0C
	asl 
	sta $D000 
	lda #$00
	rol 
	sta $D010 
	lda $7C59,X 
	clc 
	adc #$32
	ldy $7F9F 
	cpy #$50
	bcs L_BRS_7BB1_7BA1
	tay 
	lda $D41B 
	and #$07
	bne L_BRS_7BB0_7BA9
	tya 
	sbc #$09
	bne L_BRS_7BB1_7BAE

L_BRS_7BB0_7BA9:

	tya 

L_BRS_7BB1_7BA1:
L_BRS_7BB1_7BAE:

	sta $D001 
	inc $7C6D 
	lda $D015 
	ora #$01
	sta $D015 
	rts 

L_BRS_7BC0_7B6E:

	inc $7C1A 
	lda $7C6D 
	sec 
	sbc #$14
	eor #$FF
	sta $7C6D 
	lda #$FF
	sta $8FF8 
	jmp L_JMP_7B63_7BD3
	.byte $05,$02,$00,$02,$00,$02,$00,$02
	.byte $00,$02,$00,$00,$02,$00,$02,$00
	.byte $02,$00,$02,$02,$00,$02,$00,$02
	.byte $00,$02,$00,$02,$00,$00,$02,$00
	.byte $02,$00,$02,$00,$02,$05,$8E,$88
	.byte $80,$77,$6E,$63,$58,$4C,$40,$34
	.byte $28,$1C,$14,$0E,$00,$67,$5F,$59
	.byte $55,$52,$4F,$4D,$4D,$4E,$50,$53
	.byte $58,$5F,$67,$00,$00,$78,$77,$71
	.byte $6A,$62,$00,$3B,$33,$2B,$25,$25
	.byte $2B,$34,$3D,$45,$4F,$58,$61,$6A
	.byte $72,$00,$6B,$64,$5E,$5A,$58,$00
	.byte $58,$5A,$5F,$65,$6C,$71,$74,$78
	.byte $79,$7A,$79,$78,$74,$70,$6D,$66
	.byte $5F,$57,$4F,$46,$3F,$37,$31,$2E
	.byte $30,$33,$38,$3F,$00,$5F,$65,$6B
	.byte $6F,$70,$00,$6E,$72,$74,$76,$77
	.byte $76,$75,$71,$6E,$69,$64,$61,$5E
	.byte $5C,$00,$5C,$5E,$61,$64,$6A,$00
	.byte $00

L_JMP_7C6F_7033:
L_JSR_7C6F_71FE:

	lda $D000 
	sta $D002 
	lda $D001 
	sta $D003 
	lda $D010 
	lsr 
	php 
	php 
	lsr 
	plp 
	rol 
	plp 
	rol 
	sta $D010 
	rts 

L_JMP_7C8A_7027:
L_JSR_7C8A_7D75:

	lda #$D8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$9C
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_7257_7C9E

L_JMP_7CA1_702A:
L_JSR_7CA1_7DA8:

	lda #$9C
	sta $FC 
	lda #$00
	sta $FB 
	lda #$D8
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jmp L_JMP_7257_7CB5

L_JMP_7CB8_7030:
L_BRS_7CB8_7CBB:

	ldy $D011 
	bpl L_BRS_7CB8_7CBB
	lda $D015 
	and #$80
	ora $02
	sta $D015 
	rts 

	.byte $D5,$DD,$DD,$DD,$D5,$F7,$D7,$F7
	.byte $F7,$D5,$D5,$FD,$D5,$DF,$D5,$D5
	.byte $FD,$D5,$FD,$D5,$DD,$DD,$D5,$FD
	.byte $FD,$D5,$DF,$D5,$FD,$D5,$D5,$DF
	.byte $D5,$DD,$D5,$D5,$FD,$F7,$F7,$F7
	.byte $D5,$DD,$D5,$DD,$D5,$D5,$DD,$D5
	.byte $FD,$D5,$FD,$FD,$FD,$FD,$FD,$5F
	.byte $DF,$DF,$DF,$5F

L_JMP_7D04_7A63:

	lda $F9 
	cmp #$25
	bne L_BRS_7D10_7D08
	ldy #$0A
	lda #$0B
	bne L_BRS_7D1E_7D0E

L_BRS_7D10_7D08:

	ldy #$00
	sec 
	lda $F9 

L_BRS_7D15_7D1A:

	sbc #$0A
	bcc L_BRS_7D1C_7D17
	iny 
	bne L_BRS_7D15_7D1A

L_BRS_7D1C_7D17:

	adc #$0A

L_BRS_7D1E_7D0E:

	pha 
	jsr L_JSR_7D3C_7D1F
	ldy #$04

L_BRS_7D24_7D2A:

	lda ($FB),Y 
	sta $E3E3,Y 
	dey 
	bpl L_BRS_7D24_7D2A
	pla 
	tay 
	jsr L_JSR_7D3C_7D2E
	ldy #$04

L_BRS_7D33_7D39:

	lda ($FB),Y 
	sta $E3EB,Y 
	dey 
	bpl L_BRS_7D33_7D39
	rts 

L_JSR_7D3C_7D1F:
L_JSR_7D3C_7D2E:

	sty $02 
	lda #$7C
	sta $FC 
	lda #$C8
	sta $FB 
	ldx #$05
	jmp L_JMP_756B_7D48

L_JSR_7D4B_7E33:

	jsr L_JSR_734D_7D4B
	lda $D015 
	and #$80
	sta $D015 
	lda #$80
	sta $D418 
	lda #$81
	sta $D412 
	lda #$AA
	sta $D40E 
	lda #$55
	sta $D40F 
	lda #$00
	sta $7F9E 
	sta $7C6D 
	sta $7C19 
	jsr L_JSR_7C8A_7D75
	jsr L_JSR_7F50_7D78
	jsr L_JSR_7ED6_7D7B
	lda #$90
	sta $FC 
	lda #$00
	sta $FB 
	lda #$D8
	sta $FE 
	lda #$00
	sta $FD 
	lda #$03
	ldx #$E8
	jsr L_JSR_7257_7D92
	lda $DD00 
	and #$FC
	ora #$01
	sta $DD00 
	lda #$FF
	sta $8FF8 
	rts 

L_JMP_7DA5_7E5C:

	jsr L_JSR_734D_7DA5
	jsr L_JSR_7CA1_7DA8
	lda $DD00 
	and #$FC
	sta $DD00 
	jsr L_JSR_7F62_7DB3
	jmp L_JMP_7A66_7DB6

L_JSR_7DB9_7E3C:
L_JSR_7DB9_7EBB:

	lda #$5B
	sta $FC 
	lda #$00
	sta $FB 
	lda #$AC
	sta $FE 
	lda #$DF
	sta $FD 
	ldx $7F9E 
	inx 
	cpx #$03
	bcc L_BRS_7DD3_7DCF
	ldx #$00

L_BRS_7DD3_7DCF:

	stx $7F9E 
	cpx #$00
	beq L_BRS_7DEA_7DD8

L_BRS_7DDA_7DE8:

	lda $FB 
	clc 
	adc #$CA
	sta $FB 
	lda $FC 
	adc #$06
	sta $FC 
	dex 
	bne L_BRS_7DDA_7DE8

L_BRS_7DEA_7DD8:

	lda #$06
	ldx #$CA
	jsr L_JSR_7257_7DEE
	lda #$C2
	ldx $7F9E 
	bne L_BRS_7E05_7DF6
	sta $8E47 
	lda #$02
	sta $8DF8 
	sta $8E46 
	bne L_BRS_7E30_7E03

L_BRS_7E05_7DF6:

	cpx #$01
	bne L_BRS_7E1A_7E07
	lda #$02
	sta $8DF1 
	lda #$2C
	sta $8DF7 
	lda #$C0
	sta $8E48 
	bne L_BRS_7E30_7E18

L_BRS_7E1A_7E07:

	sta $8DF1 
	sta $8DF8 
	sta $8E48 
	lda #$0C
	sta $8DF7 
	sta $8E46 
	lda #$C0
	sta $8E47 

L_BRS_7E30_7E03:
L_BRS_7E30_7E18:

	jmp L_JMP_7308_7E30

L_JMP_7E33_7036:

	jsr L_JSR_7D4B_7E33
	jsr L_JSR_7EB2_7E36

L_BRS_7E39_7E4C:

	jsr L_JSR_7E6C_7E39

L_BRS_7E3C_7E47:
L_BRS_7E3C_7E57:

	jsr L_JSR_7DB9_7E3C
	jsr L_JSR_7A90_7E3F
	jsr L_JSR_7E5F_7E42
	dec $02 
	bne L_BRS_7E3C_7E47
	jsr L_JSR_7EA5_7E49
	bcc L_BRS_7E39_7E4C
	lda $7F9E 
	beq L_BRS_7E59_7E51
	eor #$03
	sta $02 
	bne L_BRS_7E3C_7E57

L_BRS_7E59_7E51:

	jsr L_JSR_7A4F_7E59
	jmp L_JMP_7DA5_7E5C

L_JSR_7E5F_7E42:
L_JSR_7E5F_7EBE:

	ldx $7F9F 
	inx 
	ldy #$00

L_BRS_7E65_7E66:
L_BRS_7E65_7E69:

	dey 
	bne L_BRS_7E65_7E66
	dex 
	bne L_BRS_7E65_7E69
	rts 

L_JSR_7E6C_7E39:

	lda $D41B 
	and #$7F
	ldx $7F9F 
	bne L_BRS_7E7D_7E74
	and #$1F
	ora #$60
	clv
	bvc L_BRS_7EA2_7E7B

L_BRS_7E7D_7E74:

	cpx #$10
	bne L_BRS_7E88_7E7F
	and #$1F
	ora #$20
	clv
	bvc L_BRS_7EA2_7E86

L_BRS_7E88_7E7F:

	cpx #$20
	bne L_BRS_7E93_7E8A
	and #$07
	ora #$08
	clv
	bvc L_BRS_7EA2_7E91

L_BRS_7E93_7E8A:

	cpx #$30
	bne L_BRS_7E9E_7E95
	and #$03
	ora #$04
	clv
	bvc L_BRS_7EA2_7E9C

L_BRS_7E9E_7E95:

	and #$07
	ora #$08

L_BRS_7EA2_7E7B:
L_BRS_7EA2_7E86:
L_BRS_7EA2_7E91:
L_BRS_7EA2_7E9C:

	sta $02 
	rts 

L_JSR_7EA5_7E49:

	lda $7F9F 
	cmp #$50
	bcs L_BRS_7EB1_7EAA
	adc #$10
	sta $7F9F 

L_BRS_7EB1_7EAA:

	rts 

L_JSR_7EB2_7E36:

	lda #$50
	sta $7F9F 

L_BRS_7EB7_7ECE:

	lda #$09
	sta $02 

L_BRS_7EBB_7EC3:

	jsr L_JSR_7DB9_7EBB
	jsr L_JSR_7E5F_7EBE
	dec $02 
	bne L_BRS_7EBB_7EC3
	lda $7F9F 
	sec 
	sbc #$10
	sta $7F9F 
	bcs L_BRS_7EB7_7ECE
	lda #$00
	sta $7F9F 
	rts 

L_JSR_7ED6_7D7B:

	lda #$FD
	sta $8FFF 
	lda #$E0
	sta $FC 
	lda #$00
	sta $FB 
	lda #$A0
	sta $FE 
	lda #$00
	sta $FD 
	ldx #$00
	jsr L_JSR_7547_7EED
	lda #$0A
	jsr L_JSR_7257_7EF2
	jsr L_JSR_755B_7EF5
	lda #$FA
	sta $FC 
	lda #$40
	sta $FB 
	lda #$BA
	sta $FE 
	lda #$40
	sta $FD 
	ldx #$00
	jsr L_JSR_7547_7F0A
	lda #$05
	jsr L_JSR_7257_7F0F
	jsr L_JSR_755B_7F12
	lda #$D8
	sta $FC 
	lda #$00
	sta $FB 
	lda #$90
	sta $FE 
	lda #$00
	sta $FD 
	lda #$01
	ldx #$40
	jsr L_JSR_7257_7F29
	lda $CFFF 
	sec 
	sbc #$2B
	sta $02 
	lda #$CA
	sta $FC 
	lda #$C0
	sta $FB 
	ldx #$40
	jsr L_JSR_756B_7F3E
	lda #$BF
	sta $FE 
	lda #$40
	sta $FD 
	lda #$00
	ldx #$40
	jmp L_JMP_7257_7F4D

L_JSR_7F50_7D78:

	lda $D010 
	ror 
	lda $D000 
	ror 
	sta $7FA0 
	lda $D001 
	sta $7FA1 
	rts 

L_JSR_7F62_7DB3:

	lda $7FA0 
	rol 
	sta $D000 
	lda #$00
	rol 
	sta $D010 
	lda $7FA1 
	sta $D001 
	rts
