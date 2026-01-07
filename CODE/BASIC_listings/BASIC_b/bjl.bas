8096 data1,2,13,6,4,230,225:clr:poke56,120:clr:if(peek(36864)=76)then8261
8136 poke53280,0:poke53281,0:poke53287,1:i=2:fori=ito6:reada:poke(53287+i),a:next
8180 readx:ready:fori=0to4:poke(53252+(2*i)),((x+(18*i))and255):poke(53253+(2*i)),y:next
8224 hb=0:fori=1to5:if((x+(18*(i-1)))>255)then:hb=(hb+(2^(i+1)))
8252 next:poke53264,hb:if(peek(36864)<>76)thenload"bpcode",8,1
8286 fori=1to7:poke(36856+i),254:poke(53240+i),254:next:poke36856,253
8313 poke53240,253:poke53276,254:poke53285,0:poke53275,0:poke53248,150:poke53249,150
8374 sys((36864+(4*3))):load"bjg",8