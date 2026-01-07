8103 data 4,5,6,8,9,10,5,100,15,250,25,500,6,77,65,88,66,69,84,1,5,25,100,500
8104 data 115,124,133,142,151,0,0,25,31,37,43,49,55,0,0,0,100,106,112,118
8105 data 124,130,0,0,14,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,141,141,14,14,25
8105 data 31,37,43,49,55,-4,-4,-4,100,106,112,118,124,130,141,141,14,14,25
8106 data 31,37,43,49,55,-1,0,-1,100,106,112,118,124,130,141,141,36,36,40,40
8107 data 40,40,40,40,-1,0,-1,115,115,115,115,115,115,118,118,36,36,40,40,40
8108 data 40,40,40,-2,0,-2,115,115,115,115,115,115,118,118,36,36,40,40,40,40
8109 data 40,40,-2,0,-2,115,115,115,115,115,115,118,118,36,36,40,40,40,40,40
8110 data 40,77,77,77,115,115,115,115,115,115,118,118,36,36,36,36,36,36,36
8111 data 36,0,0,0,118,118,118,118,118,118,118,118,36,36,36,36,36,36,36,36,0
8112 data 0,0,118,118,118,118,118,118,118,118,0,0,17,17,17,17,17,17,0,0,0,17
8113 data 17,17,17,17,17,0,0,51,51,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,51,51,51,51
8114 data 51,51,51,51,51,51,16,16,16,51,51,51,51,51,51,51,51,51,51,71,71,71
8115 data 71,71,71,16,0,32,71,71,71,71,71,71,51,51,156,144,91,91,91,91,91,91
8116 data 64,0,128,91,91,91,91,91,91,144,156,156,144,91,91,91,91,91,91,16,0
8117 data 32,91,91,91,91,91,91,144,156,156,144,121,121,121,121,121,121,64,0
8118 data 128,121,121,121,121,121,121,144,156,156,144,121,121,121,121,121
8119 data 121,129,129,129,121,121,121,121,121,121,144,156,156,144,144,144
8120 data 144,144,144,144,0,0,0,144,144,144,144,144,144,144,156,156,156,156
8121 data 156,156,156,156,156,0,0,0,156,156,156,156,156,156,156,156,-1,-1,0
8122 data 0,0,0,0,0,-1,-1,-1,0,0,0,0,0,0,-1,-1,12,12,-1,-1,-1,-1,-1,-1,-1,-1
8123 data -1,-1,-1,-1,-1,-1,-1,2,2,12,12,0,0,0,0,0,0,3,3,3,0,0,0,0,0,0,2,2
8124 data 12,12,0,0,0,0,0,0,0,-1,4,0,0,0,0,0,0,2,2,3,4,5,5,5,5,5,5,8,-1,12,6
8125 data 6,6,6,6,6,7,8,3,4,5,5,5,5,5,5,1,-1,5,6,6,6,6,6,6,7,8,3,4,9,9,9,9,9
8126 data 9,9,-1,13,10,10,10,10,10,10,7,8,3,4,9,9,9,9,9,9,11,11,11,10,10,10
8127 data 10,10,10,7,8,3,4,4,4,4,4,4,4,-1,-1,-1,7,7,7,7,7,7,7,8,3,3,3,3,3,3
8128 data 3,3,-1,-1,-1,8,8,8,8,8,8,8,8
9753 clr:dimx(20,11):dimy(20,11):dimbu(20,11):dimbe(20,11):dimus(12):dimsz(5):dimmu(20,11)
9754 dimsp(6):dimfi(5):dimcb(12):dimdb(12):dimcd(12):dimmi(2):dimma(2):dimcp(12)
9755 dimre(20):tb=0:po=0:x1=1:forx1=x1to6:readi:cp(x1)=i:cp((x1+6))=i:next
9894 r1=0:r2=0:ba=36864:ve=(ba+(23*3)):x1=0:forx1=x1to2:readmi(x1):readma(x1):next
9917 readcl:x1=1:forx1=x1tocl:readi:cd$=(cd$+chr$(i)):next
9944 v1=(peek(ve)+(peek((ve+1))*256)):v2=(peek((ve+2))+(peek((ve+3))*256))
9970 v3=(peek((ve+4))+(peek((ve+5))*256)):v4=(peek((ve+6))+(peek((ve+7))*256))
9998 v5=(peek((ve+8))+(peek((ve+9))*256)):v6=(peek((ve+10))+(peek((ve+11))*256))
10026 c1=240:c2=187:gosub12211:x1=1:forx1=x1to5:readsz(x1):next
10046 x1=1:forx1=x1to5:readfi(x1):next:x1=1:forx1=x1to6:sp(x1)=0:next:x1=1
10070 forx1=x1to12:cb(x1)=0:db(x1)=0:cd(x1)=0:next:x1=0
10089 forx1=x1to20:x(x1,0)=0:x(x1,11)=0:bu(x1,0)=-1:bu(x1,11)=-1:y(x1,0)=0
10090 y(x1,11)=0:y1=0:fory1=y1to11:be(x1,y1)=0:mu(x1,y1)=0:next:next:y1=0
10145 fory1=y1to11:x(0,y1)=0:x(20,y1)=0:y(0,y1)=0:y(20,y1)=0:bu(o,y1)=-1:bu(20,y1)=-1
10182 next:y1=1:fory1=y1to10:x1=1:forx1=x1to19:readx(x1,y1):next:next:y1=1
10203 fory1=y1to10:x1=1:forx1=x1to19:ready(x1,y1):next:next:y1=1:fory1=y1to10:x1=1
10228 forx1=x1to19:readbu(x1,y1):next:next:x1=1:forx1=x1to2:y1=2
10247 fory1=y1to4:mu(x1,y1)=1:mu((x1+17),y1)=1:next:mu(x1,10)=4:mu((x1+17),10)=-4:next
10278 y1=5:fory1=y1to9:mu(1,y1)=4:mu(19,y1)=-4:mu(2,y1)=5:mu(18,y1)=-5:next:x1=3
10280 forx1=x1to8:y1=3:fory1=y1to4:mu(x1,y1)=x1:mu((x1+9),y1)=x1:next
10332 mu(x1,10)=4:mu((x1+9),10)=-4:mu(x1,9)=5:mu((x1+9),9)=-5:mu(x1,5)=2
10333 mu((x1+9),5)=2:mu(x1,6)=2:mu((x1+9),6)=2:mu(x1,7)=3:mu(x1,8)=3
10334 mu((x1+9),7)=3:mu((x1+9),8)=3:next:x1=9:forx1=x1to11:mu(x1,8)=1:mu(x1,3)=1:next
10424 gosub12109:gosub12178:gosub12055:sys((ba+3)):sys((ba+6)):sys(ba):poke(v4+1),1
10451 gosub11948:poke2,15:sys((ba+63))
10463 p3=peek((v4+2)):p2=(peek(56320)and16)
10478 ifpeek(v4)thengosub11115:goto10463
10488 ifp2thenif(p3=0)thenif(peek(198)=0)then10463
10504 ifp3thengosub11115:goto10463
10513 if(p2=0)thengosub10608:goto10463
10524 geta$:ifa$=""then10463
10532 if((peek(653)and4)=0)then10595
10543 if(asc(a$)=18)thengosub16321
10552 if(asc(a$)=17)then15520
10559 if(asc(a$)=19)thengosub11481
10568 if(asc(a$)=22)thengosub15999
10577 if(asc(a$)=15)thengosub14990
10586 if(asc(a$)=12)thengosub15576
10595 if(asc(a$)=63)thengosub15653
10605 goto12787
10608 sys((ba+21)):gosub10935:if(((y1<176)or(x1<102))or(x1>146))then10657
10633 gosub11752:if((((mo-tb)-be)=>0)and(tb<(2*ma(li))))then12515
10654 be=0:return
10657 gosub11809:if(((be(x,y)=0)and(((x<>1)or(x<>19))and(y<>5)))and((y<3)or(y>4)))then10779
10689 ifpeek(v4)thenreturn
10692 gosub11577
10695 if(be=0)thenreturn
10699 tb=(tb-be):if(peek(56320)and16)thenreturn
10713 gosub12535:poke(v4+1),0:sys((ba+(17*3))):poke2,3:sys((ba+63)):gosub12544:x1=1
10742 forx1=x1to99:next
10748 if(peek((v4+2))=0)thenif(peek(v4)=0)thenpoke(v4+1),1:poke2,1:sys((ba+63))
10749 goto11989
10779 if((((y1<152)or(x1<66))or(x1>93))or(y1>180))thenwait56320,16:return
10809 goto11481
10812 if(x(x,y)<0)then10839
10826 x1=x(x,y):y1=y(x,y):goto10905
10839 l=((v3-x(x,y))-1):pokel,(peek(l)and(255-y(x,y))):return
10861 bu=bu(x,y):if((us(bu)<>0)or(bu=0))then10904
10878 poke2,bu:poke163,x(x,y):poke164,y(x,y):sys((ba+27)):us(bu)=1
10904 return
10905 poke163,x1:poke164,y1:poke2,bu:if(bu=0)thensys((ba+(18*3))):return
10929 sys((ba+30)):return
10935 x1=(((peek(53248)-24)+((peek(53264)and1)*256))/2)
10961 y1=(peek(53249)-50):x=peek(163):y=peek(164):return
10981 if(x(x,y)=>0)then11014
10990 x1=x(x,y):y1=y(x,y):bu=bu(x,y):gosub12343:gosub11809:goto11050
11014 x1=((x(x,y)*2)+22):y1=y(x,y):gosub12275:gosub10861:x2=x(x,y):y2=y(x,y):gosub12261:gosub11809
11050 be(x,y)=(be(x,y)+be)
11060 poke2,1:sys((ba+63)):poke53288,1:x1=c1:y1=c2
11081 gosub12275:poke(v4+1),1:pokev4,0:poke2,15:sys((ba+63)):tb=(tb+be):be=0:goto11989
11110 be=0:goto11060
11115 if(peek((v4+2))=0)thenif(peek(v4)=0)thenreturn
11128 waitv4,1:gosub10935:bu=bu(x,y):x2=x(x,y):if(x2=0)then11110
11150 if(x2<0)then10981
11156 if((((y<3)or(y>4))or(x>8))or(x<3))then11227
11174 m=int((((x(x,y)-1)/6)-3)):if(cb(m)=0)then11110
11196 x1=((x2*2)+22):y1=61:gosub12275:y2=61:gosub12261:cd(m)=(cd(m)+be):goto11060
11227 if((((y<3)or(y>4))or(x<12))or(x>17))then11298
11245 m=int((((x(x,y)+3)/6)-10)):if(cb(m)=0)then11110
11267 x1=((x2*2)+22):y1=61:gosub12275:y2=61:gosub12261:cd(m)=(cd(m)+be):goto11060
11298 if(bu=12)thenifpothen10981
11307 if(bu=2)thenifpothen10981
11316 if((bu=2)or(bu=12))then11110
11326 if(bu<>3)then11376
11332 if(po=0)then10981
11338 if(be(1,5)=0)thenif(be(19,5)=0)then11110
11355 x1=-3:y1=16:bu=2:gosub12343:sp(5)=(sp(5)+be):goto11060
11376 if(bu<>8)then11427
11382 if(po=0)then10981
11388 if(be(1,5)=0)thenif(be(19,5)=0)then11110
11405 x1=-3:y1=128:bu=14:gosub12343:sp(6)=(sp(6)+be):goto11060
11427 if(bu=4)thenif(po=0)then10981
11438 if(bu=7)thenif(po=0)then10981
11449 if(bu=5)thenifpothen10981
11458 if(bu=6)thenifpothen10981
11467 if(bu<8)thenif(bu>3)then11110
11478 goto10981
11481 if(tb<mi(li))then12376
11489 if(tb>ma(li))then12428
11497 s$="           ":z=29:gosub11885:sys((ba+(14*3))):d1=peek(249):d2=peek(250)
11547 de=(d1+d2):re(r2)=de:r2=(r2+1):if(r2>20)thenr2=0
11558 if(r1=r2)thenr1=(r1+1):if(r1>20)thenr1=0
11574 goto13039
11577 be=be(x,y):bu=bu(x,y):if(x(x,y)<=0)then11667
11596 if(bu=3)thenifpothenbe=sp(5):sp(5)=0:poke(v3+2),(peek((v3+2))and239):return
11624 if(bu=8)thenifpothenbe=sp(6):sp(6)=0:poke(v3+2),(peek((v3+2))and127):return
11652 if((bu=4)or(bu=7))thenifpothenbe=0:return
11667 if((((bu<>0)or(y<3))or(y>4))or((x>8)and(x<12)))then11740
11689 m=((x-2)+(3*(x>11)))
11700 be=cd(m)
11705 cd(m)=0
11710 if(be=0)thenreturn
11714 x1=((x(x,y)*2)+22):y1=61:gosub12535:gosub12275:x1=x(x,y):goto10905
11740 if(be=0)thenreturn
11744 be(x,y)=0:goto10812
11752 x1=(x1+4)
11756 if(x1<fi(1))thenbe=sz(1):return
11768 if(x1<fi(2))thenbe=sz(2):return
11780 if(x1<fi(3))thenbe=sz(3):return
11792 if(x1<fi(4))thenbe=sz(4):return
11804 be=sz(5):return
11809 mu=mu(x,y):if(mu=0)thenreturn
11820 if(mu<0)then11848
11827 if(mu((x-1),y)=mu)thenx=(x-1):goto11827
11845 goto11866
11848 if(mu((x+1),y)=mu)thenx=(x+1):goto11848
11866 if(mu(x,(y-1))=mu)theny=(y-1):goto11866
11884 return
11885 i=z
11888 fori=ito((z+len(s$))-1):a=asc(mid$(s$,((i-z)+1),1)):if(a>64)thenif(a<91)thena=(a-64)
11933 poke(v6+i),a:next:sys((ba+(15*3))):return
11948 gosub12055:s$="bet on table: $      status:":z=0:gosub11885
11989 s$=(str$(tb)+" "):l=(len(s$)-1):s$=right$(s$,l)
12008 if(l<4)thens$=("0"+s$):l=(l+1):goto12008
12027 s$=("bet on table: $"+s$):z=0:goto11885
12055 i=0:fori=ito39:poke(v6+i),32:next:sys((ba+(15*3))):return
12077 mo=ub:gosub12142:i=1:fori=ito9:poke(680+i),asc(mid$(m$,i,1)):next:poke690,255:return
12109 s$="":i=1:fori=ito9:s$=(s$+chr$(peek((680+i)))):next:ub=val(s$):li=peek(680):return
12142 m$=str$(mo):l=(len(m$)-1):m$=right$(m$,l)
12158 if(l<9)thenm$=("0"+m$):l=(l+1):goto12158
12177 return
12178 mo=ub
12181 gosub12142:i=0:fori=ito8:poke(v5+i),val(mid$(m$,(i+1),1)):next:sys((ba+(12*3))):return
12211 sys(ba):gosub12055:s$="       please wait one moment ...":z=0:gosub11885:return
12261 poke163,x2:poke164,y2:sys((ba+24)):return
12275 poke2,1:sys((ba+(21*3))):poke53250,(x1and255):poke53251,(y1+49)
12307 poke53264,((peek(53264)and253)or(-2*(x1>255))):poke2,3:sys((ba+(21*3))):return
12343 poke2,1:sys((ba+63)):l=((v3-x1)-1):pokel,(peek(l)ory1):poke(v2+bu),peek(53288):return
12376 gosub12055:s$=(("min bet is $"+right$(str$(mi(li)),2))+" -- bet more"):goto12479
12428 gosub12055:s$="maximum bet is $":be=ma(li):gosub16455:s$=(s$+" -- bet less!!")
12479 z=0:gosub11885:goto15485
12488 gosub12535:x2=x(x,y):y2=y(x,y):x1=((x2*2)+22):y1=y2:gosub12275:goto12261
12515 poke(v4+1),0
12520 ifpeek(v4)thenreturn
12523 if(peek((v4+2))<>1)then12515
12532 goto12544
12535 poke2,1:sys((ba+63))
12544 if(be=>sz(5))thenpoke53288,4:return
12560 if(be=>sz(4))thenpoke53288,6:return
12576 if(be=>sz(3))thenpoke53288,13:return
12592 if(be=>sz(2))thenpoke53288,2:return
12608 poke53288,1:return
12617 i=0:j=1:o$="":if((de=4)or(de=10))theni=2:j=1:o$="2:1"
12647 if((de=5)or(de=9))theni=3:j=2:o$="3:2"
12669 if((de=6)or(de=8))theni=6:j=5:o$="6:5"
12691 if(de=7)theni=1
12699 k=(i/j):return
12706 i=0:j=1:o$="":if((de=4)or(de=10))theni=9:j=5:o$="9:5"
12736 if((de=5)or(de=9))theni=7:j=5:o$="7:5"
12758 if((de=6)or(de=8))theni=7:j=6:o$="7:6"
12780 k=(i/j):return
12787 t$=right$((t$+a$),cl):if(t$<>cd$)then10463
12802 sys((ba+(19*3))):sys((ba+3)):sys((ba+18)):print"{clr}{blk}":poke53269,0:printtab(13)
12833 print"{down}{down}{down}{down}{red}change max bet":print:print"{pur}enter new upper limit:":print"{yel}==>{blu}C{left}";:s$=""
12894 geta$:if(a$=chr$(13))then12983
12927 if((a$=chr$(20))and(s$<>""))thenprint" {left}{left}C{left}";:s$=left$(s$,(len(s$)-1))
12955 if((a$=chr$(20))or(len(s$)>5))then12894
12996 if(a$<"0")or(a$>"9")then12894
12968 printa$;"C{left}";:s$=(s$+a$):goto12894
12983 ma(li)=val(s$)
12989 sys((ba+60)):poke2,15:sys((ba+63)):sys(ba):sys((ba+15)):goto10463
13015 am=(am-be(x,y)):tb=(tb-be(x,y)):be(x,y)=0:goto10812
13039 am=0:if(po=0)then13328
13048 if(po<>de)thenif(de<>7)then13580
13061 gosub12617
13064 l=1:if(de=7)thenl=-1
13075 ifbe(1,5)thenam=(am+(l*be(1,5))):if(l<0)thentb=(tb-be(1,5)):x=1:y=5:gosub10812
13111 ifbe(19,5)thenam=(am+(l*be(19,5))):if(l<0)thentb=(tb-be(19,5)):x=19:y=5:gosub10812
13147 if(l<0)thenbe(1,5)=0:be(19,5)=0
13162 ifsp(5)theni=(sp(5)*k):am=(am+(l*i)):poke(v3+2),(peek((v3+2))and239):tb=(tb-sp(5))
13199 ifsp(6)theni=(sp(6)*k):am=(am+(l*i)):poke(v3+2),(peek((v3+2))and127):tb=(tb-sp(6))
13236 ifbe(2,5)thenam=(am-(l*be(2,5))):tb=(tb-be(2,5)):x=2:y=5:gosub10812
13267 ifbe(18,5)thenam=(am-(l*be(18,5))):tb=(tb-be(18,5)):x=18:y=5:gosub10812
13298 be(2,5)=0:be(18,5)=0:sp(5)=0:sp(6)=0:sys((ba+(22*3))):po=0:goto13580
13328 if(de>3)thenif(de<11)thenif(de<>7)then13553
13347 l=1:if(((de=2)or(de=3))or(de=12))thenl=-1
13368 ifbe(1,5)thenam=(am+(l*be(1,5))):if(l<0)thentb=(tb-be(1,5)):x=1:y=5:gosub10812
13404 ifbe(19,5)thenam=(am+(l*be(19,5))):if(l<0)thentb=(tb-be(19,5)):x=19:y=5:gosub10812
13440 if(l<0)thenbe(1,5)=0:be(19,5)=0
13455 if(de=12)thenl=0
13463 ifbe(2,5)thenam=(am-(l*be(2,5))):if(l<0)thentb=(tb-be(2,5)):x=2:y=5:gosub10812
13499 ifbe(18,5)thenam=(am-(l*be(18,5))):if(l<0)thentb=(tb-be(18,5)):x=18:y=5:gosub10812
13535 if(l<0)thenbe(2,5)=0:be(18,5)=0
13550 goto13580
13553 po=de:i=(po-4):if(po>7)theni=(i-1)
13569 poke255,i:sys((ba+(16*3)))
13580 m=1
13583 form=mto12:if((cb(m)=0)or((de<>7)and(cp(m)<>de)))then13717
13609 l=1:if(de=7)thenl=-1
13620 gosub12617:i=cd(m):if(l=1)theni=(i*k)
13638 x=((2+m)-(3*(m>6))):ifitheny1=61:bu=0:x1=x(x,3):gosub10905
13666 ifithenam=(am+(i*l)):tb=(tb-cd(m)):cd(m)=0
13689 y=3:gosub10812:am=(am+(cb(m)*l)):tb=(tb-cb(m)):cb(m)=0
13717 if((db(m)=0)or((de<>7)and(cp(m)<>de)))then13798
13739 l=-1:if(de=7)thenl=1
13750 x=((2+m)-(3*(m>6))):x1=x(x,3):y1=71:bu=0:gosub10905:am=(am+(db(m)*l))
13751 tb=(tb-db(m)):db(m)=0
13798 nextm
13801 if(de>3)thenif(de<11)thenif(de<>7)then13991
13820 l=-1:if((de=7)or(de=11))thenl=1
13836 ifbe(3,5)thentb=(tb-be(3,5)):am=(am+(be(3,5)*l)):x=3:y=5:gosub10812
13867 ifbe(12,5)thentb=(tb-be(12,5)):am=(am+(be(12,5)*l)):x=12:y=5:gosub10812
13898 if(de=12)thenl=0
13906 ifbe(1,2)thentb=(tb-be(1,2)):am=(am-(be(1,2)*l)):x=1:y=2:gosub10812
13937 ifbe(18,2)thentb=(tb-be(18,2)):am=(am-(be(18,2)*l)):x=18:y=2:gosub10812
13968 be(3,5)=0:be(12,5)=0:be(1,2)=0:be(18,2)=0:goto14220
13991 m=((de-1)+(1*(de>7)))
14004 ifbe(3,5)thenx=3:y=5:gosub10812:x=m:y=3:be=be(3,5):gosub12488
14030 ifbe(3,5)thencb((m-2))=(cb((m-2))+be):be=0:be(3,5)=0
14057 ifbe(12,5)thenx=12:y=5:gosub10812:x=(m+9):y=3:be=be(12,5):gosub12488
14085 ifbe(12,5)thencb((m+4))=(cb((m+4))+be):be=0:be(12,5)=0
14112 ifbe(1,2)thenx=1:y=2:gosub10812:x=m:y=4:be=be(1,2):gosub12488
14138 ifbe(1,2)thendb((m-2))=(db((m-2))+be):be=0:be(1,2)=0
14165 ifbe(18,2)thenx=18:y=2:gosub10812:x=(m+9):y=4:be=be(18,2):gosub12488
14193 ifbe(18,2)thendb((m+4))=(db((m+4))+be):be=0:be(18,2)=0
14220 if(be(9,3)=0)then14256
14229 if(de=7)thenam=(am+(4*be(9,3))):goto14256
14249 x=9:y=3:gosub13015
14256 if(be(9,4)=0)then14298
14265 if(d1=2)thenif(d2=2)thenam=(am+(be(9,4)*7)):goto14298
14291 x=9:y=4:gosub13015
14298 if(be(9,5)=0)then14340
14307 if(d1=3)thenif(d2=3)thenam=(am+(be(9,5)*9)):goto14340
14333 x=9:y=5:gosub13015
14340 if(be(9,6)=0)then14376
14349 if(de=2)thenam=(am+(be(9,6)*30)):goto14265
14369 x=9:y=6:gosub13015
14376 if(be(9,7)=0)then14412
14385 if(de=3)thenam=(am+(be(9,7)*15)):goto14412
14405 x=9:y=7:gosub13015
14412 if(be(11,4)=0)then14454
14421 if(d1=5)thenif(d2=5)thenam=(am+(be(11,4)*7)):goto14454
14447 x=11:y=4:gosub13015
14454 if(be(11,5)=0)then14496
14463 if(d1=4)thenif(d2=4)thenam=(am+(be(11,5)*9)):goto14496
14489 x=11:y=5:gosub13015
14496 if(be(11,6)=0)then14532
14505 if(de=12)thenam=(am+(be(11,6)*30)):goto14532
14525 x=11:y=6:gosub13015
14532 if(be(11,7)=0)then14568
14541 if(de=11)thenam=(am+(be(11,7)*15)):goto14568
14561 x=11:y=7:gosub13015
14568 if(be(3,7)=0)then14627
14577 k=1:if((de=2)or(de=12))thenk=2
14594 if((de<5)or(de>8))thenam=(am+(be(3,7)*k)):goto14627
14620 x=3:y=7:gosub13015
14627 if(be(12,7)=0)then14686
14636 k=1:if((de=2)or(de=12))thenk=2
14653 if((de<5)or(de>8))thenam=(am+(be(12,7)*k)):goto14686
14679 x=12:y=7:gosub13015
14686 if(be(9,8)=0)then14727
14695 if((de<4)or(de=12))thenam=(am+(be(9,8)*7)):goto14727
14720 x=9:y=8:gosub13015
14727 gosub12706:l=1:if(de=7)thenl=-1
14741 m=3:form=mto8:if(be(m,1)=0)thenif(be((m+9),1)=0)then14877
14769 if(be(m,1)=0)then14820
14779 if(l=-1)thenx=m:y=1:gosub13015:goto14820
14796 if(de=cp((m-2)))thenam=(am+(be(m,1)*k))
14820 if(be((m+9),1)=0)then14877
14832 if(l=-1)thenx=(m+9):y=1:gosub13015:goto14877
14851 if(de=cp((m-2)))thenam=(am+(be((m+9),1)*k))
14877 next
14878 am=int(am):if(am=0)then14901
14890 mo=(mo+am):ub=mo:gosub12178
14901 if(am=0)thens$="even     ":goto14981
14923 s$="won  $":if(am<0)thens$="lost $":a$=str$(am):l=len(a$):s$=(s$+right$(a$,(l-1)))
14964 if(len(s$)<11)thens$=(s$+" "):goto14964
14981 z=29:gosub11885:goto11110
14990 sys((ba+21))
14995 gosub10935:bu=bu(x,y):gosub11809:x2=x(x,y):15011 be=be(x,y):s$="payoff: "
15028 if(x2=0)thenreturn
15032 if(x2<0)then15137
15038 if((bu=12)or(bu=2))thens$=(s$+"1:1"):k=1
15059 if(bu=0)thenif(y>2)thende=((((x+1)-(x>5))+(10*(x>11)))-(x>14)):gosub12617:s$=(s$+o$)
15098 if(bu=0)thenif(y<3)thende=((((x+1)-(x>5))+(10*(x>11)))-(x>14)):gosub12706:s$=(s$+o$)
15137 if(x2<0)thenif(bu=3)thens$=(s$+"4:1"):k=4
15159 if((x2>-1)or(x2<-2))then15263
15171 if((x2=-1)and(bu<8))thens$=(s$+"7:1"):k=7
15193 if((x2=-1)and(bu>7))thens$=(s$+"9:1"):k=9
15215 if(x2=-2)thenif(bu<8)thens$=(s$+"30:1"):k=30
15239 if(x2=-2)thenif(bu>7)thens$=(s$+"15:1"):k=15
15263 if(x2<0)then15380
15269 if((bu=3)or(bu=8))thens$=(s$+"1:1"):k=1
15290 if((bu=4)or(bu=7))thens$=(s$+"1:1"):k=1
15311 if((bu=5)or(bu=6))thens$=(s$+"1:1"):k=1
15332 if((bu=9)or(bu=10))thens$=(s$+"1:1-2,12 2:1"):k=2
15363 if(bu=11)thens$=(s$+"7:1"):k=7
15380 gosub12055:z=0:gosub11885:s$="no bet placed":ifbethens$="bet pays $"
15423 if(be=0)thenz=27:gosub11885:goto15485
15437 if(k=2)thens$="pays $":gosub16455:s$=(s$+" or $")
15466 be=(be*k):gosub16455:z=(40-len(s$)):gosub11885
15485 poke198,0
15489 if((peek(56320)and31)=31)thenif(peek(198)=0)then15489
15510 geta$:be=0:a$=" ":goto11948
15520 gosub12055:sys((ba+3)):sys((ba+9)):poke53269,0:poke53280,0:poke53281,0:sys((ba+18))
15562 gosub12077:print"{blk}{clr}"
15569 load"cml",8
15576 s$="min: $":be=mi(li):gosub16455:be=0:gosub12055:z=0:gosub11885:s$="max: $":be=ma(li)
15634 gosub16455:be=0:z=(40-len(s$)):gosub11885:goto15489
15653 sys((ba+(19*3))):sys((ba+3)):sys((ba+18)):print"{clr}{blk}":poke53269,0:printtab(14)
15684 print"{down}{down}{down}{down}{down}{down}{down}help screen{down}"
15706 printtab(4):print"ctrl-r      last twenty results":printtab(4)
15744 print"ctrl-v      show bet/chip value":printtab(4):print"ctrl-l      show table limits"
15812 printtab(4):print"ctrl-o      show odds":printtab(4):print"ctrl-s      roll dice"
15864 printtab(4):print"ctrl-q      quit game{down}"
15891 printtab(4):print"   ?        show this menu"
15922 print"{down}{down}{down}{down}{down}{rght}hit any key or move joystick to return"
15969 gosub15489:print"{clr}":sys((ba+60)):poke2,15:sys((ba+63)):sys(ba):sys((ba+15)):return
15999 sys((ba+21))
16004 gosub10935:gosub11809:bu=bu(x,y):be=be(x,y):if(y1>175)thenif(x1>101)thengosub11752
16035 if(x(x,y)>0)thengosub16114:ifithen16099
16050 if(be=0)thenreturn
16054 s$="chip value is: $":ifx(x,y)thens$="bet value is: $"
16099 gosub16455:gosub12055:z=0:gosub11885:goto15489
16114 i=0:if((bu<>0)or(y<3))then16230
16126 m=((x-2)+(3*(x>11))):if(((cb(m)=0)and(cd(m)=0))and(db(m)=0))thenreturn
16158 s$="come: $":be=cb(m):gosub16455:s$=(s$+"  odds: $"):be=cd(m):gosub16455
16200 s$=(s$+"   dont come: $"):be=db(m):i=1:return
16230 if((bu<>3)and(bu<>8))thenreturn
16238 m=((bu+2)/5):if((be(x,y)=0)and(sp(m)=0))thenreturn
16259 s$="pass line: $"
16275 be=be(x,y):gosub16455:s$=(s$+"    pass line odds: $"):be=sp((m+4)):i=1:return
16321 sys((ba+(19*3))):sys((ba+3)):sys((ba+18)):print"{clr}{blk}":m=1:poke53269,0:i=(r2-1)
16357 print"last twenty results:":if(i<0)theni=20
16387 print((right$(str$(m),2)+" -")+str$(re(i))):i=(i-1):m=(m+1)
16412 if(i<0)theni=20
16419 if(i<>r2)then16387
16425 gosub15489:print"{clr}":poke2,15:sys((ba+63)):sys((ba+60)):sys(ba):sys((ba+15)):return
16455 o$=str$(int(be)):l=(len(o$)-1):o$=right$(o$,l):s$=(s$+o$):return