8098 poke56,124:clr
8104 if(peek(36864)<>76)thengosub8287
8119 if(peek(36864)=76)then8149
8132 poke53240,253
8141 poke53287,1
8149 if(peek(36864)<>76)thenload"bpcode",8,1
8172 poke36856,253:fori=1to7:poke(36856+i),254:next:poke53252,68:poke53253,113
8217 poke53264,4:poke53276,254:poke53285,0:poke53275,0:poke53248,150:poke53249,150
8268 sys((36864+(6*3))):load"pkg",8
8287 print"{clr}{yel}":poke53280,0:poke53281,0:printtab(9)
8309 print"{down}{down}{down}{down}{down}{down}{down}select bet size:    $1":be=1
8343 printtab(9):print"{down}{down}use joystick to select":printtab(11)
8374 print"hit fire when done{up}{up}{up}{up}"
8399 forx=1to200:next:p=(peek(56320)and28):if(p=28)then8407
8423 if((pand16)=0)thenpoke700,be:poke53289,(1-(be=5)):return
8448 be=(1-(4*(be=1))):print"{up}";:printtab(30):printright$(str$(be),1):goto8399