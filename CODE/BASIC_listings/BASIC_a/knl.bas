8096 data 1,2,13,6,4,30,123:clr:poke56,127:clr:if(peek(36864)=76)then8255
8135 poke53280,0:poke53281,0:poke53287,1:i=3:fori=ito7:reada:poke(53287+i),a:next
8179 readx:ready:i=0
8187 fori=ito4:poke(53254+(2*i)),x:poke(53255+(2*i)),(y+(i*13)):next
8220 i=1:fori=ito7:poke(53240+i),254:next:poke53264,0:poke53240,253
8255 if(peek(36864)<>76)then:load"kcode",8,1
8277 poke53276,254:poke53285,0:poke53275,0:poke53248,150:poke53249,150
8332 sys((36864+(4*3))):load"kng",8