3 data9,84,69,32,81,85,73,69,82,79
4 data10,73,32,76,79,86,69,32,89,79,85
5 data1,5,25,100,500
6 clr:dimsz(5),py(15,15)
7 ba=36864:ve=ba+15*3:jo=56320:be=0:readcl:forx1=1tocl:readi:cd$=cd$+chr$(i)
8 next:readc2:forx1=1toc2:readi:c2$=c2$+chr$(i):next
9 v1=peek(ve)+peek(ve+1)*256:v2=peek(ve+2)+peek(ve+3)*256
10 v3=peek(ve+4)+peek(ve+5)*256:v4=peek(ve+6)+peek(ve+7)*256
11 v5=peek(ve+8)+peek(ve+9)*256:v6=peek(ve+10)+peek(ve+11)*256
12 v7=peek(ve+12)+peek(ve+13)*256
13 forx1=1to5:readsz(x1):next
14 forx=0to15:fory=0to15:py(x,y)=0:next:next
15 data1,5,1,3,10,2,4,15,3,12,25
16 data4,15,37,4,8,21,43,5,9,32,50
17 data5,10,24,43,75,5,12,27,50,95,145
18 data6,34,60,90,124,178,6,45,60,110
19 data145,190,224,6,50,90,140,190,234,290,321
20 data7,75,110,168,200,390,500,675,8,120,300,500,700,900,1200,3250
21 data8,260,400,500,800,1000,5000,20000,50000
22 forx=1to15:readt:fory=ttox:readpy(x,y):next:next
23 sysba
24 gosub76:gosub88
25 gosub64:gosub78
26 p=peek(v6):b=peek(jo)and16
27 ifpeek(v6+2)thensysba+13*3
28 ifpeek(v6+1)thengosub47:goto26
29 if(peek(198)=0)and(p=0)andbthen26
30 ifpeek(v7)thensysba+12*3:pokev7,0:goto26
31 ifpthengosub47:goto26
32 if(b=0)and(peek(v6+1)=0)thengosub42
33 geta$:ifa$=""then26
34 if(peek(653)and4)=0then40
35 ifasc(a$)=17then127
36 ifasc(a$)=3thensysba+14*3
37 ifasc(a$)=19thengosub56
38 ifasc(a$)=22thengosub141
39 ifasc(a$)=15thengosub112
40 ifasc(a$)=63thengosub130
41 goto97
42 gosub44:if(x1>12)or(y1<147)or(y1>177)or(peek(v6+1))thenreturn
43 goto56
44 x1=(peek(53248)-24+(peek(53264)and1)*256)/2:y1=peek(53249)-50
45 x=peek(163):y=peek(164)
46 return
47 ifpeek(v6+1)=0thenifpeek(v6)=0thenreturn
48 waitv6,1:co=peek(53288)and15
49 ifco=1thenbe=sz(1):goto55
50 ifco=2thenbe=sz(2):goto55
51 ifco=13thenbe=sz(3):goto55
52 ifco=6thenbe=sz(4):goto55
53 ifco=4thenbe=sz(5):goto55
54 be=0
55 pokev6,0:gosub68:goto78
56 ifbe=0then91
57 p=peek(v5):ifp=0then92
58 sysba+11*3
59 goto100
60 fori=5to1step-1:ifkand2^(i+2)thenbe=sz(i)
61 next:return
62 print"{home}{blk}"s$:fori=ztoz+len(s$)-1:pokev2+i,peek(1024+i-z):next
63 sysba+8*3:return
64 gosub71
65 s$="current bet: $      numbers checked: ":ch=peek(v5):o$=str$(ch)
66 l=len(o$):o$=right$(o$,l-1):ifl<3theno$="0"+o$
67 s$=s$+o$:z=0:gosub62
68 s$=str$(be)+" ":l=len(s$)-1:s$=right$(s$,l)
69 ifl<3thens$="0"+s$:l=l+1:goto69
70 z=14:goto62
71 fori=0to39:pokev2+i,32:next
72 sysba+8*3:return
73 mo=ub:gosub85
74 fori=1to9:poke680+i,asc(mid$(m$,i,1)):next
75 poke690,255:return
76 s$="":fori=1to9:s$=s$+chr$(peek(680+i)):next:ub=val(s$)
77 li=peek(680):return
78 m=mo:poke2,1
79 ifmthenpoke2,9
80 ifm>4thenpoke2,25
81 ifm>49thenpoke2,57
82 ifm>99thenpoke2,121
83 ifm>499thenpoke2,249
84 sysba+9*3:return
85 m$=str$(mo):l=len(m$)-1:m$=right$(m$,l)
86 ifl<9thenm$="0"+m$:l=l+1:goto86
87 return
88 mo=ub
89 gosub85:fori=0to8:pokev3+i,val(mid$(m$,i+1,1)):next
90 sysba+5*3:return
91 s$="you must place a bet":z=(40-len(s$))/2:gosub71:gosub62:goto123
92 s$="you must pick at least one number":z=(40-len(s$))/2:gosub71
93 gosub62:goto123
94 ifright$(t$,cl)<>cd$then26
95 s$="SS ani, te quiero mucho!! SS"
96 z=int((40-len(s$))/2):gosub71:gosub62:gosub123:goto26
97 t$=right$(t$+a$,c2):ift$<>c2$then94
98 s$="SS betty -n- charlie SS"
99 z=int((40-len(s$))/2):gosub71:gosub62:gosub123:goto26
100 ch=peek(v5):rt=0
101 forx=0to19:ifpeek(v1+peek(v4+x)-1)thenrt=rt+1
102 next
103 k=py(ch,rt):am=k*be
104 ifam=0thenam=-be
105 ifam>50000thenam=50000
106 am=int(am)
107 mo=mo+am:ub=mo:gosub88
108 s$="won  $":ifam<0thens$="lost $"
109 a$=str$(am):l=len(a$):s$=s$+right$(a$,l-1)
110 iflen(s$)<20thens$=s$+" ":goto110
111 z=0:gosub62:be=0:poke56097,7:poke56098,7:goto123
112 ifpeek(v7)thenreturn
113 sysba+6*3:sysba+3:sysba+9:poke53269,0:ch=peek(v5)
114 print"{clr}{wht}"tab(14)"{down}{blu}keno payoffs{down}{down}{yel}"
115 ifch=0thenprinttab(12)"{red}no bets placed!":goto121
116 fori=1toch:printtab(9);:ifi<10thenprint" ";
117 printstr$(i)+" correct pays $";
118 j=be*py(ch,i):ifj>50000thenj=50000
119 o$=str$(j):l=len(o$):printright$(o$,l-1)
120 next
121 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{red}  hit any key or joystick to return..."
122 rf=1:gosub123:print"{clr}":sysba+7*3:gosub78:sysba:sysba+6:return
123 if(peek(56320)and31)=31thenifpeek(198)=0then123
124 geta$:a$=" "
125 poke198,0:ifrfthenrf=0:return
126 goto64
127 gosub71:sysba+3:poke53269,0:poke53280,0:poke53281,0
128 sysba+9:gosub73:print"{blk}{clr}
129 load"rig",8
130 ifpeek(v7)thenreturn
131 sysba+6*3:sysba+3:sysba+9:poke53269,0
132 print"{clr}{wht}"tab(14)"{down}{down}{down}{down}{down}{down}{down}help screen
133 print:printtab(4)"ctrl-v      show chip value
134 printtab(4)"ctrl-s      start machine
135 printtab(4)"ctrl-o      show payoffs
136 printtab(4)"ctrl-c      clear bets
137 printtab(4)"ctrl-q      quit game
138 print:printtab(4)"   ?        show this menu
139 print"{down}{down}{down}{down}{down}{rght}hit any key or move joystick to return
140 rf=1:gosub123:print"{clr}":sysba+7*3:gosub78:sysba:sysba+6:return
141 tb=be:k=peek(53278)and248:ifk=0thenreturn
142 s$="chip value is: $":gosub60:gosub144
143 gosub71:z=int((40-len(s$))/2):gosub62:be=tb:goto123
144 o$=str$(int(be)):l=len(o$)-1:o$=right$(o$,l):s$=s$+o$:return