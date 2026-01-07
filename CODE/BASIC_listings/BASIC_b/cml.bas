8096 clr:if(peek(36864)=16)then8300
8110 poke56,128:clr:poke53280,0:poke53281,0:print"{clr}"
8135 print"{home}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{yel}insert side one & press return"
8182 geta$:if(a$<>chr$(13))then8182
8191 open15,8,15:open2,8,2,"trump castle,p,r":input#15,e:close2:close15
8228 if(e>19)thenprint"{clr}{down}{down}{down}{red}error -- please insert side one...":goto8135
8278 load"mcode",8,1
8288 if(peek(36864)<>16)then8110
8300 print"{clr}":sys((36865+18)):load"cm",8