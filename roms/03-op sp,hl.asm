ROM0:0101 C3 13 02         jp   $0213
ROM0:0104 CE ED 66 66+     db   $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D
ROM0:0114 00 08 11 1F+     db   $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99
ROM0:0124 BB BB 67 63+     db   $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E
ROM0:0134 00 00 00 00+     db   "<NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL><NUL>"
ROM0:0143 80               db   $80
ROM0:0144 00 00            db   $00,$00
ROM0:0146 00               db   $00
ROM0:0147 01               db   $01
ROM0:0148 00               db   $00
ROM0:0149 00               db   $00
ROM0:014A 00               db   $00
ROM0:014B 00               db   $00
ROM0:014C 00               db   $00
ROM0:014D 66               db   $66
ROM0:014E 20 6C            db   $20,$6C
ROM0:0200 47               ld   b,a
ROM0:0201 11 00 C0         ld   de,$C000
ROM0:0204 0E 10            ld   c,$10
ROM0:0206 2A               ldi  a,[hl]
ROM0:0207 12               ld   [de],a
ROM0:0208 1C               inc  e
ROM0:0209 20 FB            jr   nz,$0206
ROM0:020B 14               inc  d
ROM0:020C 0D               dec  c
ROM0:020D 20 F7            jr   nz,$0206
ROM0:020F 78               ld   a,b
ROM0:0210 C3 00 C0         jp   $C000
ROM0:0213 21 00 40         ld   hl,$4000
ROM0:0216 C3 00 02         jp   $0200
ROM1:4000 C3 20 C2         jp   $C220
ROM1:4003 D6 05            sub  a,$05
ROM1:4005 30 FC            jr   nc,$4003
ROM1:4007 1F               rra  
ROM1:4008 30 00            jr   nc,$400A
ROM1:400A CE 01            adc  a,$01
ROM1:400C D0               ret  nc
ROM1:400D C8               ret  z
ROM1:400E 00               nop  
ROM1:400F C9               ret  
ROM1:4010 B7               or   a
ROM1:4011 C8               ret  z
ROM1:4012 F5               push af
ROM1:4013 3E DF            ld   a,$DF
ROM1:4015 CD 03 C0         call $C003
ROM1:4018 F1               pop  af
ROM1:4019 3D               dec  a
ROM1:401A 20 F6            jr   nz,$4012
ROM1:401C C9               ret  
ROM1:401D B7               or   a
ROM1:401E C8               ret  z
ROM1:401F F5               push af
ROM1:4020 3E FF            ld   a,$FF
ROM1:4022 CD 12 C0         call $C012
ROM1:4025 3E D4            ld   a,$D4
ROM1:4027 CD 03 C0         call $C003
ROM1:402A F1               pop  af
ROM1:402B 3D               dec  a
ROM1:402C 20 F1            jr   nz,$401F
ROM1:402E C9               ret  
ROM1:402F F5               push af
ROM1:4030 7C               ld   a,h
ROM1:4031 CD 10 C0         call $C010
ROM1:4034 7D               ld   a,l
ROM1:4035 CD 03 C0         call $C003
ROM1:4038 F1               pop  af
ROM1:4039 C9               ret   
ROM1:404C C9               ret  
ROM1:404D 18 00            jr   $404F
ROM1:404F 3E FF            ld   a,$FF
ROM1:4051 E0 80            ldh  [$FF80],a
ROM1:4053 E0 81            ldh  [$FF81],a
ROM1:4055 E0 82            ldh  [$FF82],a
ROM1:4057 E0 83            ldh  [$FF83],a
ROM1:4059 C9               ret  
ROM1:405A F5               push af
ROM1:405B C5               push bc
ROM1:405C D5               push de
ROM1:405D E5               push hl
ROM1:405E 21 83 FF         ld   hl,$FF83
ROM1:4061 46               ld   b,[hl]
ROM1:4062 2D               dec  l
ROM1:4063 4E               ld   c,[hl]
ROM1:4064 2D               dec  l
ROM1:4065 56               ld   d,[hl]
ROM1:4066 2D               dec  l
ROM1:4067 AE               xor  [hl]
ROM1:4068 26 08            ld   h,$08
ROM1:406A CB 38            srl  b
ROM1:406C CB 19            rr   c
ROM1:406E CB 1A            rr   d
ROM1:4070 1F               rra  
ROM1:4071 30 10            jr   nc,$4083
ROM1:4073 5F               ld   e,a
ROM1:4074 78               ld   a,b
ROM1:4075 EE ED            xor  a,$ED
ROM1:4077 47               ld   b,a
ROM1:4078 79               ld   a,c
ROM1:4079 EE B8            xor  a,$B8
ROM1:407B 4F               ld   c,a
ROM1:407C 7A               ld   a,d
ROM1:407D EE 83            xor  a,$83
ROM1:407F 57               ld   d,a
ROM1:4080 7B               ld   a,e
ROM1:4081 EE 20            xor  a,$20
ROM1:4083 25               dec  h
ROM1:4084 20 E4            jr   nz,$406A
ROM1:4086 26 FF            ld   h,$FF
ROM1:4088 22               ldi  [hl],a
ROM1:4089 72               ld   [hl],d
ROM1:408A 2C               inc  l
ROM1:408B 71               ld   [hl],c
ROM1:408C 2C               inc  l
ROM1:408D 70               ld   [hl],b
ROM1:408E E1               pop  hl
ROM1:408F D1               pop  de
ROM1:4090 C1               pop  bc
ROM1:4091 F1               pop  af
ROM1:4092 C9               ret  
ROM1:4093 7D               ld   a,l
ROM1:4094 EA 02 D8         ld   [$D802],a
ROM1:4097 7C               ld   a,h
ROM1:4098 EA 03 D8         ld   [$D803],a
ROM1:409B 18 04            jr   $40A1
ROM1:409D 3E C9            ld   a,$C9
ROM1:409F 18 02            jr   $40A3
ROM1:40A1 3E C3            ld   a,$C3
ROM1:40A3 EA 01 D8         ld   [$D801],a
ROM1:40A6 C9               ret  
ROM1:40A7 F5               push af
ROM1:40A8 FE 0A            cp   a,$0A
ROM1:40AA C4 5A C0         call nz,$C05A
ROM1:40AD CD 01 D8         call $D801
ROM1:40B0 F1               pop  af
ROM1:40B1 C9               ret  
ROM1:40B2 F5               push af
ROM1:40B3 3E 20            ld   a,$20
ROM1:40B5 CD 01 D8         call $D801
ROM1:40B8 F1               pop  af
ROM1:40B9 C9               ret  
ROM1:40BA F5               push af
ROM1:40BB 3E 0A            ld   a,$0A
ROM1:40BD CD 01 D8         call $D801
ROM1:40C0 F1               pop  af
ROM1:40C1 C9               ret  
ROM1:40C2 E1               pop  hl
ROM1:40C3 CD C7 C0         call $C0C7
ROM1:40C6 E9               jp   hl
ROM1:40C7 F5               push af
ROM1:40C8 18 03            jr   $40CD
ROM1:40CA CD A7 C0         call $C0A7
ROM1:40CD 2A               ldi  a,[hl]
ROM1:40CE B7               or   a
ROM1:40CF 20 F9            jr   nz,$40CA
ROM1:40D1 F1               pop  af
ROM1:40D2 C9               ret  
ROM1:40D3 CD EE C0         call $C0EE
ROM1:40D6 CD 13 C1         call $C113
ROM1:40D9 CD 1D C1         call $C11D
ROM1:40DC CD 23 C1         call $C123
ROM1:40DF CD BA C0         call $C0BA
ROM1:40E2 C9               ret  
ROM1:40E3 F5               push af
ROM1:40E4 CD 29 C1         call $C129
ROM1:40E7 3E 20            ld   a,$20
ROM1:40E9 CD 01 D8         call $D801
ROM1:40EC F1               pop  af
ROM1:40ED C9               ret  
ROM1:40EE F5               push af
ROM1:40EF CD 29 C1         call $C129
ROM1:40F2 F1               pop  af
ROM1:40F3 C5               push bc
ROM1:40F4 F5               push af
ROM1:40F5 C1               pop  bc
ROM1:40F6 CD FF C0         call $C0FF
ROM1:40F9 C1               pop  bc
ROM1:40FA C9               ret  
ROM1:40FB F5               push af
ROM1:40FC 78               ld   a,b
ROM1:40FD 18 E5            jr   $40E4
ROM1:40FF F5               push af
ROM1:4100 79               ld   a,c
ROM1:4101 18 E1            jr   $40E4
ROM1:4103 F5               push af
ROM1:4104 7A               ld   a,d
ROM1:4105 18 DD            jr   $40E4
ROM1:4107 F5               push af
ROM1:4108 7B               ld   a,e
ROM1:4109 18 D9            jr   $40E4
ROM1:410B F5               push af
ROM1:410C 7C               ld   a,h
ROM1:410D 18 D5            jr   $40E4
ROM1:410F F5               push af
ROM1:4110 7D               ld   a,l
ROM1:4111 18 D1            jr   $40E4
ROM1:4113 F5               push af
ROM1:4114 C5               push bc
ROM1:4115 78               ld   a,b
ROM1:4116 CD 29 C1         call $C129
ROM1:4119 79               ld   a,c
ROM1:411A C1               pop  bc
ROM1:411B 18 C7            jr   $40E4
ROM1:411D F5               push af
ROM1:411E C5               push bc
ROM1:411F 42               ld   b,d
ROM1:4120 4B               ld   c,e
ROM1:4121 18 F2            jr   $4115
ROM1:4123 F5               push af
ROM1:4124 C5               push bc
ROM1:4125 44               ld   b,h
ROM1:4126 4D               ld   c,l
ROM1:4127 18 EC            jr   $4115
ROM1:4129 CD 5A C0         call $C05A
ROM1:412C F5               push af
ROM1:412D CB 37            swap a
ROM1:412F CD 33 C1         call $C133
ROM1:4132 F1               pop  af
ROM1:4133 E6 0F            and  a,$0F
ROM1:4135 FE 0A            cp   a,$0A
ROM1:4137 38 02            jr   c,$413B
ROM1:4139 C6 07            add  a,$07
ROM1:413B C6 30            add  a,$30
ROM1:413D C3 01 D8         jp   $D801
ROM1:4140 F5               push af
ROM1:4141 C5               push bc
ROM1:4142 18 0C            jr   $4150
ROM1:4144 F5               push af
ROM1:4145 C5               push bc
ROM1:4146 FE 0A            cp   a,$0A
ROM1:4148 38 0B            jr   c,$4155
ROM1:414A 0E 64            ld   c,$64
ROM1:414C B9               cp   c
ROM1:414D D4 5D C1         call nc,$C15D
ROM1:4150 0E 0A            ld   c,$0A
ROM1:4152 CD 5D C1         call $C15D
ROM1:4155 C6 30            add  a,$30
ROM1:4157 CD A7 C0         call $C0A7
ROM1:415A C1               pop  bc
ROM1:415B F1               pop  af
ROM1:415C C9               ret  
ROM1:415D 06 2F            ld   b,$2F
ROM1:415F 04               inc  b
ROM1:4160 91               sub  c
ROM1:4161 30 FC            jr   nc,$415F
ROM1:4163 81               add  c
ROM1:4164 4F               ld   c,a
ROM1:4165 78               ld   a,b
ROM1:4166 CD A7 C0         call $C0A7
ROM1:4169 79               ld   a,c
ROM1:416A C9               ret  
ROM1:416B E1               pop  hl
ROM1:416C E5               push hl
ROM1:416D F5               push af
ROM1:416E 23               inc  hl
ROM1:416F 23               inc  hl
ROM1:4170 2A               ldi  a,[hl]
ROM1:4171 EA 04 D8         ld   [$D804],a
ROM1:4174 7D               ld   a,l
ROM1:4175 EA 05 D8         ld   [$D805],a
ROM1:4178 7C               ld   a,h
ROM1:4179 EA 06 D8         ld   [$D806],a
ROM1:417C F1               pop  af
ROM1:417D C9               ret  
ROM1:417E E5               push hl
ROM1:417F CD 6B C1         call $C16B
ROM1:4182 18 02            jr   $4186
ROM1:4184 FF               rst  $38
ROM1:4185 00               nop  
ROM1:4186 E1               pop  hl
ROM1:4187 CD 4D C0         call $C04D
ROM1:418A C9               ret  
ROM1:418B CD BA C0         call $C0BA
ROM1:418E E5               push hl
ROM1:418F CD C2 C0         call $C0C2
ROM1:4192 50               ld   d,b
ROM1:4193 61               ld   h,c
ROM1:4194 73               ld   [hl],e
ROM1:4195 73               ld   [hl],e
ROM1:4196 65               ld   h,l
ROM1:4197 64               ld   h,h
ROM1:4198 00               nop  
ROM1:4199 E1               pop  hl
ROM1:419A 3E 00            ld   a,$00
ROM1:419C C3 6B C2         jp   $C26B
ROM1:419F FA 04 D8         ld   a,[$D804]
ROM1:41A2 3C               inc  a
ROM1:41A3 28 05            jr   z,$41AA
ROM1:41A5 3D               dec  a
ROM1:41A6 28 E3            jr   z,$418B
ROM1:41A8 18 0F            jr   $41B9
ROM1:41AA E5               push hl
ROM1:41AB CD C2 C0         call $C0C2
ROM1:41AE 44               ld   b,h
ROM1:41AF 6F               ld   l,a
ROM1:41B0 6E               ld   l,[hl]
ROM1:41B1 65               ld   h,l
ROM1:41B2 00               nop  
ROM1:41B3 E1               pop  hl
ROM1:41B4 3E 00            ld   a,$00
ROM1:41B6 C3 6B C2         jp   $C26B
ROM1:41B9 FA 05 D8         ld   a,[$D805]
ROM1:41BC 6F               ld   l,a
ROM1:41BD FA 06 D8         ld   a,[$D806]
ROM1:41C0 67               ld   h,a
ROM1:41C1 7E               ld   a,[hl]
ROM1:41C2 B7               or   a
ROM1:41C3 28 09            jr   z,$41CE
ROM1:41C5 CD BA C0         call $C0BA
ROM1:41C8 CD C7 C0         call $C0C7
ROM1:41CB CD BA C0         call $C0BA
ROM1:41CE FA 04 D8         ld   a,[$D804]
ROM1:41D1 FE 01            cp   a,$01
ROM1:41D3 CE 00            adc  a,$00
ROM1:41D5 C3 6B C2         jp   $C26B
ROM1:41D8 F5               push af
ROM1:41D9 F0 80            ldh  a,[$FF80]
ROM1:41DB 2F               cpl  
ROM1:41DC F5               push af
ROM1:41DD F0 81            ldh  a,[$FF81]
ROM1:41DF 2F               cpl  
ROM1:41E0 F5               push af
ROM1:41E1 F0 82            ldh  a,[$FF82]
ROM1:41E3 2F               cpl  
ROM1:41E4 F5               push af
ROM1:41E5 F0 83            ldh  a,[$FF83]
ROM1:41E7 2F               cpl  
ROM1:41E8 CD 29 C1         call $C129
ROM1:41EB F1               pop  af
ROM1:41EC CD 29 C1         call $C129
ROM1:41EF F1               pop  af
ROM1:41F0 CD 29 C1         call $C129
ROM1:41F3 F1               pop  af
ROM1:41F4 CD E3 C0         call $C0E3
ROM1:41F7 F1               pop  af
ROM1:41F8 C9               ret  
ROM1:41F9 F0 80            ldh  a,[$FF80]
ROM1:41FB BB               cp   e
ROM1:41FC 20 12            jr   nz,$4210
ROM1:41FE F0 81            ldh  a,[$FF81]
ROM1:4200 BA               cp   d
ROM1:4201 20 0D            jr   nz,$4210
ROM1:4203 F0 82            ldh  a,[$FF82]
ROM1:4205 B9               cp   c
ROM1:4206 20 08            jr   nz,$4210
ROM1:4208 F0 83            ldh  a,[$FF83]
ROM1:420A B8               cp   b
ROM1:420B 20 03            jr   nz,$4210
ROM1:420D C3 4F C0         jp   $C04F
ROM1:4210 CD D8 C1         call $C1D8
ROM1:4213 C3 B9 C1         jp   $C1B9
ROM1:4216 2A               ldi  a,[hl]
ROM1:4217 CD 5A C0         call $C05A
ROM1:421A 0B               dec  bc
ROM1:421B 78               ld   a,b
ROM1:421C B1               or   c
ROM1:421D 20 F7            jr   nz,$4216
ROM1:421F C9               ret  
ROM1:4220 F3               di   
ROM1:4221 31 FF DF         ld   sp,$DFFF
ROM1:4224 EA 00 D8         ld   [$D800],a
ROM1:4227 3E 00            ld   a,$00
ROM1:4229 E0 07            ldh  [$FF07],a
ROM1:422B 3E 00            ld   a,$00
ROM1:422D E0 0F            ldh  [$FF0F],a
ROM1:422F 3E 00            ld   a,$00
ROM1:4231 E0 FF            ldh  [$FFFF],a
ROM1:4233 3E 00            ld   a,$00
ROM1:4235 E0 26            ldh  [$FF26],a
ROM1:4237 3E 80            ld   a,$80
ROM1:4239 E0 26            ldh  [$FF26],a
ROM1:423B 3E FF            ld   a,$FF
ROM1:423D E0 25            ldh  [$FF25],a
ROM1:423F 3E 77            ld   a,$77
ROM1:4241 E0 24            ldh  [$FF24],a
ROM1:4243 21 23 CB         ld   hl,$CB23
ROM1:4246 CD 93 C0         call $C093
ROM1:4249 CD 7E C1         call $C17E
ROM1:424C CD 0C CB         call $CB0C
ROM1:424F CD 4F C0         call $C04F
ROM1:4252 F5               push af
ROM1:4253 3E 03            ld   a,$03
ROM1:4255 CD 1F C0         call $C01F
ROM1:4258 3E FF            ld   a,$FF
ROM1:425A CD 12 C0         call $C012
ROM1:425D 3E CD            ld   a,$CD
ROM1:425F CD 03 C0         call $C003
ROM1:4262 F1               pop  af
ROM1:4263 CD AC C4         call $C4AC
ROM1:4266 3E 00            ld   a,$00
ROM1:4268 C3 6B C2         jp   $C26B
ROM1:426B 31 FF DF         ld   sp,$DFFF
ROM1:426E F5               push af
ROM1:426F CD 76 C2         call $C276
ROM1:4272 F1               pop  af
ROM1:4273 C3 3A CB         jp   $CB3A
ROM1:4276 F5               push af
ROM1:4277 CD BA C0         call $C0BA
ROM1:427A CD A1 C0         call $C0A1
ROM1:427D F1               pop  af
ROM1:427E FE 01            cp   a,$01
ROM1:4280 D8               ret  c
ROM1:4281 20 0E            jr   nz,$4291
ROM1:4283 E5               push hl
ROM1:4284 CD C2 C0         call $C0C2
ROM1:4287 46               ld   b,[hl]
ROM1:4288 61               ld   h,c
ROM1:4289 69               ld   l,c
ROM1:428A 6C               ld   l,h
ROM1:428B 65               ld   h,l
ROM1:428C 64               ld   h,h
ROM1:428D 0A               ld   a,[bc]
ROM1:428E 00               nop  
ROM1:428F E1               pop  hl
ROM1:4290 C9               ret  
ROM1:4291 E5               push hl
ROM1:4292 CD C2 C0         call $C0C2
ROM1:4295 46               ld   b,[hl]
ROM1:4296 61               ld   h,c
ROM1:4297 69               ld   l,c
ROM1:4298 6C               ld   l,h
ROM1:4299 65               ld   h,l
ROM1:429A 64               ld   h,h
ROM1:429B 20 23            jr   nz,$42C0
ROM1:429D 00               nop  
ROM1:429E E1               pop  hl
ROM1:429F CD 44 C1         call $C144
ROM1:42A2 CD BA C0         call $C0BA
ROM1:42A5 C9               ret  
ROM1:42A6 3E AD            ld   a,$AD
ROM1:42A8 EA 1E D8         ld   [$D81E],a
ROM1:42AB 3E C6            ld   a,$C6
ROM1:42AD EA 1F D8         ld   [$D81F],a
ROM1:42B0 C9               ret  
ROM1:42B1 C5               push bc
ROM1:42B2 D5               push de
ROM1:42B3 E5               push hl
ROM1:42B4 FA 1E D8         ld   a,[$D81E]
ROM1:42B7 6F               ld   l,a
ROM1:42B8 FA 1F D8         ld   a,[$D81F]
ROM1:42BB 67               ld   h,a
ROM1:42BC 11 80 FF         ld   de,$FF80
ROM1:42BF 06 00            ld   b,$00
ROM1:42C1 1A               ld   a,[de]
ROM1:42C2 AE               xor  [hl]
ROM1:42C3 B0               or   b
ROM1:42C4 47               ld   b,a
ROM1:42C5 23               inc  hl
ROM1:42C6 1C               inc  e
ROM1:42C7 7B               ld   a,e
ROM1:42C8 FE 84            cp   a,$84
ROM1:42CA 20 F5            jr   nz,$42C1
ROM1:42CC 7D               ld   a,l
ROM1:42CD EA 1E D8         ld   [$D81E],a
ROM1:42D0 7C               ld   a,h
ROM1:42D1 EA 1F D8         ld   [$D81F],a
ROM1:42D4 78               ld   a,b
ROM1:42D5 FE 00            cp   a,$00
ROM1:42D7 E1               pop  hl
ROM1:42D8 D1               pop  de
ROM1:42D9 C1               pop  bc
ROM1:42DA C9               ret  
ROM1:42DB FA 00 D8         ld   a,[$D800]
ROM1:42DE E6 10            and  a,$10
ROM1:42E0 C8               ret  z
ROM1:42E1 F0 4D            ldh  a,[$FF4D]
ROM1:42E3 07               rlca 
ROM1:42E4 D0               ret  nc
ROM1:42E5 18 0A            jr   $42F1
ROM1:42E7 FA 00 D8         ld   a,[$D800]
ROM1:42EA E6 10            and  a,$10
ROM1:42EC C8               ret  z
ROM1:42ED F0 4D            ldh  a,[$FF4D]
ROM1:42EF 07               rlca 
ROM1:42F0 D8               ret  c
ROM1:42F1 F3               di   
ROM1:42F2 F0 FF            ldh  a,[$FFFF]
ROM1:42F4 F5               push af
ROM1:42F5 AF               xor  a
ROM1:42F6 E0 FF            ldh  [$FFFF],a
ROM1:42F8 E0 0F            ldh  [$FF0F],a
ROM1:42FA 3E 30            ld   a,$30
ROM1:42FC E0 00            ldh  [$FF00],a
ROM1:42FE 3E 01            ld   a,$01
ROM1:4300 E0 4D            ldh  [$FF4D],a
ROM1:4302 10 00            stop
ROM1:4304 F1               pop  af
ROM1:4305 E0 FF            ldh  [$FFFF],a
ROM1:4307 C9               ret  
ROM1:4308 C5               push bc
ROM1:4309 CD 41 C3         call $C341
ROM1:430C 3E C0            ld   a,$C0
ROM1:430E E0 14            ldh  [$FF14],a
ROM1:4310 3E FF            ld   a,$FF
ROM1:4312 E0 11            ldh  [$FF11],a
ROM1:4314 3E 08            ld   a,$08
ROM1:4316 E0 12            ldh  [$FF12],a
ROM1:4318 3E C0            ld   a,$C0
ROM1:431A E0 14            ldh  [$FF14],a
ROM1:431C 01 9E FD         ld   bc,$FD9E
ROM1:431F 03               inc  bc
ROM1:4320 F0 26            ldh  a,[$FF26]
ROM1:4322 E6 01            and  a,$01
ROM1:4324 20 F9            jr   nz,$431F
ROM1:4326 3E 00            ld   a,$00
ROM1:4328 CB 78            bit  7,b
ROM1:432A 20 01            jr   nz,$432D
ROM1:432C 3C               inc  a
ROM1:432D C1               pop  bc
ROM1:432E C9               ret  
ROM1:432F 3E 00            ld   a,$00
ROM1:4331 E0 26            ldh  [$FF26],a
ROM1:4333 C9               ret  
ROM1:4334 3E 80            ld   a,$80
ROM1:4336 E0 26            ldh  [$FF26],a
ROM1:4338 3E FF            ld   a,$FF
ROM1:433A E0 25            ldh  [$FF25],a
ROM1:433C 3E 77            ld   a,$77
ROM1:433E E0 24            ldh  [$FF24],a
ROM1:4340 C9               ret  
ROM1:4341 3E 00            ld   a,$00
ROM1:4343 E0 19            ldh  [$FF19],a
ROM1:4345 3E 3E            ld   a,$3E
ROM1:4347 E0 16            ldh  [$FF16],a
ROM1:4349 3E 08            ld   a,$08
ROM1:434B E0 17            ldh  [$FF17],a
ROM1:434D 3E C0            ld   a,$C0
ROM1:434F E0 19            ldh  [$FF19],a
ROM1:4351 F0 26            ldh  a,[$FF26]
ROM1:4353 E6 02            and  a,$02
ROM1:4355 20 FA            jr   nz,$4351
ROM1:4357 C9               ret  
ROM1:4358 3E 11            ld   a,$11
ROM1:435A E0 10            ldh  [$FF10],a
ROM1:435C 3E 08            ld   a,$08
ROM1:435E E0 12            ldh  [$FF12],a
ROM1:4360 3E FF            ld   a,$FF
ROM1:4362 E0 13            ldh  [$FF13],a
ROM1:4364 3E 83            ld   a,$83
ROM1:4366 E0 14            ldh  [$FF14],a
ROM1:4368 F0 26            ldh  a,[$FF26]
ROM1:436A E6 01            and  a,$01
ROM1:436C 20 FA            jr   nz,$4368
ROM1:436E C9               ret  
ROM1:436F C5               push bc
ROM1:4370 3E 00            ld   a,$00
ROM1:4372 E0 1A            ldh  [$FF1A],a
ROM1:4374 0E 30            ld   c,$30
ROM1:4376 2A               ldi  a,[hl]
ROM1:4377 E2               ld   [$ff00+c],a
ROM1:4378 0C               inc  c
ROM1:4379 CB 71            bit  6,c
ROM1:437B 28 F9            jr   z,$4376
ROM1:437D C1               pop  bc
ROM1:437E C9               ret  
ROM1:437F AF               xor  a
ROM1:4380 E0 26            ldh  [$FF26],a
ROM1:4382 3D               dec  a
ROM1:4383 E0 26            ldh  [$FF26],a
ROM1:4385 E0 25            ldh  [$FF25],a
ROM1:4387 E0 24            ldh  [$FF24],a
ROM1:4389 3E F1            ld   a,$F1
ROM1:438B E0 12            ldh  [$FF12],a
ROM1:438D 3E 86            ld   a,$86
ROM1:438F E0 14            ldh  [$FF14],a
ROM1:4391 F5               push af
ROM1:4392 3E 03            ld   a,$03
ROM1:4394 CD 1F C0         call $C01F
ROM1:4397 3E FF            ld   a,$FF
ROM1:4399 CD 12 C0         call $C012
ROM1:439C 3E CD            ld   a,$CD
ROM1:439E CD 03 C0         call $C003
ROM1:43A1 F1               pop  af
ROM1:43A2 C9               ret  
ROM1:43A3 C5               push bc
ROM1:43A4 4F               ld   c,a
ROM1:43A5 06 08            ld   b,$08
ROM1:43A7 3E 00            ld   a,$00
ROM1:43A9 E0 10            ldh  [$FF10],a
ROM1:43AB 3E 80            ld   a,$80
ROM1:43AD E0 11            ldh  [$FF11],a
ROM1:43AF 3E F8            ld   a,$F8
ROM1:43B1 E0 13            ldh  [$FF13],a
ROM1:43B3 3E 60            ld   a,$60
ROM1:43B5 CB 11            rl   c
ROM1:43B7 30 02            jr   nc,$43BB
ROM1:43B9 3E A0            ld   a,$A0
ROM1:43BB E0 12            ldh  [$FF12],a
ROM1:43BD 3E 87            ld   a,$87
ROM1:43BF E0 14            ldh  [$FF14],a
ROM1:43C1 F5               push af
ROM1:43C2 3E 01            ld   a,$01
ROM1:43C4 CD 12 C0         call $C012
ROM1:43C7 3E 13            ld   a,$13
ROM1:43C9 CD 03 C0         call $C003
ROM1:43CC F1               pop  af
ROM1:43CD 3E 00            ld   a,$00
ROM1:43CF E0 12            ldh  [$FF12],a
ROM1:43D1 F5               push af
ROM1:43D2 3E 4C            ld   a,$4C
ROM1:43D4 CD 03 C0         call $C003
ROM1:43D7 F1               pop  af
ROM1:43D8 05               dec  b
ROM1:43D9 20 D8            jr   nz,$43B3
ROM1:43DB C1               pop  bc
ROM1:43DC C9               ret  
ROM1:43DD C5               push bc
ROM1:43DE 0E 30            ld   c,$30
ROM1:43E0 E2               ld   [$ff00+c],a
ROM1:43E1 0C               inc  c
ROM1:43E2 CB 71            bit  6,c
ROM1:43E4 28 FA            jr   z,$43E0
ROM1:43E6 C1               pop  bc
ROM1:43E7 C9               ret  
ROM1:43E8 C5               push bc
ROM1:43E9 4F               ld   c,a
ROM1:43EA 06 00            ld   b,$00
ROM1:43EC F0 26            ldh  a,[$FF26]
ROM1:43EE A1               and  c
ROM1:43EF 28 0F            jr   z,$4400
ROM1:43F1 F5               push af
ROM1:43F2 3E 0F            ld   a,$0F
ROM1:43F4 CD 12 C0         call $C012
ROM1:43F7 3E CE            ld   a,$CE
ROM1:43F9 CD 03 C0         call $C003
ROM1:43FC F1               pop  af
ROM1:43FD 04               inc  b
ROM1:43FE 20 EC            jr   nz,$43EC
ROM1:4400 78               ld   a,b
ROM1:4401 C1               pop  bc
ROM1:4402 C9               ret  
ROM1:4403 F5               push af
ROM1:4404 E5               push hl
ROM1:4405 21 26 FF         ld   hl,$FF26
ROM1:4408 3E 08            ld   a,$08
ROM1:440A E0 17            ldh  [$FF17],a
ROM1:440C 3E 40            ld   a,$40
ROM1:440E E0 19            ldh  [$FF19],a
ROM1:4410 3E FE            ld   a,$FE
ROM1:4412 E0 16            ldh  [$FF16],a
ROM1:4414 3E C0            ld   a,$C0
ROM1:4416 E0 19            ldh  [$FF19],a
ROM1:4418 3E 02            ld   a,$02
ROM1:441A A6               and  [hl]
ROM1:441B 20 FD            jr   nz,$441A
ROM1:441D F5               push af
ROM1:441E 3E 0F            ld   a,$0F
ROM1:4420 CD 12 C0         call $C012
ROM1:4423 3E C5            ld   a,$C5
ROM1:4425 CD 03 C0         call $C003
ROM1:4428 F1               pop  af
ROM1:4429 3E FF            ld   a,$FF
ROM1:442B E0 16            ldh  [$FF16],a
ROM1:442D 3E C0            ld   a,$C0
ROM1:442F E0 19            ldh  [$FF19],a
ROM1:4431 F0 26            ldh  a,[$FF26]
ROM1:4433 00               nop  
ROM1:4434 00               nop  
ROM1:4435 E6 02            and  a,$02
ROM1:4437 20 E4            jr   nz,$441D
ROM1:4439 E1               pop  hl
ROM1:443A F1               pop  af
ROM1:443B C9               ret  
ROM1:443C B7               or   a
ROM1:443D 20 06            jr   nz,$4445
ROM1:443F C9               ret  
ROM1:4440 F5               push af
ROM1:4441 3E D3            ld   a,$D3
ROM1:4443 18 03            jr   $4448
ROM1:4445 F5               push af
ROM1:4446 3E DF            ld   a,$DF
ROM1:4448 CD 03 C0         call $C003
ROM1:444B F5               push af
ROM1:444C 3E 0E            ld   a,$0E
ROM1:444E CD 12 C0         call $C012
ROM1:4451 3E D8            ld   a,$D8
ROM1:4453 CD 03 C0         call $C003
ROM1:4456 F1               pop  af
ROM1:4457 F1               pop  af
ROM1:4458 3D               dec  a
ROM1:4459 20 EA            jr   nz,$4445
ROM1:445B C9               ret  
ROM1:445C 2E 00            ld   l,$00
ROM1:445E AF               xor  a
ROM1:445F 4F               ld   c,a
ROM1:4460 57               ld   d,a
ROM1:4461 5D               ld   e,l
ROM1:4462 26 08            ld   h,$08
ROM1:4464 1F               rra  
ROM1:4465 CB 19            rr   c
ROM1:4467 CB 1A            rr   d
ROM1:4469 CB 1B            rr   e
ROM1:446B 30 10            jr   nc,$447D
ROM1:446D EE ED            xor  a,$ED
ROM1:446F 47               ld   b,a
ROM1:4470 79               ld   a,c
ROM1:4471 EE B8            xor  a,$B8
ROM1:4473 4F               ld   c,a
ROM1:4474 7A               ld   a,d
ROM1:4475 EE 83            xor  a,$83
ROM1:4477 57               ld   d,a
ROM1:4478 7B               ld   a,e
ROM1:4479 EE 20            xor  a,$20
ROM1:447B 5F               ld   e,a
ROM1:447C 78               ld   a,b
ROM1:447D 25               dec  h
ROM1:447E 20 E4            jr   nz,$4464
ROM1:4480 26 D9            ld   h,$D9
ROM1:4482 73               ld   [hl],e
ROM1:4483 24               inc  h
ROM1:4484 72               ld   [hl],d
ROM1:4485 24               inc  h
ROM1:4486 71               ld   [hl],c
ROM1:4487 24               inc  h
ROM1:4488 77               ld   [hl],a
ROM1:4489 2C               inc  l
ROM1:448A 20 D2            jr   nz,$445E
ROM1:448C C3 4D C0         jp   $C04D
ROM1:448F 6F               ld   l,a
ROM1:4490 F0 80            ldh  a,[$FF80]
ROM1:4492 AD               xor  l
ROM1:4493 6F               ld   l,a
ROM1:4494 26 D9            ld   h,$D9
ROM1:4496 F0 81            ldh  a,[$FF81]
ROM1:4498 AE               xor  [hl]
ROM1:4499 24               inc  h
ROM1:449A E0 80            ldh  [$FF80],a
ROM1:449C F0 82            ldh  a,[$FF82]
ROM1:449E AE               xor  [hl]
ROM1:449F 24               inc  h
ROM1:44A0 E0 81            ldh  [$FF81],a
ROM1:44A2 F0 83            ldh  a,[$FF83]
ROM1:44A4 AE               xor  [hl]
ROM1:44A5 24               inc  h
ROM1:44A6 E0 82            ldh  [$FF82],a
ROM1:44A8 7E               ld   a,[hl]
ROM1:44A9 E0 83            ldh  [$FF83],a
ROM1:44AB C9               ret  
ROM1:44AC CD E7 C2         call $C2E7
ROM1:44AF CD 5C C4         call $C45C
ROM1:44B2 CD A6 C2         call $C2A6
ROM1:44B5 E5               push hl
ROM1:44B6 CD 6B C1         call $C16B
ROM1:44B9 18 02            jr   $44BD
ROM1:44BB 00               nop  
ROM1:44BC 00               nop  
ROM1:44BD E1               pop  hl
ROM1:44BE 21 FB C5         ld   hl,$C5FB
ROM1:44C1 2A               ldi  a,[hl]
ROM1:44C2 EA F8 DE         ld   [$DEF8],a
ROM1:44C5 2A               ldi  a,[hl]
ROM1:44C6 EA F9 DE         ld   [$DEF9],a
ROM1:44C9 2A               ldi  a,[hl]
ROM1:44CA EA FA DE         ld   [$DEFA],a
ROM1:44CD E5               push hl
ROM1:44CE 3E C3            ld   a,$C3
ROM1:44D0 EA FB DE         ld   [$DEFB],a
ROM1:44D3 3E 42            ld   a,$42
ROM1:44D5 EA FC DE         ld   [$DEFC],a
ROM1:44D8 3E C6            ld   a,$C6
ROM1:44DA EA FD DE         ld   [$DEFD],a
ROM1:44DD CD 4F C0         call $C04F
ROM1:44E0 CD 13 C6         call $C613
ROM1:44E3 CD B1 C2         call $C2B1
ROM1:44E6 28 19            jr   z,$4501
ROM1:44E8 E5               push hl
ROM1:44E9 CD 6B C1         call $C16B
ROM1:44EC 18 02            jr   $44F0
ROM1:44EE 01 00 E1         ld   bc,$E100
ROM1:44F1 FA F8 DE         ld   a,[$DEF8]
ROM1:44F4 CD E3 C0         call $C0E3
ROM1:44F7 FE CB            cp   a,$CB
ROM1:44F9 20 06            jr   nz,$4501
ROM1:44FB FA F9 DE         ld   a,[$DEF9]
ROM1:44FE CD E3 C0         call $C0E3
ROM1:4501 E1               pop  hl
ROM1:4502 7D               ld   a,l
ROM1:4503 FE 13            cp   a,$13
ROM1:4505 20 BA            jr   nz,$44C1
ROM1:4507 7C               ld   a,h
ROM1:4508 FE C6            cp   a,$C6
ROM1:450A 20 B5            jr   nz,$44C1
ROM1:450C C3 9F C1         jp   $C19F
ROM1:450F E5               push hl
ROM1:4510 F5               push af
ROM1:4511 6F               ld   l,a
ROM1:4512 F0 80            ldh  a,[$FF80]
ROM1:4514 AD               xor  l
ROM1:4515 6F               ld   l,a
ROM1:4516 26 D9            ld   h,$D9
ROM1:4518 F0 81            ldh  a,[$FF81]
ROM1:451A AE               xor  [hl]
ROM1:451B 24               inc  h
ROM1:451C E0 80            ldh  [$FF80],a
ROM1:451E F0 82            ldh  a,[$FF82]
ROM1:4520 AE               xor  [hl]
ROM1:4521 24               inc  h
ROM1:4522 E0 81            ldh  [$FF81],a
ROM1:4524 F0 83            ldh  a,[$FF83]
ROM1:4526 AE               xor  [hl]
ROM1:4527 24               inc  h
ROM1:4528 E0 82            ldh  [$FF82],a
ROM1:452A 7E               ld   a,[hl]
ROM1:452B E0 83            ldh  [$FF83],a
ROM1:452D E1               pop  hl
ROM1:452E 7D               ld   a,l
ROM1:452F 6F               ld   l,a
ROM1:4530 F0 80            ldh  a,[$FF80]
ROM1:4532 AD               xor  l
ROM1:4533 6F               ld   l,a
ROM1:4534 26 D9            ld   h,$D9
ROM1:4536 F0 81            ldh  a,[$FF81]
ROM1:4538 AE               xor  [hl]
ROM1:4539 24               inc  h
ROM1:453A E0 80            ldh  [$FF80],a
ROM1:453C F0 82            ldh  a,[$FF82]
ROM1:453E AE               xor  [hl]
ROM1:453F 24               inc  h
ROM1:4540 E0 81            ldh  [$FF81],a
ROM1:4542 F0 83            ldh  a,[$FF83]
ROM1:4544 AE               xor  [hl]
ROM1:4545 24               inc  h
ROM1:4546 E0 82            ldh  [$FF82],a
ROM1:4548 7E               ld   a,[hl]
ROM1:4549 E0 83            ldh  [$FF83],a
ROM1:454B 78               ld   a,b
ROM1:454C 6F               ld   l,a
ROM1:454D F0 80            ldh  a,[$FF80]
ROM1:454F AD               xor  l
ROM1:4550 6F               ld   l,a
ROM1:4551 26 D9            ld   h,$D9
ROM1:4553 F0 81            ldh  a,[$FF81]
ROM1:4555 AE               xor  [hl]
ROM1:4556 24               inc  h
ROM1:4557 E0 80            ldh  [$FF80],a
ROM1:4559 F0 82            ldh  a,[$FF82]
ROM1:455B AE               xor  [hl]
ROM1:455C 24               inc  h
ROM1:455D E0 81            ldh  [$FF81],a
ROM1:455F F0 83            ldh  a,[$FF83]
ROM1:4561 AE               xor  [hl]
ROM1:4562 24               inc  h
ROM1:4563 E0 82            ldh  [$FF82],a
ROM1:4565 7E               ld   a,[hl]
ROM1:4566 E0 83            ldh  [$FF83],a
ROM1:4568 79               ld   a,c
ROM1:4569 6F               ld   l,a
ROM1:456A F0 80            ldh  a,[$FF80]
ROM1:456C AD               xor  l
ROM1:456D 6F               ld   l,a
ROM1:456E 26 D9            ld   h,$D9
ROM1:4570 F0 81            ldh  a,[$FF81]
ROM1:4572 AE               xor  [hl]
ROM1:4573 24               inc  h
ROM1:4574 E0 80            ldh  [$FF80],a
ROM1:4576 F0 82            ldh  a,[$FF82]
ROM1:4578 AE               xor  [hl]
ROM1:4579 24               inc  h
ROM1:457A E0 81            ldh  [$FF81],a
ROM1:457C F0 83            ldh  a,[$FF83]
ROM1:457E AE               xor  [hl]
ROM1:457F 24               inc  h
ROM1:4580 E0 82            ldh  [$FF82],a
ROM1:4582 7E               ld   a,[hl]
ROM1:4583 E0 83            ldh  [$FF83],a
ROM1:4585 7A               ld   a,d
ROM1:4586 6F               ld   l,a
ROM1:4587 F0 80            ldh  a,[$FF80]
ROM1:4589 AD               xor  l
ROM1:458A 6F               ld   l,a
ROM1:458B 26 D9            ld   h,$D9
ROM1:458D F0 81            ldh  a,[$FF81]
ROM1:458F AE               xor  [hl]
ROM1:4590 24               inc  h
ROM1:4591 E0 80            ldh  [$FF80],a
ROM1:4593 F0 82            ldh  a,[$FF82]
ROM1:4595 AE               xor  [hl]
ROM1:4596 24               inc  h
ROM1:4597 E0 81            ldh  [$FF81],a
ROM1:4599 F0 83            ldh  a,[$FF83]
ROM1:459B AE               xor  [hl]
ROM1:459C 24               inc  h
ROM1:459D E0 82            ldh  [$FF82],a
ROM1:459F 7E               ld   a,[hl]
ROM1:45A0 E0 83            ldh  [$FF83],a
ROM1:45A2 7B               ld   a,e
ROM1:45A3 6F               ld   l,a
ROM1:45A4 F0 80            ldh  a,[$FF80]
ROM1:45A6 AD               xor  l
ROM1:45A7 6F               ld   l,a
ROM1:45A8 26 D9            ld   h,$D9
ROM1:45AA F0 81            ldh  a,[$FF81]
ROM1:45AC AE               xor  [hl]
ROM1:45AD 24               inc  h
ROM1:45AE E0 80            ldh  [$FF80],a
ROM1:45B0 F0 82            ldh  a,[$FF82]
ROM1:45B2 AE               xor  [hl]
ROM1:45B3 24               inc  h
ROM1:45B4 E0 81            ldh  [$FF81],a
ROM1:45B6 F0 83            ldh  a,[$FF83]
ROM1:45B8 AE               xor  [hl]
ROM1:45B9 24               inc  h
ROM1:45BA E0 82            ldh  [$FF82],a
ROM1:45BC 7E               ld   a,[hl]
ROM1:45BD E0 83            ldh  [$FF83],a
ROM1:45BF D1               pop  de
ROM1:45C0 7A               ld   a,d
ROM1:45C1 6F               ld   l,a
ROM1:45C2 F0 80            ldh  a,[$FF80]
ROM1:45C4 AD               xor  l
ROM1:45C5 6F               ld   l,a
ROM1:45C6 26 D9            ld   h,$D9
ROM1:45C8 F0 81            ldh  a,[$FF81]
ROM1:45CA AE               xor  [hl]
ROM1:45CB 24               inc  h
ROM1:45CC E0 80            ldh  [$FF80],a
ROM1:45CE F0 82            ldh  a,[$FF82]
ROM1:45D0 AE               xor  [hl]
ROM1:45D1 24               inc  h
ROM1:45D2 E0 81            ldh  [$FF81],a
ROM1:45D4 F0 83            ldh  a,[$FF83]
ROM1:45D6 AE               xor  [hl]
ROM1:45D7 24               inc  h
ROM1:45D8 E0 82            ldh  [$FF82],a
ROM1:45DA 7E               ld   a,[hl]
ROM1:45DB E0 83            ldh  [$FF83],a
ROM1:45DD 7B               ld   a,e
ROM1:45DE 6F               ld   l,a
ROM1:45DF F0 80            ldh  a,[$FF80]
ROM1:45E1 AD               xor  l
ROM1:45E2 6F               ld   l,a
ROM1:45E3 26 D9            ld   h,$D9
ROM1:45E5 F0 81            ldh  a,[$FF81]
ROM1:45E7 AE               xor  [hl]
ROM1:45E8 24               inc  h
ROM1:45E9 E0 80            ldh  [$FF80],a
ROM1:45EB F0 82            ldh  a,[$FF82]
ROM1:45ED AE               xor  [hl]
ROM1:45EE 24               inc  h
ROM1:45EF E0 81            ldh  [$FF81],a
ROM1:45F1 F0 83            ldh  a,[$FF83]
ROM1:45F3 AE               xor  [hl]
ROM1:45F4 24               inc  h
ROM1:45F5 E0 82            ldh  [$FF82],a
ROM1:45F7 7E               ld   a,[hl]
ROM1:45F8 E0 83            ldh  [$FF83],a
ROM1:45FA C9               ret  
ROM1:45FB 33               inc  sp
ROM1:45FC 00               nop  
ROM1:45FD 00               nop  
ROM1:45FE 3B               dec  sp
ROM1:45FF 00               nop  
ROM1:4600 00               nop  
ROM1:4601 39               add  hl,sp
ROM1:4602 00               nop  
ROM1:4603 00               nop  
ROM1:4604 F9               ld   sp,hl
ROM1:4605 00               nop  
ROM1:4606 00               nop  
ROM1:4607 E8 01            add  sp,$01
ROM1:4609 00               nop  
ROM1:460A E8 FF            add  sp,-$01
ROM1:460C 00               nop  
ROM1:460D F8 01            ld   hl,sp+$01
ROM1:460F 00               nop  
ROM1:4610 F8 FF            ld   hl,sp-$01
ROM1:4612 00               nop  
ROM1:4613 0E 00            ld   c,$00
ROM1:4615 CD 1E C6         call $C61E
ROM1:4618 0E F0            ld   c,$F0
ROM1:461A CD 1E C6         call $C61E
ROM1:461D C9               ret  
ROM1:461E 21 71 C6         ld   hl,$C671
ROM1:4621 5E               ld   e,[hl]
ROM1:4622 23               inc  hl
ROM1:4623 56               ld   d,[hl]
ROM1:4624 23               inc  hl
ROM1:4625 E5               push hl
ROM1:4626 21 71 C6         ld   hl,$C671
ROM1:4629 C5               push bc
ROM1:462A D5               push de
ROM1:462B E5               push hl
ROM1:462C C5               push bc
ROM1:462D F1               pop  af
ROM1:462E 08 00 DD         ld   [$DD00],sp
ROM1:4631 2A               ldi  a,[hl]
ROM1:4632 66               ld   h,[hl]
ROM1:4633 6F               ld   l,a
ROM1:4634 F9               ld   sp,hl
ROM1:4635 62               ld   h,d
ROM1:4636 6B               ld   l,e
ROM1:4637 3E 12            ld   a,$12
ROM1:4639 01 91 56         ld   bc,$5691
ROM1:463C 11 BC 9A         ld   de,$9ABC
ROM1:463F C3 F8 DE         jp   $DEF8
ROM1:4642 08 02 DD         ld   [$DD02],sp
ROM1:4645 31 70 DF         ld   sp,$DF70
ROM1:4648 CD 0F C5         call $C50F
ROM1:464B FA 02 DD         ld   a,[$DD02]
ROM1:464E CD 8F C4         call $C48F
ROM1:4651 FA 03 DD         ld   a,[$DD03]
ROM1:4654 CD 8F C4         call $C48F
ROM1:4657 FA 00 DD         ld   a,[$DD00]
ROM1:465A 6F               ld   l,a
ROM1:465B FA 01 DD         ld   a,[$DD01]
ROM1:465E 67               ld   h,a
ROM1:465F F9               ld   sp,hl
ROM1:4660 E1               pop  hl
ROM1:4661 D1               pop  de
ROM1:4662 C1               pop  bc
ROM1:4663 23               inc  hl
ROM1:4664 23               inc  hl
ROM1:4665 7D               ld   a,l
ROM1:4666 FE 8F            cp   a,$8F
ROM1:4668 20 BF            jr   nz,$4629
ROM1:466A E1               pop  hl
ROM1:466B 7D               ld   a,l
ROM1:466C FE 8F            cp   a,$8F
ROM1:466E 20 B1            jr   nz,$4621
ROM1:4670 C9               ret  
ROM1:4671 00               nop  
ROM1:4672 00               nop  
ROM1:4673 01 00 0F         ld   bc,$0F00
ROM1:4676 00               nop  
ROM1:4677 10 00            stop
ROM1:4679 1F               rra  
ROM1:467A 00               nop  
ROM1:467B 7F               ld   a,a
ROM1:467C 00               nop  
ROM1:467D 80               add  b
ROM1:467E 00               nop  
ROM1:467F FF               rst  $38
ROM1:4680 00               nop  
ROM1:4681 00               nop  
ROM1:4682 01 00 0F         ld   bc,$0F00
ROM1:4685 00               nop  
ROM1:4686 1F               rra  
ROM1:4687 00               nop  
ROM1:4688 10 FF            <corrupted stop>
ROM1:468A 7F               ld   a,a
ROM1:468B 00               nop  
ROM1:468C 80               add  b
ROM1:468D FF               rst  $38
ROM1:468E FF               rst  $38
ROM1:468F 00               nop  
ROM1:4690 00               nop  
ROM1:4691 01 00 0F         ld   bc,$0F00
ROM1:4694 00               nop  
ROM1:4695 10 00            stop
ROM1:4697 1F               rra  
ROM1:4698 00               nop  
ROM1:4699 7F               ld   a,a
ROM1:469A 00               nop  
ROM1:469B 80               add  b
ROM1:469C 00               nop  
ROM1:469D FF               rst  $38
ROM1:469E 00               nop  
ROM1:469F 00               nop  
ROM1:46A0 01 00 0F         ld   bc,$0F00
ROM1:46A3 00               nop  
ROM1:46A4 1F               rra  
ROM1:46A5 00               nop  
ROM1:46A6 10 FF            <corrupted stop>
ROM1:46A8 7F               ld   a,a
ROM1:46A9 00               nop  
ROM1:46AA 80               add  b
ROM1:46AB FF               rst  $38
ROM1:46AC FF               rst  $38
ROM1:46AD BC               cp   h
ROM1:46AE F4               db   $F4 ; undefined opcode
ROM1:46AF CD 8C C7         call $C78C
ROM1:46B2 5E               ld   e,[hl]
ROM1:46B3 89               adc  c
ROM1:46B4 E5               push hl
ROM1:46B5 36 65            ld   [hl],$65
ROM1:46B7 21 55 D6         ld   hl,$D655
ROM1:46BA 6A               ld   l,d
ROM1:46BB 2A               ldi  a,[hl]
ROM1:46BC FF               rst  $38
ROM1:46BD EB               db   $EB ; undefined opcode
ROM1:46BE 34               inc  [hl]
ROM1:46BF 37               scf  
ROM1:46C0 B9               cp   c
ROM1:46C1 08 5F 22         ld   [$225F],sp
ROM1:46C4 13               inc  de
ROM1:46C5 B6               or   [hl]
ROM1:46C6 2A               ldi  a,[hl]
ROM1:46C7 37               scf  
ROM1:46C8 C3 72 43         jp   $4372
ROM1:46CB 5C               ld   e,h
ROM1:46CC 4D               ld   c,l
ROM1:46CD C5               push bc
ROM1:46CE 01 1E FB         ld   bc,$FB1E
ROM1:46D1 03               inc  bc
ROM1:46D2 78               ld   a,b
ROM1:46D3 B1               or   c
ROM1:46D4 28 06            jr   z,$46DC
ROM1:46D6 F0 44            ldh  a,[$FF44]
ROM1:46D8 FE 90            cp   a,$90
ROM1:46DA 20 F5            jr   nz,$46D1
ROM1:46DC C1               pop  bc
ROM1:46DD C9               ret  
ROM1:46DE CD 81 C7         call $C781
ROM1:46E1 FA 00 D8         ld   a,[$D800]
ROM1:46E4 E6 10            and  a,$10
ROM1:46E6 C4 20 C7         call nz,$C720
ROM1:46E9 3E 20            ld   a,$20
ROM1:46EB CD 12 C7         call $C712
ROM1:46EE 21 00 82         ld   hl,$8200
ROM1:46F1 0E 00            ld   c,$00
ROM1:46F3 CD 59 C7         call $C759
ROM1:46F6 21 00 8A         ld   hl,$8A00
ROM1:46F9 0E FF            ld   c,$FF
ROM1:46FB CD 59 C7         call $C759
ROM1:46FE 3E 14            ld   a,$14
ROM1:4700 EA 1B D8         ld   [$D81B],a
ROM1:4703 3E 00            ld   a,$00
ROM1:4705 EA 1C D8         ld   [$D81C],a
ROM1:4708 3E F8            ld   a,$F8
ROM1:470A EA 1D D8         ld   [$D81D],a
ROM1:470D CD C7 C7         call $C7C7
ROM1:4710 18 5C            jr   $476E
ROM1:4712 21 00 98         ld   hl,$9800
ROM1:4715 06 04            ld   b,$04
ROM1:4717 77               ld   [hl],a
ROM1:4718 2C               inc  l
ROM1:4719 20 FC            jr   nz,$4717
ROM1:471B 24               inc  h
ROM1:471C 05               dec  b
ROM1:471D 20 F8            jr   nz,$4717
ROM1:471F C9               ret  
ROM1:4720 3E 80            ld   a,$80
ROM1:4722 E0 68            ldh  [$FF68],a
ROM1:4724 06 10            ld   b,$10
ROM1:4726 3E FF            ld   a,$FF
ROM1:4728 E0 69            ldh  [$FF69],a
ROM1:472A 3E 7F            ld   a,$7F
ROM1:472C E0 69            ldh  [$FF69],a
ROM1:472E 3E 00            ld   a,$00
ROM1:4730 E0 69            ldh  [$FF69],a
ROM1:4732 3E 00            ld   a,$00
ROM1:4734 E0 69            ldh  [$FF69],a
ROM1:4736 3E 00            ld   a,$00
ROM1:4738 E0 69            ldh  [$FF69],a
ROM1:473A 3E 00            ld   a,$00
ROM1:473C E0 69            ldh  [$FF69],a
ROM1:473E 3E 00            ld   a,$00
ROM1:4740 E0 69            ldh  [$FF69],a
ROM1:4742 3E 00            ld   a,$00
ROM1:4744 E0 69            ldh  [$FF69],a
ROM1:4746 05               dec  b
ROM1:4747 20 DD            jr   nz,$4726
ROM1:4749 3E 01            ld   a,$01
ROM1:474B EA 4F FF         ld   [$FF4F],a
ROM1:474E 3E 00            ld   a,$00
ROM1:4750 CD 12 C7         call $C712
ROM1:4753 3E 00            ld   a,$00
ROM1:4755 EA 4F FF         ld   [$FF4F],a
ROM1:4758 C9               ret  
ROM1:4759 11 0C C8         ld   de,$C80C
ROM1:475C 06 60            ld   b,$60
ROM1:475E C5               push bc
ROM1:475F 06 08            ld   b,$08
ROM1:4761 1A               ld   a,[de]
ROM1:4762 13               inc  de
ROM1:4763 A9               xor  c
ROM1:4764 22               ldi  [hl],a
ROM1:4765 22               ldi  [hl],a
ROM1:4766 05               dec  b
ROM1:4767 20 F8            jr   nz,$4761
ROM1:4769 C1               pop  bc
ROM1:476A 05               dec  b
ROM1:476B 20 F1            jr   nz,$475E
ROM1:476D C9               ret  
ROM1:476E F5               push af
ROM1:476F CD CD C6         call $C6CD
ROM1:4772 3E 91            ld   a,$91
ROM1:4774 E0 40            ldh  [$FF40],a
ROM1:4776 3E 00            ld   a,$00
ROM1:4778 E0 43            ldh  [$FF43],a
ROM1:477A 3E E4            ld   a,$E4
ROM1:477C E0 47            ldh  [$FF47],a
ROM1:477E C3 EB C7         jp   $C7EB
ROM1:4781 F5               push af
ROM1:4782 CD CD C6         call $C6CD
ROM1:4785 3E 11            ld   a,$11
ROM1:4787 E0 40            ldh  [$FF40],a
ROM1:4789 F1               pop  af
ROM1:478A C9               ret  
ROM1:478B AF               xor  a
ROM1:478C 18 02            jr   $4790
ROM1:478E 3E 80            ld   a,$80
ROM1:4790 E6 80            and  a,$80
ROM1:4792 EA 1C D8         ld   [$D81C],a
ROM1:4795 C9               ret  
ROM1:4796 F5               push af
ROM1:4797 FE 0A            cp   a,$0A
ROM1:4799 28 1D            jr   z,$47B8
ROM1:479B E5               push hl
ROM1:479C F5               push af
ROM1:479D 21 1B D8         ld   hl,$D81B
ROM1:47A0 2A               ldi  a,[hl]
ROM1:47A1 FE 07            cp   a,$07
ROM1:47A3 20 09            jr   nz,$47AE
ROM1:47A5 F1               pop  af
ROM1:47A6 FE 20            cp   a,$20
ROM1:47A8 28 0A            jr   z,$47B4
ROM1:47AA CD B7 C7         call $C7B7
ROM1:47AD F5               push af
ROM1:47AE F1               pop  af
ROM1:47AF B6               or   [hl]
ROM1:47B0 2D               dec  l
ROM1:47B1 35               dec  [hl]
ROM1:47B2 6E               ld   l,[hl]
ROM1:47B3 77               ld   [hl],a
ROM1:47B4 E1               pop  hl
ROM1:47B5 F1               pop  af
ROM1:47B6 C9               ret  
ROM1:47B7 F5               push af
ROM1:47B8 CD CD C6         call $C6CD
ROM1:47BB CD F4 C7         call $C7F4
ROM1:47BE CD C7 C7         call $C7C7
ROM1:47C1 CD F4 C7         call $C7F4
ROM1:47C4 C3 EB C7         jp   $C7EB
ROM1:47C7 C5               push bc
ROM1:47C8 E5               push hl
ROM1:47C9 FA 1D D8         ld   a,[$D81D]
ROM1:47CC C6 08            add  a,$08
ROM1:47CE EA 1D D8         ld   [$D81D],a
ROM1:47D1 3E 20            ld   a,$20
ROM1:47D3 21 1A D8         ld   hl,$D81A
ROM1:47D6 06 14            ld   b,$14
ROM1:47D8 32               ldd  [hl],a
ROM1:47D9 05               dec  b
ROM1:47DA 20 FC            jr   nz,$47D8
ROM1:47DC 3E 1B            ld   a,$1B
ROM1:47DE EA 1B D8         ld   [$D81B],a
ROM1:47E1 E1               pop  hl
ROM1:47E2 C1               pop  bc
ROM1:47E3 C9               ret  
ROM1:47E4 F5               push af
ROM1:47E5 CD CD C6         call $C6CD
ROM1:47E8 CD F4 C7         call $C7F4
ROM1:47EB FA 1D D8         ld   a,[$D81D]
ROM1:47EE D6 88            sub  a,$88
ROM1:47F0 E0 42            ldh  [$FF42],a
ROM1:47F2 F1               pop  af
ROM1:47F3 C9               ret  
ROM1:47F4 D5               push de
ROM1:47F5 E5               push hl
ROM1:47F6 FA 1D D8         ld   a,[$D81D]
ROM1:47F9 6F               ld   l,a
ROM1:47FA 26 26            ld   h,$26
ROM1:47FC 29               add  hl,hl
ROM1:47FD 29               add  hl,hl
ROM1:47FE 11 1B D8         ld   de,$D81B
ROM1:4801 1D               dec  e
ROM1:4802 1A               ld   a,[de]
ROM1:4803 22               ldi  [hl],a
ROM1:4804 7B               ld   a,e
ROM1:4805 FE 07            cp   a,$07
ROM1:4807 20 F8            jr   nz,$4801
ROM1:4809 E1               pop  hl
ROM1:480A D1               pop  de
ROM1:480B C9               ret  
ROM1:480C 00               nop  
ROM1:480D 00               nop  
ROM1:480E 00               nop  
ROM1:480F 00               nop  
ROM1:4810 00               nop  
ROM1:4811 00               nop  
ROM1:4812 00               nop  
ROM1:4813 00               nop  
ROM1:4814 18 18            jr   $482E
ROM1:4816 18 18            jr   $4830
ROM1:4818 18 00            jr   $481A
ROM1:481A 18 00            jr   $481C
ROM1:481C 6C               ld   l,h
ROM1:481D 6C               ld   l,h
ROM1:481E 6C               ld   l,h
ROM1:481F 00               nop  
ROM1:4820 00               nop  
ROM1:4821 00               nop  
ROM1:4822 00               nop  
ROM1:4823 00               nop  
ROM1:4824 6C               ld   l,h
ROM1:4825 FE 6C            cp   a,$6C
ROM1:4827 6C               ld   l,h
ROM1:4828 FE 6C            cp   a,$6C
ROM1:482A 00               nop  
ROM1:482B 00               nop  
ROM1:482C 18 3E            jr   $486C
ROM1:482E 60               ld   h,b
ROM1:482F 3C               inc  a
ROM1:4830 06 7C            ld   b,$7C
ROM1:4832 18 00            jr   $4834
ROM1:4834 66               ld   h,[hl]
ROM1:4835 6C               ld   l,h
ROM1:4836 18 30            jr   $4868
ROM1:4838 60               ld   h,b
ROM1:4839 C6 86            add  a,$86
ROM1:483B 00               nop  
ROM1:483C 1C               inc  e
ROM1:483D 36 1C            ld   [hl],$1C
ROM1:483F 38 6F            jr   c,$48B0
ROM1:4841 66               ld   h,[hl]
ROM1:4842 3B               dec  sp
ROM1:4843 00               nop  
ROM1:4844 0C               inc  c
ROM1:4845 0C               inc  c
ROM1:4846 0C               inc  c
ROM1:4847 00               nop  
ROM1:4848 00               nop  
ROM1:4849 00               nop  
ROM1:484A 00               nop  
ROM1:484B 00               nop  
ROM1:484C 0E 1C            ld   c,$1C
ROM1:484E 18 18            jr   $4868
ROM1:4850 18 1C            jr   $486E
ROM1:4852 0E 00            ld   c,$00
ROM1:4854 70               ld   [hl],b
ROM1:4855 38 18            jr   c,$486F
ROM1:4857 18 18            jr   $4871
ROM1:4859 38 70            jr   c,$48CB
ROM1:485B 00               nop  
ROM1:485C 00               nop  
ROM1:485D 66               ld   h,[hl]
ROM1:485E 3C               inc  a
ROM1:485F FF               rst  $38
ROM1:4860 3C               inc  a
ROM1:4861 66               ld   h,[hl]
ROM1:4862 00               nop  
ROM1:4863 00               nop  
ROM1:4864 00               nop  
ROM1:4865 18 18            jr   $487F
ROM1:4867 7E               ld   a,[hl]
ROM1:4868 18 18            jr   $4882
ROM1:486A 00               nop  
ROM1:486B 00               nop  
ROM1:486C 00               nop  
ROM1:486D 00               nop  
ROM1:486E 00               nop  
ROM1:486F 00               nop  
ROM1:4870 00               nop  
ROM1:4871 30 30            jr   nc,$48A3
ROM1:4873 60               ld   h,b
ROM1:4874 00               nop  
ROM1:4875 00               nop  
ROM1:4876 00               nop  
ROM1:4877 7E               ld   a,[hl]
ROM1:4878 00               nop  
ROM1:4879 00               nop  
ROM1:487A 00               nop  
ROM1:487B 00               nop  
ROM1:487C 00               nop  
ROM1:487D 00               nop  
ROM1:487E 00               nop  
ROM1:487F 00               nop  
ROM1:4880 00               nop  
ROM1:4881 60               ld   h,b
ROM1:4882 60               ld   h,b
ROM1:4883 00               nop  
ROM1:4884 02               ld   [bc],a
ROM1:4885 06 0C            ld   b,$0C
ROM1:4887 18 30            jr   $48B9
ROM1:4889 60               ld   h,b
ROM1:488A 40               ld   b,b
ROM1:488B 00               nop  
ROM1:488C 3C               inc  a
ROM1:488D 66               ld   h,[hl]
ROM1:488E 6E               ld   l,[hl]
ROM1:488F 76               halt 
ROM1:4890 66               ld   h,[hl]
ROM1:4891 66               ld   h,[hl]
ROM1:4892 3C               inc  a
ROM1:4893 00               nop  
ROM1:4894 18 38            jr   $48CE
ROM1:4896 18 18            jr   $48B0
ROM1:4898 18 18            jr   $48B2
ROM1:489A 7E               ld   a,[hl]
ROM1:489B 00               nop  
ROM1:489C 3C               inc  a
ROM1:489D 66               ld   h,[hl]
ROM1:489E 06 0C            ld   b,$0C
ROM1:48A0 18 30            jr   $48D2
ROM1:48A2 7E               ld   a,[hl]
ROM1:48A3 00               nop  
ROM1:48A4 7E               ld   a,[hl]
ROM1:48A5 0C               inc  c
ROM1:48A6 18 0C            jr   $48B4
ROM1:48A8 06 66            ld   b,$66
ROM1:48AA 3C               inc  a
ROM1:48AB 00               nop  
ROM1:48AC 0C               inc  c
ROM1:48AD 1C               inc  e
ROM1:48AE 3C               inc  a
ROM1:48AF 6C               ld   l,h
ROM1:48B0 7E               ld   a,[hl]
ROM1:48B1 0C               inc  c
ROM1:48B2 0C               inc  c
ROM1:48B3 00               nop  
ROM1:48B4 7E               ld   a,[hl]
ROM1:48B5 60               ld   h,b
ROM1:48B6 7C               ld   a,h
ROM1:48B7 06 06            ld   b,$06
ROM1:48B9 66               ld   h,[hl]
ROM1:48BA 3C               inc  a
ROM1:48BB 00               nop  
ROM1:48BC 3C               inc  a
ROM1:48BD 60               ld   h,b
ROM1:48BE 60               ld   h,b
ROM1:48BF 7C               ld   a,h
ROM1:48C0 66               ld   h,[hl]
ROM1:48C1 66               ld   h,[hl]
ROM1:48C2 3C               inc  a
ROM1:48C3 00               nop  
ROM1:48C4 7E               ld   a,[hl]
ROM1:48C5 06 0C            ld   b,$0C
ROM1:48C7 18 30            jr   $48F9
ROM1:48C9 30 30            jr   nc,$48FB
ROM1:48CB 00               nop  
ROM1:48CC 3C               inc  a
ROM1:48CD 66               ld   h,[hl]
ROM1:48CE 66               ld   h,[hl]
ROM1:48CF 3C               inc  a
ROM1:48D0 66               ld   h,[hl]
ROM1:48D1 66               ld   h,[hl]
ROM1:48D2 3C               inc  a
ROM1:48D3 00               nop  
ROM1:48D4 3C               inc  a
ROM1:48D5 66               ld   h,[hl]
ROM1:48D6 66               ld   h,[hl]
ROM1:48D7 3E 06            ld   a,$06
ROM1:48D9 0C               inc  c
ROM1:48DA 38 00            jr   c,$48DC
ROM1:48DC 00               nop  
ROM1:48DD 18 18            jr   $48F7
ROM1:48DF 00               nop  
ROM1:48E0 18 18            jr   $48FA
ROM1:48E2 00               nop  
ROM1:48E3 00               nop  
ROM1:48E4 00               nop  
ROM1:48E5 18 18            jr   $48FF
ROM1:48E7 00               nop  
ROM1:48E8 18 18            jr   $4902
ROM1:48EA 30 00            jr   nc,$48EC
ROM1:48EC 0C               inc  c
ROM1:48ED 18 30            jr   $491F
ROM1:48EF 60               ld   h,b
ROM1:48F0 30 18            jr   nc,$490A
ROM1:48F2 0C               inc  c
ROM1:48F3 00               nop  
ROM1:48F4 00               nop  
ROM1:48F5 00               nop  
ROM1:48F6 7E               ld   a,[hl]
ROM1:48F7 00               nop  
ROM1:48F8 00               nop  
ROM1:48F9 7E               ld   a,[hl]
ROM1:48FA 00               nop  
ROM1:48FB 00               nop  
ROM1:48FC 30 18            jr   nc,$4916
ROM1:48FE 0C               inc  c
ROM1:48FF 06 0C            ld   b,$0C
ROM1:4901 18 30            jr   $4933
ROM1:4903 00               nop  
ROM1:4904 3C               inc  a
ROM1:4905 66               ld   h,[hl]
ROM1:4906 06 0C            ld   b,$0C
ROM1:4908 18 00            jr   $490A
ROM1:490A 18 00            jr   $490C
ROM1:490C 3C               inc  a
ROM1:490D 66               ld   h,[hl]
ROM1:490E 6E               ld   l,[hl]
ROM1:490F 6A               ld   l,d
ROM1:4910 6E               ld   l,[hl]
ROM1:4911 60               ld   h,b
ROM1:4912 3E 00            ld   a,$00
ROM1:4914 18 3C            jr   $4952
ROM1:4916 66               ld   h,[hl]
ROM1:4917 66               ld   h,[hl]
ROM1:4918 7E               ld   a,[hl]
ROM1:4919 66               ld   h,[hl]
ROM1:491A 66               ld   h,[hl]
ROM1:491B 00               nop  
ROM1:491C 7C               ld   a,h
ROM1:491D 66               ld   h,[hl]
ROM1:491E 66               ld   h,[hl]
ROM1:491F 7C               ld   a,h
ROM1:4920 66               ld   h,[hl]
ROM1:4921 66               ld   h,[hl]
ROM1:4922 7C               ld   a,h
ROM1:4923 00               nop  
ROM1:4924 3C               inc  a
ROM1:4925 66               ld   h,[hl]
ROM1:4926 60               ld   h,b
ROM1:4927 60               ld   h,b
ROM1:4928 60               ld   h,b
ROM1:4929 66               ld   h,[hl]
ROM1:492A 3C               inc  a
ROM1:492B 00               nop  
ROM1:492C 78               ld   a,b
ROM1:492D 6C               ld   l,h
ROM1:492E 66               ld   h,[hl]
ROM1:492F 66               ld   h,[hl]
ROM1:4930 66               ld   h,[hl]
ROM1:4931 6C               ld   l,h
ROM1:4932 78               ld   a,b
ROM1:4933 00               nop  
ROM1:4934 7E               ld   a,[hl]
ROM1:4935 60               ld   h,b
ROM1:4936 60               ld   h,b
ROM1:4937 7C               ld   a,h
ROM1:4938 60               ld   h,b
ROM1:4939 60               ld   h,b
ROM1:493A 7E               ld   a,[hl]
ROM1:493B 00               nop  
ROM1:493C 7E               ld   a,[hl]
ROM1:493D 60               ld   h,b
ROM1:493E 60               ld   h,b
ROM1:493F 7C               ld   a,h
ROM1:4940 60               ld   h,b
ROM1:4941 60               ld   h,b
ROM1:4942 60               ld   h,b
ROM1:4943 00               nop  
ROM1:4944 3E 60            ld   a,$60
ROM1:4946 60               ld   h,b
ROM1:4947 6E               ld   l,[hl]
ROM1:4948 66               ld   h,[hl]
ROM1:4949 66               ld   h,[hl]
ROM1:494A 3E 00            ld   a,$00
ROM1:494C 66               ld   h,[hl]
ROM1:494D 66               ld   h,[hl]
ROM1:494E 66               ld   h,[hl]
ROM1:494F 7E               ld   a,[hl]
ROM1:4950 66               ld   h,[hl]
ROM1:4951 66               ld   h,[hl]
ROM1:4952 66               ld   h,[hl]
ROM1:4953 00               nop  
ROM1:4954 3C               inc  a
ROM1:4955 18 18            jr   $496F
ROM1:4957 18 18            jr   $4971
ROM1:4959 18 3C            jr   $4997
ROM1:495B 00               nop  
ROM1:495C 06 06            ld   b,$06
ROM1:495E 06 06            ld   b,$06
ROM1:4960 06 66            ld   b,$66
ROM1:4962 3C               inc  a
ROM1:4963 00               nop  
ROM1:4964 66               ld   h,[hl]
ROM1:4965 6C               ld   l,h
ROM1:4966 78               ld   a,b
ROM1:4967 70               ld   [hl],b
ROM1:4968 78               ld   a,b
ROM1:4969 6C               ld   l,h
ROM1:496A 66               ld   h,[hl]
ROM1:496B 00               nop  
ROM1:496C 60               ld   h,b
ROM1:496D 60               ld   h,b
ROM1:496E 60               ld   h,b
ROM1:496F 60               ld   h,b
ROM1:4970 60               ld   h,b
ROM1:4971 60               ld   h,b
ROM1:4972 7E               ld   a,[hl]
ROM1:4973 00               nop  
ROM1:4974 C6 EE            add  a,$EE
ROM1:4976 FE D6            cp   a,$D6
ROM1:4978 C6 C6            add  a,$C6
ROM1:497A C6 00            add  a,$00
ROM1:497C 66               ld   h,[hl]
ROM1:497D 76               halt 
ROM1:497E 7E               ld   a,[hl]
ROM1:497F 7E               ld   a,[hl]
ROM1:4980 6E               ld   l,[hl]
ROM1:4981 66               ld   h,[hl]
ROM1:4982 66               ld   h,[hl]
ROM1:4983 00               nop  
ROM1:4984 3C               inc  a
ROM1:4985 66               ld   h,[hl]
ROM1:4986 66               ld   h,[hl]
ROM1:4987 66               ld   h,[hl]
ROM1:4988 66               ld   h,[hl]
ROM1:4989 66               ld   h,[hl]
ROM1:498A 3C               inc  a
ROM1:498B 00               nop  
ROM1:498C 7C               ld   a,h
ROM1:498D 66               ld   h,[hl]
ROM1:498E 66               ld   h,[hl]
ROM1:498F 7C               ld   a,h
ROM1:4990 60               ld   h,b
ROM1:4991 60               ld   h,b
ROM1:4992 60               ld   h,b
ROM1:4993 00               nop  
ROM1:4994 3C               inc  a
ROM1:4995 66               ld   h,[hl]
ROM1:4996 66               ld   h,[hl]
ROM1:4997 66               ld   h,[hl]
ROM1:4998 76               halt 
ROM1:4999 6C               ld   l,h
ROM1:499A 36 00            ld   [hl],$00
ROM1:499C 7C               ld   a,h
ROM1:499D 66               ld   h,[hl]
ROM1:499E 66               ld   h,[hl]
ROM1:499F 7C               ld   a,h
ROM1:49A0 6C               ld   l,h
ROM1:49A1 66               ld   h,[hl]
ROM1:49A2 66               ld   h,[hl]
ROM1:49A3 00               nop  
ROM1:49A4 3C               inc  a
ROM1:49A5 66               ld   h,[hl]
ROM1:49A6 60               ld   h,b
ROM1:49A7 3C               inc  a
ROM1:49A8 06 66            ld   b,$66
ROM1:49AA 3C               inc  a
ROM1:49AB 00               nop  
ROM1:49AC 7E               ld   a,[hl]
ROM1:49AD 18 18            jr   $49C7
ROM1:49AF 18 18            jr   $49C9
ROM1:49B1 18 18            jr   $49CB
ROM1:49B3 00               nop  
ROM1:49B4 66               ld   h,[hl]
ROM1:49B5 66               ld   h,[hl]
ROM1:49B6 66               ld   h,[hl]
ROM1:49B7 66               ld   h,[hl]
ROM1:49B8 66               ld   h,[hl]
ROM1:49B9 66               ld   h,[hl]
ROM1:49BA 3E 00            ld   a,$00
ROM1:49BC 66               ld   h,[hl]
ROM1:49BD 66               ld   h,[hl]
ROM1:49BE 66               ld   h,[hl]
ROM1:49BF 66               ld   h,[hl]
ROM1:49C0 3C               inc  a
ROM1:49C1 3C               inc  a
ROM1:49C2 18 00            jr   $49C4
ROM1:49C4 C6 C6            add  a,$C6
ROM1:49C6 C6 D6            add  a,$D6
ROM1:49C8 FE EE            cp   a,$EE
ROM1:49CA C6 00            add  a,$00
ROM1:49CC 66               ld   h,[hl]
ROM1:49CD 66               ld   h,[hl]
ROM1:49CE 3C               inc  a
ROM1:49CF 18 3C            jr   $4A0D
ROM1:49D1 66               ld   h,[hl]
ROM1:49D2 66               ld   h,[hl]
ROM1:49D3 00               nop  
ROM1:49D4 66               ld   h,[hl]
ROM1:49D5 66               ld   h,[hl]
ROM1:49D6 66               ld   h,[hl]
ROM1:49D7 3C               inc  a
ROM1:49D8 18 18            jr   $49F2
ROM1:49DA 18 00            jr   $49DC
ROM1:49DC 7E               ld   a,[hl]
ROM1:49DD 06 0C            ld   b,$0C
ROM1:49DF 18 30            jr   $4A11
ROM1:49E1 60               ld   h,b
ROM1:49E2 7E               ld   a,[hl]
ROM1:49E3 00               nop  
ROM1:49E4 1E 18            ld   e,$18
ROM1:49E6 18 18            jr   $4A00
ROM1:49E8 18 18            jr   $4A02
ROM1:49EA 1E 00            ld   e,$00
ROM1:49EC 40               ld   b,b
ROM1:49ED 60               ld   h,b
ROM1:49EE 30 18            jr   nc,$4A08
ROM1:49F0 0C               inc  c
ROM1:49F1 06 02            ld   b,$02
ROM1:49F3 00               nop  
ROM1:49F4 78               ld   a,b
ROM1:49F5 18 18            jr   $4A0F
ROM1:49F7 18 18            jr   $4A11
ROM1:49F9 18 78            jr   $4A73
ROM1:49FB 00               nop  
ROM1:49FC 10 38            <corrupted stop>
ROM1:49FE 6C               ld   l,h
ROM1:49FF C6 00            add  a,$00 
ROM1:4A0B FE C0            cp   a,$C0
ROM1:4A0D 60               ld   h,b
ROM1:4A0E 30 00            jr   nc,$4A10 
ROM1:4A16 3C               inc  a
ROM1:4A17 06 3E            ld   b,$3E
ROM1:4A19 66               ld   h,[hl]
ROM1:4A1A 3E 00            ld   a,$00
ROM1:4A1C 60               ld   h,b
ROM1:4A1D 60               ld   h,b
ROM1:4A1E 7C               ld   a,h
ROM1:4A1F 66               ld   h,[hl]
ROM1:4A20 66               ld   h,[hl]
ROM1:4A21 66               ld   h,[hl]
ROM1:4A22 7C               ld   a,h
ROM1:4A23 00               nop  
ROM1:4A24 00               nop  
ROM1:4A25 00               nop  
ROM1:4A26 3C               inc  a
ROM1:4A27 60               ld   h,b
ROM1:4A28 60               ld   h,b
ROM1:4A29 60               ld   h,b
ROM1:4A2A 3C               inc  a
ROM1:4A2B 00               nop  
ROM1:4A2C 06 06            ld   b,$06
ROM1:4A2E 3E 66            ld   a,$66
ROM1:4A30 66               ld   h,[hl]
ROM1:4A31 66               ld   h,[hl]
ROM1:4A32 3E 00            ld   a,$00
ROM1:4A34 00               nop  
ROM1:4A35 00               nop  
ROM1:4A36 3C               inc  a
ROM1:4A37 66               ld   h,[hl]
ROM1:4A38 7E               ld   a,[hl]
ROM1:4A39 60               ld   h,b
ROM1:4A3A 3C               inc  a
ROM1:4A3B 00               nop  
ROM1:4A3C 1C               inc  e
ROM1:4A3D 30 7C            jr   nc,$4ABB
ROM1:4A3F 30 30            jr   nc,$4A71
ROM1:4A41 30 30            jr   nc,$4A73
ROM1:4A43 00               nop  
ROM1:4A44 00               nop  
ROM1:4A45 00               nop  
ROM1:4A46 3E 66            ld   a,$66
ROM1:4A48 66               ld   h,[hl]
ROM1:4A49 3E 06            ld   a,$06
ROM1:4A4B 7C               ld   a,h
ROM1:4A4C 60               ld   h,b
ROM1:4A4D 60               ld   h,b
ROM1:4A4E 7C               ld   a,h
ROM1:4A4F 66               ld   h,[hl]
ROM1:4A50 66               ld   h,[hl]
ROM1:4A51 66               ld   h,[hl]
ROM1:4A52 66               ld   h,[hl]
ROM1:4A53 00               nop  
ROM1:4A54 18 00            jr   $4A56
ROM1:4A56 38 18            jr   c,$4A70
ROM1:4A58 18 18            jr   $4A72
ROM1:4A5A 3C               inc  a
ROM1:4A5B 00               nop  
ROM1:4A5C 18 00            jr   $4A5E
ROM1:4A5E 18 18            jr   $4A78
ROM1:4A60 18 18            jr   $4A7A
ROM1:4A62 18 70            jr   $4AD4
ROM1:4A64 60               ld   h,b
ROM1:4A65 60               ld   h,b
ROM1:4A66 66               ld   h,[hl]
ROM1:4A67 6C               ld   l,h
ROM1:4A68 78               ld   a,b
ROM1:4A69 6C               ld   l,h
ROM1:4A6A 66               ld   h,[hl]
ROM1:4A6B 00               nop  
ROM1:4A6C 38 18            jr   c,$4A86
ROM1:4A6E 18 18            jr   $4A88
ROM1:4A70 18 18            jr   $4A8A
ROM1:4A72 3C               inc  a
ROM1:4A73 00               nop  
ROM1:4A74 00               nop  
ROM1:4A75 00               nop  
ROM1:4A76 EC               db   $EC ; undefined opcode
ROM1:4A77 FE D6            cp   a,$D6
ROM1:4A79 C6 C6            add  a,$C6
ROM1:4A7B 00               nop  
ROM1:4A7C 00               nop  
ROM1:4A7D 00               nop  
ROM1:4A7E 7C               ld   a,h
ROM1:4A7F 66               ld   h,[hl]
ROM1:4A80 66               ld   h,[hl]
ROM1:4A81 66               ld   h,[hl]
ROM1:4A82 66               ld   h,[hl]
ROM1:4A83 00               nop  
ROM1:4A84 00               nop  
ROM1:4A85 00               nop  
ROM1:4A86 3C               inc  a
ROM1:4A87 66               ld   h,[hl]
ROM1:4A88 66               ld   h,[hl]
ROM1:4A89 66               ld   h,[hl]
ROM1:4A8A 3C               inc  a
ROM1:4A8B 00               nop  
ROM1:4A8C 00               nop  
ROM1:4A8D 00               nop  
ROM1:4A8E 7C               ld   a,h
ROM1:4A8F 66               ld   h,[hl]
ROM1:4A90 66               ld   h,[hl]
ROM1:4A91 66               ld   h,[hl]
ROM1:4A92 7C               ld   a,h
ROM1:4A93 60               ld   h,b
ROM1:4A94 00               nop  
ROM1:4A95 00               nop  
ROM1:4A96 3E 66            ld   a,$66
ROM1:4A98 66               ld   h,[hl]
ROM1:4A99 66               ld   h,[hl]
ROM1:4A9A 3E 06            ld   a,$06
ROM1:4A9C 00               nop  
ROM1:4A9D 00               nop  
ROM1:4A9E 7C               ld   a,h
ROM1:4A9F 66               ld   h,[hl]
ROM1:4AA0 60               ld   h,b
ROM1:4AA1 60               ld   h,b
ROM1:4AA2 60               ld   h,b
ROM1:4AA3 00               nop  
ROM1:4AA4 00               nop  
ROM1:4AA5 00               nop  
ROM1:4AA6 3E 60            ld   a,$60
ROM1:4AA8 3C               inc  a
ROM1:4AA9 06 7C            ld   b,$7C
ROM1:4AAB 00               nop  
ROM1:4AAC 00               nop  
ROM1:4AAD 18 7E            jr   $4B2D
ROM1:4AAF 18 18            jr   $4AC9
ROM1:4AB1 18 0E            jr   $4AC1
ROM1:4AB3 00               nop  
ROM1:4AB4 00               nop  
ROM1:4AB5 00               nop  
ROM1:4AB6 66               ld   h,[hl]
ROM1:4AB7 66               ld   h,[hl]
ROM1:4AB8 66               ld   h,[hl]
ROM1:4AB9 66               ld   h,[hl]
ROM1:4ABA 3E 00            ld   a,$00
ROM1:4ABC 00               nop  
ROM1:4ABD 00               nop  
ROM1:4ABE 66               ld   h,[hl]
ROM1:4ABF 66               ld   h,[hl]
ROM1:4AC0 66               ld   h,[hl]
ROM1:4AC1 3C               inc  a
ROM1:4AC2 18 00            jr   $4AC4
ROM1:4AC4 00               nop  
ROM1:4AC5 00               nop  
ROM1:4AC6 C6 C6            add  a,$C6
ROM1:4AC8 D6 7C            sub  a,$7C
ROM1:4ACA 6C               ld   l,h
ROM1:4ACB 00               nop  
ROM1:4ACC 00               nop  
ROM1:4ACD 00               nop  
ROM1:4ACE 66               ld   h,[hl]
ROM1:4ACF 3C               inc  a
ROM1:4AD0 18 3C            jr   $4B0E
ROM1:4AD2 66               ld   h,[hl]
ROM1:4AD3 00               nop  
ROM1:4AD4 00               nop  
ROM1:4AD5 00               nop  
ROM1:4AD6 66               ld   h,[hl]
ROM1:4AD7 66               ld   h,[hl]
ROM1:4AD8 66               ld   h,[hl]
ROM1:4AD9 3E 06            ld   a,$06
ROM1:4ADB 7C               ld   a,h
ROM1:4ADC 00               nop  
ROM1:4ADD 00               nop  
ROM1:4ADE 7E               ld   a,[hl]
ROM1:4ADF 0C               inc  c
ROM1:4AE0 18 30            jr   $4B12
ROM1:4AE2 7E               ld   a,[hl]
ROM1:4AE3 00               nop  
ROM1:4AE4 0E 18            ld   c,$18
ROM1:4AE6 18 30            jr   $4B18
ROM1:4AE8 18 18            jr   $4B02
ROM1:4AEA 0E 00            ld   c,$00
ROM1:4AEC 18 18            jr   $4B06
ROM1:4AEE 18 18            jr   $4B08
ROM1:4AF0 18 18            jr   $4B0A
ROM1:4AF2 18 00            jr   $4AF4
ROM1:4AF4 70               ld   [hl],b
ROM1:4AF5 18 18            jr   $4B0F
ROM1:4AF7 0C               inc  c
ROM1:4AF8 18 18            jr   $4B12
ROM1:4AFA 70               ld   [hl],b
ROM1:4AFB 00               nop  
ROM1:4AFC 00               nop  
ROM1:4AFD 00               nop  
ROM1:4AFE 60               ld   h,b
ROM1:4AFF F2               ld   a,[$ff00+c]
ROM1:4B00 9E               sbc  [hl]
ROM1:4B01 0C               inc  c
ROM1:4B02 00               nop  
ROM1:4B03 00               nop  
ROM1:4B04 00               nop  
ROM1:4B05 00               nop  
ROM1:4B06 00               nop  
ROM1:4B07 00               nop  
ROM1:4B08 00               nop  
ROM1:4B09 00               nop  
ROM1:4B0A 00               nop  
ROM1:4B0B 00               nop  
ROM1:4B0C CD DE C6         call $C6DE
ROM1:4B0F E5               push hl
ROM1:4B10 CD C2 C0         call $C0C2
ROM1:4B13 30 33            jr   nc,$4B48
ROM1:4B15 2D               dec  l
ROM1:4B16 6F               ld   l,a
ROM1:4B17 70               ld   [hl],b
ROM1:4B18 20 73            jr   nz,$4B8D
ROM1:4B1A 70               ld   [hl],b
ROM1:4B1B 2C               inc  l
ROM1:4B1C 68               ld   l,b
ROM1:4B1D 6C               ld   l,h
ROM1:4B1E 0A               ld   a,[bc]
ROM1:4B1F 0A               ld   a,[bc]
ROM1:4B20 00               nop  
ROM1:4B21 E1               pop  hl
ROM1:4B22 C9               ret  
ROM1:4B23 F5               push af
ROM1:4B24 E0 01            ldh  [$FF01],a
ROM1:4B26 3E 81            ld   a,$81
ROM1:4B28 E0 02            ldh  [$FF02],a
ROM1:4B2A F5               push af
ROM1:4B2B 3E 08            ld   a,$08
ROM1:4B2D CD 12 C0         call $C012
ROM1:4B30 3E D8            ld   a,$D8
ROM1:4B32 CD 03 C0         call $C003
ROM1:4B35 F1               pop  af
ROM1:4B36 F1               pop  af
ROM1:4B37 C3 96 C7         jp   $C796
ROM1:4B3A CD 6E C7         call $C76E
ROM1:4B3D CD 46 CB         call $CB46
ROM1:4B40 3E 00            ld   a,$00
ROM1:4B42 E0 26            ldh  [$FF26],a
ROM1:4B44 18 FE            jr   $4B44
ROM1:4B46 C9               ret  
VRA0:8000 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8010 F0 00 F0 00+     db   $F0,$00,$F0,$00,$FC,$00,$FC,$00,$FC,$00,$FC,$00,$F3,$00,$F3,$00
VRA0:8020 3C 00 3C 00+     db   $3C,$00,$3C,$00,$3C,$00,$3C,$00,$3C,$00,$3C,$00,$3C,$00,$3C,$00
VRA0:8030 F0 00 F0 00+     db   $F0,$00,$F0,$00,$F0,$00,$F0,$00,$00,$00,$00,$00,$F3,$00,$F3,$00
VRA0:8040 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$CF,$00,$CF,$00
VRA0:8050 00 00 00 00+     db   $00,$00,$00,$00,$0F,$00,$0F,$00,$3F,$00,$3F,$00,$0F,$00,$0F,$00
VRA0:8060 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$C0,$00,$C0,$00,$0F,$00,$0F,$00
VRA0:8070 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F0,$00,$F0,$00
VRA0:8080 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F3,$00,$F3,$00
VRA0:8090 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C0,$00,$C0,$00
VRA0:80A0 03 00 03 00+     db   $03,$00,$03,$00,$03,$00,$03,$00,$03,$00,$03,$00,$FF,$00,$FF,$00
VRA0:80B0 C0 00 C0 00+     db   $C0,$00,$C0,$00,$C0,$00,$C0,$00,$C0,$00,$C0,$00,$C3,$00,$C3,$00
VRA0:80C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FC,$00,$FC,$00
VRA0:80D0 F3 00 F3 00+     db   $F3,$00,$F3,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$00
VRA0:80E0 3C 00 3C 00+     db   $3C,$00,$3C,$00,$FC,$00,$FC,$00,$FC,$00,$FC,$00,$3C,$00,$3C,$00
VRA0:80F0 F3 00 F3 00+     db   $F3,$00,$F3,$00,$F3,$00,$F3,$00,$F3,$00,$F3,$00,$F3,$00,$F3,$00
VRA0:8100 F3 00 F3 00+     db   $F3,$00,$F3,$00,$C3,$00,$C3,$00,$C3,$00,$C3,$00,$C3,$00,$C3,$00
VRA0:8110 CF 00 CF 00+     db   $CF,$00,$CF,$00,$CF,$00,$CF,$00,$CF,$00,$CF,$00,$CF,$00,$CF,$00
VRA0:8120 3C 00 3C 00+     db   $3C,$00,$3C,$00,$3F,$00,$3F,$00,$3C,$00,$3C,$00,$0F,$00,$0F,$00
VRA0:8130 3C 00 3C 00+     db   $3C,$00,$3C,$00,$FC,$00,$FC,$00,$00,$00,$00,$00,$FC,$00,$FC,$00
VRA0:8140 FC 00 FC 00+     db   $FC,$00,$FC,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$00
VRA0:8150 F3 00 F3 00+     db   $F3,$00,$F3,$00,$F3,$00,$F3,$00,$F3,$00,$F3,$00,$F0,$00,$F0,$00
VRA0:8160 C3 00 C3 00+     db   $C3,$00,$C3,$00,$C3,$00,$C3,$00,$C3,$00,$C3,$00,$FF,$00,$FF,$00
VRA0:8170 CF 00 CF 00+     db   $CF,$00,$CF,$00,$CF,$00,$CF,$00,$CF,$00,$CF,$00,$C3,$00,$C3,$00
VRA0:8180 0F 00 0F 00+     db   $0F,$00,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$0F,$00,$FC,$00,$FC,$00
VRA0:8190 3C 00 42 00+     db   $3C,$00,$42,$00,$B9,$00,$A5,$00,$B9,$00,$A5,$00,$42,$00,$3C,$00
VRA0:81A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:81B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:81C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:81D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:81E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:81F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8200 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8210 18 18 18 18+     db   $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$00,$00,$18,$18,$00,$00
VRA0:8220 6C 6C 6C 6C+     db   $6C,$6C,$6C,$6C,$6C,$6C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8230 6C 6C FE FE+     db   $6C,$6C,$FE,$FE,$6C,$6C,$6C,$6C,$FE,$FE,$6C,$6C,$00,$00,$00,$00
VRA0:8240 18 18 3E 3E+     db   $18,$18,$3E,$3E,$60,$60,$3C,$3C,$06,$06,$7C,$7C,$18,$18,$00,$00
VRA0:8250 66 66 6C 6C+     db   $66,$66,$6C,$6C,$18,$18,$30,$30,$60,$60,$C6,$C6,$86,$86,$00,$00
VRA0:8260 1C 1C 36 36+     db   $1C,$1C,$36,$36,$1C,$1C,$38,$38,$6F,$6F,$66,$66,$3B,$3B,$00,$00
VRA0:8270 0C 0C 0C 0C+     db   $0C,$0C,$0C,$0C,$0C,$0C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8280 0E 0E 1C 1C+     db   $0E,$0E,$1C,$1C,$18,$18,$18,$18,$18,$18,$1C,$1C,$0E,$0E,$00,$00
VRA0:8290 70 70 38 38+     db   $70,$70,$38,$38,$18,$18,$18,$18,$18,$18,$38,$38,$70,$70,$00,$00
VRA0:82A0 00 00 66 66+     db   $00,$00,$66,$66,$3C,$3C,$FF,$FF,$3C,$3C,$66,$66,$00,$00,$00,$00
VRA0:82B0 00 00 18 18+     db   $00,$00,$18,$18,$18,$18,$7E,$7E,$18,$18,$18,$18,$00,$00,$00,$00
VRA0:82C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$30,$30,$30,$30,$60,$60
VRA0:82D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$7E,$7E,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:82E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$60,$60,$60,$60,$00,$00
VRA0:82F0 02 02 06 06+     db   $02,$02,$06,$06,$0C,$0C,$18,$18,$30,$30,$60,$60,$40,$40,$00,$00
VRA0:8300 3C 3C 66 66+     db   $3C,$3C,$66,$66,$6E,$6E,$76,$76,$66,$66,$66,$66,$3C,$3C,$00,$00
VRA0:8310 18 18 38 38+     db   $18,$18,$38,$38,$18,$18,$18,$18,$18,$18,$18,$18,$7E,$7E,$00,$00
VRA0:8320 3C 3C 66 66+     db   $3C,$3C,$66,$66,$06,$06,$0C,$0C,$18,$18,$30,$30,$7E,$7E,$00,$00
VRA0:8330 7E 7E 0C 0C+     db   $7E,$7E,$0C,$0C,$18,$18,$0C,$0C,$06,$06,$66,$66,$3C,$3C,$00,$00
VRA0:8340 0C 0C 1C 1C+     db   $0C,$0C,$1C,$1C,$3C,$3C,$6C,$6C,$7E,$7E,$0C,$0C,$0C,$0C,$00,$00
VRA0:8350 7E 7E 60 60+     db   $7E,$7E,$60,$60,$7C,$7C,$06,$06,$06,$06,$66,$66,$3C,$3C,$00,$00
VRA0:8360 3C 3C 60 60+     db   $3C,$3C,$60,$60,$60,$60,$7C,$7C,$66,$66,$66,$66,$3C,$3C,$00,$00
VRA0:8370 7E 7E 06 06+     db   $7E,$7E,$06,$06,$0C,$0C,$18,$18,$30,$30,$30,$30,$30,$30,$00,$00
VRA0:8380 3C 3C 66 66+     db   $3C,$3C,$66,$66,$66,$66,$3C,$3C,$66,$66,$66,$66,$3C,$3C,$00,$00
VRA0:8390 3C 3C 66 66+     db   $3C,$3C,$66,$66,$66,$66,$3E,$3E,$06,$06,$0C,$0C,$38,$38,$00,$00
VRA0:83A0 00 00 18 18+     db   $00,$00,$18,$18,$18,$18,$00,$00,$18,$18,$18,$18,$00,$00,$00,$00
VRA0:83B0 00 00 18 18+     db   $00,$00,$18,$18,$18,$18,$00,$00,$18,$18,$18,$18,$30,$30,$00,$00
VRA0:83C0 0C 0C 18 18+     db   $0C,$0C,$18,$18,$30,$30,$60,$60,$30,$30,$18,$18,$0C,$0C,$00,$00
VRA0:83D0 00 00 00 00+     db   $00,$00,$00,$00,$7E,$7E,$00,$00,$00,$00,$7E,$7E,$00,$00,$00,$00
VRA0:83E0 30 30 18 18+     db   $30,$30,$18,$18,$0C,$0C,$06,$06,$0C,$0C,$18,$18,$30,$30,$00,$00
VRA0:83F0 3C 3C 66 66+     db   $3C,$3C,$66,$66,$06,$06,$0C,$0C,$18,$18,$00,$00,$18,$18,$00,$00
VRA0:8400 3C 3C 66 66+     db   $3C,$3C,$66,$66,$6E,$6E,$6A,$6A,$6E,$6E,$60,$60,$3E,$3E,$00,$00
VRA0:8410 18 18 3C 3C+     db   $18,$18,$3C,$3C,$66,$66,$66,$66,$7E,$7E,$66,$66,$66,$66,$00,$00
VRA0:8420 7C 7C 66 66+     db   $7C,$7C,$66,$66,$66,$66,$7C,$7C,$66,$66,$66,$66,$7C,$7C,$00,$00
VRA0:8430 3C 3C 66 66+     db   $3C,$3C,$66,$66,$60,$60,$60,$60,$60,$60,$66,$66,$3C,$3C,$00,$00
VRA0:8440 78 78 6C 6C+     db   $78,$78,$6C,$6C,$66,$66,$66,$66,$66,$66,$6C,$6C,$78,$78,$00,$00
VRA0:8450 7E 7E 60 60+     db   $7E,$7E,$60,$60,$60,$60,$7C,$7C,$60,$60,$60,$60,$7E,$7E,$00,$00
VRA0:8460 7E 7E 60 60+     db   $7E,$7E,$60,$60,$60,$60,$7C,$7C,$60,$60,$60,$60,$60,$60,$00,$00
VRA0:8470 3E 3E 60 60+     db   $3E,$3E,$60,$60,$60,$60,$6E,$6E,$66,$66,$66,$66,$3E,$3E,$00,$00
VRA0:8480 66 66 66 66+     db   $66,$66,$66,$66,$66,$66,$7E,$7E,$66,$66,$66,$66,$66,$66,$00,$00
VRA0:8490 3C 3C 18 18+     db   $3C,$3C,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$3C,$3C,$00,$00
VRA0:84A0 06 06 06 06+     db   $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$66,$66,$3C,$3C,$00,$00
VRA0:84B0 66 66 6C 6C+     db   $66,$66,$6C,$6C,$78,$78,$70,$70,$78,$78,$6C,$6C,$66,$66,$00,$00
VRA0:84C0 60 60 60 60+     db   $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$7E,$7E,$00,$00
VRA0:84D0 C6 C6 EE EE+     db   $C6,$C6,$EE,$EE,$FE,$FE,$D6,$D6,$C6,$C6,$C6,$C6,$C6,$C6,$00,$00
VRA0:84E0 66 66 76 76+     db   $66,$66,$76,$76,$7E,$7E,$7E,$7E,$6E,$6E,$66,$66,$66,$66,$00,$00
VRA0:84F0 3C 3C 66 66+     db   $3C,$3C,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$3C,$3C,$00,$00
VRA0:8500 7C 7C 66 66+     db   $7C,$7C,$66,$66,$66,$66,$7C,$7C,$60,$60,$60,$60,$60,$60,$00,$00
VRA0:8510 3C 3C 66 66+     db   $3C,$3C,$66,$66,$66,$66,$66,$66,$76,$76,$6C,$6C,$36,$36,$00,$00
VRA0:8520 7C 7C 66 66+     db   $7C,$7C,$66,$66,$66,$66,$7C,$7C,$6C,$6C,$66,$66,$66,$66,$00,$00
VRA0:8530 3C 3C 66 66+     db   $3C,$3C,$66,$66,$60,$60,$3C,$3C,$06,$06,$66,$66,$3C,$3C,$00,$00
VRA0:8540 7E 7E 18 18+     db   $7E,$7E,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$00,$00
VRA0:8550 66 66 66 66+     db   $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$3E,$3E,$00,$00
VRA0:8560 66 66 66 66+     db   $66,$66,$66,$66,$66,$66,$66,$66,$3C,$3C,$3C,$3C,$18,$18,$00,$00
VRA0:8570 C6 C6 C6 C6+     db   $C6,$C6,$C6,$C6,$C6,$C6,$D6,$D6,$FE,$FE,$EE,$EE,$C6,$C6,$00,$00
VRA0:8580 66 66 66 66+     db   $66,$66,$66,$66,$3C,$3C,$18,$18,$3C,$3C,$66,$66,$66,$66,$00,$00
VRA0:8590 66 66 66 66+     db   $66,$66,$66,$66,$66,$66,$3C,$3C,$18,$18,$18,$18,$18,$18,$00,$00
VRA0:85A0 7E 7E 06 06+     db   $7E,$7E,$06,$06,$0C,$0C,$18,$18,$30,$30,$60,$60,$7E,$7E,$00,$00
VRA0:85B0 1E 1E 18 18+     db   $1E,$1E,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$1E,$1E,$00,$00
VRA0:85C0 40 40 60 60+     db   $40,$40,$60,$60,$30,$30,$18,$18,$0C,$0C,$06,$06,$02,$02,$00,$00
VRA0:85D0 78 78 18 18+     db   $78,$78,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$78,$78,$00,$00
VRA0:85E0 10 10 38 38+     db   $10,$10,$38,$38,$6C,$6C,$C6,$C6,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:85F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FE,$FE
VRA0:8600 C0 C0 60 60+     db   $C0,$C0,$60,$60,$30,$30,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8610 00 00 00 00+     db   $00,$00,$00,$00,$3C,$3C,$06,$06,$3E,$3E,$66,$66,$3E,$3E,$00,$00
VRA0:8620 60 60 60 60+     db   $60,$60,$60,$60,$7C,$7C,$66,$66,$66,$66,$66,$66,$7C,$7C,$00,$00
VRA0:8630 00 00 00 00+     db   $00,$00,$00,$00,$3C,$3C,$60,$60,$60,$60,$60,$60,$3C,$3C,$00,$00
VRA0:8640 06 06 06 06+     db   $06,$06,$06,$06,$3E,$3E,$66,$66,$66,$66,$66,$66,$3E,$3E,$00,$00
VRA0:8650 00 00 00 00+     db   $00,$00,$00,$00,$3C,$3C,$66,$66,$7E,$7E,$60,$60,$3C,$3C,$00,$00
VRA0:8660 1C 1C 30 30+     db   $1C,$1C,$30,$30,$7C,$7C,$30,$30,$30,$30,$30,$30,$30,$30,$00,$00
VRA0:8670 00 00 00 00+     db   $00,$00,$00,$00,$3E,$3E,$66,$66,$66,$66,$3E,$3E,$06,$06,$7C,$7C
VRA0:8680 60 60 60 60+     db   $60,$60,$60,$60,$7C,$7C,$66,$66,$66,$66,$66,$66,$66,$66,$00,$00
VRA0:8690 18 18 00 00+     db   $18,$18,$00,$00,$38,$38,$18,$18,$18,$18,$18,$18,$3C,$3C,$00,$00
VRA0:86A0 18 18 00 00+     db   $18,$18,$00,$00,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$70,$70
VRA0:86B0 60 60 60 60+     db   $60,$60,$60,$60,$66,$66,$6C,$6C,$78,$78,$6C,$6C,$66,$66,$00,$00
VRA0:86C0 38 38 18 18+     db   $38,$38,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$3C,$3C,$00,$00
VRA0:86D0 00 00 00 00+     db   $00,$00,$00,$00,$EC,$EC,$FE,$FE,$D6,$D6,$C6,$C6,$C6,$C6,$00,$00
VRA0:86E0 00 00 00 00+     db   $00,$00,$00,$00,$7C,$7C,$66,$66,$66,$66,$66,$66,$66,$66,$00,$00
VRA0:86F0 00 00 00 00+     db   $00,$00,$00,$00,$3C,$3C,$66,$66,$66,$66,$66,$66,$3C,$3C,$00,$00
VRA0:8700 00 00 00 00+     db   $00,$00,$00,$00,$7C,$7C,$66,$66,$66,$66,$66,$66,$7C,$7C,$60,$60
VRA0:8710 00 00 00 00+     db   $00,$00,$00,$00,$3E,$3E,$66,$66,$66,$66,$66,$66,$3E,$3E,$06,$06
VRA0:8720 00 00 00 00+     db   $00,$00,$00,$00,$7C,$7C,$66,$66,$60,$60,$60,$60,$60,$60,$00,$00
VRA0:8730 00 00 00 00+     db   $00,$00,$00,$00,$3E,$3E,$60,$60,$3C,$3C,$06,$06,$7C,$7C,$00,$00
VRA0:8740 00 00 18 18+     db   $00,$00,$18,$18,$7E,$7E,$18,$18,$18,$18,$18,$18,$0E,$0E,$00,$00
VRA0:8750 00 00 00 00+     db   $00,$00,$00,$00,$66,$66,$66,$66,$66,$66,$66,$66,$3E,$3E,$00,$00
VRA0:8760 00 00 00 00+     db   $00,$00,$00,$00,$66,$66,$66,$66,$66,$66,$3C,$3C,$18,$18,$00,$00
VRA0:8770 00 00 00 00+     db   $00,$00,$00,$00,$C6,$C6,$C6,$C6,$D6,$D6,$7C,$7C,$6C,$6C,$00,$00
VRA0:8780 00 00 00 00+     db   $00,$00,$00,$00,$66,$66,$3C,$3C,$18,$18,$3C,$3C,$66,$66,$00,$00
VRA0:8790 00 00 00 00+     db   $00,$00,$00,$00,$66,$66,$66,$66,$66,$66,$3E,$3E,$06,$06,$7C,$7C
VRA0:87A0 00 00 00 00+     db   $00,$00,$00,$00,$7E,$7E,$0C,$0C,$18,$18,$30,$30,$7E,$7E,$00,$00
VRA0:87B0 0E 0E 18 18+     db   $0E,$0E,$18,$18,$18,$18,$30,$30,$18,$18,$18,$18,$0E,$0E,$00,$00
VRA0:87C0 18 18 18 18+     db   $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$00,$00
VRA0:87D0 70 70 18 18+     db   $70,$70,$18,$18,$18,$18,$0C,$0C,$18,$18,$18,$18,$70,$70,$00,$00
VRA0:87E0 00 00 00 00+     db   $00,$00,$00,$00,$60,$60,$F2,$F2,$9E,$9E,$0C,$0C,$00,$00,$00,$00
VRA0:87F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8800 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8810 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8820 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8830 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8840 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8850 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8860 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8870 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8880 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8890 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:88A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:88B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:88C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:88D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:88E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:88F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8900 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8910 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8920 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8930 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8940 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8950 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8960 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8970 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8980 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8990 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:89A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:89B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:89C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:89D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:89E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:89F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:8A00 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
VRA0:8A10 E7 E7 E7 E7+     db   $E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$FF,$FF,$E7,$E7,$FF,$FF
VRA0:8A20 93 93 93 93+     db   $93,$93,$93,$93,$93,$93,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
VRA0:8A30 93 93 01 01+     db   $93,$93,$01,$01,$93,$93,$93,$93,$01,$01,$93,$93,$FF,$FF,$FF,$FF
VRA0:8A40 E7 E7 C1 C1+     db   $E7,$E7,$C1,$C1,$9F,$9F,$C3,$C3,$F9,$F9,$83,$83,$E7,$E7,$FF,$FF
VRA0:8A50 99 99 93 93+     db   $99,$99,$93,$93,$E7,$E7,$CF,$CF,$9F,$9F,$39,$39,$79,$79,$FF,$FF
VRA0:8A60 E3 E3 C9 C9+     db   $E3,$E3,$C9,$C9,$E3,$E3,$C7,$C7,$90,$90,$99,$99,$C4,$C4,$FF,$FF
VRA0:8A70 F3 F3 F3 F3+     db   $F3,$F3,$F3,$F3,$F3,$F3,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
VRA0:8A80 F1 F1 E3 E3+     db   $F1,$F1,$E3,$E3,$E7,$E7,$E7,$E7,$E7,$E7,$E3,$E3,$F1,$F1,$FF,$FF
VRA0:8A90 8F 8F C7 C7+     db   $8F,$8F,$C7,$C7,$E7,$E7,$E7,$E7,$E7,$E7,$C7,$C7,$8F,$8F,$FF,$FF
VRA0:8AA0 FF FF 99 99+     db   $FF,$FF,$99,$99,$C3,$C3,$00,$00,$C3,$C3,$99,$99,$FF,$FF,$FF,$FF
VRA0:8AB0 FF FF E7 E7+     db   $FF,$FF,$E7,$E7,$E7,$E7,$81,$81,$E7,$E7,$E7,$E7,$FF,$FF,$FF,$FF
VRA0:8AC0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$CF,$CF,$CF,$CF,$9F,$9F
VRA0:8AD0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$81,$81,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
VRA0:8AE0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$9F,$9F,$9F,$9F,$FF,$FF
VRA0:8AF0 FD FD F9 F9+     db   $FD,$FD,$F9,$F9,$F3,$F3,$E7,$E7,$CF,$CF,$9F,$9F,$BF,$BF,$FF,$FF
VRA0:8B00 C3 C3 99 99+     db   $C3,$C3,$99,$99,$91,$91,$89,$89,$99,$99,$99,$99,$C3,$C3,$FF,$FF
VRA0:8B10 E7 E7 C7 C7+     db   $E7,$E7,$C7,$C7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$81,$81,$FF,$FF
VRA0:8B20 C3 C3 99 99+     db   $C3,$C3,$99,$99,$F9,$F9,$F3,$F3,$E7,$E7,$CF,$CF,$81,$81,$FF,$FF
VRA0:8B30 81 81 F3 F3+     db   $81,$81,$F3,$F3,$E7,$E7,$F3,$F3,$F9,$F9,$99,$99,$C3,$C3,$FF,$FF
VRA0:8B40 F3 F3 E3 E3+     db   $F3,$F3,$E3,$E3,$C3,$C3,$93,$93,$81,$81,$F3,$F3,$F3,$F3,$FF,$FF
VRA0:8B50 81 81 9F 9F+     db   $81,$81,$9F,$9F,$83,$83,$F9,$F9,$F9,$F9,$99,$99,$C3,$C3,$FF,$FF
VRA0:8B60 C3 C3 9F 9F+     db   $C3,$C3,$9F,$9F,$9F,$9F,$83,$83,$99,$99,$99,$99,$C3,$C3,$FF,$FF
VRA0:8B70 81 81 F9 F9+     db   $81,$81,$F9,$F9,$F3,$F3,$E7,$E7,$CF,$CF,$CF,$CF,$CF,$CF,$FF,$FF
VRA0:8B80 C3 C3 99 99+     db   $C3,$C3,$99,$99,$99,$99,$C3,$C3,$99,$99,$99,$99,$C3,$C3,$FF,$FF
VRA0:8B90 C3 C3 99 99+     db   $C3,$C3,$99,$99,$99,$99,$C1,$C1,$F9,$F9,$F3,$F3,$C7,$C7,$FF,$FF
VRA0:8BA0 FF FF E7 E7+     db   $FF,$FF,$E7,$E7,$E7,$E7,$FF,$FF,$E7,$E7,$E7,$E7,$FF,$FF,$FF,$FF
VRA0:8BB0 FF FF E7 E7+     db   $FF,$FF,$E7,$E7,$E7,$E7,$FF,$FF,$E7,$E7,$E7,$E7,$CF,$CF,$FF,$FF
VRA0:8BC0 F3 F3 E7 E7+     db   $F3,$F3,$E7,$E7,$CF,$CF,$9F,$9F,$CF,$CF,$E7,$E7,$F3,$F3,$FF,$FF
VRA0:8BD0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$81,$81,$FF,$FF,$FF,$FF,$81,$81,$FF,$FF,$FF,$FF
VRA0:8BE0 CF CF E7 E7+     db   $CF,$CF,$E7,$E7,$F3,$F3,$F9,$F9,$F3,$F3,$E7,$E7,$CF,$CF,$FF,$FF
VRA0:8BF0 C3 C3 99 99+     db   $C3,$C3,$99,$99,$F9,$F9,$F3,$F3,$E7,$E7,$FF,$FF,$E7,$E7,$FF,$FF
VRA0:8C00 C3 C3 99 99+     db   $C3,$C3,$99,$99,$91,$91,$95,$95,$91,$91,$9F,$9F,$C1,$C1,$FF,$FF
VRA0:8C10 E7 E7 C3 C3+     db   $E7,$E7,$C3,$C3,$99,$99,$99,$99,$81,$81,$99,$99,$99,$99,$FF,$FF
VRA0:8C20 83 83 99 99+     db   $83,$83,$99,$99,$99,$99,$83,$83,$99,$99,$99,$99,$83,$83,$FF,$FF
VRA0:8C30 C3 C3 99 99+     db   $C3,$C3,$99,$99,$9F,$9F,$9F,$9F,$9F,$9F,$99,$99,$C3,$C3,$FF,$FF
VRA0:8C40 87 87 93 93+     db   $87,$87,$93,$93,$99,$99,$99,$99,$99,$99,$93,$93,$87,$87,$FF,$FF
VRA0:8C50 81 81 9F 9F+     db   $81,$81,$9F,$9F,$9F,$9F,$83,$83,$9F,$9F,$9F,$9F,$81,$81,$FF,$FF
VRA0:8C60 81 81 9F 9F+     db   $81,$81,$9F,$9F,$9F,$9F,$83,$83,$9F,$9F,$9F,$9F,$9F,$9F,$FF,$FF
VRA0:8C70 C1 C1 9F 9F+     db   $C1,$C1,$9F,$9F,$9F,$9F,$91,$91,$99,$99,$99,$99,$C1,$C1,$FF,$FF
VRA0:8C80 99 99 99 99+     db   $99,$99,$99,$99,$99,$99,$81,$81,$99,$99,$99,$99,$99,$99,$FF,$FF
VRA0:8C90 C3 C3 E7 E7+     db   $C3,$C3,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$C3,$C3,$FF,$FF
VRA0:8CA0 F9 F9 F9 F9+     db   $F9,$F9,$F9,$F9,$F9,$F9,$F9,$F9,$F9,$F9,$99,$99,$C3,$C3,$FF,$FF
VRA0:8CB0 99 99 93 93+     db   $99,$99,$93,$93,$87,$87,$8F,$8F,$87,$87,$93,$93,$99,$99,$FF,$FF
VRA0:8CC0 9F 9F 9F 9F+     db   $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$81,$81,$FF,$FF
VRA0:8CD0 39 39 11 11+     db   $39,$39,$11,$11,$01,$01,$29,$29,$39,$39,$39,$39,$39,$39,$FF,$FF
VRA0:8CE0 99 99 89 89+     db   $99,$99,$89,$89,$81,$81,$81,$81,$91,$91,$99,$99,$99,$99,$FF,$FF
VRA0:8CF0 C3 C3 99 99+     db   $C3,$C3,$99,$99,$99,$99,$99,$99,$99,$99,$99,$99,$C3,$C3,$FF,$FF
VRA0:8D00 83 83 99 99+     db   $83,$83,$99,$99,$99,$99,$83,$83,$9F,$9F,$9F,$9F,$9F,$9F,$FF,$FF
VRA0:8D10 C3 C3 99 99+     db   $C3,$C3,$99,$99,$99,$99,$99,$99,$89,$89,$93,$93,$C9,$C9,$FF,$FF
VRA0:8D20 83 83 99 99+     db   $83,$83,$99,$99,$99,$99,$83,$83,$93,$93,$99,$99,$99,$99,$FF,$FF
VRA0:8D30 C3 C3 99 99+     db   $C3,$C3,$99,$99,$9F,$9F,$C3,$C3,$F9,$F9,$99,$99,$C3,$C3,$FF,$FF
VRA0:8D40 81 81 E7 E7+     db   $81,$81,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$FF,$FF
VRA0:8D50 99 99 99 99+     db   $99,$99,$99,$99,$99,$99,$99,$99,$99,$99,$99,$99,$C1,$C1,$FF,$FF
VRA0:8D60 99 99 99 99+     db   $99,$99,$99,$99,$99,$99,$99,$99,$C3,$C3,$C3,$C3,$E7,$E7,$FF,$FF
VRA0:8D70 39 39 39 39+     db   $39,$39,$39,$39,$39,$39,$29,$29,$01,$01,$11,$11,$39,$39,$FF,$FF
VRA0:8D80 99 99 99 99+     db   $99,$99,$99,$99,$C3,$C3,$E7,$E7,$C3,$C3,$99,$99,$99,$99,$FF,$FF
VRA0:8D90 99 99 99 99+     db   $99,$99,$99,$99,$99,$99,$C3,$C3,$E7,$E7,$E7,$E7,$E7,$E7,$FF,$FF
VRA0:8DA0 81 81 F9 F9+     db   $81,$81,$F9,$F9,$F3,$F3,$E7,$E7,$CF,$CF,$9F,$9F,$81,$81,$FF,$FF
VRA0:8DB0 E1 E1 E7 E7+     db   $E1,$E1,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E1,$E1,$FF,$FF
VRA0:8DC0 BF BF 9F 9F+     db   $BF,$BF,$9F,$9F,$CF,$CF,$E7,$E7,$F3,$F3,$F9,$F9,$FD,$FD,$FF,$FF
VRA0:8DD0 87 87 E7 E7+     db   $87,$87,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$87,$87,$FF,$FF
VRA0:8DE0 EF EF C7 C7+     db   $EF,$EF,$C7,$C7,$93,$93,$39,$39,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
VRA0:8DF0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$01,$01
VRA0:8E00 3F 3F 9F 9F+     db   $3F,$3F,$9F,$9F,$CF,$CF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
VRA0:8E10 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$C3,$C3,$F9,$F9,$C1,$C1,$99,$99,$C1,$C1,$FF,$FF
VRA0:8E20 9F 9F 9F 9F+     db   $9F,$9F,$9F,$9F,$83,$83,$99,$99,$99,$99,$99,$99,$83,$83,$FF,$FF
VRA0:8E30 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$C3,$C3,$9F,$9F,$9F,$9F,$9F,$9F,$C3,$C3,$FF,$FF
VRA0:8E40 F9 F9 F9 F9+     db   $F9,$F9,$F9,$F9,$C1,$C1,$99,$99,$99,$99,$99,$99,$C1,$C1,$FF,$FF
VRA0:8E50 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$C3,$C3,$99,$99,$81,$81,$9F,$9F,$C3,$C3,$FF,$FF
VRA0:8E60 E3 E3 CF CF+     db   $E3,$E3,$CF,$CF,$83,$83,$CF,$CF,$CF,$CF,$CF,$CF,$CF,$CF,$FF,$FF
VRA0:8E70 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$C1,$C1,$99,$99,$99,$99,$C1,$C1,$F9,$F9,$83,$83
VRA0:8E80 9F 9F 9F 9F+     db   $9F,$9F,$9F,$9F,$83,$83,$99,$99,$99,$99,$99,$99,$99,$99,$FF,$FF
VRA0:8E90 E7 E7 FF FF+     db   $E7,$E7,$FF,$FF,$C7,$C7,$E7,$E7,$E7,$E7,$E7,$E7,$C3,$C3,$FF,$FF
VRA0:8EA0 E7 E7 FF FF+     db   $E7,$E7,$FF,$FF,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$8F,$8F
VRA0:8EB0 9F 9F 9F 9F+     db   $9F,$9F,$9F,$9F,$99,$99,$93,$93,$87,$87,$93,$93,$99,$99,$FF,$FF
VRA0:8EC0 C7 C7 E7 E7+     db   $C7,$C7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$C3,$C3,$FF,$FF
VRA0:8ED0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$13,$13,$01,$01,$29,$29,$39,$39,$39,$39,$FF,$FF
VRA0:8EE0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$83,$83,$99,$99,$99,$99,$99,$99,$99,$99,$FF,$FF
VRA0:8EF0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$C3,$C3,$99,$99,$99,$99,$99,$99,$C3,$C3,$FF,$FF
VRA0:8F00 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$83,$83,$99,$99,$99,$99,$99,$99,$83,$83,$9F,$9F
VRA0:8F10 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$C1,$C1,$99,$99,$99,$99,$99,$99,$C1,$C1,$F9,$F9
VRA0:8F20 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$83,$83,$99,$99,$9F,$9F,$9F,$9F,$9F,$9F,$FF,$FF
VRA0:8F30 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$C1,$C1,$9F,$9F,$C3,$C3,$F9,$F9,$83,$83,$FF,$FF
VRA0:8F40 FF FF E7 E7+     db   $FF,$FF,$E7,$E7,$81,$81,$E7,$E7,$E7,$E7,$E7,$E7,$F1,$F1,$FF,$FF
VRA0:8F50 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$99,$99,$99,$99,$99,$99,$99,$99,$C1,$C1,$FF,$FF
VRA0:8F60 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$99,$99,$99,$99,$99,$99,$C3,$C3,$E7,$E7,$FF,$FF
VRA0:8F70 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$39,$39,$39,$39,$29,$29,$83,$83,$93,$93,$FF,$FF
VRA0:8F80 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$99,$99,$C3,$C3,$E7,$E7,$C3,$C3,$99,$99,$FF,$FF
VRA0:8F90 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$99,$99,$99,$99,$99,$99,$C1,$C1,$F9,$F9,$83,$83
VRA0:8FA0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$81,$81,$F3,$F3,$E7,$E7,$CF,$CF,$81,$81,$FF,$FF
VRA0:8FB0 F1 F1 E7 E7+     db   $F1,$F1,$E7,$E7,$E7,$E7,$CF,$CF,$E7,$E7,$E7,$E7,$F1,$F1,$FF,$FF
VRA0:8FC0 E7 E7 E7 E7+     db   $E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$FF,$FF
VRA0:8FD0 8F 8F E7 E7+     db   $8F,$8F,$E7,$E7,$E7,$E7,$F3,$F3,$E7,$E7,$E7,$E7,$8F,$8F,$FF,$FF
VRA0:8FE0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$9F,$9F,$0D,$0D,$61,$61,$F3,$F3,$FF,$FF,$FF,$FF
VRA0:8FF0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
VRA0:9000 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9010 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9020 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9030 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9040 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9050 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9060 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9070 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9080 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9090 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:90A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:90B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:90C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:90D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:90E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:90F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9100 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9110 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9120 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9130 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9140 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9150 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9160 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9170 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9180 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9190 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:91A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:91B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:91C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:91D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:91E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:91F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9200 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9210 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9220 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9230 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9240 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9250 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9260 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9270 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9280 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9290 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:92A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:92B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:92C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:92D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:92E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:92F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9300 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9310 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9320 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9330 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9340 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9350 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9360 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9370 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9380 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9390 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:93A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:93B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:93C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:93D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:93E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:93F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9400 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9410 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9420 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9430 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9440 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9450 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9460 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9470 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9480 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9490 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:94A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:94B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:94C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:94D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:94E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:94F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9500 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9510 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9520 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9530 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9540 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9550 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9560 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9570 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9580 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9590 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:95A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:95B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:95C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:95D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:95E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:95F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9600 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9610 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9620 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9630 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9640 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9650 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9660 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9670 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9680 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9690 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:96A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:96B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:96C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:96D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:96E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:96F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9700 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9710 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9720 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9730 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9740 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9750 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9760 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9770 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9780 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9790 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:97A0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:97B0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:97C0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:97D0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:97E0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:97F0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9800 30 33 2D 6F+     db   $30,$33,$2D,$6F,$70,$20,$73,$70,$2C,$68,$6C,$20,$20,$20,$20,$20
VRA0:9810 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9820 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9830 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9840 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9850 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9860 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9870 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9880 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9890 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:98A0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:98B0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:98C0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:98D0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:98E0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:98F0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9900 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9910 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9920 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9930 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9940 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9950 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9960 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9970 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9980 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9990 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:99A0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:99B0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:99C0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:99D0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:99E0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:99F0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A00 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A10 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A20 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A30 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A40 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A50 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A60 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A70 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A80 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9A90 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9AA0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9AB0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9AC0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9AD0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9AE0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9AF0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B00 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B10 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B20 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B30 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B40 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B50 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B60 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B70 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B80 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9B90 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9BA0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9BB0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9BC0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9BD0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9BE0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9BF0 20 20 20 20+     db   $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
VRA0:9C00 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C10 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C20 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C30 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C40 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C50 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C60 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C70 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C80 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9C90 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9CA0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9CB0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9CC0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9CD0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9CE0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9CF0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D00 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D10 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D20 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D30 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D40 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D50 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D60 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D70 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D80 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9D90 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9DA0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9DB0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9DC0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9DD0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9DE0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9DF0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E00 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E10 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E20 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E30 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E40 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E50 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E60 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E70 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E80 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9E90 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9EA0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9EB0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9EC0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9ED0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9EE0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9EF0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F00 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F10 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F20 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F30 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F40 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F50 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F60 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F70 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F80 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9F90 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9FA0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9FB0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9FC0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9FD0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9FE0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
VRA0:9FF0 00 00 00 00+     db   $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
SRA0:A000 FF               rst  $38
SRA0:A001 FF               rst  $38
SRA0:A002 FF               rst  $38
SRA0:A003 FF               rst  $38
SRA0:A004 FF               rst  $38
SRA0:A005 FF               rst  $38
SRA0:A006 FF               rst  $38
SRA0:A007 FF               rst  $38
SRA0:A008 FF               rst  $38
SRA0:A009 FF               rst  $38
SRA0:A00A FF               rst  $38
SRA0:A00B FF               rst  $38
SRA0:A00C FF               rst  $38
SRA0:A00D FF               rst  $38
SRA0:A00E FF               rst  $38
SRA0:A00F FF               rst  $38
SRA0:A010 FF               rst  $38
SRA0:A011 FF               rst  $38
SRA0:A012 FF               rst  $38
SRA0:A013 FF               rst  $38
SRA0:A014 FF               rst  $38
SRA0:A015 FF               rst  $38
SRA0:A016 FF               rst  $38
SRA0:A017 FF               rst  $38
SRA0:A018 FF               rst  $38
SRA0:A019 FF               rst  $38
SRA0:A01A FF               rst  $38
SRA0:A01B FF               rst  $38
SRA0:A01C FF               rst  $38
SRA0:A01D FF               rst  $38
SRA0:A01E FF               rst  $38
SRA0:A01F FF               rst  $38
SRA0:A020 FF               rst  $38
SRA0:A021 FF               rst  $38
SRA0:A022 FF               rst  $38
SRA0:A023 FF               rst  $38
SRA0:A024 FF               rst  $38
SRA0:A025 FF               rst  $38
SRA0:A026 FF               rst  $38
SRA0:A027 FF               rst  $38
SRA0:A028 FF               rst  $38
SRA0:A029 FF               rst  $38
SRA0:A02A FF               rst  $38
SRA0:A02B FF               rst  $38
SRA0:A02C FF               rst  $38
SRA0:A02D FF               rst  $38
SRA0:A02E FF               rst  $38
SRA0:A02F FF               rst  $38
SRA0:A030 FF               rst  $38
SRA0:A031 FF               rst  $38
SRA0:A032 FF               rst  $38
SRA0:A033 FF               rst  $38
SRA0:A034 FF               rst  $38
SRA0:A035 FF               rst  $38
SRA0:A036 FF               rst  $38
SRA0:A037 FF               rst  $38
SRA0:A038 FF               rst  $38
SRA0:A039 FF               rst  $38
SRA0:A03A FF               rst  $38
SRA0:A03B FF               rst  $38
SRA0:A03C FF               rst  $38
SRA0:A03D FF               rst  $38
SRA0:A03E FF               rst  $38
SRA0:A03F FF               rst  $38
SRA0:A040 FF               rst  $38
SRA0:A041 FF               rst  $38
SRA0:A042 FF               rst  $38
SRA0:A043 FF               rst  $38
SRA0:A044 FF               rst  $38
SRA0:A045 FF               rst  $38
SRA0:A046 FF               rst  $38
SRA0:A047 FF               rst  $38
SRA0:A048 FF               rst  $38
SRA0:A049 FF               rst  $38
SRA0:A04A FF               rst  $38
SRA0:A04B FF               rst  $38
SRA0:A04C FF               rst  $38
SRA0:A04D FF               rst  $38
SRA0:A04E FF               rst  $38
SRA0:A04F FF               rst  $38
SRA0:A050 FF               rst  $38
SRA0:A051 FF               rst  $38
SRA0:A052 FF               rst  $38
SRA0:A053 FF               rst  $38
SRA0:A054 FF               rst  $38
SRA0:A055 FF               rst  $38
SRA0:A056 FF               rst  $38
SRA0:A057 FF               rst  $38
SRA0:A058 FF               rst  $38
SRA0:A059 FF               rst  $38
SRA0:A05A FF               rst  $38
SRA0:A05B FF               rst  $38
SRA0:A05C FF               rst  $38
SRA0:A05D FF               rst  $38
SRA0:A05E FF               rst  $38
SRA0:A05F FF               rst  $38
SRA0:A060 FF               rst  $38
SRA0:A061 FF               rst  $38
SRA0:A062 FF               rst  $38
SRA0:A063 FF               rst  $38
SRA0:A064 FF               rst  $38
SRA0:A065 FF               rst  $38
SRA0:A066 FF               rst  $38
SRA0:A067 FF               rst  $38
SRA0:A068 FF               rst  $38
SRA0:A069 FF               rst  $38
SRA0:A06A FF               rst  $38
SRA0:A06B FF               rst  $38
SRA0:A06C FF               rst  $38
SRA0:A06D FF               rst  $38
SRA0:A06E FF               rst  $38
SRA0:A06F FF               rst  $38
SRA0:A070 FF               rst  $38
SRA0:A071 FF               rst  $38
SRA0:A072 FF               rst  $38
SRA0:A073 FF               rst  $38
SRA0:A074 FF               rst  $38
SRA0:A075 FF               rst  $38
SRA0:A076 FF               rst  $38
SRA0:A077 FF               rst  $38
SRA0:A078 FF               rst  $38
SRA0:A079 FF               rst  $38
SRA0:A07A FF               rst  $38
SRA0:A07B FF               rst  $38
SRA0:A07C FF               rst  $38
SRA0:A07D FF               rst  $38
SRA0:A07E FF               rst  $38
SRA0:A07F FF               rst  $38
SRA0:A080 FF               rst  $38
SRA0:A081 FF               rst  $38
SRA0:A082 FF               rst  $38
SRA0:A083 FF               rst  $38
SRA0:A084 FF               rst  $38
SRA0:A085 FF               rst  $38
SRA0:A086 FF               rst  $38
SRA0:A087 FF               rst  $38
SRA0:A088 FF               rst  $38
SRA0:A089 FF               rst  $38
SRA0:A08A FF               rst  $38
SRA0:A08B FF               rst  $38
SRA0:A08C FF               rst  $38
SRA0:A08D FF               rst  $38
SRA0:A08E FF               rst  $38
SRA0:A08F FF               rst  $38
SRA0:A090 FF               rst  $38
SRA0:A091 FF               rst  $38
SRA0:A092 FF               rst  $38
SRA0:A093 FF               rst  $38
SRA0:A094 FF               rst  $38
SRA0:A095 FF               rst  $38
SRA0:A096 FF               rst  $38
SRA0:A097 FF               rst  $38
SRA0:A098 FF               rst  $38
SRA0:A099 FF               rst  $38
SRA0:A09A FF               rst  $38
SRA0:A09B FF               rst  $38
SRA0:A09C FF               rst  $38
SRA0:A09D FF               rst  $38
SRA0:A09E FF               rst  $38
SRA0:A09F FF               rst  $38
SRA0:A0A0 FF               rst  $38
SRA0:A0A1 FF               rst  $38
SRA0:A0A2 FF               rst  $38
SRA0:A0A3 FF               rst  $38
SRA0:A0A4 FF               rst  $38
SRA0:A0A5 FF               rst  $38
SRA0:A0A6 FF               rst  $38
SRA0:A0A7 FF               rst  $38
SRA0:A0A8 FF               rst  $38
SRA0:A0A9 FF               rst  $38
SRA0:A0AA FF               rst  $38
SRA0:A0AB FF               rst  $38
SRA0:A0AC FF               rst  $38
SRA0:A0AD FF               rst  $38
SRA0:A0AE FF               rst  $38
SRA0:A0AF FF               rst  $38
SRA0:A0B0 FF               rst  $38
SRA0:A0B1 FF               rst  $38
SRA0:A0B2 FF               rst  $38
SRA0:A0B3 FF               rst  $38
SRA0:A0B4 FF               rst  $38
SRA0:A0B5 FF               rst  $38
SRA0:A0B6 FF               rst  $38
SRA0:A0B7 FF               rst  $38
SRA0:A0B8 FF               rst  $38
SRA0:A0B9 FF               rst  $38
SRA0:A0BA FF               rst  $38
SRA0:A0BB FF               rst  $38
SRA0:A0BC FF               rst  $38
SRA0:A0BD FF               rst  $38
SRA0:A0BE FF               rst  $38
SRA0:A0BF FF               rst  $38
SRA0:A0C0 FF               rst  $38
SRA0:A0C1 FF               rst  $38
SRA0:A0C2 FF               rst  $38
SRA0:A0C3 FF               rst  $38
SRA0:A0C4 FF               rst  $38
SRA0:A0C5 FF               rst  $38
SRA0:A0C6 FF               rst  $38
SRA0:A0C7 FF               rst  $38
SRA0:A0C8 FF               rst  $38
SRA0:A0C9 FF               rst  $38
SRA0:A0CA FF               rst  $38
SRA0:A0CB FF               rst  $38
SRA0:A0CC FF               rst  $38
SRA0:A0CD FF               rst  $38
SRA0:A0CE FF               rst  $38
SRA0:A0CF FF               rst  $38
SRA0:A0D0 FF               rst  $38
SRA0:A0D1 FF               rst  $38
SRA0:A0D2 FF               rst  $38
SRA0:A0D3 FF               rst  $38
SRA0:A0D4 FF               rst  $38
SRA0:A0D5 FF               rst  $38
SRA0:A0D6 FF               rst  $38
SRA0:A0D7 FF               rst  $38
SRA0:A0D8 FF               rst  $38
SRA0:A0D9 FF               rst  $38
SRA0:A0DA FF               rst  $38
SRA0:A0DB FF               rst  $38
SRA0:A0DC FF               rst  $38
SRA0:A0DD FF               rst  $38
SRA0:A0DE FF               rst  $38
SRA0:A0DF FF               rst  $38
SRA0:A0E0 FF               rst  $38
SRA0:A0E1 FF               rst  $38
SRA0:A0E2 FF               rst  $38
SRA0:A0E3 FF               rst  $38
SRA0:A0E4 FF               rst  $38
SRA0:A0E5 FF               rst  $38
SRA0:A0E6 FF               rst  $38
SRA0:A0E7 FF               rst  $38
SRA0:A0E8 FF               rst  $38
SRA0:A0E9 FF               rst  $38
SRA0:A0EA FF               rst  $38
SRA0:A0EB FF               rst  $38
SRA0:A0EC FF               rst  $38
SRA0:A0ED FF               rst  $38
SRA0:A0EE FF               rst  $38
SRA0:A0EF FF               rst  $38
SRA0:A0F0 FF               rst  $38
SRA0:A0F1 FF               rst  $38
SRA0:A0F2 FF               rst  $38
SRA0:A0F3 FF               rst  $38
SRA0:A0F4 FF               rst  $38
SRA0:A0F5 FF               rst  $38
SRA0:A0F6 FF               rst  $38
SRA0:A0F7 FF               rst  $38
SRA0:A0F8 FF               rst  $38
SRA0:A0F9 FF               rst  $38
SRA0:A0FA FF               rst  $38
SRA0:A0FB FF               rst  $38
SRA0:A0FC FF               rst  $38
SRA0:A0FD FF               rst  $38
SRA0:A0FE FF               rst  $38
SRA0:A0FF FF               rst  $38
SRA0:A100 FF               rst  $38
SRA0:A101 FF               rst  $38
SRA0:A102 FF               rst  $38
SRA0:A103 FF               rst  $38
SRA0:A104 FF               rst  $38
SRA0:A105 FF               rst  $38
SRA0:A106 FF               rst  $38
SRA0:A107 FF               rst  $38
SRA0:A108 FF               rst  $38
SRA0:A109 FF               rst  $38
SRA0:A10A FF               rst  $38
SRA0:A10B FF               rst  $38
SRA0:A10C FF               rst  $38
SRA0:A10D FF               rst  $38
SRA0:A10E FF               rst  $38
SRA0:A10F FF               rst  $38
SRA0:A110 FF               rst  $38
SRA0:A111 FF               rst  $38
SRA0:A112 FF               rst  $38
SRA0:A113 FF               rst  $38
SRA0:A114 FF               rst  $38
SRA0:A115 FF               rst  $38
SRA0:A116 FF               rst  $38
SRA0:A117 FF               rst  $38
SRA0:A118 FF               rst  $38
SRA0:A119 FF               rst  $38
SRA0:A11A FF               rst  $38
SRA0:A11B FF               rst  $38
SRA0:A11C FF               rst  $38
SRA0:A11D FF               rst  $38
SRA0:A11E FF               rst  $38
SRA0:A11F FF               rst  $38
SRA0:A120 FF               rst  $38
SRA0:A121 FF               rst  $38
SRA0:A122 FF               rst  $38
SRA0:A123 FF               rst  $38
SRA0:A124 FF               rst  $38
SRA0:A125 FF               rst  $38
SRA0:A126 FF               rst  $38
SRA0:A127 FF               rst  $38
SRA0:A128 FF               rst  $38
SRA0:A129 FF               rst  $38
SRA0:A12A FF               rst  $38
SRA0:A12B FF               rst  $38
SRA0:A12C FF               rst  $38
SRA0:A12D FF               rst  $38
SRA0:A12E FF               rst  $38
SRA0:A12F FF               rst  $38
SRA0:A130 FF               rst  $38
SRA0:A131 FF               rst  $38
SRA0:A132 FF               rst  $38
SRA0:A133 FF               rst  $38
SRA0:A134 FF               rst  $38
SRA0:A135 FF               rst  $38
SRA0:A136 FF               rst  $38
SRA0:A137 FF               rst  $38
SRA0:A138 FF               rst  $38
SRA0:A139 FF               rst  $38
SRA0:A13A FF               rst  $38
SRA0:A13B FF               rst  $38
SRA0:A13C FF               rst  $38
SRA0:A13D FF               rst  $38
SRA0:A13E FF               rst  $38
SRA0:A13F FF               rst  $38
SRA0:A140 FF               rst  $38
SRA0:A141 FF               rst  $38
SRA0:A142 FF               rst  $38
SRA0:A143 FF               rst  $38
SRA0:A144 FF               rst  $38
SRA0:A145 FF               rst  $38
SRA0:A146 FF               rst  $38
SRA0:A147 FF               rst  $38
SRA0:A148 FF               rst  $38
SRA0:A149 FF               rst  $38
SRA0:A14A FF               rst  $38
SRA0:A14B FF               rst  $38
SRA0:A14C FF               rst  $38
SRA0:A14D FF               rst  $38
SRA0:A14E FF               rst  $38
SRA0:A14F FF               rst  $38
SRA0:A150 FF               rst  $38
SRA0:A151 FF               rst  $38
SRA0:A152 FF               rst  $38
SRA0:A153 FF               rst  $38
SRA0:A154 FF               rst  $38
SRA0:A155 FF               rst  $38
SRA0:A156 FF               rst  $38
SRA0:A157 FF               rst  $38
SRA0:A158 FF               rst  $38
SRA0:A159 FF               rst  $38
SRA0:A15A FF               rst  $38
SRA0:A15B FF               rst  $38
SRA0:A15C FF               rst  $38
SRA0:A15D FF               rst  $38
SRA0:A15E FF               rst  $38
SRA0:A15F FF               rst  $38
SRA0:A160 FF               rst  $38
SRA0:A161 FF               rst  $38
SRA0:A162 FF               rst  $38
SRA0:A163 FF               rst  $38
SRA0:A164 FF               rst  $38
SRA0:A165 FF               rst  $38
SRA0:A166 FF               rst  $38
SRA0:A167 FF               rst  $38
SRA0:A168 FF               rst  $38
SRA0:A169 FF               rst  $38
SRA0:A16A FF               rst  $38
SRA0:A16B FF               rst  $38
SRA0:A16C FF               rst  $38
SRA0:A16D FF               rst  $38
SRA0:A16E FF               rst  $38
SRA0:A16F FF               rst  $38
SRA0:A170 FF               rst  $38
SRA0:A171 FF               rst  $38
SRA0:A172 FF               rst  $38
SRA0:A173 FF               rst  $38
SRA0:A174 FF               rst  $38
SRA0:A175 FF               rst  $38
SRA0:A176 FF               rst  $38
SRA0:A177 FF               rst  $38
SRA0:A178 FF               rst  $38
SRA0:A179 FF               rst  $38
SRA0:A17A FF               rst  $38
SRA0:A17B FF               rst  $38
SRA0:A17C FF               rst  $38
SRA0:A17D FF               rst  $38
SRA0:A17E FF               rst  $38
SRA0:A17F FF               rst  $38
SRA0:A180 FF               rst  $38
SRA0:A181 FF               rst  $38
SRA0:A182 FF               rst  $38
SRA0:A183 FF               rst  $38
SRA0:A184 FF               rst  $38
SRA0:A185 FF               rst  $38
SRA0:A186 FF               rst  $38
SRA0:A187 FF               rst  $38
SRA0:A188 FF               rst  $38
SRA0:A189 FF               rst  $38
SRA0:A18A FF               rst  $38
SRA0:A18B FF               rst  $38
SRA0:A18C FF               rst  $38
SRA0:A18D FF               rst  $38
SRA0:A18E FF               rst  $38
SRA0:A18F FF               rst  $38
SRA0:A190 FF               rst  $38
SRA0:A191 FF               rst  $38
SRA0:A192 FF               rst  $38
SRA0:A193 FF               rst  $38
SRA0:A194 FF               rst  $38
SRA0:A195 FF               rst  $38
SRA0:A196 FF               rst  $38
SRA0:A197 FF               rst  $38
SRA0:A198 FF               rst  $38
SRA0:A199 FF               rst  $38
SRA0:A19A FF               rst  $38
SRA0:A19B FF               rst  $38
SRA0:A19C FF               rst  $38
SRA0:A19D FF               rst  $38
SRA0:A19E FF               rst  $38
SRA0:A19F FF               rst  $38
SRA0:A1A0 FF               rst  $38
SRA0:A1A1 FF               rst  $38
SRA0:A1A2 FF               rst  $38
SRA0:A1A3 FF               rst  $38
SRA0:A1A4 FF               rst  $38
SRA0:A1A5 FF               rst  $38
SRA0:A1A6 FF               rst  $38
SRA0:A1A7 FF               rst  $38
SRA0:A1A8 FF               rst  $38
SRA0:A1A9 FF               rst  $38
SRA0:A1AA FF               rst  $38
SRA0:A1AB FF               rst  $38
SRA0:A1AC FF               rst  $38
SRA0:A1AD FF               rst  $38
SRA0:A1AE FF               rst  $38
SRA0:A1AF FF               rst  $38
SRA0:A1B0 FF               rst  $38
SRA0:A1B1 FF               rst  $38
SRA0:A1B2 FF               rst  $38
SRA0:A1B3 FF               rst  $38
SRA0:A1B4 FF               rst  $38
SRA0:A1B5 FF               rst  $38
SRA0:A1B6 FF               rst  $38
SRA0:A1B7 FF               rst  $38
SRA0:A1B8 FF               rst  $38
SRA0:A1B9 FF               rst  $38
SRA0:A1BA FF               rst  $38
SRA0:A1BB FF               rst  $38
SRA0:A1BC FF               rst  $38
SRA0:A1BD FF               rst  $38
SRA0:A1BE FF               rst  $38
SRA0:A1BF FF               rst  $38
SRA0:A1C0 FF               rst  $38
SRA0:A1C1 FF               rst  $38
SRA0:A1C2 FF               rst  $38
SRA0:A1C3 FF               rst  $38
SRA0:A1C4 FF               rst  $38
SRA0:A1C5 FF               rst  $38
SRA0:A1C6 FF               rst  $38
SRA0:A1C7 FF               rst  $38
SRA0:A1C8 FF               rst  $38
SRA0:A1C9 FF               rst  $38
SRA0:A1CA FF               rst  $38
SRA0:A1CB FF               rst  $38
SRA0:A1CC FF               rst  $38
SRA0:A1CD FF               rst  $38
SRA0:A1CE FF               rst  $38
SRA0:A1CF FF               rst  $38
SRA0:A1D0 FF               rst  $38
SRA0:A1D1 FF               rst  $38
SRA0:A1D2 FF               rst  $38
SRA0:A1D3 FF               rst  $38
SRA0:A1D4 FF               rst  $38
SRA0:A1D5 FF               rst  $38
SRA0:A1D6 FF               rst  $38
SRA0:A1D7 FF               rst  $38
SRA0:A1D8 FF               rst  $38
SRA0:A1D9 FF               rst  $38
SRA0:A1DA FF               rst  $38
SRA0:A1DB FF               rst  $38
SRA0:A1DC FF               rst  $38
SRA0:A1DD FF               rst  $38
SRA0:A1DE FF               rst  $38
SRA0:A1DF FF               rst  $38
SRA0:A1E0 FF               rst  $38
SRA0:A1E1 FF               rst  $38
SRA0:A1E2 FF               rst  $38
SRA0:A1E3 FF               rst  $38
SRA0:A1E4 FF               rst  $38
SRA0:A1E5 FF               rst  $38
SRA0:A1E6 FF               rst  $38
SRA0:A1E7 FF               rst  $38
SRA0:A1E8 FF               rst  $38
SRA0:A1E9 FF               rst  $38
SRA0:A1EA FF               rst  $38
SRA0:A1EB FF               rst  $38
SRA0:A1EC FF               rst  $38
SRA0:A1ED FF               rst  $38
SRA0:A1EE FF               rst  $38
SRA0:A1EF FF               rst  $38
SRA0:A1F0 FF               rst  $38
SRA0:A1F1 FF               rst  $38
SRA0:A1F2 FF               rst  $38
SRA0:A1F3 FF               rst  $38
SRA0:A1F4 FF               rst  $38
SRA0:A1F5 FF               rst  $38
SRA0:A1F6 FF               rst  $38
SRA0:A1F7 FF               rst  $38
SRA0:A1F8 FF               rst  $38
SRA0:A1F9 FF               rst  $38
SRA0:A1FA FF               rst  $38
SRA0:A1FB FF               rst  $38
SRA0:A1FC FF               rst  $38
SRA0:A1FD FF               rst  $38
SRA0:A1FE FF               rst  $38
SRA0:A1FF FF               rst  $38
SRA0:A200 FF               rst  $38
SRA0:A201 FF               rst  $38
SRA0:A202 FF               rst  $38
SRA0:A203 FF               rst  $38
SRA0:A204 FF               rst  $38
SRA0:A205 FF               rst  $38
SRA0:A206 FF               rst  $38
SRA0:A207 FF               rst  $38
SRA0:A208 FF               rst  $38
SRA0:A209 FF               rst  $38
SRA0:A20A FF               rst  $38
SRA0:A20B FF               rst  $38
SRA0:A20C FF               rst  $38
SRA0:A20D FF               rst  $38
SRA0:A20E FF               rst  $38
SRA0:A20F FF               rst  $38
SRA0:A210 FF               rst  $38
SRA0:A211 FF               rst  $38
SRA0:A212 FF               rst  $38
SRA0:A213 FF               rst  $38
SRA0:A214 FF               rst  $38
SRA0:A215 FF               rst  $38
SRA0:A216 FF               rst  $38
SRA0:A217 FF               rst  $38
SRA0:A218 FF               rst  $38
SRA0:A219 FF               rst  $38
SRA0:A21A FF               rst  $38
SRA0:A21B FF               rst  $38
SRA0:A21C FF               rst  $38
SRA0:A21D FF               rst  $38
SRA0:A21E FF               rst  $38
SRA0:A21F FF               rst  $38
SRA0:A220 FF               rst  $38
SRA0:A221 FF               rst  $38
SRA0:A222 FF               rst  $38
SRA0:A223 FF               rst  $38
SRA0:A224 FF               rst  $38
SRA0:A225 FF               rst  $38
SRA0:A226 FF               rst  $38
SRA0:A227 FF               rst  $38
SRA0:A228 FF               rst  $38
SRA0:A229 FF               rst  $38
SRA0:A22A FF               rst  $38
SRA0:A22B FF               rst  $38
SRA0:A22C FF               rst  $38
SRA0:A22D FF               rst  $38
SRA0:A22E FF               rst  $38
SRA0:A22F FF               rst  $38
SRA0:A230 FF               rst  $38
SRA0:A231 FF               rst  $38
SRA0:A232 FF               rst  $38
SRA0:A233 FF               rst  $38
SRA0:A234 FF               rst  $38
SRA0:A235 FF               rst  $38
SRA0:A236 FF               rst  $38
SRA0:A237 FF               rst  $38
SRA0:A238 FF               rst  $38
SRA0:A239 FF               rst  $38
SRA0:A23A FF               rst  $38
SRA0:A23B FF               rst  $38
SRA0:A23C FF               rst  $38
SRA0:A23D FF               rst  $38
SRA0:A23E FF               rst  $38
SRA0:A23F FF               rst  $38
SRA0:A240 FF               rst  $38
SRA0:A241 FF               rst  $38
SRA0:A242 FF               rst  $38
SRA0:A243 FF               rst  $38
SRA0:A244 FF               rst  $38
SRA0:A245 FF               rst  $38
SRA0:A246 FF               rst  $38
SRA0:A247 FF               rst  $38
SRA0:A248 FF               rst  $38
SRA0:A249 FF               rst  $38
SRA0:A24A FF               rst  $38
SRA0:A24B FF               rst  $38
SRA0:A24C FF               rst  $38
SRA0:A24D FF               rst  $38
SRA0:A24E FF               rst  $38
SRA0:A24F FF               rst  $38
SRA0:A250 FF               rst  $38
SRA0:A251 FF               rst  $38
SRA0:A252 FF               rst  $38
SRA0:A253 FF               rst  $38
SRA0:A254 FF               rst  $38
SRA0:A255 FF               rst  $38
SRA0:A256 FF               rst  $38
SRA0:A257 FF               rst  $38
SRA0:A258 FF               rst  $38
SRA0:A259 FF               rst  $38
SRA0:A25A FF               rst  $38
SRA0:A25B FF               rst  $38
SRA0:A25C FF               rst  $38
SRA0:A25D FF               rst  $38
SRA0:A25E FF               rst  $38
SRA0:A25F FF               rst  $38
SRA0:A260 FF               rst  $38
SRA0:A261 FF               rst  $38
SRA0:A262 FF               rst  $38
SRA0:A263 FF               rst  $38
SRA0:A264 FF               rst  $38
SRA0:A265 FF               rst  $38
SRA0:A266 FF               rst  $38
SRA0:A267 FF               rst  $38
SRA0:A268 FF               rst  $38
SRA0:A269 FF               rst  $38
SRA0:A26A FF               rst  $38
SRA0:A26B FF               rst  $38
SRA0:A26C FF               rst  $38
SRA0:A26D FF               rst  $38
SRA0:A26E FF               rst  $38
SRA0:A26F FF               rst  $38
SRA0:A270 FF               rst  $38
SRA0:A271 FF               rst  $38
SRA0:A272 FF               rst  $38
SRA0:A273 FF               rst  $38
SRA0:A274 FF               rst  $38
SRA0:A275 FF               rst  $38
SRA0:A276 FF               rst  $38
SRA0:A277 FF               rst  $38
SRA0:A278 FF               rst  $38
SRA0:A279 FF               rst  $38
SRA0:A27A FF               rst  $38
SRA0:A27B FF               rst  $38
SRA0:A27C FF               rst  $38
SRA0:A27D FF               rst  $38
SRA0:A27E FF               rst  $38
SRA0:A27F FF               rst  $38
SRA0:A280 FF               rst  $38
SRA0:A281 FF               rst  $38
SRA0:A282 FF               rst  $38
SRA0:A283 FF               rst  $38
SRA0:A284 FF               rst  $38
SRA0:A285 FF               rst  $38
SRA0:A286 FF               rst  $38
SRA0:A287 FF               rst  $38
SRA0:A288 FF               rst  $38
SRA0:A289 FF               rst  $38
SRA0:A28A FF               rst  $38
SRA0:A28B FF               rst  $38
SRA0:A28C FF               rst  $38
SRA0:A28D FF               rst  $38
SRA0:A28E FF               rst  $38
SRA0:A28F FF               rst  $38
SRA0:A290 FF               rst  $38
SRA0:A291 FF               rst  $38
SRA0:A292 FF               rst  $38
SRA0:A293 FF               rst  $38
SRA0:A294 FF               rst  $38
SRA0:A295 FF               rst  $38
SRA0:A296 FF               rst  $38
SRA0:A297 FF               rst  $38
SRA0:A298 FF               rst  $38
SRA0:A299 FF               rst  $38
SRA0:A29A FF               rst  $38
SRA0:A29B FF               rst  $38
SRA0:A29C FF               rst  $38
SRA0:A29D FF               rst  $38
SRA0:A29E FF               rst  $38
SRA0:A29F FF               rst  $38
SRA0:A2A0 FF               rst  $38
SRA0:A2A1 FF               rst  $38
SRA0:A2A2 FF               rst  $38
SRA0:A2A3 FF               rst  $38
SRA0:A2A4 FF               rst  $38
SRA0:A2A5 FF               rst  $38
SRA0:A2A6 FF               rst  $38
SRA0:A2A7 FF               rst  $38
SRA0:A2A8 FF               rst  $38
SRA0:A2A9 FF               rst  $38
SRA0:A2AA FF               rst  $38
SRA0:A2AB FF               rst  $38
SRA0:A2AC FF               rst  $38
SRA0:A2AD FF               rst  $38
SRA0:A2AE FF               rst  $38
SRA0:A2AF FF               rst  $38
SRA0:A2B0 FF               rst  $38
SRA0:A2B1 FF               rst  $38
SRA0:A2B2 FF               rst  $38
SRA0:A2B3 FF               rst  $38
SRA0:A2B4 FF               rst  $38
SRA0:A2B5 FF               rst  $38
SRA0:A2B6 FF               rst  $38
SRA0:A2B7 FF               rst  $38
SRA0:A2B8 FF               rst  $38
SRA0:A2B9 FF               rst  $38
SRA0:A2BA FF               rst  $38
SRA0:A2BB FF               rst  $38
SRA0:A2BC FF               rst  $38
SRA0:A2BD FF               rst  $38
SRA0:A2BE FF               rst  $38
SRA0:A2BF FF               rst  $38
SRA0:A2C0 FF               rst  $38
SRA0:A2C1 FF               rst  $38
SRA0:A2C2 FF               rst  $38
SRA0:A2C3 FF               rst  $38
SRA0:A2C4 FF               rst  $38
SRA0:A2C5 FF               rst  $38
SRA0:A2C6 FF               rst  $38
SRA0:A2C7 FF               rst  $38
SRA0:A2C8 FF               rst  $38
SRA0:A2C9 FF               rst  $38
SRA0:A2CA FF               rst  $38
SRA0:A2CB FF               rst  $38
SRA0:A2CC FF               rst  $38
SRA0:A2CD FF               rst  $38
SRA0:A2CE FF               rst  $38
SRA0:A2CF FF               rst  $38
SRA0:A2D0 FF               rst  $38
SRA0:A2D1 FF               rst  $38
SRA0:A2D2 FF               rst  $38
SRA0:A2D3 FF               rst  $38
SRA0:A2D4 FF               rst  $38
SRA0:A2D5 FF               rst  $38
SRA0:A2D6 FF               rst  $38
SRA0:A2D7 FF               rst  $38
SRA0:A2D8 FF               rst  $38
SRA0:A2D9 FF               rst  $38
SRA0:A2DA FF               rst  $38
SRA0:A2DB FF               rst  $38
SRA0:A2DC FF               rst  $38
SRA0:A2DD FF               rst  $38
SRA0:A2DE FF               rst  $38
SRA0:A2DF FF               rst  $38
SRA0:A2E0 FF               rst  $38
SRA0:A2E1 FF               rst  $38
SRA0:A2E2 FF               rst  $38
SRA0:A2E3 FF               rst  $38
SRA0:A2E4 FF               rst  $38
SRA0:A2E5 FF               rst  $38
SRA0:A2E6 FF               rst  $38
SRA0:A2E7 FF               rst  $38
SRA0:A2E8 FF               rst  $38
SRA0:A2E9 FF               rst  $38
SRA0:A2EA FF               rst  $38
SRA0:A2EB FF               rst  $38
SRA0:A2EC FF               rst  $38
SRA0:A2ED FF               rst  $38
SRA0:A2EE FF               rst  $38
SRA0:A2EF FF               rst  $38
SRA0:A2F0 FF               rst  $38
SRA0:A2F1 FF               rst  $38
SRA0:A2F2 FF               rst  $38
SRA0:A2F3 FF               rst  $38
SRA0:A2F4 FF               rst  $38
SRA0:A2F5 FF               rst  $38
SRA0:A2F6 FF               rst  $38
SRA0:A2F7 FF               rst  $38
SRA0:A2F8 FF               rst  $38
SRA0:A2F9 FF               rst  $38
SRA0:A2FA FF               rst  $38
SRA0:A2FB FF               rst  $38
SRA0:A2FC FF               rst  $38
SRA0:A2FD FF               rst  $38
SRA0:A2FE FF               rst  $38
SRA0:A2FF FF               rst  $38
SRA0:A300 FF               rst  $38
SRA0:A301 FF               rst  $38
SRA0:A302 FF               rst  $38
SRA0:A303 FF               rst  $38
SRA0:A304 FF               rst  $38
SRA0:A305 FF               rst  $38
SRA0:A306 FF               rst  $38
SRA0:A307 FF               rst  $38
SRA0:A308 FF               rst  $38
SRA0:A309 FF               rst  $38
SRA0:A30A FF               rst  $38
SRA0:A30B FF               rst  $38
SRA0:A30C FF               rst  $38
SRA0:A30D FF               rst  $38
SRA0:A30E FF               rst  $38
SRA0:A30F FF               rst  $38
SRA0:A310 FF               rst  $38
SRA0:A311 FF               rst  $38
SRA0:A312 FF               rst  $38
SRA0:A313 FF               rst  $38
SRA0:A314 FF               rst  $38
SRA0:A315 FF               rst  $38
SRA0:A316 FF               rst  $38
SRA0:A317 FF               rst  $38
SRA0:A318 FF               rst  $38
SRA0:A319 FF               rst  $38
SRA0:A31A FF               rst  $38
SRA0:A31B FF               rst  $38
SRA0:A31C FF               rst  $38
SRA0:A31D FF               rst  $38
SRA0:A31E FF               rst  $38
SRA0:A31F FF               rst  $38
SRA0:A320 FF               rst  $38
SRA0:A321 FF               rst  $38
SRA0:A322 FF               rst  $38
SRA0:A323 FF               rst  $38
SRA0:A324 FF               rst  $38
SRA0:A325 FF               rst  $38
SRA0:A326 FF               rst  $38
SRA0:A327 FF               rst  $38
SRA0:A328 FF               rst  $38
SRA0:A329 FF               rst  $38
SRA0:A32A FF               rst  $38
SRA0:A32B FF               rst  $38
SRA0:A32C FF               rst  $38
SRA0:A32D FF               rst  $38
SRA0:A32E FF               rst  $38
SRA0:A32F FF               rst  $38
SRA0:A330 FF               rst  $38
SRA0:A331 FF               rst  $38
SRA0:A332 FF               rst  $38
SRA0:A333 FF               rst  $38
SRA0:A334 FF               rst  $38
SRA0:A335 FF               rst  $38
SRA0:A336 FF               rst  $38
SRA0:A337 FF               rst  $38
SRA0:A338 FF               rst  $38
SRA0:A339 FF               rst  $38
SRA0:A33A FF               rst  $38
SRA0:A33B FF               rst  $38
SRA0:A33C FF               rst  $38
SRA0:A33D FF               rst  $38
SRA0:A33E FF               rst  $38
SRA0:A33F FF               rst  $38
SRA0:A340 FF               rst  $38
SRA0:A341 FF               rst  $38
SRA0:A342 FF               rst  $38
SRA0:A343 FF               rst  $38
SRA0:A344 FF               rst  $38
SRA0:A345 FF               rst  $38
SRA0:A346 FF               rst  $38
SRA0:A347 FF               rst  $38
SRA0:A348 FF               rst  $38
SRA0:A349 FF               rst  $38
SRA0:A34A FF               rst  $38
SRA0:A34B FF               rst  $38
SRA0:A34C FF               rst  $38
SRA0:A34D FF               rst  $38
SRA0:A34E FF               rst  $38
SRA0:A34F FF               rst  $38
SRA0:A350 FF               rst  $38
SRA0:A351 FF               rst  $38
SRA0:A352 FF               rst  $38
SRA0:A353 FF               rst  $38
SRA0:A354 FF               rst  $38
SRA0:A355 FF               rst  $38
SRA0:A356 FF               rst  $38
SRA0:A357 FF               rst  $38
SRA0:A358 FF               rst  $38
SRA0:A359 FF               rst  $38
SRA0:A35A FF               rst  $38
SRA0:A35B FF               rst  $38
SRA0:A35C FF               rst  $38
SRA0:A35D FF               rst  $38
SRA0:A35E FF               rst  $38
SRA0:A35F FF               rst  $38
SRA0:A360 FF               rst  $38
SRA0:A361 FF               rst  $38
SRA0:A362 FF               rst  $38
SRA0:A363 FF               rst  $38
SRA0:A364 FF               rst  $38
SRA0:A365 FF               rst  $38
SRA0:A366 FF               rst  $38
SRA0:A367 FF               rst  $38
SRA0:A368 FF               rst  $38
SRA0:A369 FF               rst  $38
SRA0:A36A FF               rst  $38
SRA0:A36B FF               rst  $38
SRA0:A36C FF               rst  $38
SRA0:A36D FF               rst  $38
SRA0:A36E FF               rst  $38
SRA0:A36F FF               rst  $38
SRA0:A370 FF               rst  $38
SRA0:A371 FF               rst  $38
SRA0:A372 FF               rst  $38
SRA0:A373 FF               rst  $38
SRA0:A374 FF               rst  $38
SRA0:A375 FF               rst  $38
SRA0:A376 FF               rst  $38
SRA0:A377 FF               rst  $38
SRA0:A378 FF               rst  $38
SRA0:A379 FF               rst  $38
SRA0:A37A FF               rst  $38
SRA0:A37B FF               rst  $38
SRA0:A37C FF               rst  $38
SRA0:A37D FF               rst  $38
SRA0:A37E FF               rst  $38
SRA0:A37F FF               rst  $38
SRA0:A380 FF               rst  $38
SRA0:A381 FF               rst  $38
SRA0:A382 FF               rst  $38
SRA0:A383 FF               rst  $38
SRA0:A384 FF               rst  $38
SRA0:A385 FF               rst  $38
SRA0:A386 FF               rst  $38
SRA0:A387 FF               rst  $38
SRA0:A388 FF               rst  $38
SRA0:A389 FF               rst  $38
SRA0:A38A FF               rst  $38
SRA0:A38B FF               rst  $38
SRA0:A38C FF               rst  $38
SRA0:A38D FF               rst  $38
SRA0:A38E FF               rst  $38
SRA0:A38F FF               rst  $38
SRA0:A390 FF               rst  $38
SRA0:A391 FF               rst  $38
SRA0:A392 FF               rst  $38
SRA0:A393 FF               rst  $38
SRA0:A394 FF               rst  $38
SRA0:A395 FF               rst  $38
SRA0:A396 FF               rst  $38
SRA0:A397 FF               rst  $38
SRA0:A398 FF               rst  $38
SRA0:A399 FF               rst  $38
SRA0:A39A FF               rst  $38
SRA0:A39B FF               rst  $38
SRA0:A39C FF               rst  $38
SRA0:A39D FF               rst  $38
SRA0:A39E FF               rst  $38
SRA0:A39F FF               rst  $38
SRA0:A3A0 FF               rst  $38
SRA0:A3A1 FF               rst  $38
SRA0:A3A2 FF               rst  $38
SRA0:A3A3 FF               rst  $38
SRA0:A3A4 FF               rst  $38
SRA0:A3A5 FF               rst  $38
SRA0:A3A6 FF               rst  $38
SRA0:A3A7 FF               rst  $38
SRA0:A3A8 FF               rst  $38
SRA0:A3A9 FF               rst  $38
SRA0:A3AA FF               rst  $38
SRA0:A3AB FF               rst  $38
SRA0:A3AC FF               rst  $38
SRA0:A3AD FF               rst  $38
SRA0:A3AE FF               rst  $38
SRA0:A3AF FF               rst  $38
SRA0:A3B0 FF               rst  $38
SRA0:A3B1 FF               rst  $38
SRA0:A3B2 FF               rst  $38
SRA0:A3B3 FF               rst  $38
SRA0:A3B4 FF               rst  $38
SRA0:A3B5 FF               rst  $38
SRA0:A3B6 FF               rst  $38
SRA0:A3B7 FF               rst  $38
SRA0:A3B8 FF               rst  $38
SRA0:A3B9 FF               rst  $38
SRA0:A3BA FF               rst  $38
SRA0:A3BB FF               rst  $38
SRA0:A3BC FF               rst  $38
SRA0:A3BD FF               rst  $38
SRA0:A3BE FF               rst  $38
SRA0:A3BF FF               rst  $38
SRA0:A3C0 FF               rst  $38
SRA0:A3C1 FF               rst  $38
SRA0:A3C2 FF               rst  $38
SRA0:A3C3 FF               rst  $38
SRA0:A3C4 FF               rst  $38
SRA0:A3C5 FF               rst  $38
SRA0:A3C6 FF               rst  $38
SRA0:A3C7 FF               rst  $38
SRA0:A3C8 FF               rst  $38
SRA0:A3C9 FF               rst  $38
SRA0:A3CA FF               rst  $38
SRA0:A3CB FF               rst  $38
SRA0:A3CC FF               rst  $38
SRA0:A3CD FF               rst  $38
SRA0:A3CE FF               rst  $38
SRA0:A3CF FF               rst  $38
SRA0:A3D0 FF               rst  $38
SRA0:A3D1 FF               rst  $38
SRA0:A3D2 FF               rst  $38
SRA0:A3D3 FF               rst  $38
SRA0:A3D4 FF               rst  $38
SRA0:A3D5 FF               rst  $38
SRA0:A3D6 FF               rst  $38
SRA0:A3D7 FF               rst  $38
SRA0:A3D8 FF               rst  $38
SRA0:A3D9 FF               rst  $38
SRA0:A3DA FF               rst  $38
SRA0:A3DB FF               rst  $38
SRA0:A3DC FF               rst  $38
SRA0:A3DD FF               rst  $38
SRA0:A3DE FF               rst  $38
SRA0:A3DF FF               rst  $38
SRA0:A3E0 FF               rst  $38
SRA0:A3E1 FF               rst  $38
SRA0:A3E2 FF               rst  $38
SRA0:A3E3 FF               rst  $38
SRA0:A3E4 FF               rst  $38
SRA0:A3E5 FF               rst  $38
SRA0:A3E6 FF               rst  $38
SRA0:A3E7 FF               rst  $38
SRA0:A3E8 FF               rst  $38
SRA0:A3E9 FF               rst  $38
SRA0:A3EA FF               rst  $38
SRA0:A3EB FF               rst  $38
SRA0:A3EC FF               rst  $38
SRA0:A3ED FF               rst  $38
SRA0:A3EE FF               rst  $38
SRA0:A3EF FF               rst  $38
SRA0:A3F0 FF               rst  $38
SRA0:A3F1 FF               rst  $38
SRA0:A3F2 FF               rst  $38
SRA0:A3F3 FF               rst  $38
SRA0:A3F4 FF               rst  $38
SRA0:A3F5 FF               rst  $38
SRA0:A3F6 FF               rst  $38
SRA0:A3F7 FF               rst  $38
SRA0:A3F8 FF               rst  $38
SRA0:A3F9 FF               rst  $38
SRA0:A3FA FF               rst  $38
SRA0:A3FB FF               rst  $38
SRA0:A3FC FF               rst  $38
SRA0:A3FD FF               rst  $38
SRA0:A3FE FF               rst  $38
SRA0:A3FF FF               rst  $38
SRA0:A400 FF               rst  $38
SRA0:A401 FF               rst  $38
SRA0:A402 FF               rst  $38
SRA0:A403 FF               rst  $38
SRA0:A404 FF               rst  $38
SRA0:A405 FF               rst  $38
SRA0:A406 FF               rst  $38
SRA0:A407 FF               rst  $38
SRA0:A408 FF               rst  $38
SRA0:A409 FF               rst  $38
SRA0:A40A FF               rst  $38
SRA0:A40B FF               rst  $38
SRA0:A40C FF               rst  $38
SRA0:A40D FF               rst  $38
SRA0:A40E FF               rst  $38
SRA0:A40F FF               rst  $38
SRA0:A410 FF               rst  $38
SRA0:A411 FF               rst  $38
SRA0:A412 FF               rst  $38
SRA0:A413 FF               rst  $38
SRA0:A414 FF               rst  $38
SRA0:A415 FF               rst  $38
SRA0:A416 FF               rst  $38
SRA0:A417 FF               rst  $38
SRA0:A418 FF               rst  $38
SRA0:A419 FF               rst  $38
SRA0:A41A FF               rst  $38
SRA0:A41B FF               rst  $38
SRA0:A41C FF               rst  $38
SRA0:A41D FF               rst  $38
SRA0:A41E FF               rst  $38
SRA0:A41F FF               rst  $38
SRA0:A420 FF               rst  $38
SRA0:A421 FF               rst  $38
SRA0:A422 FF               rst  $38
SRA0:A423 FF               rst  $38
SRA0:A424 FF               rst  $38
SRA0:A425 FF               rst  $38
SRA0:A426 FF               rst  $38
SRA0:A427 FF               rst  $38
SRA0:A428 FF               rst  $38
SRA0:A429 FF               rst  $38
SRA0:A42A FF               rst  $38
SRA0:A42B FF               rst  $38
SRA0:A42C FF               rst  $38
SRA0:A42D FF               rst  $38
SRA0:A42E FF               rst  $38
SRA0:A42F FF               rst  $38
SRA0:A430 FF               rst  $38
SRA0:A431 FF               rst  $38
SRA0:A432 FF               rst  $38
SRA0:A433 FF               rst  $38
SRA0:A434 FF               rst  $38
SRA0:A435 FF               rst  $38
SRA0:A436 FF               rst  $38
SRA0:A437 FF               rst  $38
SRA0:A438 FF               rst  $38
SRA0:A439 FF               rst  $38
SRA0:A43A FF               rst  $38
SRA0:A43B FF               rst  $38
SRA0:A43C FF               rst  $38
SRA0:A43D FF               rst  $38
SRA0:A43E FF               rst  $38
SRA0:A43F FF               rst  $38
SRA0:A440 FF               rst  $38
SRA0:A441 FF               rst  $38
SRA0:A442 FF               rst  $38
SRA0:A443 FF               rst  $38
SRA0:A444 FF               rst  $38
SRA0:A445 FF               rst  $38
SRA0:A446 FF               rst  $38
SRA0:A447 FF               rst  $38
SRA0:A448 FF               rst  $38
SRA0:A449 FF               rst  $38
SRA0:A44A FF               rst  $38
SRA0:A44B FF               rst  $38
SRA0:A44C FF               rst  $38
SRA0:A44D FF               rst  $38
SRA0:A44E FF               rst  $38
SRA0:A44F FF               rst  $38
SRA0:A450 FF               rst  $38
SRA0:A451 FF               rst  $38
SRA0:A452 FF               rst  $38
SRA0:A453 FF               rst  $38
SRA0:A454 FF               rst  $38
SRA0:A455 FF               rst  $38
SRA0:A456 FF               rst  $38
SRA0:A457 FF               rst  $38
SRA0:A458 FF               rst  $38
SRA0:A459 FF               rst  $38
SRA0:A45A FF               rst  $38
SRA0:A45B FF               rst  $38
SRA0:A45C FF               rst  $38
SRA0:A45D FF               rst  $38
SRA0:A45E FF               rst  $38
SRA0:A45F FF               rst  $38
SRA0:A460 FF               rst  $38
SRA0:A461 FF               rst  $38
SRA0:A462 FF               rst  $38
SRA0:A463 FF               rst  $38
SRA0:A464 FF               rst  $38
SRA0:A465 FF               rst  $38
SRA0:A466 FF               rst  $38
SRA0:A467 FF               rst  $38
SRA0:A468 FF               rst  $38
SRA0:A469 FF               rst  $38
SRA0:A46A FF               rst  $38
SRA0:A46B FF               rst  $38
SRA0:A46C FF               rst  $38
SRA0:A46D FF               rst  $38
SRA0:A46E FF               rst  $38
SRA0:A46F FF               rst  $38
SRA0:A470 FF               rst  $38
SRA0:A471 FF               rst  $38
SRA0:A472 FF               rst  $38
SRA0:A473 FF               rst  $38
SRA0:A474 FF               rst  $38
SRA0:A475 FF               rst  $38
SRA0:A476 FF               rst  $38
SRA0:A477 FF               rst  $38
SRA0:A478 FF               rst  $38
SRA0:A479 FF               rst  $38
SRA0:A47A FF               rst  $38
SRA0:A47B FF               rst  $38
SRA0:A47C FF               rst  $38
SRA0:A47D FF               rst  $38
SRA0:A47E FF               rst  $38
SRA0:A47F FF               rst  $38
SRA0:A480 FF               rst  $38
SRA0:A481 FF               rst  $38
SRA0:A482 FF               rst  $38
SRA0:A483 FF               rst  $38
SRA0:A484 FF               rst  $38
SRA0:A485 FF               rst  $38
SRA0:A486 FF               rst  $38
SRA0:A487 FF               rst  $38
SRA0:A488 FF               rst  $38
SRA0:A489 FF               rst  $38
SRA0:A48A FF               rst  $38
SRA0:A48B FF               rst  $38
SRA0:A48C FF               rst  $38
SRA0:A48D FF               rst  $38
SRA0:A48E FF               rst  $38
SRA0:A48F FF               rst  $38
SRA0:A490 FF               rst  $38
SRA0:A491 FF               rst  $38
SRA0:A492 FF               rst  $38
SRA0:A493 FF               rst  $38
SRA0:A494 FF               rst  $38
SRA0:A495 FF               rst  $38
SRA0:A496 FF               rst  $38
SRA0:A497 FF               rst  $38
SRA0:A498 FF               rst  $38
SRA0:A499 FF               rst  $38
SRA0:A49A FF               rst  $38
SRA0:A49B FF               rst  $38
SRA0:A49C FF               rst  $38
SRA0:A49D FF               rst  $38
SRA0:A49E FF               rst  $38
SRA0:A49F FF               rst  $38
SRA0:A4A0 FF               rst  $38
SRA0:A4A1 FF               rst  $38
SRA0:A4A2 FF               rst  $38
SRA0:A4A3 FF               rst  $38
SRA0:A4A4 FF               rst  $38
SRA0:A4A5 FF               rst  $38
SRA0:A4A6 FF               rst  $38
SRA0:A4A7 FF               rst  $38
SRA0:A4A8 FF               rst  $38
SRA0:A4A9 FF               rst  $38
SRA0:A4AA FF               rst  $38
SRA0:A4AB FF               rst  $38
SRA0:A4AC FF               rst  $38
SRA0:A4AD FF               rst  $38
SRA0:A4AE FF               rst  $38
SRA0:A4AF FF               rst  $38
SRA0:A4B0 FF               rst  $38
SRA0:A4B1 FF               rst  $38
SRA0:A4B2 FF               rst  $38
SRA0:A4B3 FF               rst  $38
SRA0:A4B4 FF               rst  $38
SRA0:A4B5 FF               rst  $38
SRA0:A4B6 FF               rst  $38
SRA0:A4B7 FF               rst  $38
SRA0:A4B8 FF               rst  $38
SRA0:A4B9 FF               rst  $38
SRA0:A4BA FF               rst  $38
SRA0:A4BB FF               rst  $38
SRA0:A4BC FF               rst  $38
SRA0:A4BD FF               rst  $38
SRA0:A4BE FF               rst  $38
SRA0:A4BF FF               rst  $38
SRA0:A4C0 FF               rst  $38
SRA0:A4C1 FF               rst  $38
SRA0:A4C2 FF               rst  $38
SRA0:A4C3 FF               rst  $38
SRA0:A4C4 FF               rst  $38
SRA0:A4C5 FF               rst  $38
SRA0:A4C6 FF               rst  $38
SRA0:A4C7 FF               rst  $38
SRA0:A4C8 FF               rst  $38
SRA0:A4C9 FF               rst  $38
SRA0:A4CA FF               rst  $38
SRA0:A4CB FF               rst  $38
SRA0:A4CC FF               rst  $38
SRA0:A4CD FF               rst  $38
SRA0:A4CE FF               rst  $38
SRA0:A4CF FF               rst  $38
SRA0:A4D0 FF               rst  $38
SRA0:A4D1 FF               rst  $38
SRA0:A4D2 FF               rst  $38
SRA0:A4D3 FF               rst  $38
SRA0:A4D4 FF               rst  $38
SRA0:A4D5 FF               rst  $38
SRA0:A4D6 FF               rst  $38
SRA0:A4D7 FF               rst  $38
SRA0:A4D8 FF               rst  $38
SRA0:A4D9 FF               rst  $38
SRA0:A4DA FF               rst  $38
SRA0:A4DB FF               rst  $38
SRA0:A4DC FF               rst  $38
SRA0:A4DD FF               rst  $38
SRA0:A4DE FF               rst  $38
SRA0:A4DF FF               rst  $38
SRA0:A4E0 FF               rst  $38
SRA0:A4E1 FF               rst  $38
SRA0:A4E2 FF               rst  $38
SRA0:A4E3 FF               rst  $38
SRA0:A4E4 FF               rst  $38
SRA0:A4E5 FF               rst  $38
SRA0:A4E6 FF               rst  $38
SRA0:A4E7 FF               rst  $38
SRA0:A4E8 FF               rst  $38
SRA0:A4E9 FF               rst  $38
SRA0:A4EA FF               rst  $38
SRA0:A4EB FF               rst  $38
SRA0:A4EC FF               rst  $38
SRA0:A4ED FF               rst  $38
SRA0:A4EE FF               rst  $38
SRA0:A4EF FF               rst  $38
SRA0:A4F0 FF               rst  $38
SRA0:A4F1 FF               rst  $38
SRA0:A4F2 FF               rst  $38
SRA0:A4F3 FF               rst  $38
SRA0:A4F4 FF               rst  $38
SRA0:A4F5 FF               rst  $38
SRA0:A4F6 FF               rst  $38
SRA0:A4F7 FF               rst  $38
SRA0:A4F8 FF               rst  $38
SRA0:A4F9 FF               rst  $38
SRA0:A4FA FF               rst  $38
SRA0:A4FB FF               rst  $38
SRA0:A4FC FF               rst  $38
SRA0:A4FD FF               rst  $38
SRA0:A4FE FF               rst  $38
SRA0:A4FF FF               rst  $38
SRA0:A500 FF               rst  $38
SRA0:A501 FF               rst  $38
SRA0:A502 FF               rst  $38
SRA0:A503 FF               rst  $38
SRA0:A504 FF               rst  $38
SRA0:A505 FF               rst  $38
SRA0:A506 FF               rst  $38
SRA0:A507 FF               rst  $38
SRA0:A508 FF               rst  $38
SRA0:A509 FF               rst  $38
SRA0:A50A FF               rst  $38
SRA0:A50B FF               rst  $38
SRA0:A50C FF               rst  $38
SRA0:A50D FF               rst  $38
SRA0:A50E FF               rst  $38
SRA0:A50F FF               rst  $38
SRA0:A510 FF               rst  $38
SRA0:A511 FF               rst  $38
SRA0:A512 FF               rst  $38
SRA0:A513 FF               rst  $38
SRA0:A514 FF               rst  $38
SRA0:A515 FF               rst  $38
SRA0:A516 FF               rst  $38
SRA0:A517 FF               rst  $38
SRA0:A518 FF               rst  $38
SRA0:A519 FF               rst  $38
SRA0:A51A FF               rst  $38
SRA0:A51B FF               rst  $38
SRA0:A51C FF               rst  $38
SRA0:A51D FF               rst  $38
SRA0:A51E FF               rst  $38
SRA0:A51F FF               rst  $38
SRA0:A520 FF               rst  $38
SRA0:A521 FF               rst  $38
SRA0:A522 FF               rst  $38
SRA0:A523 FF               rst  $38
SRA0:A524 FF               rst  $38
SRA0:A525 FF               rst  $38
SRA0:A526 FF               rst  $38
SRA0:A527 FF               rst  $38
SRA0:A528 FF               rst  $38
SRA0:A529 FF               rst  $38
SRA0:A52A FF               rst  $38
SRA0:A52B FF               rst  $38
SRA0:A52C FF               rst  $38
SRA0:A52D FF               rst  $38
SRA0:A52E FF               rst  $38
SRA0:A52F FF               rst  $38
SRA0:A530 FF               rst  $38
SRA0:A531 FF               rst  $38
SRA0:A532 FF               rst  $38
SRA0:A533 FF               rst  $38
SRA0:A534 FF               rst  $38
SRA0:A535 FF               rst  $38
SRA0:A536 FF               rst  $38
SRA0:A537 FF               rst  $38
SRA0:A538 FF               rst  $38
SRA0:A539 FF               rst  $38
SRA0:A53A FF               rst  $38
SRA0:A53B FF               rst  $38
SRA0:A53C FF               rst  $38
SRA0:A53D FF               rst  $38
SRA0:A53E FF               rst  $38
SRA0:A53F FF               rst  $38
SRA0:A540 FF               rst  $38
SRA0:A541 FF               rst  $38
SRA0:A542 FF               rst  $38
SRA0:A543 FF               rst  $38
SRA0:A544 FF               rst  $38
SRA0:A545 FF               rst  $38
SRA0:A546 FF               rst  $38
SRA0:A547 FF               rst  $38
SRA0:A548 FF               rst  $38
SRA0:A549 FF               rst  $38
SRA0:A54A FF               rst  $38
SRA0:A54B FF               rst  $38
SRA0:A54C FF               rst  $38
SRA0:A54D FF               rst  $38
SRA0:A54E FF               rst  $38
SRA0:A54F FF               rst  $38
SRA0:A550 FF               rst  $38
SRA0:A551 FF               rst  $38
SRA0:A552 FF               rst  $38
SRA0:A553 FF               rst  $38
SRA0:A554 FF               rst  $38
SRA0:A555 FF               rst  $38
SRA0:A556 FF               rst  $38
SRA0:A557 FF               rst  $38
SRA0:A558 FF               rst  $38
SRA0:A559 FF               rst  $38
SRA0:A55A FF               rst  $38
SRA0:A55B FF               rst  $38
SRA0:A55C FF               rst  $38
SRA0:A55D FF               rst  $38
SRA0:A55E FF               rst  $38
SRA0:A55F FF               rst  $38
SRA0:A560 FF               rst  $38
SRA0:A561 FF               rst  $38
SRA0:A562 FF               rst  $38
SRA0:A563 FF               rst  $38
SRA0:A564 FF               rst  $38
SRA0:A565 FF               rst  $38
SRA0:A566 FF               rst  $38
SRA0:A567 FF               rst  $38
SRA0:A568 FF               rst  $38
SRA0:A569 FF               rst  $38
SRA0:A56A FF               rst  $38
SRA0:A56B FF               rst  $38
SRA0:A56C FF               rst  $38
SRA0:A56D FF               rst  $38
SRA0:A56E FF               rst  $38
SRA0:A56F FF               rst  $38
SRA0:A570 FF               rst  $38
SRA0:A571 FF               rst  $38
SRA0:A572 FF               rst  $38
SRA0:A573 FF               rst  $38
SRA0:A574 FF               rst  $38
SRA0:A575 FF               rst  $38
SRA0:A576 FF               rst  $38
SRA0:A577 FF               rst  $38
SRA0:A578 FF               rst  $38
SRA0:A579 FF               rst  $38
SRA0:A57A FF               rst  $38
SRA0:A57B FF               rst  $38
SRA0:A57C FF               rst  $38
SRA0:A57D FF               rst  $38
SRA0:A57E FF               rst  $38
SRA0:A57F FF               rst  $38
SRA0:A580 FF               rst  $38
SRA0:A581 FF               rst  $38
SRA0:A582 FF               rst  $38
SRA0:A583 FF               rst  $38
SRA0:A584 FF               rst  $38
SRA0:A585 FF               rst  $38
SRA0:A586 FF               rst  $38
SRA0:A587 FF               rst  $38
SRA0:A588 FF               rst  $38
SRA0:A589 FF               rst  $38
SRA0:A58A FF               rst  $38
SRA0:A58B FF               rst  $38
SRA0:A58C FF               rst  $38
SRA0:A58D FF               rst  $38
SRA0:A58E FF               rst  $38
SRA0:A58F FF               rst  $38
SRA0:A590 FF               rst  $38
SRA0:A591 FF               rst  $38
SRA0:A592 FF               rst  $38
SRA0:A593 FF               rst  $38
SRA0:A594 FF               rst  $38
SRA0:A595 FF               rst  $38
SRA0:A596 FF               rst  $38
SRA0:A597 FF               rst  $38
SRA0:A598 FF               rst  $38
SRA0:A599 FF               rst  $38
SRA0:A59A FF               rst  $38
SRA0:A59B FF               rst  $38
SRA0:A59C FF               rst  $38
SRA0:A59D FF               rst  $38
SRA0:A59E FF               rst  $38
SRA0:A59F FF               rst  $38
SRA0:A5A0 FF               rst  $38
SRA0:A5A1 FF               rst  $38
SRA0:A5A2 FF               rst  $38
SRA0:A5A3 FF               rst  $38
SRA0:A5A4 FF               rst  $38
SRA0:A5A5 FF               rst  $38
SRA0:A5A6 FF               rst  $38
SRA0:A5A7 FF               rst  $38
SRA0:A5A8 FF               rst  $38
SRA0:A5A9 FF               rst  $38
SRA0:A5AA FF               rst  $38
SRA0:A5AB FF               rst  $38
SRA0:A5AC FF               rst  $38
SRA0:A5AD FF               rst  $38
SRA0:A5AE FF               rst  $38
SRA0:A5AF FF               rst  $38
SRA0:A5B0 FF               rst  $38
SRA0:A5B1 FF               rst  $38
SRA0:A5B2 FF               rst  $38
SRA0:A5B3 FF               rst  $38
SRA0:A5B4 FF               rst  $38
SRA0:A5B5 FF               rst  $38
SRA0:A5B6 FF               rst  $38
SRA0:A5B7 FF               rst  $38
SRA0:A5B8 FF               rst  $38
SRA0:A5B9 FF               rst  $38
SRA0:A5BA FF               rst  $38
SRA0:A5BB FF               rst  $38
SRA0:A5BC FF               rst  $38
SRA0:A5BD FF               rst  $38
SRA0:A5BE FF               rst  $38
SRA0:A5BF FF               rst  $38
SRA0:A5C0 FF               rst  $38
SRA0:A5C1 FF               rst  $38
SRA0:A5C2 FF               rst  $38
SRA0:A5C3 FF               rst  $38
SRA0:A5C4 FF               rst  $38
SRA0:A5C5 FF               rst  $38
SRA0:A5C6 FF               rst  $38
SRA0:A5C7 FF               rst  $38
SRA0:A5C8 FF               rst  $38
SRA0:A5C9 FF               rst  $38
SRA0:A5CA FF               rst  $38
SRA0:A5CB FF               rst  $38
SRA0:A5CC FF               rst  $38
SRA0:A5CD FF               rst  $38
SRA0:A5CE FF               rst  $38
SRA0:A5CF FF               rst  $38
SRA0:A5D0 FF               rst  $38
SRA0:A5D1 FF               rst  $38
SRA0:A5D2 FF               rst  $38
SRA0:A5D3 FF               rst  $38
SRA0:A5D4 FF               rst  $38
SRA0:A5D5 FF               rst  $38
SRA0:A5D6 FF               rst  $38
SRA0:A5D7 FF               rst  $38
SRA0:A5D8 FF               rst  $38
SRA0:A5D9 FF               rst  $38
SRA0:A5DA FF               rst  $38
SRA0:A5DB FF               rst  $38
SRA0:A5DC FF               rst  $38
SRA0:A5DD FF               rst  $38
SRA0:A5DE FF               rst  $38
SRA0:A5DF FF               rst  $38
SRA0:A5E0 FF               rst  $38
SRA0:A5E1 FF               rst  $38
SRA0:A5E2 FF               rst  $38
SRA0:A5E3 FF               rst  $38
SRA0:A5E4 FF               rst  $38
SRA0:A5E5 FF               rst  $38
SRA0:A5E6 FF               rst  $38
SRA0:A5E7 FF               rst  $38
SRA0:A5E8 FF               rst  $38
SRA0:A5E9 FF               rst  $38
SRA0:A5EA FF               rst  $38
SRA0:A5EB FF               rst  $38
SRA0:A5EC FF               rst  $38
SRA0:A5ED FF               rst  $38
SRA0:A5EE FF               rst  $38
SRA0:A5EF FF               rst  $38
SRA0:A5F0 FF               rst  $38
SRA0:A5F1 FF               rst  $38
SRA0:A5F2 FF               rst  $38
SRA0:A5F3 FF               rst  $38
SRA0:A5F4 FF               rst  $38
SRA0:A5F5 FF               rst  $38
SRA0:A5F6 FF               rst  $38
SRA0:A5F7 FF               rst  $38
SRA0:A5F8 FF               rst  $38
SRA0:A5F9 FF               rst  $38
SRA0:A5FA FF               rst  $38
SRA0:A5FB FF               rst  $38
SRA0:A5FC FF               rst  $38
SRA0:A5FD FF               rst  $38
SRA0:A5FE FF               rst  $38
SRA0:A5FF FF               rst  $38
SRA0:A600 FF               rst  $38
SRA0:A601 FF               rst  $38
SRA0:A602 FF               rst  $38
SRA0:A603 FF               rst  $38
SRA0:A604 FF               rst  $38
SRA0:A605 FF               rst  $38
SRA0:A606 FF               rst  $38
SRA0:A607 FF               rst  $38
SRA0:A608 FF               rst  $38
SRA0:A609 FF               rst  $38
SRA0:A60A FF               rst  $38
SRA0:A60B FF               rst  $38
SRA0:A60C FF               rst  $38
SRA0:A60D FF               rst  $38
SRA0:A60E FF               rst  $38
SRA0:A60F FF               rst  $38
SRA0:A610 FF               rst  $38
SRA0:A611 FF               rst  $38
SRA0:A612 FF               rst  $38
SRA0:A613 FF               rst  $38
SRA0:A614 FF               rst  $38
SRA0:A615 FF               rst  $38
SRA0:A616 FF               rst  $38
SRA0:A617 FF               rst  $38
SRA0:A618 FF               rst  $38
SRA0:A619 FF               rst  $38
SRA0:A61A FF               rst  $38
SRA0:A61B FF               rst  $38
SRA0:A61C FF               rst  $38
SRA0:A61D FF               rst  $38
SRA0:A61E FF               rst  $38
SRA0:A61F FF               rst  $38
SRA0:A620 FF               rst  $38
SRA0:A621 FF               rst  $38
SRA0:A622 FF               rst  $38
SRA0:A623 FF               rst  $38
SRA0:A624 FF               rst  $38
SRA0:A625 FF               rst  $38
SRA0:A626 FF               rst  $38
SRA0:A627 FF               rst  $38
SRA0:A628 FF               rst  $38
SRA0:A629 FF               rst  $38
SRA0:A62A FF               rst  $38
SRA0:A62B FF               rst  $38
SRA0:A62C FF               rst  $38
SRA0:A62D FF               rst  $38
SRA0:A62E FF               rst  $38
SRA0:A62F FF               rst  $38
SRA0:A630 FF               rst  $38
SRA0:A631 FF               rst  $38
SRA0:A632 FF               rst  $38
SRA0:A633 FF               rst  $38
SRA0:A634 FF               rst  $38
SRA0:A635 FF               rst  $38
SRA0:A636 FF               rst  $38
SRA0:A637 FF               rst  $38
SRA0:A638 FF               rst  $38
SRA0:A639 FF               rst  $38
SRA0:A63A FF               rst  $38
SRA0:A63B FF               rst  $38
SRA0:A63C FF               rst  $38
SRA0:A63D FF               rst  $38
SRA0:A63E FF               rst  $38
SRA0:A63F FF               rst  $38
SRA0:A640 FF               rst  $38
SRA0:A641 FF               rst  $38
SRA0:A642 FF               rst  $38
SRA0:A643 FF               rst  $38
SRA0:A644 FF               rst  $38
SRA0:A645 FF               rst  $38
SRA0:A646 FF               rst  $38
SRA0:A647 FF               rst  $38
SRA0:A648 FF               rst  $38
SRA0:A649 FF               rst  $38
SRA0:A64A FF               rst  $38
SRA0:A64B FF               rst  $38
SRA0:A64C FF               rst  $38
SRA0:A64D FF               rst  $38
SRA0:A64E FF               rst  $38
SRA0:A64F FF               rst  $38
SRA0:A650 FF               rst  $38
SRA0:A651 FF               rst  $38
SRA0:A652 FF               rst  $38
SRA0:A653 FF               rst  $38
SRA0:A654 FF               rst  $38
SRA0:A655 FF               rst  $38
SRA0:A656 FF               rst  $38
SRA0:A657 FF               rst  $38
SRA0:A658 FF               rst  $38
SRA0:A659 FF               rst  $38
SRA0:A65A FF               rst  $38
SRA0:A65B FF               rst  $38
SRA0:A65C FF               rst  $38
SRA0:A65D FF               rst  $38
SRA0:A65E FF               rst  $38
SRA0:A65F FF               rst  $38
SRA0:A660 FF               rst  $38
SRA0:A661 FF               rst  $38
SRA0:A662 FF               rst  $38
SRA0:A663 FF               rst  $38
SRA0:A664 FF               rst  $38
SRA0:A665 FF               rst  $38
SRA0:A666 FF               rst  $38
SRA0:A667 FF               rst  $38
SRA0:A668 FF               rst  $38
SRA0:A669 FF               rst  $38
SRA0:A66A FF               rst  $38
SRA0:A66B FF               rst  $38
SRA0:A66C FF               rst  $38
SRA0:A66D FF               rst  $38
SRA0:A66E FF               rst  $38
SRA0:A66F FF               rst  $38
SRA0:A670 FF               rst  $38
SRA0:A671 FF               rst  $38
SRA0:A672 FF               rst  $38
SRA0:A673 FF               rst  $38
SRA0:A674 FF               rst  $38
SRA0:A675 FF               rst  $38
SRA0:A676 FF               rst  $38
SRA0:A677 FF               rst  $38
SRA0:A678 FF               rst  $38
SRA0:A679 FF               rst  $38
SRA0:A67A FF               rst  $38
SRA0:A67B FF               rst  $38
SRA0:A67C FF               rst  $38
SRA0:A67D FF               rst  $38
SRA0:A67E FF               rst  $38
SRA0:A67F FF               rst  $38
SRA0:A680 FF               rst  $38
SRA0:A681 FF               rst  $38
SRA0:A682 FF               rst  $38
SRA0:A683 FF               rst  $38
SRA0:A684 FF               rst  $38
SRA0:A685 FF               rst  $38
SRA0:A686 FF               rst  $38
SRA0:A687 FF               rst  $38
SRA0:A688 FF               rst  $38
SRA0:A689 FF               rst  $38
SRA0:A68A FF               rst  $38
SRA0:A68B FF               rst  $38
SRA0:A68C FF               rst  $38
SRA0:A68D FF               rst  $38
SRA0:A68E FF               rst  $38
SRA0:A68F FF               rst  $38
SRA0:A690 FF               rst  $38
SRA0:A691 FF               rst  $38
SRA0:A692 FF               rst  $38
SRA0:A693 FF               rst  $38
SRA0:A694 FF               rst  $38
SRA0:A695 FF               rst  $38
SRA0:A696 FF               rst  $38
SRA0:A697 FF               rst  $38
SRA0:A698 FF               rst  $38
SRA0:A699 FF               rst  $38
SRA0:A69A FF               rst  $38
SRA0:A69B FF               rst  $38
SRA0:A69C FF               rst  $38
SRA0:A69D FF               rst  $38
SRA0:A69E FF               rst  $38
SRA0:A69F FF               rst  $38
SRA0:A6A0 FF               rst  $38
SRA0:A6A1 FF               rst  $38
SRA0:A6A2 FF               rst  $38
SRA0:A6A3 FF               rst  $38
SRA0:A6A4 FF               rst  $38
SRA0:A6A5 FF               rst  $38
SRA0:A6A6 FF               rst  $38
SRA0:A6A7 FF               rst  $38
SRA0:A6A8 FF               rst  $38
SRA0:A6A9 FF               rst  $38
SRA0:A6AA FF               rst  $38
SRA0:A6AB FF               rst  $38
SRA0:A6AC FF               rst  $38
SRA0:A6AD FF               rst  $38
SRA0:A6AE FF               rst  $38
SRA0:A6AF FF               rst  $38
SRA0:A6B0 FF               rst  $38
SRA0:A6B1 FF               rst  $38
SRA0:A6B2 FF               rst  $38
SRA0:A6B3 FF               rst  $38
SRA0:A6B4 FF               rst  $38
SRA0:A6B5 FF               rst  $38
SRA0:A6B6 FF               rst  $38
SRA0:A6B7 FF               rst  $38
SRA0:A6B8 FF               rst  $38
SRA0:A6B9 FF               rst  $38
SRA0:A6BA FF               rst  $38
SRA0:A6BB FF               rst  $38
SRA0:A6BC FF               rst  $38
SRA0:A6BD FF               rst  $38
SRA0:A6BE FF               rst  $38
SRA0:A6BF FF               rst  $38
SRA0:A6C0 FF               rst  $38
SRA0:A6C1 FF               rst  $38
SRA0:A6C2 FF               rst  $38
SRA0:A6C3 FF               rst  $38
SRA0:A6C4 FF               rst  $38
SRA0:A6C5 FF               rst  $38
SRA0:A6C6 FF               rst  $38
SRA0:A6C7 FF               rst  $38
SRA0:A6C8 FF               rst  $38
SRA0:A6C9 FF               rst  $38
SRA0:A6CA FF               rst  $38
SRA0:A6CB FF               rst  $38
SRA0:A6CC FF               rst  $38
SRA0:A6CD FF               rst  $38
SRA0:A6CE FF               rst  $38
SRA0:A6CF FF               rst  $38
SRA0:A6D0 FF               rst  $38
SRA0:A6D1 FF               rst  $38
SRA0:A6D2 FF               rst  $38
SRA0:A6D3 FF               rst  $38
SRA0:A6D4 FF               rst  $38
SRA0:A6D5 FF               rst  $38
SRA0:A6D6 FF               rst  $38
SRA0:A6D7 FF               rst  $38
SRA0:A6D8 FF               rst  $38
SRA0:A6D9 FF               rst  $38
SRA0:A6DA FF               rst  $38
SRA0:A6DB FF               rst  $38
SRA0:A6DC FF               rst  $38
SRA0:A6DD FF               rst  $38
SRA0:A6DE FF               rst  $38
SRA0:A6DF FF               rst  $38
SRA0:A6E0 FF               rst  $38
SRA0:A6E1 FF               rst  $38
SRA0:A6E2 FF               rst  $38
SRA0:A6E3 FF               rst  $38
SRA0:A6E4 FF               rst  $38
SRA0:A6E5 FF               rst  $38
SRA0:A6E6 FF               rst  $38
SRA0:A6E7 FF               rst  $38
SRA0:A6E8 FF               rst  $38
SRA0:A6E9 FF               rst  $38
SRA0:A6EA FF               rst  $38
SRA0:A6EB FF               rst  $38
SRA0:A6EC FF               rst  $38
SRA0:A6ED FF               rst  $38
SRA0:A6EE FF               rst  $38
SRA0:A6EF FF               rst  $38
SRA0:A6F0 FF               rst  $38
SRA0:A6F1 FF               rst  $38
SRA0:A6F2 FF               rst  $38
SRA0:A6F3 FF               rst  $38
SRA0:A6F4 FF               rst  $38
SRA0:A6F5 FF               rst  $38
SRA0:A6F6 FF               rst  $38
SRA0:A6F7 FF               rst  $38
SRA0:A6F8 FF               rst  $38
SRA0:A6F9 FF               rst  $38
SRA0:A6FA FF               rst  $38
SRA0:A6FB FF               rst  $38
SRA0:A6FC FF               rst  $38
SRA0:A6FD FF               rst  $38
SRA0:A6FE FF               rst  $38
SRA0:A6FF FF               rst  $38
SRA0:A700 FF               rst  $38
SRA0:A701 FF               rst  $38
SRA0:A702 FF               rst  $38
SRA0:A703 FF               rst  $38
SRA0:A704 FF               rst  $38
SRA0:A705 FF               rst  $38
SRA0:A706 FF               rst  $38
SRA0:A707 FF               rst  $38
SRA0:A708 FF               rst  $38
SRA0:A709 FF               rst  $38
SRA0:A70A FF               rst  $38
SRA0:A70B FF               rst  $38
SRA0:A70C FF               rst  $38
SRA0:A70D FF               rst  $38
SRA0:A70E FF               rst  $38
SRA0:A70F FF               rst  $38
SRA0:A710 FF               rst  $38
SRA0:A711 FF               rst  $38
SRA0:A712 FF               rst  $38
SRA0:A713 FF               rst  $38
SRA0:A714 FF               rst  $38
SRA0:A715 FF               rst  $38
SRA0:A716 FF               rst  $38
SRA0:A717 FF               rst  $38
SRA0:A718 FF               rst  $38
SRA0:A719 FF               rst  $38
SRA0:A71A FF               rst  $38
SRA0:A71B FF               rst  $38
SRA0:A71C FF               rst  $38
SRA0:A71D FF               rst  $38
SRA0:A71E FF               rst  $38
SRA0:A71F FF               rst  $38
SRA0:A720 FF               rst  $38
SRA0:A721 FF               rst  $38
SRA0:A722 FF               rst  $38
SRA0:A723 FF               rst  $38
SRA0:A724 FF               rst  $38
SRA0:A725 FF               rst  $38
SRA0:A726 FF               rst  $38
SRA0:A727 FF               rst  $38
SRA0:A728 FF               rst  $38
SRA0:A729 FF               rst  $38
SRA0:A72A FF               rst  $38
SRA0:A72B FF               rst  $38
SRA0:A72C FF               rst  $38
SRA0:A72D FF               rst  $38
SRA0:A72E FF               rst  $38
SRA0:A72F FF               rst  $38
SRA0:A730 FF               rst  $38
SRA0:A731 FF               rst  $38
SRA0:A732 FF               rst  $38
SRA0:A733 FF               rst  $38
SRA0:A734 FF               rst  $38
SRA0:A735 FF               rst  $38
SRA0:A736 FF               rst  $38
SRA0:A737 FF               rst  $38
SRA0:A738 FF               rst  $38
SRA0:A739 FF               rst  $38
SRA0:A73A FF               rst  $38
SRA0:A73B FF               rst  $38
SRA0:A73C FF               rst  $38
SRA0:A73D FF               rst  $38
SRA0:A73E FF               rst  $38
SRA0:A73F FF               rst  $38
SRA0:A740 FF               rst  $38
SRA0:A741 FF               rst  $38
SRA0:A742 FF               rst  $38
SRA0:A743 FF               rst  $38
SRA0:A744 FF               rst  $38
SRA0:A745 FF               rst  $38
SRA0:A746 FF               rst  $38
SRA0:A747 FF               rst  $38
SRA0:A748 FF               rst  $38
SRA0:A749 FF               rst  $38
SRA0:A74A FF               rst  $38
SRA0:A74B FF               rst  $38
SRA0:A74C FF               rst  $38
SRA0:A74D FF               rst  $38
SRA0:A74E FF               rst  $38
SRA0:A74F FF               rst  $38
SRA0:A750 FF               rst  $38
SRA0:A751 FF               rst  $38
SRA0:A752 FF               rst  $38
SRA0:A753 FF               rst  $38
SRA0:A754 FF               rst  $38
SRA0:A755 FF               rst  $38
SRA0:A756 FF               rst  $38
SRA0:A757 FF               rst  $38
SRA0:A758 FF               rst  $38
SRA0:A759 FF               rst  $38
SRA0:A75A FF               rst  $38
SRA0:A75B FF               rst  $38
SRA0:A75C FF               rst  $38
SRA0:A75D FF               rst  $38
SRA0:A75E FF               rst  $38
SRA0:A75F FF               rst  $38
SRA0:A760 FF               rst  $38
SRA0:A761 FF               rst  $38
SRA0:A762 FF               rst  $38
SRA0:A763 FF               rst  $38
SRA0:A764 FF               rst  $38
SRA0:A765 FF               rst  $38
SRA0:A766 FF               rst  $38
SRA0:A767 FF               rst  $38
SRA0:A768 FF               rst  $38
SRA0:A769 FF               rst  $38
SRA0:A76A FF               rst  $38
SRA0:A76B FF               rst  $38
SRA0:A76C FF               rst  $38
SRA0:A76D FF               rst  $38
SRA0:A76E FF               rst  $38
SRA0:A76F FF               rst  $38
SRA0:A770 FF               rst  $38
SRA0:A771 FF               rst  $38
SRA0:A772 FF               rst  $38
SRA0:A773 FF               rst  $38
SRA0:A774 FF               rst  $38
SRA0:A775 FF               rst  $38
SRA0:A776 FF               rst  $38
SRA0:A777 FF               rst  $38
SRA0:A778 FF               rst  $38
SRA0:A779 FF               rst  $38
SRA0:A77A FF               rst  $38
SRA0:A77B FF               rst  $38
SRA0:A77C FF               rst  $38
SRA0:A77D FF               rst  $38
SRA0:A77E FF               rst  $38
SRA0:A77F FF               rst  $38
SRA0:A780 FF               rst  $38
SRA0:A781 FF               rst  $38
SRA0:A782 FF               rst  $38
SRA0:A783 FF               rst  $38
SRA0:A784 FF               rst  $38
SRA0:A785 FF               rst  $38
SRA0:A786 FF               rst  $38
SRA0:A787 FF               rst  $38
SRA0:A788 FF               rst  $38
SRA0:A789 FF               rst  $38
SRA0:A78A FF               rst  $38
SRA0:A78B FF               rst  $38
SRA0:A78C FF               rst  $38
SRA0:A78D FF               rst  $38
SRA0:A78E FF               rst  $38
SRA0:A78F FF               rst  $38
SRA0:A790 FF               rst  $38
SRA0:A791 FF               rst  $38
SRA0:A792 FF               rst  $38
SRA0:A793 FF               rst  $38
SRA0:A794 FF               rst  $38
SRA0:A795 FF               rst  $38
SRA0:A796 FF               rst  $38
SRA0:A797 FF               rst  $38
SRA0:A798 FF               rst  $38
SRA0:A799 FF               rst  $38
SRA0:A79A FF               rst  $38
SRA0:A79B FF               rst  $38
SRA0:A79C FF               rst  $38
SRA0:A79D FF               rst  $38
SRA0:A79E FF               rst  $38
SRA0:A79F FF               rst  $38
SRA0:A7A0 FF               rst  $38
SRA0:A7A1 FF               rst  $38
SRA0:A7A2 FF               rst  $38
SRA0:A7A3 FF               rst  $38
SRA0:A7A4 FF               rst  $38
SRA0:A7A5 FF               rst  $38
SRA0:A7A6 FF               rst  $38
SRA0:A7A7 FF               rst  $38
SRA0:A7A8 FF               rst  $38
SRA0:A7A9 FF               rst  $38
SRA0:A7AA FF               rst  $38
SRA0:A7AB FF               rst  $38
SRA0:A7AC FF               rst  $38
SRA0:A7AD FF               rst  $38
SRA0:A7AE FF               rst  $38
SRA0:A7AF FF               rst  $38
SRA0:A7B0 FF               rst  $38
SRA0:A7B1 FF               rst  $38
SRA0:A7B2 FF               rst  $38
SRA0:A7B3 FF               rst  $38
SRA0:A7B4 FF               rst  $38
SRA0:A7B5 FF               rst  $38
SRA0:A7B6 FF               rst  $38
SRA0:A7B7 FF               rst  $38
SRA0:A7B8 FF               rst  $38
SRA0:A7B9 FF               rst  $38
SRA0:A7BA FF               rst  $38
SRA0:A7BB FF               rst  $38
SRA0:A7BC FF               rst  $38
SRA0:A7BD FF               rst  $38
SRA0:A7BE FF               rst  $38
SRA0:A7BF FF               rst  $38
SRA0:A7C0 FF               rst  $38
SRA0:A7C1 FF               rst  $38
SRA0:A7C2 FF               rst  $38
SRA0:A7C3 FF               rst  $38
SRA0:A7C4 FF               rst  $38
SRA0:A7C5 FF               rst  $38
SRA0:A7C6 FF               rst  $38
SRA0:A7C7 FF               rst  $38
SRA0:A7C8 FF               rst  $38
SRA0:A7C9 FF               rst  $38
SRA0:A7CA FF               rst  $38
SRA0:A7CB FF               rst  $38
SRA0:A7CC FF               rst  $38
SRA0:A7CD FF               rst  $38
SRA0:A7CE FF               rst  $38
SRA0:A7CF FF               rst  $38
SRA0:A7D0 FF               rst  $38
SRA0:A7D1 FF               rst  $38
SRA0:A7D2 FF               rst  $38
SRA0:A7D3 FF               rst  $38
SRA0:A7D4 FF               rst  $38
SRA0:A7D5 FF               rst  $38
SRA0:A7D6 FF               rst  $38
SRA0:A7D7 FF               rst  $38
SRA0:A7D8 FF               rst  $38
SRA0:A7D9 FF               rst  $38
SRA0:A7DA FF               rst  $38
SRA0:A7DB FF               rst  $38
SRA0:A7DC FF               rst  $38
SRA0:A7DD FF               rst  $38
SRA0:A7DE FF               rst  $38
SRA0:A7DF FF               rst  $38
SRA0:A7E0 FF               rst  $38
SRA0:A7E1 FF               rst  $38
SRA0:A7E2 FF               rst  $38
SRA0:A7E3 FF               rst  $38
SRA0:A7E4 FF               rst  $38
SRA0:A7E5 FF               rst  $38
SRA0:A7E6 FF               rst  $38
SRA0:A7E7 FF               rst  $38
SRA0:A7E8 FF               rst  $38
SRA0:A7E9 FF               rst  $38
SRA0:A7EA FF               rst  $38
SRA0:A7EB FF               rst  $38
SRA0:A7EC FF               rst  $38
SRA0:A7ED FF               rst  $38
SRA0:A7EE FF               rst  $38
SRA0:A7EF FF               rst  $38
SRA0:A7F0 FF               rst  $38
SRA0:A7F1 FF               rst  $38
SRA0:A7F2 FF               rst  $38
SRA0:A7F3 FF               rst  $38
SRA0:A7F4 FF               rst  $38
SRA0:A7F5 FF               rst  $38
SRA0:A7F6 FF               rst  $38
SRA0:A7F7 FF               rst  $38
SRA0:A7F8 FF               rst  $38
SRA0:A7F9 FF               rst  $38
SRA0:A7FA FF               rst  $38
SRA0:A7FB FF               rst  $38
SRA0:A7FC FF               rst  $38
SRA0:A7FD FF               rst  $38
SRA0:A7FE FF               rst  $38
SRA0:A7FF FF               rst  $38
SRA0:A800 FF               rst  $38
SRA0:A801 FF               rst  $38
SRA0:A802 FF               rst  $38
SRA0:A803 FF               rst  $38
SRA0:A804 FF               rst  $38
SRA0:A805 FF               rst  $38
SRA0:A806 FF               rst  $38
SRA0:A807 FF               rst  $38
SRA0:A808 FF               rst  $38
SRA0:A809 FF               rst  $38
SRA0:A80A FF               rst  $38
SRA0:A80B FF               rst  $38
SRA0:A80C FF               rst  $38
SRA0:A80D FF               rst  $38
SRA0:A80E FF               rst  $38
SRA0:A80F FF               rst  $38
SRA0:A810 FF               rst  $38
SRA0:A811 FF               rst  $38
SRA0:A812 FF               rst  $38
SRA0:A813 FF               rst  $38
SRA0:A814 FF               rst  $38
SRA0:A815 FF               rst  $38
SRA0:A816 FF               rst  $38
SRA0:A817 FF               rst  $38
SRA0:A818 FF               rst  $38
SRA0:A819 FF               rst  $38
SRA0:A81A FF               rst  $38
SRA0:A81B FF               rst  $38
SRA0:A81C FF               rst  $38
SRA0:A81D FF               rst  $38
SRA0:A81E FF               rst  $38
SRA0:A81F FF               rst  $38
SRA0:A820 FF               rst  $38
SRA0:A821 FF               rst  $38
SRA0:A822 FF               rst  $38
SRA0:A823 FF               rst  $38
SRA0:A824 FF               rst  $38
SRA0:A825 FF               rst  $38
SRA0:A826 FF               rst  $38
SRA0:A827 FF               rst  $38
SRA0:A828 FF               rst  $38
SRA0:A829 FF               rst  $38
SRA0:A82A FF               rst  $38
SRA0:A82B FF               rst  $38
SRA0:A82C FF               rst  $38
SRA0:A82D FF               rst  $38
SRA0:A82E FF               rst  $38
SRA0:A82F FF               rst  $38
SRA0:A830 FF               rst  $38
SRA0:A831 FF               rst  $38
SRA0:A832 FF               rst  $38
SRA0:A833 FF               rst  $38
SRA0:A834 FF               rst  $38
SRA0:A835 FF               rst  $38
SRA0:A836 FF               rst  $38
SRA0:A837 FF               rst  $38
SRA0:A838 FF               rst  $38
SRA0:A839 FF               rst  $38
SRA0:A83A FF               rst  $38
SRA0:A83B FF               rst  $38
SRA0:A83C FF               rst  $38
SRA0:A83D FF               rst  $38
SRA0:A83E FF               rst  $38
SRA0:A83F FF               rst  $38
SRA0:A840 FF               rst  $38
SRA0:A841 FF               rst  $38
SRA0:A842 FF               rst  $38
SRA0:A843 FF               rst  $38
SRA0:A844 FF               rst  $38
SRA0:A845 FF               rst  $38
SRA0:A846 FF               rst  $38
SRA0:A847 FF               rst  $38
SRA0:A848 FF               rst  $38
SRA0:A849 FF               rst  $38
SRA0:A84A FF               rst  $38
SRA0:A84B FF               rst  $38
SRA0:A84C FF               rst  $38
SRA0:A84D FF               rst  $38
SRA0:A84E FF               rst  $38
SRA0:A84F FF               rst  $38
SRA0:A850 FF               rst  $38
SRA0:A851 FF               rst  $38
SRA0:A852 FF               rst  $38
SRA0:A853 FF               rst  $38
SRA0:A854 FF               rst  $38
SRA0:A855 FF               rst  $38
SRA0:A856 FF               rst  $38
SRA0:A857 FF               rst  $38
SRA0:A858 FF               rst  $38
SRA0:A859 FF               rst  $38
SRA0:A85A FF               rst  $38
SRA0:A85B FF               rst  $38
SRA0:A85C FF               rst  $38
SRA0:A85D FF               rst  $38
SRA0:A85E FF               rst  $38
SRA0:A85F FF               rst  $38
SRA0:A860 FF               rst  $38
SRA0:A861 FF               rst  $38
SRA0:A862 FF               rst  $38
SRA0:A863 FF               rst  $38
SRA0:A864 FF               rst  $38
SRA0:A865 FF               rst  $38
SRA0:A866 FF               rst  $38
SRA0:A867 FF               rst  $38
SRA0:A868 FF               rst  $38
SRA0:A869 FF               rst  $38
SRA0:A86A FF               rst  $38
SRA0:A86B FF               rst  $38
SRA0:A86C FF               rst  $38
SRA0:A86D FF               rst  $38
SRA0:A86E FF               rst  $38
SRA0:A86F FF               rst  $38
SRA0:A870 FF               rst  $38
SRA0:A871 FF               rst  $38
SRA0:A872 FF               rst  $38
SRA0:A873 FF               rst  $38
SRA0:A874 FF               rst  $38
SRA0:A875 FF               rst  $38
SRA0:A876 FF               rst  $38
SRA0:A877 FF               rst  $38
SRA0:A878 FF               rst  $38
SRA0:A879 FF               rst  $38
SRA0:A87A FF               rst  $38
SRA0:A87B FF               rst  $38
SRA0:A87C FF               rst  $38
SRA0:A87D FF               rst  $38
SRA0:A87E FF               rst  $38
SRA0:A87F FF               rst  $38
SRA0:A880 FF               rst  $38
SRA0:A881 FF               rst  $38
SRA0:A882 FF               rst  $38
SRA0:A883 FF               rst  $38
SRA0:A884 FF               rst  $38
SRA0:A885 FF               rst  $38
SRA0:A886 FF               rst  $38
SRA0:A887 FF               rst  $38
SRA0:A888 FF               rst  $38
SRA0:A889 FF               rst  $38
SRA0:A88A FF               rst  $38
SRA0:A88B FF               rst  $38
SRA0:A88C FF               rst  $38
SRA0:A88D FF               rst  $38
SRA0:A88E FF               rst  $38
SRA0:A88F FF               rst  $38
SRA0:A890 FF               rst  $38
SRA0:A891 FF               rst  $38
SRA0:A892 FF               rst  $38
SRA0:A893 FF               rst  $38
SRA0:A894 FF               rst  $38
SRA0:A895 FF               rst  $38
SRA0:A896 FF               rst  $38
SRA0:A897 FF               rst  $38
SRA0:A898 FF               rst  $38
SRA0:A899 FF               rst  $38
SRA0:A89A FF               rst  $38
SRA0:A89B FF               rst  $38
SRA0:A89C FF               rst  $38
SRA0:A89D FF               rst  $38
SRA0:A89E FF               rst  $38
SRA0:A89F FF               rst  $38
SRA0:A8A0 FF               rst  $38
SRA0:A8A1 FF               rst  $38
SRA0:A8A2 FF               rst  $38
SRA0:A8A3 FF               rst  $38
SRA0:A8A4 FF               rst  $38
SRA0:A8A5 FF               rst  $38
SRA0:A8A6 FF               rst  $38
SRA0:A8A7 FF               rst  $38
SRA0:A8A8 FF               rst  $38
SRA0:A8A9 FF               rst  $38
SRA0:A8AA FF               rst  $38
SRA0:A8AB FF               rst  $38
SRA0:A8AC FF               rst  $38
SRA0:A8AD FF               rst  $38
SRA0:A8AE FF               rst  $38
SRA0:A8AF FF               rst  $38
SRA0:A8B0 FF               rst  $38
SRA0:A8B1 FF               rst  $38
SRA0:A8B2 FF               rst  $38
SRA0:A8B3 FF               rst  $38
SRA0:A8B4 FF               rst  $38
SRA0:A8B5 FF               rst  $38
SRA0:A8B6 FF               rst  $38
SRA0:A8B7 FF               rst  $38
SRA0:A8B8 FF               rst  $38
SRA0:A8B9 FF               rst  $38
SRA0:A8BA FF               rst  $38
SRA0:A8BB FF               rst  $38
SRA0:A8BC FF               rst  $38
SRA0:A8BD FF               rst  $38
SRA0:A8BE FF               rst  $38
SRA0:A8BF FF               rst  $38
SRA0:A8C0 FF               rst  $38
SRA0:A8C1 FF               rst  $38
SRA0:A8C2 FF               rst  $38
SRA0:A8C3 FF               rst  $38
SRA0:A8C4 FF               rst  $38
SRA0:A8C5 FF               rst  $38
SRA0:A8C6 FF               rst  $38
SRA0:A8C7 FF               rst  $38
SRA0:A8C8 FF               rst  $38
SRA0:A8C9 FF               rst  $38
SRA0:A8CA FF               rst  $38
SRA0:A8CB FF               rst  $38
SRA0:A8CC FF               rst  $38
SRA0:A8CD FF               rst  $38
SRA0:A8CE FF               rst  $38
SRA0:A8CF FF               rst  $38
SRA0:A8D0 FF               rst  $38
SRA0:A8D1 FF               rst  $38
SRA0:A8D2 FF               rst  $38
SRA0:A8D3 FF               rst  $38
SRA0:A8D4 FF               rst  $38
SRA0:A8D5 FF               rst  $38
SRA0:A8D6 FF               rst  $38
SRA0:A8D7 FF               rst  $38
SRA0:A8D8 FF               rst  $38
SRA0:A8D9 FF               rst  $38
SRA0:A8DA FF               rst  $38
SRA0:A8DB FF               rst  $38
SRA0:A8DC FF               rst  $38
SRA0:A8DD FF               rst  $38
SRA0:A8DE FF               rst  $38
SRA0:A8DF FF               rst  $38
SRA0:A8E0 FF               rst  $38
SRA0:A8E1 FF               rst  $38
SRA0:A8E2 FF               rst  $38
SRA0:A8E3 FF               rst  $38
SRA0:A8E4 FF               rst  $38
SRA0:A8E5 FF               rst  $38
SRA0:A8E6 FF               rst  $38
SRA0:A8E7 FF               rst  $38
SRA0:A8E8 FF               rst  $38
SRA0:A8E9 FF               rst  $38
SRA0:A8EA FF               rst  $38
SRA0:A8EB FF               rst  $38
SRA0:A8EC FF               rst  $38
SRA0:A8ED FF               rst  $38
SRA0:A8EE FF               rst  $38
SRA0:A8EF FF               rst  $38
SRA0:A8F0 FF               rst  $38
SRA0:A8F1 FF               rst  $38
SRA0:A8F2 FF               rst  $38
SRA0:A8F3 FF               rst  $38
SRA0:A8F4 FF               rst  $38
SRA0:A8F5 FF               rst  $38
SRA0:A8F6 FF               rst  $38
SRA0:A8F7 FF               rst  $38
SRA0:A8F8 FF               rst  $38
SRA0:A8F9 FF               rst  $38
SRA0:A8FA FF               rst  $38
SRA0:A8FB FF               rst  $38
SRA0:A8FC FF               rst  $38
SRA0:A8FD FF               rst  $38
SRA0:A8FE FF               rst  $38
SRA0:A8FF FF               rst  $38
SRA0:A900 FF               rst  $38
SRA0:A901 FF               rst  $38
SRA0:A902 FF               rst  $38
SRA0:A903 FF               rst  $38
SRA0:A904 FF               rst  $38
SRA0:A905 FF               rst  $38
SRA0:A906 FF               rst  $38
SRA0:A907 FF               rst  $38
SRA0:A908 FF               rst  $38
SRA0:A909 FF               rst  $38
SRA0:A90A FF               rst  $38
SRA0:A90B FF               rst  $38
SRA0:A90C FF               rst  $38
SRA0:A90D FF               rst  $38
SRA0:A90E FF               rst  $38
SRA0:A90F FF               rst  $38
SRA0:A910 FF               rst  $38
SRA0:A911 FF               rst  $38
SRA0:A912 FF               rst  $38
SRA0:A913 FF               rst  $38
SRA0:A914 FF               rst  $38
SRA0:A915 FF               rst  $38
SRA0:A916 FF               rst  $38
SRA0:A917 FF               rst  $38
SRA0:A918 FF               rst  $38
SRA0:A919 FF               rst  $38
SRA0:A91A FF               rst  $38
SRA0:A91B FF               rst  $38
SRA0:A91C FF               rst  $38
SRA0:A91D FF               rst  $38
SRA0:A91E FF               rst  $38
SRA0:A91F FF               rst  $38
SRA0:A920 FF               rst  $38
SRA0:A921 FF               rst  $38
SRA0:A922 FF               rst  $38
SRA0:A923 FF               rst  $38
SRA0:A924 FF               rst  $38
SRA0:A925 FF               rst  $38
SRA0:A926 FF               rst  $38
SRA0:A927 FF               rst  $38
SRA0:A928 FF               rst  $38
SRA0:A929 FF               rst  $38
SRA0:A92A FF               rst  $38
SRA0:A92B FF               rst  $38
SRA0:A92C FF               rst  $38
SRA0:A92D FF               rst  $38
SRA0:A92E FF               rst  $38
SRA0:A92F FF               rst  $38
SRA0:A930 FF               rst  $38
SRA0:A931 FF               rst  $38
SRA0:A932 FF               rst  $38
SRA0:A933 FF               rst  $38
SRA0:A934 FF               rst  $38
SRA0:A935 FF               rst  $38
SRA0:A936 FF               rst  $38
SRA0:A937 FF               rst  $38
SRA0:A938 FF               rst  $38
SRA0:A939 FF               rst  $38
SRA0:A93A FF               rst  $38
SRA0:A93B FF               rst  $38
SRA0:A93C FF               rst  $38
SRA0:A93D FF               rst  $38
SRA0:A93E FF               rst  $38
SRA0:A93F FF               rst  $38
SRA0:A940 FF               rst  $38
SRA0:A941 FF               rst  $38
SRA0:A942 FF               rst  $38
SRA0:A943 FF               rst  $38
SRA0:A944 FF               rst  $38
SRA0:A945 FF               rst  $38
SRA0:A946 FF               rst  $38
SRA0:A947 FF               rst  $38
SRA0:A948 FF               rst  $38
SRA0:A949 FF               rst  $38
SRA0:A94A FF               rst  $38
SRA0:A94B FF               rst  $38
SRA0:A94C FF               rst  $38
SRA0:A94D FF               rst  $38
SRA0:A94E FF               rst  $38
SRA0:A94F FF               rst  $38
SRA0:A950 FF               rst  $38
SRA0:A951 FF               rst  $38
SRA0:A952 FF               rst  $38
SRA0:A953 FF               rst  $38
SRA0:A954 FF               rst  $38
SRA0:A955 FF               rst  $38
SRA0:A956 FF               rst  $38
SRA0:A957 FF               rst  $38
SRA0:A958 FF               rst  $38
SRA0:A959 FF               rst  $38
SRA0:A95A FF               rst  $38
SRA0:A95B FF               rst  $38
SRA0:A95C FF               rst  $38
SRA0:A95D FF               rst  $38
SRA0:A95E FF               rst  $38
SRA0:A95F FF               rst  $38
SRA0:A960 FF               rst  $38
SRA0:A961 FF               rst  $38
SRA0:A962 FF               rst  $38
SRA0:A963 FF               rst  $38
SRA0:A964 FF               rst  $38
SRA0:A965 FF               rst  $38
SRA0:A966 FF               rst  $38
SRA0:A967 FF               rst  $38
SRA0:A968 FF               rst  $38
SRA0:A969 FF               rst  $38
SRA0:A96A FF               rst  $38
SRA0:A96B FF               rst  $38
SRA0:A96C FF               rst  $38
SRA0:A96D FF               rst  $38
SRA0:A96E FF               rst  $38
SRA0:A96F FF               rst  $38
SRA0:A970 FF               rst  $38
SRA0:A971 FF               rst  $38
SRA0:A972 FF               rst  $38
SRA0:A973 FF               rst  $38
SRA0:A974 FF               rst  $38
SRA0:A975 FF               rst  $38
SRA0:A976 FF               rst  $38
SRA0:A977 FF               rst  $38
SRA0:A978 FF               rst  $38
SRA0:A979 FF               rst  $38
SRA0:A97A FF               rst  $38
SRA0:A97B FF               rst  $38
SRA0:A97C FF               rst  $38
SRA0:A97D FF               rst  $38
SRA0:A97E FF               rst  $38
SRA0:A97F FF               rst  $38
SRA0:A980 FF               rst  $38
SRA0:A981 FF               rst  $38
SRA0:A982 FF               rst  $38
SRA0:A983 FF               rst  $38
SRA0:A984 FF               rst  $38
SRA0:A985 FF               rst  $38
SRA0:A986 FF               rst  $38
SRA0:A987 FF               rst  $38
SRA0:A988 FF               rst  $38
SRA0:A989 FF               rst  $38
SRA0:A98A FF               rst  $38
SRA0:A98B FF               rst  $38
SRA0:A98C FF               rst  $38
SRA0:A98D FF               rst  $38
SRA0:A98E FF               rst  $38
SRA0:A98F FF               rst  $38
SRA0:A990 FF               rst  $38
SRA0:A991 FF               rst  $38
SRA0:A992 FF               rst  $38
SRA0:A993 FF               rst  $38
SRA0:A994 FF               rst  $38
SRA0:A995 FF               rst  $38
SRA0:A996 FF               rst  $38
SRA0:A997 FF               rst  $38
SRA0:A998 FF               rst  $38
SRA0:A999 FF               rst  $38
SRA0:A99A FF               rst  $38
SRA0:A99B FF               rst  $38
SRA0:A99C FF               rst  $38
SRA0:A99D FF               rst  $38
SRA0:A99E FF               rst  $38
SRA0:A99F FF               rst  $38
SRA0:A9A0 FF               rst  $38
SRA0:A9A1 FF               rst  $38
SRA0:A9A2 FF               rst  $38
SRA0:A9A3 FF               rst  $38
SRA0:A9A4 FF               rst  $38
SRA0:A9A5 FF               rst  $38
SRA0:A9A6 FF               rst  $38
SRA0:A9A7 FF               rst  $38
SRA0:A9A8 FF               rst  $38
SRA0:A9A9 FF               rst  $38
SRA0:A9AA FF               rst  $38
SRA0:A9AB FF               rst  $38
SRA0:A9AC FF               rst  $38
SRA0:A9AD FF               rst  $38
SRA0:A9AE FF               rst  $38
SRA0:A9AF FF               rst  $38
SRA0:A9B0 FF               rst  $38
SRA0:A9B1 FF               rst  $38
SRA0:A9B2 FF               rst  $38
SRA0:A9B3 FF               rst  $38
SRA0:A9B4 FF               rst  $38
SRA0:A9B5 FF               rst  $38
SRA0:A9B6 FF               rst  $38
SRA0:A9B7 FF               rst  $38
SRA0:A9B8 FF               rst  $38
SRA0:A9B9 FF               rst  $38
SRA0:A9BA FF               rst  $38
SRA0:A9BB FF               rst  $38
SRA0:A9BC FF               rst  $38
SRA0:A9BD FF               rst  $38
SRA0:A9BE FF               rst  $38
SRA0:A9BF FF               rst  $38
SRA0:A9C0 FF               rst  $38
SRA0:A9C1 FF               rst  $38
SRA0:A9C2 FF               rst  $38
SRA0:A9C3 FF               rst  $38
SRA0:A9C4 FF               rst  $38
SRA0:A9C5 FF               rst  $38
SRA0:A9C6 FF               rst  $38
SRA0:A9C7 FF               rst  $38
SRA0:A9C8 FF               rst  $38
SRA0:A9C9 FF               rst  $38
SRA0:A9CA FF               rst  $38
SRA0:A9CB FF               rst  $38
SRA0:A9CC FF               rst  $38
SRA0:A9CD FF               rst  $38
SRA0:A9CE FF               rst  $38
SRA0:A9CF FF               rst  $38
SRA0:A9D0 FF               rst  $38
SRA0:A9D1 FF               rst  $38
SRA0:A9D2 FF               rst  $38
SRA0:A9D3 FF               rst  $38
SRA0:A9D4 FF               rst  $38
SRA0:A9D5 FF               rst  $38
SRA0:A9D6 FF               rst  $38
SRA0:A9D7 FF               rst  $38
SRA0:A9D8 FF               rst  $38
SRA0:A9D9 FF               rst  $38
SRA0:A9DA FF               rst  $38
SRA0:A9DB FF               rst  $38
SRA0:A9DC FF               rst  $38
SRA0:A9DD FF               rst  $38
SRA0:A9DE FF               rst  $38
SRA0:A9DF FF               rst  $38
SRA0:A9E0 FF               rst  $38
SRA0:A9E1 FF               rst  $38
SRA0:A9E2 FF               rst  $38
SRA0:A9E3 FF               rst  $38
SRA0:A9E4 FF               rst  $38
SRA0:A9E5 FF               rst  $38
SRA0:A9E6 FF               rst  $38
SRA0:A9E7 FF               rst  $38
SRA0:A9E8 FF               rst  $38
SRA0:A9E9 FF               rst  $38
SRA0:A9EA FF               rst  $38
SRA0:A9EB FF               rst  $38
SRA0:A9EC FF               rst  $38
SRA0:A9ED FF               rst  $38
SRA0:A9EE FF               rst  $38
SRA0:A9EF FF               rst  $38
SRA0:A9F0 FF               rst  $38
SRA0:A9F1 FF               rst  $38
SRA0:A9F2 FF               rst  $38
SRA0:A9F3 FF               rst  $38
SRA0:A9F4 FF               rst  $38
SRA0:A9F5 FF               rst  $38
SRA0:A9F6 FF               rst  $38
SRA0:A9F7 FF               rst  $38
SRA0:A9F8 FF               rst  $38
SRA0:A9F9 FF               rst  $38
SRA0:A9FA FF               rst  $38
SRA0:A9FB FF               rst  $38
SRA0:A9FC FF               rst  $38
SRA0:A9FD FF               rst  $38
SRA0:A9FE FF               rst  $38
SRA0:A9FF FF               rst  $38
SRA0:AA00 FF               rst  $38
SRA0:AA01 FF               rst  $38
SRA0:AA02 FF               rst  $38
SRA0:AA03 FF               rst  $38
SRA0:AA04 FF               rst  $38
SRA0:AA05 FF               rst  $38
SRA0:AA06 FF               rst  $38
SRA0:AA07 FF               rst  $38
SRA0:AA08 FF               rst  $38
SRA0:AA09 FF               rst  $38
SRA0:AA0A FF               rst  $38
SRA0:AA0B FF               rst  $38
SRA0:AA0C FF               rst  $38
SRA0:AA0D FF               rst  $38
SRA0:AA0E FF               rst  $38
SRA0:AA0F FF               rst  $38
SRA0:AA10 FF               rst  $38
SRA0:AA11 FF               rst  $38
SRA0:AA12 FF               rst  $38
SRA0:AA13 FF               rst  $38
SRA0:AA14 FF               rst  $38
SRA0:AA15 FF               rst  $38
SRA0:AA16 FF               rst  $38
SRA0:AA17 FF               rst  $38
SRA0:AA18 FF               rst  $38
SRA0:AA19 FF               rst  $38
SRA0:AA1A FF               rst  $38
SRA0:AA1B FF               rst  $38
SRA0:AA1C FF               rst  $38
SRA0:AA1D FF               rst  $38
SRA0:AA1E FF               rst  $38
SRA0:AA1F FF               rst  $38
SRA0:AA20 FF               rst  $38
SRA0:AA21 FF               rst  $38
SRA0:AA22 FF               rst  $38
SRA0:AA23 FF               rst  $38
SRA0:AA24 FF               rst  $38
SRA0:AA25 FF               rst  $38
SRA0:AA26 FF               rst  $38
SRA0:AA27 FF               rst  $38
SRA0:AA28 FF               rst  $38
SRA0:AA29 FF               rst  $38
SRA0:AA2A FF               rst  $38
SRA0:AA2B FF               rst  $38
SRA0:AA2C FF               rst  $38
SRA0:AA2D FF               rst  $38
SRA0:AA2E FF               rst  $38
SRA0:AA2F FF               rst  $38
SRA0:AA30 FF               rst  $38
SRA0:AA31 FF               rst  $38
SRA0:AA32 FF               rst  $38
SRA0:AA33 FF               rst  $38
SRA0:AA34 FF               rst  $38
SRA0:AA35 FF               rst  $38
SRA0:AA36 FF               rst  $38
SRA0:AA37 FF               rst  $38
SRA0:AA38 FF               rst  $38
SRA0:AA39 FF               rst  $38
SRA0:AA3A FF               rst  $38
SRA0:AA3B FF               rst  $38
SRA0:AA3C FF               rst  $38
SRA0:AA3D FF               rst  $38
SRA0:AA3E FF               rst  $38
SRA0:AA3F FF               rst  $38
SRA0:AA40 FF               rst  $38
SRA0:AA41 FF               rst  $38
SRA0:AA42 FF               rst  $38
SRA0:AA43 FF               rst  $38
SRA0:AA44 FF               rst  $38
SRA0:AA45 FF               rst  $38
SRA0:AA46 FF               rst  $38
SRA0:AA47 FF               rst  $38
SRA0:AA48 FF               rst  $38
SRA0:AA49 FF               rst  $38
SRA0:AA4A FF               rst  $38
SRA0:AA4B FF               rst  $38
SRA0:AA4C FF               rst  $38
SRA0:AA4D FF               rst  $38
SRA0:AA4E FF               rst  $38
SRA0:AA4F FF               rst  $38
SRA0:AA50 FF               rst  $38
SRA0:AA51 FF               rst  $38
SRA0:AA52 FF               rst  $38
SRA0:AA53 FF               rst  $38
SRA0:AA54 FF               rst  $38
SRA0:AA55 FF               rst  $38
SRA0:AA56 FF               rst  $38
SRA0:AA57 FF               rst  $38
SRA0:AA58 FF               rst  $38
SRA0:AA59 FF               rst  $38
SRA0:AA5A FF               rst  $38
SRA0:AA5B FF               rst  $38
SRA0:AA5C FF               rst  $38
SRA0:AA5D FF               rst  $38
SRA0:AA5E FF               rst  $38
SRA0:AA5F FF               rst  $38
SRA0:AA60 FF               rst  $38
SRA0:AA61 FF               rst  $38
SRA0:AA62 FF               rst  $38
SRA0:AA63 FF               rst  $38
SRA0:AA64 FF               rst  $38
SRA0:AA65 FF               rst  $38
SRA0:AA66 FF               rst  $38
SRA0:AA67 FF               rst  $38
SRA0:AA68 FF               rst  $38
SRA0:AA69 FF               rst  $38
SRA0:AA6A FF               rst  $38
SRA0:AA6B FF               rst  $38
SRA0:AA6C FF               rst  $38
SRA0:AA6D FF               rst  $38
SRA0:AA6E FF               rst  $38
SRA0:AA6F FF               rst  $38
SRA0:AA70 FF               rst  $38
SRA0:AA71 FF               rst  $38
SRA0:AA72 FF               rst  $38
SRA0:AA73 FF               rst  $38
SRA0:AA74 FF               rst  $38
SRA0:AA75 FF               rst  $38
SRA0:AA76 FF               rst  $38
SRA0:AA77 FF               rst  $38
SRA0:AA78 FF               rst  $38
SRA0:AA79 FF               rst  $38
SRA0:AA7A FF               rst  $38
SRA0:AA7B FF               rst  $38
SRA0:AA7C FF               rst  $38
SRA0:AA7D FF               rst  $38
SRA0:AA7E FF               rst  $38
SRA0:AA7F FF               rst  $38
SRA0:AA80 FF               rst  $38
SRA0:AA81 FF               rst  $38
SRA0:AA82 FF               rst  $38
SRA0:AA83 FF               rst  $38
SRA0:AA84 FF               rst  $38
SRA0:AA85 FF               rst  $38
SRA0:AA86 FF               rst  $38
SRA0:AA87 FF               rst  $38
SRA0:AA88 FF               rst  $38
SRA0:AA89 FF               rst  $38
SRA0:AA8A FF               rst  $38
SRA0:AA8B FF               rst  $38
SRA0:AA8C FF               rst  $38
SRA0:AA8D FF               rst  $38
SRA0:AA8E FF               rst  $38
SRA0:AA8F FF               rst  $38
SRA0:AA90 FF               rst  $38
SRA0:AA91 FF               rst  $38
SRA0:AA92 FF               rst  $38
SRA0:AA93 FF               rst  $38
SRA0:AA94 FF               rst  $38
SRA0:AA95 FF               rst  $38
SRA0:AA96 FF               rst  $38
SRA0:AA97 FF               rst  $38
SRA0:AA98 FF               rst  $38
SRA0:AA99 FF               rst  $38
SRA0:AA9A FF               rst  $38
SRA0:AA9B FF               rst  $38
SRA0:AA9C FF               rst  $38
SRA0:AA9D FF               rst  $38
SRA0:AA9E FF               rst  $38
SRA0:AA9F FF               rst  $38
SRA0:AAA0 FF               rst  $38
SRA0:AAA1 FF               rst  $38
SRA0:AAA2 FF               rst  $38
SRA0:AAA3 FF               rst  $38
SRA0:AAA4 FF               rst  $38
SRA0:AAA5 FF               rst  $38
SRA0:AAA6 FF               rst  $38
SRA0:AAA7 FF               rst  $38
SRA0:AAA8 FF               rst  $38
SRA0:AAA9 FF               rst  $38
SRA0:AAAA FF               rst  $38
SRA0:AAAB FF               rst  $38
SRA0:AAAC FF               rst  $38
SRA0:AAAD FF               rst  $38
SRA0:AAAE FF               rst  $38
SRA0:AAAF FF               rst  $38
SRA0:AAB0 FF               rst  $38
SRA0:AAB1 FF               rst  $38
SRA0:AAB2 FF               rst  $38
SRA0:AAB3 FF               rst  $38
SRA0:AAB4 FF               rst  $38
SRA0:AAB5 FF               rst  $38
SRA0:AAB6 FF               rst  $38
SRA0:AAB7 FF               rst  $38
SRA0:AAB8 FF               rst  $38
SRA0:AAB9 FF               rst  $38
SRA0:AABA FF               rst  $38
SRA0:AABB FF               rst  $38
SRA0:AABC FF               rst  $38
SRA0:AABD FF               rst  $38
SRA0:AABE FF               rst  $38
SRA0:AABF FF               rst  $38
SRA0:AAC0 FF               rst  $38
SRA0:AAC1 FF               rst  $38
SRA0:AAC2 FF               rst  $38
SRA0:AAC3 FF               rst  $38
SRA0:AAC4 FF               rst  $38
SRA0:AAC5 FF               rst  $38
SRA0:AAC6 FF               rst  $38
SRA0:AAC7 FF               rst  $38
SRA0:AAC8 FF               rst  $38
SRA0:AAC9 FF               rst  $38
SRA0:AACA FF               rst  $38
SRA0:AACB FF               rst  $38
SRA0:AACC FF               rst  $38
SRA0:AACD FF               rst  $38
SRA0:AACE FF               rst  $38
SRA0:AACF FF               rst  $38
SRA0:AAD0 FF               rst  $38
SRA0:AAD1 FF               rst  $38
SRA0:AAD2 FF               rst  $38
SRA0:AAD3 FF               rst  $38
SRA0:AAD4 FF               rst  $38
SRA0:AAD5 FF               rst  $38
SRA0:AAD6 FF               rst  $38
SRA0:AAD7 FF               rst  $38
SRA0:AAD8 FF               rst  $38
SRA0:AAD9 FF               rst  $38
SRA0:AADA FF               rst  $38
SRA0:AADB FF               rst  $38
SRA0:AADC FF               rst  $38
SRA0:AADD FF               rst  $38
SRA0:AADE FF               rst  $38
SRA0:AADF FF               rst  $38
SRA0:AAE0 FF               rst  $38
SRA0:AAE1 FF               rst  $38
SRA0:AAE2 FF               rst  $38
SRA0:AAE3 FF               rst  $38
SRA0:AAE4 FF               rst  $38
SRA0:AAE5 FF               rst  $38
SRA0:AAE6 FF               rst  $38
SRA0:AAE7 FF               rst  $38
SRA0:AAE8 FF               rst  $38
SRA0:AAE9 FF               rst  $38
SRA0:AAEA FF               rst  $38
SRA0:AAEB FF               rst  $38
SRA0:AAEC FF               rst  $38
SRA0:AAED FF               rst  $38
SRA0:AAEE FF               rst  $38
SRA0:AAEF FF               rst  $38
SRA0:AAF0 FF               rst  $38
SRA0:AAF1 FF               rst  $38
SRA0:AAF2 FF               rst  $38
SRA0:AAF3 FF               rst  $38
SRA0:AAF4 FF               rst  $38
SRA0:AAF5 FF               rst  $38
SRA0:AAF6 FF               rst  $38
SRA0:AAF7 FF               rst  $38
SRA0:AAF8 FF               rst  $38
SRA0:AAF9 FF               rst  $38
SRA0:AAFA FF               rst  $38
SRA0:AAFB FF               rst  $38
SRA0:AAFC FF               rst  $38
SRA0:AAFD FF               rst  $38
SRA0:AAFE FF               rst  $38
SRA0:AAFF FF               rst  $38
SRA0:AB00 FF               rst  $38
SRA0:AB01 FF               rst  $38
SRA0:AB02 FF               rst  $38
SRA0:AB03 FF               rst  $38
SRA0:AB04 FF               rst  $38
SRA0:AB05 FF               rst  $38
SRA0:AB06 FF               rst  $38
SRA0:AB07 FF               rst  $38
SRA0:AB08 FF               rst  $38
SRA0:AB09 FF               rst  $38
SRA0:AB0A FF               rst  $38
SRA0:AB0B FF               rst  $38
SRA0:AB0C FF               rst  $38
SRA0:AB0D FF               rst  $38
SRA0:AB0E FF               rst  $38
SRA0:AB0F FF               rst  $38
SRA0:AB10 FF               rst  $38
SRA0:AB11 FF               rst  $38
SRA0:AB12 FF               rst  $38
SRA0:AB13 FF               rst  $38
SRA0:AB14 FF               rst  $38
SRA0:AB15 FF               rst  $38
SRA0:AB16 FF               rst  $38
SRA0:AB17 FF               rst  $38
SRA0:AB18 FF               rst  $38
SRA0:AB19 FF               rst  $38
SRA0:AB1A FF               rst  $38
SRA0:AB1B FF               rst  $38
SRA0:AB1C FF               rst  $38
SRA0:AB1D FF               rst  $38
SRA0:AB1E FF               rst  $38
SRA0:AB1F FF               rst  $38
SRA0:AB20 FF               rst  $38
SRA0:AB21 FF               rst  $38
SRA0:AB22 FF               rst  $38
SRA0:AB23 FF               rst  $38
SRA0:AB24 FF               rst  $38
SRA0:AB25 FF               rst  $38
SRA0:AB26 FF               rst  $38
SRA0:AB27 FF               rst  $38
SRA0:AB28 FF               rst  $38
SRA0:AB29 FF               rst  $38
SRA0:AB2A FF               rst  $38
SRA0:AB2B FF               rst  $38
SRA0:AB2C FF               rst  $38
SRA0:AB2D FF               rst  $38
SRA0:AB2E FF               rst  $38
SRA0:AB2F FF               rst  $38
SRA0:AB30 FF               rst  $38
SRA0:AB31 FF               rst  $38
SRA0:AB32 FF               rst  $38
SRA0:AB33 FF               rst  $38
SRA0:AB34 FF               rst  $38
SRA0:AB35 FF               rst  $38
SRA0:AB36 FF               rst  $38
SRA0:AB37 FF               rst  $38
SRA0:AB38 FF               rst  $38
SRA0:AB39 FF               rst  $38
SRA0:AB3A FF               rst  $38
SRA0:AB3B FF               rst  $38
SRA0:AB3C FF               rst  $38
SRA0:AB3D FF               rst  $38
SRA0:AB3E FF               rst  $38
SRA0:AB3F FF               rst  $38
SRA0:AB40 FF               rst  $38
SRA0:AB41 FF               rst  $38
SRA0:AB42 FF               rst  $38
SRA0:AB43 FF               rst  $38
SRA0:AB44 FF               rst  $38
SRA0:AB45 FF               rst  $38
SRA0:AB46 FF               rst  $38
SRA0:AB47 FF               rst  $38
SRA0:AB48 FF               rst  $38
SRA0:AB49 FF               rst  $38
SRA0:AB4A FF               rst  $38
SRA0:AB4B FF               rst  $38
SRA0:AB4C FF               rst  $38
SRA0:AB4D FF               rst  $38
SRA0:AB4E FF               rst  $38
SRA0:AB4F FF               rst  $38
SRA0:AB50 FF               rst  $38
SRA0:AB51 FF               rst  $38
SRA0:AB52 FF               rst  $38
SRA0:AB53 FF               rst  $38
SRA0:AB54 FF               rst  $38
SRA0:AB55 FF               rst  $38
SRA0:AB56 FF               rst  $38
SRA0:AB57 FF               rst  $38
SRA0:AB58 FF               rst  $38
SRA0:AB59 FF               rst  $38
SRA0:AB5A FF               rst  $38
SRA0:AB5B FF               rst  $38
SRA0:AB5C FF               rst  $38
SRA0:AB5D FF               rst  $38
SRA0:AB5E FF               rst  $38
SRA0:AB5F FF               rst  $38
SRA0:AB60 FF               rst  $38
SRA0:AB61 FF               rst  $38
SRA0:AB62 FF               rst  $38
SRA0:AB63 FF               rst  $38
SRA0:AB64 FF               rst  $38
SRA0:AB65 FF               rst  $38
SRA0:AB66 FF               rst  $38
SRA0:AB67 FF               rst  $38
SRA0:AB68 FF               rst  $38
SRA0:AB69 FF               rst  $38
SRA0:AB6A FF               rst  $38
SRA0:AB6B FF               rst  $38
SRA0:AB6C FF               rst  $38
SRA0:AB6D FF               rst  $38
SRA0:AB6E FF               rst  $38
SRA0:AB6F FF               rst  $38
SRA0:AB70 FF               rst  $38
SRA0:AB71 FF               rst  $38
SRA0:AB72 FF               rst  $38
SRA0:AB73 FF               rst  $38
SRA0:AB74 FF               rst  $38
SRA0:AB75 FF               rst  $38
SRA0:AB76 FF               rst  $38
SRA0:AB77 FF               rst  $38
SRA0:AB78 FF               rst  $38
SRA0:AB79 FF               rst  $38
SRA0:AB7A FF               rst  $38
SRA0:AB7B FF               rst  $38
SRA0:AB7C FF               rst  $38
SRA0:AB7D FF               rst  $38
SRA0:AB7E FF               rst  $38
SRA0:AB7F FF               rst  $38
SRA0:AB80 FF               rst  $38
SRA0:AB81 FF               rst  $38
SRA0:AB82 FF               rst  $38
SRA0:AB83 FF               rst  $38
SRA0:AB84 FF               rst  $38
SRA0:AB85 FF               rst  $38
SRA0:AB86 FF               rst  $38
SRA0:AB87 FF               rst  $38
SRA0:AB88 FF               rst  $38
SRA0:AB89 FF               rst  $38
SRA0:AB8A FF               rst  $38
SRA0:AB8B FF               rst  $38
SRA0:AB8C FF               rst  $38
SRA0:AB8D FF               rst  $38
SRA0:AB8E FF               rst  $38
SRA0:AB8F FF               rst  $38
SRA0:AB90 FF               rst  $38
SRA0:AB91 FF               rst  $38
SRA0:AB92 FF               rst  $38
SRA0:AB93 FF               rst  $38
SRA0:AB94 FF               rst  $38
SRA0:AB95 FF               rst  $38
SRA0:AB96 FF               rst  $38
SRA0:AB97 FF               rst  $38
SRA0:AB98 FF               rst  $38
SRA0:AB99 FF               rst  $38
SRA0:AB9A FF               rst  $38
SRA0:AB9B FF               rst  $38
SRA0:AB9C FF               rst  $38
SRA0:AB9D FF               rst  $38
SRA0:AB9E FF               rst  $38
SRA0:AB9F FF               rst  $38
SRA0:ABA0 FF               rst  $38
SRA0:ABA1 FF               rst  $38
SRA0:ABA2 FF               rst  $38
SRA0:ABA3 FF               rst  $38
SRA0:ABA4 FF               rst  $38
SRA0:ABA5 FF               rst  $38
SRA0:ABA6 FF               rst  $38
SRA0:ABA7 FF               rst  $38
SRA0:ABA8 FF               rst  $38
SRA0:ABA9 FF               rst  $38
SRA0:ABAA FF               rst  $38
SRA0:ABAB FF               rst  $38
SRA0:ABAC FF               rst  $38
SRA0:ABAD FF               rst  $38
SRA0:ABAE FF               rst  $38
SRA0:ABAF FF               rst  $38
SRA0:ABB0 FF               rst  $38
SRA0:ABB1 FF               rst  $38
SRA0:ABB2 FF               rst  $38
SRA0:ABB3 FF               rst  $38
SRA0:ABB4 FF               rst  $38
SRA0:ABB5 FF               rst  $38
SRA0:ABB6 FF               rst  $38
SRA0:ABB7 FF               rst  $38
SRA0:ABB8 FF               rst  $38
SRA0:ABB9 FF               rst  $38
SRA0:ABBA FF               rst  $38
SRA0:ABBB FF               rst  $38
SRA0:ABBC FF               rst  $38
SRA0:ABBD FF               rst  $38
SRA0:ABBE FF               rst  $38
SRA0:ABBF FF               rst  $38
SRA0:ABC0 FF               rst  $38
SRA0:ABC1 FF               rst  $38
SRA0:ABC2 FF               rst  $38
SRA0:ABC3 FF               rst  $38
SRA0:ABC4 FF               rst  $38
SRA0:ABC5 FF               rst  $38
SRA0:ABC6 FF               rst  $38
SRA0:ABC7 FF               rst  $38
SRA0:ABC8 FF               rst  $38
SRA0:ABC9 FF               rst  $38
SRA0:ABCA FF               rst  $38
SRA0:ABCB FF               rst  $38
SRA0:ABCC FF               rst  $38
SRA0:ABCD FF               rst  $38
SRA0:ABCE FF               rst  $38
SRA0:ABCF FF               rst  $38
SRA0:ABD0 FF               rst  $38
SRA0:ABD1 FF               rst  $38
SRA0:ABD2 FF               rst  $38
SRA0:ABD3 FF               rst  $38
SRA0:ABD4 FF               rst  $38
SRA0:ABD5 FF               rst  $38
SRA0:ABD6 FF               rst  $38
SRA0:ABD7 FF               rst  $38
SRA0:ABD8 FF               rst  $38
SRA0:ABD9 FF               rst  $38
SRA0:ABDA FF               rst  $38
SRA0:ABDB FF               rst  $38
SRA0:ABDC FF               rst  $38
SRA0:ABDD FF               rst  $38
SRA0:ABDE FF               rst  $38
SRA0:ABDF FF               rst  $38
SRA0:ABE0 FF               rst  $38
SRA0:ABE1 FF               rst  $38
SRA0:ABE2 FF               rst  $38
SRA0:ABE3 FF               rst  $38
SRA0:ABE4 FF               rst  $38
SRA0:ABE5 FF               rst  $38
SRA0:ABE6 FF               rst  $38
SRA0:ABE7 FF               rst  $38
SRA0:ABE8 FF               rst  $38
SRA0:ABE9 FF               rst  $38
SRA0:ABEA FF               rst  $38
SRA0:ABEB FF               rst  $38
SRA0:ABEC FF               rst  $38
SRA0:ABED FF               rst  $38
SRA0:ABEE FF               rst  $38
SRA0:ABEF FF               rst  $38
SRA0:ABF0 FF               rst  $38
SRA0:ABF1 FF               rst  $38
SRA0:ABF2 FF               rst  $38
SRA0:ABF3 FF               rst  $38
SRA0:ABF4 FF               rst  $38
SRA0:ABF5 FF               rst  $38
SRA0:ABF6 FF               rst  $38
SRA0:ABF7 FF               rst  $38
SRA0:ABF8 FF               rst  $38
SRA0:ABF9 FF               rst  $38
SRA0:ABFA FF               rst  $38
SRA0:ABFB FF               rst  $38
SRA0:ABFC FF               rst  $38
SRA0:ABFD FF               rst  $38
SRA0:ABFE FF               rst  $38
SRA0:ABFF FF               rst  $38
SRA0:AC00 FF               rst  $38
SRA0:AC01 FF               rst  $38
SRA0:AC02 FF               rst  $38
SRA0:AC03 FF               rst  $38
SRA0:AC04 FF               rst  $38
SRA0:AC05 FF               rst  $38
SRA0:AC06 FF               rst  $38
SRA0:AC07 FF               rst  $38
SRA0:AC08 FF               rst  $38
SRA0:AC09 FF               rst  $38
SRA0:AC0A FF               rst  $38
SRA0:AC0B FF               rst  $38
SRA0:AC0C FF               rst  $38
SRA0:AC0D FF               rst  $38
SRA0:AC0E FF               rst  $38
SRA0:AC0F FF               rst  $38
SRA0:AC10 FF               rst  $38
SRA0:AC11 FF               rst  $38
SRA0:AC12 FF               rst  $38
SRA0:AC13 FF               rst  $38
SRA0:AC14 FF               rst  $38
SRA0:AC15 FF               rst  $38
SRA0:AC16 FF               rst  $38
SRA0:AC17 FF               rst  $38
SRA0:AC18 FF               rst  $38
SRA0:AC19 FF               rst  $38
SRA0:AC1A FF               rst  $38
SRA0:AC1B FF               rst  $38
SRA0:AC1C FF               rst  $38
SRA0:AC1D FF               rst  $38
SRA0:AC1E FF               rst  $38
SRA0:AC1F FF               rst  $38
SRA0:AC20 FF               rst  $38
SRA0:AC21 FF               rst  $38
SRA0:AC22 FF               rst  $38
SRA0:AC23 FF               rst  $38
SRA0:AC24 FF               rst  $38
SRA0:AC25 FF               rst  $38
SRA0:AC26 FF               rst  $38
SRA0:AC27 FF               rst  $38
SRA0:AC28 FF               rst  $38
SRA0:AC29 FF               rst  $38
SRA0:AC2A FF               rst  $38
SRA0:AC2B FF               rst  $38
SRA0:AC2C FF               rst  $38
SRA0:AC2D FF               rst  $38
SRA0:AC2E FF               rst  $38
SRA0:AC2F FF               rst  $38
SRA0:AC30 FF               rst  $38
SRA0:AC31 FF               rst  $38
SRA0:AC32 FF               rst  $38
SRA0:AC33 FF               rst  $38
SRA0:AC34 FF               rst  $38
SRA0:AC35 FF               rst  $38
SRA0:AC36 FF               rst  $38
SRA0:AC37 FF               rst  $38
SRA0:AC38 FF               rst  $38
SRA0:AC39 FF               rst  $38
SRA0:AC3A FF               rst  $38
SRA0:AC3B FF               rst  $38
SRA0:AC3C FF               rst  $38
SRA0:AC3D FF               rst  $38
SRA0:AC3E FF               rst  $38
SRA0:AC3F FF               rst  $38
SRA0:AC40 FF               rst  $38
SRA0:AC41 FF               rst  $38
SRA0:AC42 FF               rst  $38
SRA0:AC43 FF               rst  $38
SRA0:AC44 FF               rst  $38
SRA0:AC45 FF               rst  $38
SRA0:AC46 FF               rst  $38
SRA0:AC47 FF               rst  $38
SRA0:AC48 FF               rst  $38
SRA0:AC49 FF               rst  $38
SRA0:AC4A FF               rst  $38
SRA0:AC4B FF               rst  $38
SRA0:AC4C FF               rst  $38
SRA0:AC4D FF               rst  $38
SRA0:AC4E FF               rst  $38
SRA0:AC4F FF               rst  $38
SRA0:AC50 FF               rst  $38
SRA0:AC51 FF               rst  $38
SRA0:AC52 FF               rst  $38
SRA0:AC53 FF               rst  $38
SRA0:AC54 FF               rst  $38
SRA0:AC55 FF               rst  $38
SRA0:AC56 FF               rst  $38
SRA0:AC57 FF               rst  $38
SRA0:AC58 FF               rst  $38
SRA0:AC59 FF               rst  $38
SRA0:AC5A FF               rst  $38
SRA0:AC5B FF               rst  $38
SRA0:AC5C FF               rst  $38
SRA0:AC5D FF               rst  $38
SRA0:AC5E FF               rst  $38
SRA0:AC5F FF               rst  $38
SRA0:AC60 FF               rst  $38
SRA0:AC61 FF               rst  $38
SRA0:AC62 FF               rst  $38
SRA0:AC63 FF               rst  $38
SRA0:AC64 FF               rst  $38
SRA0:AC65 FF               rst  $38
SRA0:AC66 FF               rst  $38
SRA0:AC67 FF               rst  $38
SRA0:AC68 FF               rst  $38
SRA0:AC69 FF               rst  $38
SRA0:AC6A FF               rst  $38
SRA0:AC6B FF               rst  $38
SRA0:AC6C FF               rst  $38
SRA0:AC6D FF               rst  $38
SRA0:AC6E FF               rst  $38
SRA0:AC6F FF               rst  $38
SRA0:AC70 FF               rst  $38
SRA0:AC71 FF               rst  $38
SRA0:AC72 FF               rst  $38
SRA0:AC73 FF               rst  $38
SRA0:AC74 FF               rst  $38
SRA0:AC75 FF               rst  $38
SRA0:AC76 FF               rst  $38
SRA0:AC77 FF               rst  $38
SRA0:AC78 FF               rst  $38
SRA0:AC79 FF               rst  $38
SRA0:AC7A FF               rst  $38
SRA0:AC7B FF               rst  $38
SRA0:AC7C FF               rst  $38
SRA0:AC7D FF               rst  $38
SRA0:AC7E FF               rst  $38
SRA0:AC7F FF               rst  $38
SRA0:AC80 FF               rst  $38
SRA0:AC81 FF               rst  $38
SRA0:AC82 FF               rst  $38
SRA0:AC83 FF               rst  $38
SRA0:AC84 FF               rst  $38
SRA0:AC85 FF               rst  $38
SRA0:AC86 FF               rst  $38
SRA0:AC87 FF               rst  $38
SRA0:AC88 FF               rst  $38
SRA0:AC89 FF               rst  $38
SRA0:AC8A FF               rst  $38
SRA0:AC8B FF               rst  $38
SRA0:AC8C FF               rst  $38
SRA0:AC8D FF               rst  $38
SRA0:AC8E FF               rst  $38
SRA0:AC8F FF               rst  $38
SRA0:AC90 FF               rst  $38
SRA0:AC91 FF               rst  $38
SRA0:AC92 FF               rst  $38
SRA0:AC93 FF               rst  $38
SRA0:AC94 FF               rst  $38
SRA0:AC95 FF               rst  $38
SRA0:AC96 FF               rst  $38
SRA0:AC97 FF               rst  $38
SRA0:AC98 FF               rst  $38
SRA0:AC99 FF               rst  $38
SRA0:AC9A FF               rst  $38
SRA0:AC9B FF               rst  $38
SRA0:AC9C FF               rst  $38
SRA0:AC9D FF               rst  $38
SRA0:AC9E FF               rst  $38
SRA0:AC9F FF               rst  $38
SRA0:ACA0 FF               rst  $38
SRA0:ACA1 FF               rst  $38
SRA0:ACA2 FF               rst  $38
SRA0:ACA3 FF               rst  $38
SRA0:ACA4 FF               rst  $38
SRA0:ACA5 FF               rst  $38
SRA0:ACA6 FF               rst  $38
SRA0:ACA7 FF               rst  $38
SRA0:ACA8 FF               rst  $38
SRA0:ACA9 FF               rst  $38
SRA0:ACAA FF               rst  $38
SRA0:ACAB FF               rst  $38
SRA0:ACAC FF               rst  $38
SRA0:ACAD FF               rst  $38
SRA0:ACAE FF               rst  $38
SRA0:ACAF FF               rst  $38
SRA0:ACB0 FF               rst  $38
SRA0:ACB1 FF               rst  $38
SRA0:ACB2 FF               rst  $38
SRA0:ACB3 FF               rst  $38
SRA0:ACB4 FF               rst  $38
SRA0:ACB5 FF               rst  $38
SRA0:ACB6 FF               rst  $38
SRA0:ACB7 FF               rst  $38
SRA0:ACB8 FF               rst  $38
SRA0:ACB9 FF               rst  $38
SRA0:ACBA FF               rst  $38
SRA0:ACBB FF               rst  $38
SRA0:ACBC FF               rst  $38
SRA0:ACBD FF               rst  $38
SRA0:ACBE FF               rst  $38
SRA0:ACBF FF               rst  $38
SRA0:ACC0 FF               rst  $38
SRA0:ACC1 FF               rst  $38
SRA0:ACC2 FF               rst  $38
SRA0:ACC3 FF               rst  $38
SRA0:ACC4 FF               rst  $38
SRA0:ACC5 FF               rst  $38
SRA0:ACC6 FF               rst  $38
SRA0:ACC7 FF               rst  $38
SRA0:ACC8 FF               rst  $38
SRA0:ACC9 FF               rst  $38
SRA0:ACCA FF               rst  $38
SRA0:ACCB FF               rst  $38
SRA0:ACCC FF               rst  $38
SRA0:ACCD FF               rst  $38
SRA0:ACCE FF               rst  $38
SRA0:ACCF FF               rst  $38
SRA0:ACD0 FF               rst  $38
SRA0:ACD1 FF               rst  $38
SRA0:ACD2 FF               rst  $38
SRA0:ACD3 FF               rst  $38
SRA0:ACD4 FF               rst  $38
SRA0:ACD5 FF               rst  $38
SRA0:ACD6 FF               rst  $38
SRA0:ACD7 FF               rst  $38
SRA0:ACD8 FF               rst  $38
SRA0:ACD9 FF               rst  $38
SRA0:ACDA FF               rst  $38
SRA0:ACDB FF               rst  $38
SRA0:ACDC FF               rst  $38
SRA0:ACDD FF               rst  $38
SRA0:ACDE FF               rst  $38
SRA0:ACDF FF               rst  $38
SRA0:ACE0 FF               rst  $38
SRA0:ACE1 FF               rst  $38
SRA0:ACE2 FF               rst  $38
SRA0:ACE3 FF               rst  $38
SRA0:ACE4 FF               rst  $38
SRA0:ACE5 FF               rst  $38
SRA0:ACE6 FF               rst  $38
SRA0:ACE7 FF               rst  $38
SRA0:ACE8 FF               rst  $38
SRA0:ACE9 FF               rst  $38
SRA0:ACEA FF               rst  $38
SRA0:ACEB FF               rst  $38
SRA0:ACEC FF               rst  $38
SRA0:ACED FF               rst  $38
SRA0:ACEE FF               rst  $38
SRA0:ACEF FF               rst  $38
SRA0:ACF0 FF               rst  $38
SRA0:ACF1 FF               rst  $38
SRA0:ACF2 FF               rst  $38
SRA0:ACF3 FF               rst  $38
SRA0:ACF4 FF               rst  $38
SRA0:ACF5 FF               rst  $38
SRA0:ACF6 FF               rst  $38
SRA0:ACF7 FF               rst  $38
SRA0:ACF8 FF               rst  $38
SRA0:ACF9 FF               rst  $38
SRA0:ACFA FF               rst  $38
SRA0:ACFB FF               rst  $38
SRA0:ACFC FF               rst  $38
SRA0:ACFD FF               rst  $38
SRA0:ACFE FF               rst  $38
SRA0:ACFF FF               rst  $38
SRA0:AD00 FF               rst  $38
SRA0:AD01 FF               rst  $38
SRA0:AD02 FF               rst  $38
SRA0:AD03 FF               rst  $38
SRA0:AD04 FF               rst  $38
SRA0:AD05 FF               rst  $38
SRA0:AD06 FF               rst  $38
SRA0:AD07 FF               rst  $38
SRA0:AD08 FF               rst  $38
SRA0:AD09 FF               rst  $38
SRA0:AD0A FF               rst  $38
SRA0:AD0B FF               rst  $38
SRA0:AD0C FF               rst  $38
SRA0:AD0D FF               rst  $38
SRA0:AD0E FF               rst  $38
SRA0:AD0F FF               rst  $38
SRA0:AD10 FF               rst  $38
SRA0:AD11 FF               rst  $38
SRA0:AD12 FF               rst  $38
SRA0:AD13 FF               rst  $38
SRA0:AD14 FF               rst  $38
SRA0:AD15 FF               rst  $38
SRA0:AD16 FF               rst  $38
SRA0:AD17 FF               rst  $38
SRA0:AD18 FF               rst  $38
SRA0:AD19 FF               rst  $38
SRA0:AD1A FF               rst  $38
SRA0:AD1B FF               rst  $38
SRA0:AD1C FF               rst  $38
SRA0:AD1D FF               rst  $38
SRA0:AD1E FF               rst  $38
SRA0:AD1F FF               rst  $38
SRA0:AD20 FF               rst  $38
SRA0:AD21 FF               rst  $38
SRA0:AD22 FF               rst  $38
SRA0:AD23 FF               rst  $38
SRA0:AD24 FF               rst  $38
SRA0:AD25 FF               rst  $38
SRA0:AD26 FF               rst  $38
SRA0:AD27 FF               rst  $38
SRA0:AD28 FF               rst  $38
SRA0:AD29 FF               rst  $38
SRA0:AD2A FF               rst  $38
SRA0:AD2B FF               rst  $38
SRA0:AD2C FF               rst  $38
SRA0:AD2D FF               rst  $38
SRA0:AD2E FF               rst  $38
SRA0:AD2F FF               rst  $38
SRA0:AD30 FF               rst  $38
SRA0:AD31 FF               rst  $38
SRA0:AD32 FF               rst  $38
SRA0:AD33 FF               rst  $38
SRA0:AD34 FF               rst  $38
SRA0:AD35 FF               rst  $38
SRA0:AD36 FF               rst  $38
SRA0:AD37 FF               rst  $38
SRA0:AD38 FF               rst  $38
SRA0:AD39 FF               rst  $38
SRA0:AD3A FF               rst  $38
SRA0:AD3B FF               rst  $38
SRA0:AD3C FF               rst  $38
SRA0:AD3D FF               rst  $38
SRA0:AD3E FF               rst  $38
SRA0:AD3F FF               rst  $38
SRA0:AD40 FF               rst  $38
SRA0:AD41 FF               rst  $38
SRA0:AD42 FF               rst  $38
SRA0:AD43 FF               rst  $38
SRA0:AD44 FF               rst  $38
SRA0:AD45 FF               rst  $38
SRA0:AD46 FF               rst  $38
SRA0:AD47 FF               rst  $38
SRA0:AD48 FF               rst  $38
SRA0:AD49 FF               rst  $38
SRA0:AD4A FF               rst  $38
SRA0:AD4B FF               rst  $38
SRA0:AD4C FF               rst  $38
SRA0:AD4D FF               rst  $38
SRA0:AD4E FF               rst  $38
SRA0:AD4F FF               rst  $38
SRA0:AD50 FF               rst  $38
SRA0:AD51 FF               rst  $38
SRA0:AD52 FF               rst  $38
SRA0:AD53 FF               rst  $38
SRA0:AD54 FF               rst  $38
SRA0:AD55 FF               rst  $38
SRA0:AD56 FF               rst  $38
SRA0:AD57 FF               rst  $38
SRA0:AD58 FF               rst  $38
SRA0:AD59 FF               rst  $38
SRA0:AD5A FF               rst  $38
SRA0:AD5B FF               rst  $38
SRA0:AD5C FF               rst  $38
SRA0:AD5D FF               rst  $38
SRA0:AD5E FF               rst  $38
SRA0:AD5F FF               rst  $38
SRA0:AD60 FF               rst  $38
SRA0:AD61 FF               rst  $38
SRA0:AD62 FF               rst  $38
SRA0:AD63 FF               rst  $38
SRA0:AD64 FF               rst  $38
SRA0:AD65 FF               rst  $38
SRA0:AD66 FF               rst  $38
SRA0:AD67 FF               rst  $38
SRA0:AD68 FF               rst  $38
SRA0:AD69 FF               rst  $38
SRA0:AD6A FF               rst  $38
SRA0:AD6B FF               rst  $38
SRA0:AD6C FF               rst  $38
SRA0:AD6D FF               rst  $38
SRA0:AD6E FF               rst  $38
SRA0:AD6F FF               rst  $38
SRA0:AD70 FF               rst  $38
SRA0:AD71 FF               rst  $38
SRA0:AD72 FF               rst  $38
SRA0:AD73 FF               rst  $38
SRA0:AD74 FF               rst  $38
SRA0:AD75 FF               rst  $38
SRA0:AD76 FF               rst  $38
SRA0:AD77 FF               rst  $38
SRA0:AD78 FF               rst  $38
SRA0:AD79 FF               rst  $38
SRA0:AD7A FF               rst  $38
SRA0:AD7B FF               rst  $38
SRA0:AD7C FF               rst  $38
SRA0:AD7D FF               rst  $38
SRA0:AD7E FF               rst  $38
SRA0:AD7F FF               rst  $38
SRA0:AD80 FF               rst  $38
SRA0:AD81 FF               rst  $38
SRA0:AD82 FF               rst  $38
SRA0:AD83 FF               rst  $38
SRA0:AD84 FF               rst  $38
SRA0:AD85 FF               rst  $38
SRA0:AD86 FF               rst  $38
SRA0:AD87 FF               rst  $38
SRA0:AD88 FF               rst  $38
SRA0:AD89 FF               rst  $38
SRA0:AD8A FF               rst  $38
SRA0:AD8B FF               rst  $38
SRA0:AD8C FF               rst  $38
SRA0:AD8D FF               rst  $38
SRA0:AD8E FF               rst  $38
SRA0:AD8F FF               rst  $38
SRA0:AD90 FF               rst  $38
SRA0:AD91 FF               rst  $38
SRA0:AD92 FF               rst  $38
SRA0:AD93 FF               rst  $38
SRA0:AD94 FF               rst  $38
SRA0:AD95 FF               rst  $38
SRA0:AD96 FF               rst  $38
SRA0:AD97 FF               rst  $38
SRA0:AD98 FF               rst  $38
SRA0:AD99 FF               rst  $38
SRA0:AD9A FF               rst  $38
SRA0:AD9B FF               rst  $38
SRA0:AD9C FF               rst  $38
SRA0:AD9D FF               rst  $38
SRA0:AD9E FF               rst  $38
SRA0:AD9F FF               rst  $38
SRA0:ADA0 FF               rst  $38
SRA0:ADA1 FF               rst  $38
SRA0:ADA2 FF               rst  $38
SRA0:ADA3 FF               rst  $38
SRA0:ADA4 FF               rst  $38
SRA0:ADA5 FF               rst  $38
SRA0:ADA6 FF               rst  $38
SRA0:ADA7 FF               rst  $38
SRA0:ADA8 FF               rst  $38
SRA0:ADA9 FF               rst  $38
SRA0:ADAA FF               rst  $38
SRA0:ADAB FF               rst  $38
SRA0:ADAC FF               rst  $38
SRA0:ADAD FF               rst  $38
SRA0:ADAE FF               rst  $38
SRA0:ADAF FF               rst  $38
SRA0:ADB0 FF               rst  $38
SRA0:ADB1 FF               rst  $38
SRA0:ADB2 FF               rst  $38
SRA0:ADB3 FF               rst  $38
SRA0:ADB4 FF               rst  $38
SRA0:ADB5 FF               rst  $38
SRA0:ADB6 FF               rst  $38
SRA0:ADB7 FF               rst  $38
SRA0:ADB8 FF               rst  $38
SRA0:ADB9 FF               rst  $38
SRA0:ADBA FF               rst  $38
SRA0:ADBB FF               rst  $38
SRA0:ADBC FF               rst  $38
SRA0:ADBD FF               rst  $38
SRA0:ADBE FF               rst  $38
SRA0:ADBF FF               rst  $38
SRA0:ADC0 FF               rst  $38
SRA0:ADC1 FF               rst  $38
SRA0:ADC2 FF               rst  $38
SRA0:ADC3 FF               rst  $38
SRA0:ADC4 FF               rst  $38
SRA0:ADC5 FF               rst  $38
SRA0:ADC6 FF               rst  $38
SRA0:ADC7 FF               rst  $38
SRA0:ADC8 FF               rst  $38
SRA0:ADC9 FF               rst  $38
SRA0:ADCA FF               rst  $38
SRA0:ADCB FF               rst  $38
SRA0:ADCC FF               rst  $38
SRA0:ADCD FF               rst  $38
SRA0:ADCE FF               rst  $38
SRA0:ADCF FF               rst  $38
SRA0:ADD0 FF               rst  $38
SRA0:ADD1 FF               rst  $38
SRA0:ADD2 FF               rst  $38
SRA0:ADD3 FF               rst  $38
SRA0:ADD4 FF               rst  $38
SRA0:ADD5 FF               rst  $38
SRA0:ADD6 FF               rst  $38
SRA0:ADD7 FF               rst  $38
SRA0:ADD8 FF               rst  $38
SRA0:ADD9 FF               rst  $38
SRA0:ADDA FF               rst  $38
SRA0:ADDB FF               rst  $38
SRA0:ADDC FF               rst  $38
SRA0:ADDD FF               rst  $38
SRA0:ADDE FF               rst  $38
SRA0:ADDF FF               rst  $38
SRA0:ADE0 FF               rst  $38
SRA0:ADE1 FF               rst  $38
SRA0:ADE2 FF               rst  $38
SRA0:ADE3 FF               rst  $38
SRA0:ADE4 FF               rst  $38
SRA0:ADE5 FF               rst  $38
SRA0:ADE6 FF               rst  $38
SRA0:ADE7 FF               rst  $38
SRA0:ADE8 FF               rst  $38
SRA0:ADE9 FF               rst  $38
SRA0:ADEA FF               rst  $38
SRA0:ADEB FF               rst  $38
SRA0:ADEC FF               rst  $38
SRA0:ADED FF               rst  $38
SRA0:ADEE FF               rst  $38
SRA0:ADEF FF               rst  $38
SRA0:ADF0 FF               rst  $38
SRA0:ADF1 FF               rst  $38
SRA0:ADF2 FF               rst  $38
SRA0:ADF3 FF               rst  $38
SRA0:ADF4 FF               rst  $38
SRA0:ADF5 FF               rst  $38
SRA0:ADF6 FF               rst  $38
SRA0:ADF7 FF               rst  $38
SRA0:ADF8 FF               rst  $38
SRA0:ADF9 FF               rst  $38
SRA0:ADFA FF               rst  $38
SRA0:ADFB FF               rst  $38
SRA0:ADFC FF               rst  $38
SRA0:ADFD FF               rst  $38
SRA0:ADFE FF               rst  $38
SRA0:ADFF FF               rst  $38
SRA0:AE00 FF               rst  $38
SRA0:AE01 FF               rst  $38
SRA0:AE02 FF               rst  $38
SRA0:AE03 FF               rst  $38
SRA0:AE04 FF               rst  $38
SRA0:AE05 FF               rst  $38
SRA0:AE06 FF               rst  $38
SRA0:AE07 FF               rst  $38
SRA0:AE08 FF               rst  $38
SRA0:AE09 FF               rst  $38
SRA0:AE0A FF               rst  $38
SRA0:AE0B FF               rst  $38
SRA0:AE0C FF               rst  $38
SRA0:AE0D FF               rst  $38
SRA0:AE0E FF               rst  $38
SRA0:AE0F FF               rst  $38
SRA0:AE10 FF               rst  $38
SRA0:AE11 FF               rst  $38
SRA0:AE12 FF               rst  $38
SRA0:AE13 FF               rst  $38
SRA0:AE14 FF               rst  $38
SRA0:AE15 FF               rst  $38
SRA0:AE16 FF               rst  $38
SRA0:AE17 FF               rst  $38
SRA0:AE18 FF               rst  $38
SRA0:AE19 FF               rst  $38
SRA0:AE1A FF               rst  $38
SRA0:AE1B FF               rst  $38
SRA0:AE1C FF               rst  $38
SRA0:AE1D FF               rst  $38
SRA0:AE1E FF               rst  $38
SRA0:AE1F FF               rst  $38
SRA0:AE20 FF               rst  $38
SRA0:AE21 FF               rst  $38
SRA0:AE22 FF               rst  $38
SRA0:AE23 FF               rst  $38
SRA0:AE24 FF               rst  $38
SRA0:AE25 FF               rst  $38
SRA0:AE26 FF               rst  $38
SRA0:AE27 FF               rst  $38
SRA0:AE28 FF               rst  $38
SRA0:AE29 FF               rst  $38
SRA0:AE2A FF               rst  $38
SRA0:AE2B FF               rst  $38
SRA0:AE2C FF               rst  $38
SRA0:AE2D FF               rst  $38
SRA0:AE2E FF               rst  $38
SRA0:AE2F FF               rst  $38
SRA0:AE30 FF               rst  $38
SRA0:AE31 FF               rst  $38
SRA0:AE32 FF               rst  $38
SRA0:AE33 FF               rst  $38
SRA0:AE34 FF               rst  $38
SRA0:AE35 FF               rst  $38
SRA0:AE36 FF               rst  $38
SRA0:AE37 FF               rst  $38
SRA0:AE38 FF               rst  $38
SRA0:AE39 FF               rst  $38
SRA0:AE3A FF               rst  $38
SRA0:AE3B FF               rst  $38
SRA0:AE3C FF               rst  $38
SRA0:AE3D FF               rst  $38
SRA0:AE3E FF               rst  $38
SRA0:AE3F FF               rst  $38
SRA0:AE40 FF               rst  $38
SRA0:AE41 FF               rst  $38
SRA0:AE42 FF               rst  $38
SRA0:AE43 FF               rst  $38
SRA0:AE44 FF               rst  $38
SRA0:AE45 FF               rst  $38
SRA0:AE46 FF               rst  $38
SRA0:AE47 FF               rst  $38
SRA0:AE48 FF               rst  $38
SRA0:AE49 FF               rst  $38
SRA0:AE4A FF               rst  $38
SRA0:AE4B FF               rst  $38
SRA0:AE4C FF               rst  $38
SRA0:AE4D FF               rst  $38
SRA0:AE4E FF               rst  $38
SRA0:AE4F FF               rst  $38
SRA0:AE50 FF               rst  $38
SRA0:AE51 FF               rst  $38
SRA0:AE52 FF               rst  $38
SRA0:AE53 FF               rst  $38
SRA0:AE54 FF               rst  $38
SRA0:AE55 FF               rst  $38
SRA0:AE56 FF               rst  $38
SRA0:AE57 FF               rst  $38
SRA0:AE58 FF               rst  $38
SRA0:AE59 FF               rst  $38
SRA0:AE5A FF               rst  $38
SRA0:AE5B FF               rst  $38
SRA0:AE5C FF               rst  $38
SRA0:AE5D FF               rst  $38
SRA0:AE5E FF               rst  $38
SRA0:AE5F FF               rst  $38
SRA0:AE60 FF               rst  $38
SRA0:AE61 FF               rst  $38
SRA0:AE62 FF               rst  $38
SRA0:AE63 FF               rst  $38
SRA0:AE64 FF               rst  $38
SRA0:AE65 FF               rst  $38
SRA0:AE66 FF               rst  $38
SRA0:AE67 FF               rst  $38
SRA0:AE68 FF               rst  $38
SRA0:AE69 FF               rst  $38
SRA0:AE6A FF               rst  $38
SRA0:AE6B FF               rst  $38
SRA0:AE6C FF               rst  $38
SRA0:AE6D FF               rst  $38
SRA0:AE6E FF               rst  $38
SRA0:AE6F FF               rst  $38
SRA0:AE70 FF               rst  $38
SRA0:AE71 FF               rst  $38
SRA0:AE72 FF               rst  $38
SRA0:AE73 FF               rst  $38
SRA0:AE74 FF               rst  $38
SRA0:AE75 FF               rst  $38
SRA0:AE76 FF               rst  $38
SRA0:AE77 FF               rst  $38
SRA0:AE78 FF               rst  $38
SRA0:AE79 FF               rst  $38
SRA0:AE7A FF               rst  $38
SRA0:AE7B FF               rst  $38
SRA0:AE7C FF               rst  $38
SRA0:AE7D FF               rst  $38
SRA0:AE7E FF               rst  $38
SRA0:AE7F FF               rst  $38
SRA0:AE80 FF               rst  $38
SRA0:AE81 FF               rst  $38
SRA0:AE82 FF               rst  $38
SRA0:AE83 FF               rst  $38
SRA0:AE84 FF               rst  $38
SRA0:AE85 FF               rst  $38
SRA0:AE86 FF               rst  $38
SRA0:AE87 FF               rst  $38
SRA0:AE88 FF               rst  $38
SRA0:AE89 FF               rst  $38
SRA0:AE8A FF               rst  $38
SRA0:AE8B FF               rst  $38
SRA0:AE8C FF               rst  $38
SRA0:AE8D FF               rst  $38
SRA0:AE8E FF               rst  $38
SRA0:AE8F FF               rst  $38
SRA0:AE90 FF               rst  $38
SRA0:AE91 FF               rst  $38
SRA0:AE92 FF               rst  $38
SRA0:AE93 FF               rst  $38
SRA0:AE94 FF               rst  $38
SRA0:AE95 FF               rst  $38
SRA0:AE96 FF               rst  $38
SRA0:AE97 FF               rst  $38
SRA0:AE98 FF               rst  $38
SRA0:AE99 FF               rst  $38
SRA0:AE9A FF               rst  $38
SRA0:AE9B FF               rst  $38
SRA0:AE9C FF               rst  $38
SRA0:AE9D FF               rst  $38
SRA0:AE9E FF               rst  $38
SRA0:AE9F FF               rst  $38
SRA0:AEA0 FF               rst  $38
SRA0:AEA1 FF               rst  $38
SRA0:AEA2 FF               rst  $38
SRA0:AEA3 FF               rst  $38
SRA0:AEA4 FF               rst  $38
SRA0:AEA5 FF               rst  $38
SRA0:AEA6 FF               rst  $38
SRA0:AEA7 FF               rst  $38
SRA0:AEA8 FF               rst  $38
SRA0:AEA9 FF               rst  $38
SRA0:AEAA FF               rst  $38
SRA0:AEAB FF               rst  $38
SRA0:AEAC FF               rst  $38
SRA0:AEAD FF               rst  $38
SRA0:AEAE FF               rst  $38
SRA0:AEAF FF               rst  $38
SRA0:AEB0 FF               rst  $38
SRA0:AEB1 FF               rst  $38
SRA0:AEB2 FF               rst  $38
SRA0:AEB3 FF               rst  $38
SRA0:AEB4 FF               rst  $38
SRA0:AEB5 FF               rst  $38
SRA0:AEB6 FF               rst  $38
SRA0:AEB7 FF               rst  $38
SRA0:AEB8 FF               rst  $38
SRA0:AEB9 FF               rst  $38
SRA0:AEBA FF               rst  $38
SRA0:AEBB FF               rst  $38
SRA0:AEBC FF               rst  $38
SRA0:AEBD FF               rst  $38
SRA0:AEBE FF               rst  $38
SRA0:AEBF FF               rst  $38
SRA0:AEC0 FF               rst  $38
SRA0:AEC1 FF               rst  $38
SRA0:AEC2 FF               rst  $38
SRA0:AEC3 FF               rst  $38
SRA0:AEC4 FF               rst  $38
SRA0:AEC5 FF               rst  $38
SRA0:AEC6 FF               rst  $38
SRA0:AEC7 FF               rst  $38
SRA0:AEC8 FF               rst  $38
SRA0:AEC9 FF               rst  $38
SRA0:AECA FF               rst  $38
SRA0:AECB FF               rst  $38
SRA0:AECC FF               rst  $38
SRA0:AECD FF               rst  $38
SRA0:AECE FF               rst  $38
SRA0:AECF FF               rst  $38
SRA0:AED0 FF               rst  $38
SRA0:AED1 FF               rst  $38
SRA0:AED2 FF               rst  $38
SRA0:AED3 FF               rst  $38
SRA0:AED4 FF               rst  $38
SRA0:AED5 FF               rst  $38
SRA0:AED6 FF               rst  $38
SRA0:AED7 FF               rst  $38
SRA0:AED8 FF               rst  $38
SRA0:AED9 FF               rst  $38
SRA0:AEDA FF               rst  $38
SRA0:AEDB FF               rst  $38
SRA0:AEDC FF               rst  $38
SRA0:AEDD FF               rst  $38
SRA0:AEDE FF               rst  $38
SRA0:AEDF FF               rst  $38
SRA0:AEE0 FF               rst  $38
SRA0:AEE1 FF               rst  $38
SRA0:AEE2 FF               rst  $38
SRA0:AEE3 FF               rst  $38
SRA0:AEE4 FF               rst  $38
SRA0:AEE5 FF               rst  $38
SRA0:AEE6 FF               rst  $38
SRA0:AEE7 FF               rst  $38
SRA0:AEE8 FF               rst  $38
SRA0:AEE9 FF               rst  $38
SRA0:AEEA FF               rst  $38
SRA0:AEEB FF               rst  $38
SRA0:AEEC FF               rst  $38
SRA0:AEED FF               rst  $38
SRA0:AEEE FF               rst  $38
SRA0:AEEF FF               rst  $38
SRA0:AEF0 FF               rst  $38
SRA0:AEF1 FF               rst  $38
SRA0:AEF2 FF               rst  $38
SRA0:AEF3 FF               rst  $38
SRA0:AEF4 FF               rst  $38
SRA0:AEF5 FF               rst  $38
SRA0:AEF6 FF               rst  $38
SRA0:AEF7 FF               rst  $38
SRA0:AEF8 FF               rst  $38
SRA0:AEF9 FF               rst  $38
SRA0:AEFA FF               rst  $38
SRA0:AEFB FF               rst  $38
SRA0:AEFC FF               rst  $38
SRA0:AEFD FF               rst  $38
SRA0:AEFE FF               rst  $38
SRA0:AEFF FF               rst  $38
SRA0:AF00 FF               rst  $38
SRA0:AF01 FF               rst  $38
SRA0:AF02 FF               rst  $38
SRA0:AF03 FF               rst  $38
SRA0:AF04 FF               rst  $38
SRA0:AF05 FF               rst  $38
SRA0:AF06 FF               rst  $38
SRA0:AF07 FF               rst  $38
SRA0:AF08 FF               rst  $38
SRA0:AF09 FF               rst  $38
SRA0:AF0A FF               rst  $38
SRA0:AF0B FF               rst  $38
SRA0:AF0C FF               rst  $38
SRA0:AF0D FF               rst  $38
SRA0:AF0E FF               rst  $38
SRA0:AF0F FF               rst  $38
SRA0:AF10 FF               rst  $38
SRA0:AF11 FF               rst  $38
SRA0:AF12 FF               rst  $38
SRA0:AF13 FF               rst  $38
SRA0:AF14 FF               rst  $38
SRA0:AF15 FF               rst  $38
SRA0:AF16 FF               rst  $38
SRA0:AF17 FF               rst  $38
SRA0:AF18 FF               rst  $38
SRA0:AF19 FF               rst  $38
SRA0:AF1A FF               rst  $38
SRA0:AF1B FF               rst  $38
SRA0:AF1C FF               rst  $38
SRA0:AF1D FF               rst  $38
SRA0:AF1E FF               rst  $38
SRA0:AF1F FF               rst  $38
SRA0:AF20 FF               rst  $38
SRA0:AF21 FF               rst  $38
SRA0:AF22 FF               rst  $38
SRA0:AF23 FF               rst  $38
SRA0:AF24 FF               rst  $38
SRA0:AF25 FF               rst  $38
SRA0:AF26 FF               rst  $38
SRA0:AF27 FF               rst  $38
SRA0:AF28 FF               rst  $38
SRA0:AF29 FF               rst  $38
SRA0:AF2A FF               rst  $38
SRA0:AF2B FF               rst  $38
SRA0:AF2C FF               rst  $38
SRA0:AF2D FF               rst  $38
SRA0:AF2E FF               rst  $38
SRA0:AF2F FF               rst  $38
SRA0:AF30 FF               rst  $38
SRA0:AF31 FF               rst  $38
SRA0:AF32 FF               rst  $38
SRA0:AF33 FF               rst  $38
SRA0:AF34 FF               rst  $38
SRA0:AF35 FF               rst  $38
SRA0:AF36 FF               rst  $38
SRA0:AF37 FF               rst  $38
SRA0:AF38 FF               rst  $38
SRA0:AF39 FF               rst  $38
SRA0:AF3A FF               rst  $38
SRA0:AF3B FF               rst  $38
SRA0:AF3C FF               rst  $38
SRA0:AF3D FF               rst  $38
SRA0:AF3E FF               rst  $38
SRA0:AF3F FF               rst  $38
SRA0:AF40 FF               rst  $38
SRA0:AF41 FF               rst  $38
SRA0:AF42 FF               rst  $38
SRA0:AF43 FF               rst  $38
SRA0:AF44 FF               rst  $38
SRA0:AF45 FF               rst  $38
SRA0:AF46 FF               rst  $38
SRA0:AF47 FF               rst  $38
SRA0:AF48 FF               rst  $38
SRA0:AF49 FF               rst  $38
SRA0:AF4A FF               rst  $38
SRA0:AF4B FF               rst  $38
SRA0:AF4C FF               rst  $38
SRA0:AF4D FF               rst  $38
SRA0:AF4E FF               rst  $38
SRA0:AF4F FF               rst  $38
SRA0:AF50 FF               rst  $38
SRA0:AF51 FF               rst  $38
SRA0:AF52 FF               rst  $38
SRA0:AF53 FF               rst  $38
SRA0:AF54 FF               rst  $38
SRA0:AF55 FF               rst  $38
SRA0:AF56 FF               rst  $38
SRA0:AF57 FF               rst  $38
SRA0:AF58 FF               rst  $38
SRA0:AF59 FF               rst  $38
SRA0:AF5A FF               rst  $38
SRA0:AF5B FF               rst  $38
SRA0:AF5C FF               rst  $38
SRA0:AF5D FF               rst  $38
SRA0:AF5E FF               rst  $38
SRA0:AF5F FF               rst  $38
SRA0:AF60 FF               rst  $38
SRA0:AF61 FF               rst  $38
SRA0:AF62 FF               rst  $38
SRA0:AF63 FF               rst  $38
SRA0:AF64 FF               rst  $38
SRA0:AF65 FF               rst  $38
SRA0:AF66 FF               rst  $38
SRA0:AF67 FF               rst  $38
SRA0:AF68 FF               rst  $38
SRA0:AF69 FF               rst  $38
SRA0:AF6A FF               rst  $38
SRA0:AF6B FF               rst  $38
SRA0:AF6C FF               rst  $38
SRA0:AF6D FF               rst  $38
SRA0:AF6E FF               rst  $38
SRA0:AF6F FF               rst  $38
SRA0:AF70 FF               rst  $38
SRA0:AF71 FF               rst  $38
SRA0:AF72 FF               rst  $38
SRA0:AF73 FF               rst  $38
SRA0:AF74 FF               rst  $38
SRA0:AF75 FF               rst  $38
SRA0:AF76 FF               rst  $38
SRA0:AF77 FF               rst  $38
SRA0:AF78 FF               rst  $38
SRA0:AF79 FF               rst  $38
SRA0:AF7A FF               rst  $38
SRA0:AF7B FF               rst  $38
SRA0:AF7C FF               rst  $38
SRA0:AF7D FF               rst  $38
SRA0:AF7E FF               rst  $38
SRA0:AF7F FF               rst  $38
SRA0:AF80 FF               rst  $38
SRA0:AF81 FF               rst  $38
SRA0:AF82 FF               rst  $38
SRA0:AF83 FF               rst  $38
SRA0:AF84 FF               rst  $38
SRA0:AF85 FF               rst  $38
SRA0:AF86 FF               rst  $38
SRA0:AF87 FF               rst  $38
SRA0:AF88 FF               rst  $38
SRA0:AF89 FF               rst  $38
SRA0:AF8A FF               rst  $38
SRA0:AF8B FF               rst  $38
SRA0:AF8C FF               rst  $38
SRA0:AF8D FF               rst  $38
SRA0:AF8E FF               rst  $38
SRA0:AF8F FF               rst  $38
SRA0:AF90 FF               rst  $38
SRA0:AF91 FF               rst  $38
SRA0:AF92 FF               rst  $38
SRA0:AF93 FF               rst  $38
SRA0:AF94 FF               rst  $38
SRA0:AF95 FF               rst  $38
SRA0:AF96 FF               rst  $38
SRA0:AF97 FF               rst  $38
SRA0:AF98 FF               rst  $38
SRA0:AF99 FF               rst  $38
SRA0:AF9A FF               rst  $38
SRA0:AF9B FF               rst  $38
SRA0:AF9C FF               rst  $38
SRA0:AF9D FF               rst  $38
SRA0:AF9E FF               rst  $38
SRA0:AF9F FF               rst  $38
SRA0:AFA0 FF               rst  $38
SRA0:AFA1 FF               rst  $38
SRA0:AFA2 FF               rst  $38
SRA0:AFA3 FF               rst  $38
SRA0:AFA4 FF               rst  $38
SRA0:AFA5 FF               rst  $38
SRA0:AFA6 FF               rst  $38
SRA0:AFA7 FF               rst  $38
SRA0:AFA8 FF               rst  $38
SRA0:AFA9 FF               rst  $38
SRA0:AFAA FF               rst  $38
SRA0:AFAB FF               rst  $38
SRA0:AFAC FF               rst  $38
SRA0:AFAD FF               rst  $38
SRA0:AFAE FF               rst  $38
SRA0:AFAF FF               rst  $38
SRA0:AFB0 FF               rst  $38
SRA0:AFB1 FF               rst  $38
SRA0:AFB2 FF               rst  $38
SRA0:AFB3 FF               rst  $38
SRA0:AFB4 FF               rst  $38
SRA0:AFB5 FF               rst  $38
SRA0:AFB6 FF               rst  $38
SRA0:AFB7 FF               rst  $38
SRA0:AFB8 FF               rst  $38
SRA0:AFB9 FF               rst  $38
SRA0:AFBA FF               rst  $38
SRA0:AFBB FF               rst  $38
SRA0:AFBC FF               rst  $38
SRA0:AFBD FF               rst  $38
SRA0:AFBE FF               rst  $38
SRA0:AFBF FF               rst  $38
SRA0:AFC0 FF               rst  $38
SRA0:AFC1 FF               rst  $38
SRA0:AFC2 FF               rst  $38
SRA0:AFC3 FF               rst  $38
SRA0:AFC4 FF               rst  $38
SRA0:AFC5 FF               rst  $38
SRA0:AFC6 FF               rst  $38
SRA0:AFC7 FF               rst  $38
SRA0:AFC8 FF               rst  $38
SRA0:AFC9 FF               rst  $38
SRA0:AFCA FF               rst  $38
SRA0:AFCB FF               rst  $38
SRA0:AFCC FF               rst  $38
SRA0:AFCD FF               rst  $38
SRA0:AFCE FF               rst  $38
SRA0:AFCF FF               rst  $38
SRA0:AFD0 FF               rst  $38
SRA0:AFD1 FF               rst  $38
SRA0:AFD2 FF               rst  $38
SRA0:AFD3 FF               rst  $38
SRA0:AFD4 FF               rst  $38
SRA0:AFD5 FF               rst  $38
SRA0:AFD6 FF               rst  $38
SRA0:AFD7 FF               rst  $38
SRA0:AFD8 FF               rst  $38
SRA0:AFD9 FF               rst  $38
SRA0:AFDA FF               rst  $38
SRA0:AFDB FF               rst  $38
SRA0:AFDC FF               rst  $38
SRA0:AFDD FF               rst  $38
SRA0:AFDE FF               rst  $38
SRA0:AFDF FF               rst  $38
SRA0:AFE0 FF               rst  $38
SRA0:AFE1 FF               rst  $38
SRA0:AFE2 FF               rst  $38
SRA0:AFE3 FF               rst  $38
SRA0:AFE4 FF               rst  $38
SRA0:AFE5 FF               rst  $38
SRA0:AFE6 FF               rst  $38
SRA0:AFE7 FF               rst  $38
SRA0:AFE8 FF               rst  $38
SRA0:AFE9 FF               rst  $38
SRA0:AFEA FF               rst  $38
SRA0:AFEB FF               rst  $38
SRA0:AFEC FF               rst  $38
SRA0:AFED FF               rst  $38
SRA0:AFEE FF               rst  $38
SRA0:AFEF FF               rst  $38
SRA0:AFF0 FF               rst  $38
SRA0:AFF1 FF               rst  $38
SRA0:AFF2 FF               rst  $38
SRA0:AFF3 FF               rst  $38
SRA0:AFF4 FF               rst  $38
SRA0:AFF5 FF               rst  $38
SRA0:AFF6 FF               rst  $38
SRA0:AFF7 FF               rst  $38
SRA0:AFF8 FF               rst  $38
SRA0:AFF9 FF               rst  $38
SRA0:AFFA FF               rst  $38
SRA0:AFFB FF               rst  $38
SRA0:AFFC FF               rst  $38
SRA0:AFFD FF               rst  $38
SRA0:AFFE FF               rst  $38
SRA0:AFFF FF               rst  $38
SRA0:B000 FF               rst  $38
SRA0:B001 FF               rst  $38
SRA0:B002 FF               rst  $38
SRA0:B003 FF               rst  $38
SRA0:B004 FF               rst  $38
SRA0:B005 FF               rst  $38
SRA0:B006 FF               rst  $38
SRA0:B007 FF               rst  $38
SRA0:B008 FF               rst  $38
SRA0:B009 FF               rst  $38
SRA0:B00A FF               rst  $38
SRA0:B00B FF               rst  $38
SRA0:B00C FF               rst  $38
SRA0:B00D FF               rst  $38
SRA0:B00E FF               rst  $38
SRA0:B00F FF               rst  $38
SRA0:B010 FF               rst  $38
SRA0:B011 FF               rst  $38
SRA0:B012 FF               rst  $38
SRA0:B013 FF               rst  $38
SRA0:B014 FF               rst  $38
SRA0:B015 FF               rst  $38
SRA0:B016 FF               rst  $38
SRA0:B017 FF               rst  $38
SRA0:B018 FF               rst  $38
SRA0:B019 FF               rst  $38
SRA0:B01A FF               rst  $38
SRA0:B01B FF               rst  $38
SRA0:B01C FF               rst  $38
SRA0:B01D FF               rst  $38
SRA0:B01E FF               rst  $38
SRA0:B01F FF               rst  $38
SRA0:B020 FF               rst  $38
SRA0:B021 FF               rst  $38
SRA0:B022 FF               rst  $38
SRA0:B023 FF               rst  $38
SRA0:B024 FF               rst  $38
SRA0:B025 FF               rst  $38
SRA0:B026 FF               rst  $38
SRA0:B027 FF               rst  $38
SRA0:B028 FF               rst  $38
SRA0:B029 FF               rst  $38
SRA0:B02A FF               rst  $38
SRA0:B02B FF               rst  $38
SRA0:B02C FF               rst  $38
SRA0:B02D FF               rst  $38
SRA0:B02E FF               rst  $38
SRA0:B02F FF               rst  $38
SRA0:B030 FF               rst  $38
SRA0:B031 FF               rst  $38
SRA0:B032 FF               rst  $38
SRA0:B033 FF               rst  $38
SRA0:B034 FF               rst  $38
SRA0:B035 FF               rst  $38
SRA0:B036 FF               rst  $38
SRA0:B037 FF               rst  $38
SRA0:B038 FF               rst  $38
SRA0:B039 FF               rst  $38
SRA0:B03A FF               rst  $38
SRA0:B03B FF               rst  $38
SRA0:B03C FF               rst  $38
SRA0:B03D FF               rst  $38
SRA0:B03E FF               rst  $38
SRA0:B03F FF               rst  $38
SRA0:B040 FF               rst  $38
SRA0:B041 FF               rst  $38
SRA0:B042 FF               rst  $38
SRA0:B043 FF               rst  $38
SRA0:B044 FF               rst  $38
SRA0:B045 FF               rst  $38
SRA0:B046 FF               rst  $38
SRA0:B047 FF               rst  $38
SRA0:B048 FF               rst  $38
SRA0:B049 FF               rst  $38
SRA0:B04A FF               rst  $38
SRA0:B04B FF               rst  $38
SRA0:B04C FF               rst  $38
SRA0:B04D FF               rst  $38
SRA0:B04E FF               rst  $38
SRA0:B04F FF               rst  $38
SRA0:B050 FF               rst  $38
SRA0:B051 FF               rst  $38
SRA0:B052 FF               rst  $38
SRA0:B053 FF               rst  $38
SRA0:B054 FF               rst  $38
SRA0:B055 FF               rst  $38
SRA0:B056 FF               rst  $38
SRA0:B057 FF               rst  $38
SRA0:B058 FF               rst  $38
SRA0:B059 FF               rst  $38
SRA0:B05A FF               rst  $38
SRA0:B05B FF               rst  $38
SRA0:B05C FF               rst  $38
SRA0:B05D FF               rst  $38
SRA0:B05E FF               rst  $38
SRA0:B05F FF               rst  $38
SRA0:B060 FF               rst  $38
SRA0:B061 FF               rst  $38
SRA0:B062 FF               rst  $38
SRA0:B063 FF               rst  $38
SRA0:B064 FF               rst  $38
SRA0:B065 FF               rst  $38
SRA0:B066 FF               rst  $38
SRA0:B067 FF               rst  $38
SRA0:B068 FF               rst  $38
SRA0:B069 FF               rst  $38
SRA0:B06A FF               rst  $38
SRA0:B06B FF               rst  $38
SRA0:B06C FF               rst  $38
SRA0:B06D FF               rst  $38
SRA0:B06E FF               rst  $38
SRA0:B06F FF               rst  $38
SRA0:B070 FF               rst  $38
SRA0:B071 FF               rst  $38
SRA0:B072 FF               rst  $38
SRA0:B073 FF               rst  $38
SRA0:B074 FF               rst  $38
SRA0:B075 FF               rst  $38
SRA0:B076 FF               rst  $38
SRA0:B077 FF               rst  $38
SRA0:B078 FF               rst  $38
SRA0:B079 FF               rst  $38
SRA0:B07A FF               rst  $38
SRA0:B07B FF               rst  $38
SRA0:B07C FF               rst  $38
SRA0:B07D FF               rst  $38
SRA0:B07E FF               rst  $38
SRA0:B07F FF               rst  $38
SRA0:B080 FF               rst  $38
SRA0:B081 FF               rst  $38
SRA0:B082 FF               rst  $38
SRA0:B083 FF               rst  $38
SRA0:B084 FF               rst  $38
SRA0:B085 FF               rst  $38
SRA0:B086 FF               rst  $38
SRA0:B087 FF               rst  $38
SRA0:B088 FF               rst  $38
SRA0:B089 FF               rst  $38
SRA0:B08A FF               rst  $38
SRA0:B08B FF               rst  $38
SRA0:B08C FF               rst  $38
SRA0:B08D FF               rst  $38
SRA0:B08E FF               rst  $38
SRA0:B08F FF               rst  $38
SRA0:B090 FF               rst  $38
SRA0:B091 FF               rst  $38
SRA0:B092 FF               rst  $38
SRA0:B093 FF               rst  $38
SRA0:B094 FF               rst  $38
SRA0:B095 FF               rst  $38
SRA0:B096 FF               rst  $38
SRA0:B097 FF               rst  $38
SRA0:B098 FF               rst  $38
SRA0:B099 FF               rst  $38
SRA0:B09A FF               rst  $38
SRA0:B09B FF               rst  $38
SRA0:B09C FF               rst  $38
SRA0:B09D FF               rst  $38
SRA0:B09E FF               rst  $38
SRA0:B09F FF               rst  $38
SRA0:B0A0 FF               rst  $38
SRA0:B0A1 FF               rst  $38
SRA0:B0A2 FF               rst  $38
SRA0:B0A3 FF               rst  $38
SRA0:B0A4 FF               rst  $38
SRA0:B0A5 FF               rst  $38
SRA0:B0A6 FF               rst  $38
SRA0:B0A7 FF               rst  $38
SRA0:B0A8 FF               rst  $38
SRA0:B0A9 FF               rst  $38
SRA0:B0AA FF               rst  $38
SRA0:B0AB FF               rst  $38
SRA0:B0AC FF               rst  $38
SRA0:B0AD FF               rst  $38
SRA0:B0AE FF               rst  $38
SRA0:B0AF FF               rst  $38
SRA0:B0B0 FF               rst  $38
SRA0:B0B1 FF               rst  $38
SRA0:B0B2 FF               rst  $38
SRA0:B0B3 FF               rst  $38
SRA0:B0B4 FF               rst  $38
SRA0:B0B5 FF               rst  $38
SRA0:B0B6 FF               rst  $38
SRA0:B0B7 FF               rst  $38
SRA0:B0B8 FF               rst  $38
SRA0:B0B9 FF               rst  $38
SRA0:B0BA FF               rst  $38
SRA0:B0BB FF               rst  $38
SRA0:B0BC FF               rst  $38
SRA0:B0BD FF               rst  $38
SRA0:B0BE FF               rst  $38
SRA0:B0BF FF               rst  $38
SRA0:B0C0 FF               rst  $38
SRA0:B0C1 FF               rst  $38
SRA0:B0C2 FF               rst  $38
SRA0:B0C3 FF               rst  $38
SRA0:B0C4 FF               rst  $38
SRA0:B0C5 FF               rst  $38
SRA0:B0C6 FF               rst  $38
SRA0:B0C7 FF               rst  $38
SRA0:B0C8 FF               rst  $38
SRA0:B0C9 FF               rst  $38
SRA0:B0CA FF               rst  $38
SRA0:B0CB FF               rst  $38
SRA0:B0CC FF               rst  $38
SRA0:B0CD FF               rst  $38
SRA0:B0CE FF               rst  $38
SRA0:B0CF FF               rst  $38
SRA0:B0D0 FF               rst  $38
SRA0:B0D1 FF               rst  $38
SRA0:B0D2 FF               rst  $38
SRA0:B0D3 FF               rst  $38
SRA0:B0D4 FF               rst  $38
SRA0:B0D5 FF               rst  $38
SRA0:B0D6 FF               rst  $38
SRA0:B0D7 FF               rst  $38
SRA0:B0D8 FF               rst  $38
SRA0:B0D9 FF               rst  $38
SRA0:B0DA FF               rst  $38
SRA0:B0DB FF               rst  $38
SRA0:B0DC FF               rst  $38
SRA0:B0DD FF               rst  $38
SRA0:B0DE FF               rst  $38
SRA0:B0DF FF               rst  $38
SRA0:B0E0 FF               rst  $38
SRA0:B0E1 FF               rst  $38
SRA0:B0E2 FF               rst  $38
SRA0:B0E3 FF               rst  $38
SRA0:B0E4 FF               rst  $38
SRA0:B0E5 FF               rst  $38
SRA0:B0E6 FF               rst  $38
SRA0:B0E7 FF               rst  $38
SRA0:B0E8 FF               rst  $38
SRA0:B0E9 FF               rst  $38
SRA0:B0EA FF               rst  $38
SRA0:B0EB FF               rst  $38
SRA0:B0EC FF               rst  $38
SRA0:B0ED FF               rst  $38
SRA0:B0EE FF               rst  $38
SRA0:B0EF FF               rst  $38
SRA0:B0F0 FF               rst  $38
SRA0:B0F1 FF               rst  $38
SRA0:B0F2 FF               rst  $38
SRA0:B0F3 FF               rst  $38
SRA0:B0F4 FF               rst  $38
SRA0:B0F5 FF               rst  $38
SRA0:B0F6 FF               rst  $38
SRA0:B0F7 FF               rst  $38
SRA0:B0F8 FF               rst  $38
SRA0:B0F9 FF               rst  $38
SRA0:B0FA FF               rst  $38
SRA0:B0FB FF               rst  $38
SRA0:B0FC FF               rst  $38
SRA0:B0FD FF               rst  $38
SRA0:B0FE FF               rst  $38
SRA0:B0FF FF               rst  $38
SRA0:B100 FF               rst  $38
SRA0:B101 FF               rst  $38
SRA0:B102 FF               rst  $38
SRA0:B103 FF               rst  $38
SRA0:B104 FF               rst  $38
SRA0:B105 FF               rst  $38
SRA0:B106 FF               rst  $38
SRA0:B107 FF               rst  $38
SRA0:B108 FF               rst  $38
SRA0:B109 FF               rst  $38
SRA0:B10A FF               rst  $38
SRA0:B10B FF               rst  $38
SRA0:B10C FF               rst  $38
SRA0:B10D FF               rst  $38
SRA0:B10E FF               rst  $38
SRA0:B10F FF               rst  $38
SRA0:B110 FF               rst  $38
SRA0:B111 FF               rst  $38
SRA0:B112 FF               rst  $38
SRA0:B113 FF               rst  $38
SRA0:B114 FF               rst  $38
SRA0:B115 FF               rst  $38
SRA0:B116 FF               rst  $38
SRA0:B117 FF               rst  $38
SRA0:B118 FF               rst  $38
SRA0:B119 FF               rst  $38
SRA0:B11A FF               rst  $38
SRA0:B11B FF               rst  $38
SRA0:B11C FF               rst  $38
SRA0:B11D FF               rst  $38
SRA0:B11E FF               rst  $38
SRA0:B11F FF               rst  $38
SRA0:B120 FF               rst  $38
SRA0:B121 FF               rst  $38
SRA0:B122 FF               rst  $38
SRA0:B123 FF               rst  $38
SRA0:B124 FF               rst  $38
SRA0:B125 FF               rst  $38
SRA0:B126 FF               rst  $38
SRA0:B127 FF               rst  $38
SRA0:B128 FF               rst  $38
SRA0:B129 FF               rst  $38
SRA0:B12A FF               rst  $38
SRA0:B12B FF               rst  $38
SRA0:B12C FF               rst  $38
SRA0:B12D FF               rst  $38
SRA0:B12E FF               rst  $38
SRA0:B12F FF               rst  $38
SRA0:B130 FF               rst  $38
SRA0:B131 FF               rst  $38
SRA0:B132 FF               rst  $38
SRA0:B133 FF               rst  $38
SRA0:B134 FF               rst  $38
SRA0:B135 FF               rst  $38
SRA0:B136 FF               rst  $38
SRA0:B137 FF               rst  $38
SRA0:B138 FF               rst  $38
SRA0:B139 FF               rst  $38
SRA0:B13A FF               rst  $38
SRA0:B13B FF               rst  $38
SRA0:B13C FF               rst  $38
SRA0:B13D FF               rst  $38
SRA0:B13E FF               rst  $38
SRA0:B13F FF               rst  $38
SRA0:B140 FF               rst  $38
SRA0:B141 FF               rst  $38
SRA0:B142 FF               rst  $38
SRA0:B143 FF               rst  $38
SRA0:B144 FF               rst  $38
SRA0:B145 FF               rst  $38
SRA0:B146 FF               rst  $38
SRA0:B147 FF               rst  $38
SRA0:B148 FF               rst  $38
SRA0:B149 FF               rst  $38
SRA0:B14A FF               rst  $38
SRA0:B14B FF               rst  $38
SRA0:B14C FF               rst  $38
SRA0:B14D FF               rst  $38
SRA0:B14E FF               rst  $38
SRA0:B14F FF               rst  $38
SRA0:B150 FF               rst  $38
SRA0:B151 FF               rst  $38
SRA0:B152 FF               rst  $38
SRA0:B153 FF               rst  $38
SRA0:B154 FF               rst  $38
SRA0:B155 FF               rst  $38
SRA0:B156 FF               rst  $38
SRA0:B157 FF               rst  $38
SRA0:B158 FF               rst  $38
SRA0:B159 FF               rst  $38
SRA0:B15A FF               rst  $38
SRA0:B15B FF               rst  $38
SRA0:B15C FF               rst  $38
SRA0:B15D FF               rst  $38
SRA0:B15E FF               rst  $38
SRA0:B15F FF               rst  $38
SRA0:B160 FF               rst  $38
SRA0:B161 FF               rst  $38
SRA0:B162 FF               rst  $38
SRA0:B163 FF               rst  $38
SRA0:B164 FF               rst  $38
SRA0:B165 FF               rst  $38
SRA0:B166 FF               rst  $38
SRA0:B167 FF               rst  $38
SRA0:B168 FF               rst  $38
SRA0:B169 FF               rst  $38
SRA0:B16A FF               rst  $38
SRA0:B16B FF               rst  $38
SRA0:B16C FF               rst  $38
SRA0:B16D FF               rst  $38
SRA0:B16E FF               rst  $38
SRA0:B16F FF               rst  $38
SRA0:B170 FF               rst  $38
SRA0:B171 FF               rst  $38
SRA0:B172 FF               rst  $38
SRA0:B173 FF               rst  $38
SRA0:B174 FF               rst  $38
SRA0:B175 FF               rst  $38
SRA0:B176 FF               rst  $38
SRA0:B177 FF               rst  $38
SRA0:B178 FF               rst  $38
SRA0:B179 FF               rst  $38
SRA0:B17A FF               rst  $38
SRA0:B17B FF               rst  $38
SRA0:B17C FF               rst  $38
SRA0:B17D FF               rst  $38
SRA0:B17E FF               rst  $38
SRA0:B17F FF               rst  $38
SRA0:B180 FF               rst  $38
SRA0:B181 FF               rst  $38
SRA0:B182 FF               rst  $38
SRA0:B183 FF               rst  $38
SRA0:B184 FF               rst  $38
SRA0:B185 FF               rst  $38
SRA0:B186 FF               rst  $38
SRA0:B187 FF               rst  $38
SRA0:B188 FF               rst  $38
SRA0:B189 FF               rst  $38
SRA0:B18A FF               rst  $38
SRA0:B18B FF               rst  $38
SRA0:B18C FF               rst  $38
SRA0:B18D FF               rst  $38
SRA0:B18E FF               rst  $38
SRA0:B18F FF               rst  $38
SRA0:B190 FF               rst  $38
SRA0:B191 FF               rst  $38
SRA0:B192 FF               rst  $38
SRA0:B193 FF               rst  $38
SRA0:B194 FF               rst  $38
SRA0:B195 FF               rst  $38
SRA0:B196 FF               rst  $38
SRA0:B197 FF               rst  $38
SRA0:B198 FF               rst  $38
SRA0:B199 FF               rst  $38
SRA0:B19A FF               rst  $38
SRA0:B19B FF               rst  $38
SRA0:B19C FF               rst  $38
SRA0:B19D FF               rst  $38
SRA0:B19E FF               rst  $38
SRA0:B19F FF               rst  $38
SRA0:B1A0 FF               rst  $38
SRA0:B1A1 FF               rst  $38
SRA0:B1A2 FF               rst  $38
SRA0:B1A3 FF               rst  $38
SRA0:B1A4 FF               rst  $38
SRA0:B1A5 FF               rst  $38
SRA0:B1A6 FF               rst  $38
SRA0:B1A7 FF               rst  $38
SRA0:B1A8 FF               rst  $38
SRA0:B1A9 FF               rst  $38
SRA0:B1AA FF               rst  $38
SRA0:B1AB FF               rst  $38
SRA0:B1AC FF               rst  $38
SRA0:B1AD FF               rst  $38
SRA0:B1AE FF               rst  $38
SRA0:B1AF FF               rst  $38
SRA0:B1B0 FF               rst  $38
SRA0:B1B1 FF               rst  $38
SRA0:B1B2 FF               rst  $38
SRA0:B1B3 FF               rst  $38
SRA0:B1B4 FF               rst  $38
SRA0:B1B5 FF               rst  $38
SRA0:B1B6 FF               rst  $38
SRA0:B1B7 FF               rst  $38
SRA0:B1B8 FF               rst  $38
SRA0:B1B9 FF               rst  $38
SRA0:B1BA FF               rst  $38
SRA0:B1BB FF               rst  $38
SRA0:B1BC FF               rst  $38
SRA0:B1BD FF               rst  $38
SRA0:B1BE FF               rst  $38
SRA0:B1BF FF               rst  $38
SRA0:B1C0 FF               rst  $38
SRA0:B1C1 FF               rst  $38
SRA0:B1C2 FF               rst  $38
SRA0:B1C3 FF               rst  $38
SRA0:B1C4 FF               rst  $38
SRA0:B1C5 FF               rst  $38
SRA0:B1C6 FF               rst  $38
SRA0:B1C7 FF               rst  $38
SRA0:B1C8 FF               rst  $38
SRA0:B1C9 FF               rst  $38
SRA0:B1CA FF               rst  $38
SRA0:B1CB FF               rst  $38
SRA0:B1CC FF               rst  $38
SRA0:B1CD FF               rst  $38
SRA0:B1CE FF               rst  $38
SRA0:B1CF FF               rst  $38
SRA0:B1D0 FF               rst  $38
SRA0:B1D1 FF               rst  $38
SRA0:B1D2 FF               rst  $38
SRA0:B1D3 FF               rst  $38
SRA0:B1D4 FF               rst  $38
SRA0:B1D5 FF               rst  $38
SRA0:B1D6 FF               rst  $38
SRA0:B1D7 FF               rst  $38
SRA0:B1D8 FF               rst  $38
SRA0:B1D9 FF               rst  $38
SRA0:B1DA FF               rst  $38
SRA0:B1DB FF               rst  $38
SRA0:B1DC FF               rst  $38
SRA0:B1DD FF               rst  $38
SRA0:B1DE FF               rst  $38
SRA0:B1DF FF               rst  $38
SRA0:B1E0 FF               rst  $38
SRA0:B1E1 FF               rst  $38
SRA0:B1E2 FF               rst  $38
SRA0:B1E3 FF               rst  $38
SRA0:B1E4 FF               rst  $38
SRA0:B1E5 FF               rst  $38
SRA0:B1E6 FF               rst  $38
SRA0:B1E7 FF               rst  $38
SRA0:B1E8 FF               rst  $38
SRA0:B1E9 FF               rst  $38
SRA0:B1EA FF               rst  $38
SRA0:B1EB FF               rst  $38
SRA0:B1EC FF               rst  $38
SRA0:B1ED FF               rst  $38
SRA0:B1EE FF               rst  $38
SRA0:B1EF FF               rst  $38
SRA0:B1F0 FF               rst  $38
SRA0:B1F1 FF               rst  $38
SRA0:B1F2 FF               rst  $38
SRA0:B1F3 FF               rst  $38
SRA0:B1F4 FF               rst  $38
SRA0:B1F5 FF               rst  $38
SRA0:B1F6 FF               rst  $38
SRA0:B1F7 FF               rst  $38
SRA0:B1F8 FF               rst  $38
SRA0:B1F9 FF               rst  $38
SRA0:B1FA FF               rst  $38
SRA0:B1FB FF               rst  $38
SRA0:B1FC FF               rst  $38
SRA0:B1FD FF               rst  $38
SRA0:B1FE FF               rst  $38
SRA0:B1FF FF               rst  $38
SRA0:B200 FF               rst  $38
SRA0:B201 FF               rst  $38
SRA0:B202 FF               rst  $38
SRA0:B203 FF               rst  $38
SRA0:B204 FF               rst  $38
SRA0:B205 FF               rst  $38
SRA0:B206 FF               rst  $38
SRA0:B207 FF               rst  $38
SRA0:B208 FF               rst  $38
SRA0:B209 FF               rst  $38
SRA0:B20A FF               rst  $38
SRA0:B20B FF               rst  $38
SRA0:B20C FF               rst  $38
SRA0:B20D FF               rst  $38
SRA0:B20E FF               rst  $38
SRA0:B20F FF               rst  $38
SRA0:B210 FF               rst  $38
SRA0:B211 FF               rst  $38
SRA0:B212 FF               rst  $38
SRA0:B213 FF               rst  $38
SRA0:B214 FF               rst  $38
SRA0:B215 FF               rst  $38
SRA0:B216 FF               rst  $38
SRA0:B217 FF               rst  $38
SRA0:B218 FF               rst  $38
SRA0:B219 FF               rst  $38
SRA0:B21A FF               rst  $38
SRA0:B21B FF               rst  $38
SRA0:B21C FF               rst  $38
SRA0:B21D FF               rst  $38
SRA0:B21E FF               rst  $38
SRA0:B21F FF               rst  $38
SRA0:B220 FF               rst  $38
SRA0:B221 FF               rst  $38
SRA0:B222 FF               rst  $38
SRA0:B223 FF               rst  $38
SRA0:B224 FF               rst  $38
SRA0:B225 FF               rst  $38
SRA0:B226 FF               rst  $38
SRA0:B227 FF               rst  $38
SRA0:B228 FF               rst  $38
SRA0:B229 FF               rst  $38
SRA0:B22A FF               rst  $38
SRA0:B22B FF               rst  $38
SRA0:B22C FF               rst  $38
SRA0:B22D FF               rst  $38
SRA0:B22E FF               rst  $38
SRA0:B22F FF               rst  $38
SRA0:B230 FF               rst  $38
SRA0:B231 FF               rst  $38
SRA0:B232 FF               rst  $38
SRA0:B233 FF               rst  $38
SRA0:B234 FF               rst  $38
SRA0:B235 FF               rst  $38
SRA0:B236 FF               rst  $38
SRA0:B237 FF               rst  $38
SRA0:B238 FF               rst  $38
SRA0:B239 FF               rst  $38
SRA0:B23A FF               rst  $38
SRA0:B23B FF               rst  $38
SRA0:B23C FF               rst  $38
SRA0:B23D FF               rst  $38
SRA0:B23E FF               rst  $38
SRA0:B23F FF               rst  $38
SRA0:B240 FF               rst  $38
SRA0:B241 FF               rst  $38
SRA0:B242 FF               rst  $38
SRA0:B243 FF               rst  $38
SRA0:B244 FF               rst  $38
SRA0:B245 FF               rst  $38
SRA0:B246 FF               rst  $38
SRA0:B247 FF               rst  $38
SRA0:B248 FF               rst  $38
SRA0:B249 FF               rst  $38
SRA0:B24A FF               rst  $38
SRA0:B24B FF               rst  $38
SRA0:B24C FF               rst  $38
SRA0:B24D FF               rst  $38
SRA0:B24E FF               rst  $38
SRA0:B24F FF               rst  $38
SRA0:B250 FF               rst  $38
SRA0:B251 FF               rst  $38
SRA0:B252 FF               rst  $38
SRA0:B253 FF               rst  $38
SRA0:B254 FF               rst  $38
SRA0:B255 FF               rst  $38
SRA0:B256 FF               rst  $38
SRA0:B257 FF               rst  $38
SRA0:B258 FF               rst  $38
SRA0:B259 FF               rst  $38
SRA0:B25A FF               rst  $38
SRA0:B25B FF               rst  $38
SRA0:B25C FF               rst  $38
SRA0:B25D FF               rst  $38
SRA0:B25E FF               rst  $38
SRA0:B25F FF               rst  $38
SRA0:B260 FF               rst  $38
SRA0:B261 FF               rst  $38
SRA0:B262 FF               rst  $38
SRA0:B263 FF               rst  $38
SRA0:B264 FF               rst  $38
SRA0:B265 FF               rst  $38
SRA0:B266 FF               rst  $38
SRA0:B267 FF               rst  $38
SRA0:B268 FF               rst  $38
SRA0:B269 FF               rst  $38
SRA0:B26A FF               rst  $38
SRA0:B26B FF               rst  $38
SRA0:B26C FF               rst  $38
SRA0:B26D FF               rst  $38
SRA0:B26E FF               rst  $38
SRA0:B26F FF               rst  $38
SRA0:B270 FF               rst  $38
SRA0:B271 FF               rst  $38
SRA0:B272 FF               rst  $38
SRA0:B273 FF               rst  $38
SRA0:B274 FF               rst  $38
SRA0:B275 FF               rst  $38
SRA0:B276 FF               rst  $38
SRA0:B277 FF               rst  $38
SRA0:B278 FF               rst  $38
SRA0:B279 FF               rst  $38
SRA0:B27A FF               rst  $38
SRA0:B27B FF               rst  $38
SRA0:B27C FF               rst  $38
SRA0:B27D FF               rst  $38
SRA0:B27E FF               rst  $38
SRA0:B27F FF               rst  $38
SRA0:B280 FF               rst  $38
SRA0:B281 FF               rst  $38
SRA0:B282 FF               rst  $38
SRA0:B283 FF               rst  $38
SRA0:B284 FF               rst  $38
SRA0:B285 FF               rst  $38
SRA0:B286 FF               rst  $38
SRA0:B287 FF               rst  $38
SRA0:B288 FF               rst  $38
SRA0:B289 FF               rst  $38
SRA0:B28A FF               rst  $38
SRA0:B28B FF               rst  $38
SRA0:B28C FF               rst  $38
SRA0:B28D FF               rst  $38
SRA0:B28E FF               rst  $38
SRA0:B28F FF               rst  $38
SRA0:B290 FF               rst  $38
SRA0:B291 FF               rst  $38
SRA0:B292 FF               rst  $38
SRA0:B293 FF               rst  $38
SRA0:B294 FF               rst  $38
SRA0:B295 FF               rst  $38
SRA0:B296 FF               rst  $38
SRA0:B297 FF               rst  $38
SRA0:B298 FF               rst  $38
SRA0:B299 FF               rst  $38
SRA0:B29A FF               rst  $38
SRA0:B29B FF               rst  $38
SRA0:B29C FF               rst  $38
SRA0:B29D FF               rst  $38
SRA0:B29E FF               rst  $38
SRA0:B29F FF               rst  $38
SRA0:B2A0 FF               rst  $38
SRA0:B2A1 FF               rst  $38
SRA0:B2A2 FF               rst  $38
SRA0:B2A3 FF               rst  $38
SRA0:B2A4 FF               rst  $38
SRA0:B2A5 FF               rst  $38
SRA0:B2A6 FF               rst  $38
SRA0:B2A7 FF               rst  $38
SRA0:B2A8 FF               rst  $38
SRA0:B2A9 FF               rst  $38
SRA0:B2AA FF               rst  $38
SRA0:B2AB FF               rst  $38
SRA0:B2AC FF               rst  $38
SRA0:B2AD FF               rst  $38
SRA0:B2AE FF               rst  $38
SRA0:B2AF FF               rst  $38
SRA0:B2B0 FF               rst  $38
SRA0:B2B1 FF               rst  $38
SRA0:B2B2 FF               rst  $38
SRA0:B2B3 FF               rst  $38
SRA0:B2B4 FF               rst  $38
SRA0:B2B5 FF               rst  $38
SRA0:B2B6 FF               rst  $38
SRA0:B2B7 FF               rst  $38
SRA0:B2B8 FF               rst  $38
SRA0:B2B9 FF               rst  $38
SRA0:B2BA FF               rst  $38
SRA0:B2BB FF               rst  $38
SRA0:B2BC FF               rst  $38
SRA0:B2BD FF               rst  $38
SRA0:B2BE FF               rst  $38
SRA0:B2BF FF               rst  $38
SRA0:B2C0 FF               rst  $38
SRA0:B2C1 FF               rst  $38
SRA0:B2C2 FF               rst  $38
SRA0:B2C3 FF               rst  $38
SRA0:B2C4 FF               rst  $38
SRA0:B2C5 FF               rst  $38
SRA0:B2C6 FF               rst  $38
SRA0:B2C7 FF               rst  $38
SRA0:B2C8 FF               rst  $38
SRA0:B2C9 FF               rst  $38
SRA0:B2CA FF               rst  $38
SRA0:B2CB FF               rst  $38
SRA0:B2CC FF               rst  $38
SRA0:B2CD FF               rst  $38
SRA0:B2CE FF               rst  $38
SRA0:B2CF FF               rst  $38
SRA0:B2D0 FF               rst  $38
SRA0:B2D1 FF               rst  $38
SRA0:B2D2 FF               rst  $38
SRA0:B2D3 FF               rst  $38
SRA0:B2D4 FF               rst  $38
SRA0:B2D5 FF               rst  $38
SRA0:B2D6 FF               rst  $38
SRA0:B2D7 FF               rst  $38
SRA0:B2D8 FF               rst  $38
SRA0:B2D9 FF               rst  $38
SRA0:B2DA FF               rst  $38
SRA0:B2DB FF               rst  $38
SRA0:B2DC FF               rst  $38
SRA0:B2DD FF               rst  $38
SRA0:B2DE FF               rst  $38
SRA0:B2DF FF               rst  $38
SRA0:B2E0 FF               rst  $38
SRA0:B2E1 FF               rst  $38
SRA0:B2E2 FF               rst  $38
SRA0:B2E3 FF               rst  $38
SRA0:B2E4 FF               rst  $38
SRA0:B2E5 FF               rst  $38
SRA0:B2E6 FF               rst  $38
SRA0:B2E7 FF               rst  $38
SRA0:B2E8 FF               rst  $38
SRA0:B2E9 FF               rst  $38
SRA0:B2EA FF               rst  $38
SRA0:B2EB FF               rst  $38
SRA0:B2EC FF               rst  $38
SRA0:B2ED FF               rst  $38
SRA0:B2EE FF               rst  $38
SRA0:B2EF FF               rst  $38
SRA0:B2F0 FF               rst  $38
SRA0:B2F1 FF               rst  $38
SRA0:B2F2 FF               rst  $38
SRA0:B2F3 FF               rst  $38
SRA0:B2F4 FF               rst  $38
SRA0:B2F5 FF               rst  $38
SRA0:B2F6 FF               rst  $38
SRA0:B2F7 FF               rst  $38
SRA0:B2F8 FF               rst  $38
SRA0:B2F9 FF               rst  $38
SRA0:B2FA FF               rst  $38
SRA0:B2FB FF               rst  $38
SRA0:B2FC FF               rst  $38
SRA0:B2FD FF               rst  $38
SRA0:B2FE FF               rst  $38
SRA0:B2FF FF               rst  $38
SRA0:B300 FF               rst  $38
SRA0:B301 FF               rst  $38
SRA0:B302 FF               rst  $38
SRA0:B303 FF               rst  $38
SRA0:B304 FF               rst  $38
SRA0:B305 FF               rst  $38
SRA0:B306 FF               rst  $38
SRA0:B307 FF               rst  $38
SRA0:B308 FF               rst  $38
SRA0:B309 FF               rst  $38
SRA0:B30A FF               rst  $38
SRA0:B30B FF               rst  $38
SRA0:B30C FF               rst  $38
SRA0:B30D FF               rst  $38
SRA0:B30E FF               rst  $38
SRA0:B30F FF               rst  $38
SRA0:B310 FF               rst  $38
SRA0:B311 FF               rst  $38
SRA0:B312 FF               rst  $38
SRA0:B313 FF               rst  $38
SRA0:B314 FF               rst  $38
SRA0:B315 FF               rst  $38
SRA0:B316 FF               rst  $38
SRA0:B317 FF               rst  $38
SRA0:B318 FF               rst  $38
SRA0:B319 FF               rst  $38
SRA0:B31A FF               rst  $38
SRA0:B31B FF               rst  $38
SRA0:B31C FF               rst  $38
SRA0:B31D FF               rst  $38
SRA0:B31E FF               rst  $38
SRA0:B31F FF               rst  $38
SRA0:B320 FF               rst  $38
SRA0:B321 FF               rst  $38
SRA0:B322 FF               rst  $38
SRA0:B323 FF               rst  $38
SRA0:B324 FF               rst  $38
SRA0:B325 FF               rst  $38
SRA0:B326 FF               rst  $38
SRA0:B327 FF               rst  $38
SRA0:B328 FF               rst  $38
SRA0:B329 FF               rst  $38
SRA0:B32A FF               rst  $38
SRA0:B32B FF               rst  $38
SRA0:B32C FF               rst  $38
SRA0:B32D FF               rst  $38
SRA0:B32E FF               rst  $38
SRA0:B32F FF               rst  $38
SRA0:B330 FF               rst  $38
SRA0:B331 FF               rst  $38
SRA0:B332 FF               rst  $38
SRA0:B333 FF               rst  $38
SRA0:B334 FF               rst  $38
SRA0:B335 FF               rst  $38
SRA0:B336 FF               rst  $38
SRA0:B337 FF               rst  $38
SRA0:B338 FF               rst  $38
SRA0:B339 FF               rst  $38
SRA0:B33A FF               rst  $38
SRA0:B33B FF               rst  $38
SRA0:B33C FF               rst  $38
SRA0:B33D FF               rst  $38
SRA0:B33E FF               rst  $38
SRA0:B33F FF               rst  $38
SRA0:B340 FF               rst  $38
SRA0:B341 FF               rst  $38
SRA0:B342 FF               rst  $38
SRA0:B343 FF               rst  $38
SRA0:B344 FF               rst  $38
SRA0:B345 FF               rst  $38
SRA0:B346 FF               rst  $38
SRA0:B347 FF               rst  $38
SRA0:B348 FF               rst  $38
SRA0:B349 FF               rst  $38
SRA0:B34A FF               rst  $38
SRA0:B34B FF               rst  $38
SRA0:B34C FF               rst  $38
SRA0:B34D FF               rst  $38
SRA0:B34E FF               rst  $38
SRA0:B34F FF               rst  $38
SRA0:B350 FF               rst  $38
SRA0:B351 FF               rst  $38
SRA0:B352 FF               rst  $38
SRA0:B353 FF               rst  $38
SRA0:B354 FF               rst  $38
SRA0:B355 FF               rst  $38
SRA0:B356 FF               rst  $38
SRA0:B357 FF               rst  $38
SRA0:B358 FF               rst  $38
SRA0:B359 FF               rst  $38
SRA0:B35A FF               rst  $38
SRA0:B35B FF               rst  $38
SRA0:B35C FF               rst  $38
SRA0:B35D FF               rst  $38
SRA0:B35E FF               rst  $38
SRA0:B35F FF               rst  $38
SRA0:B360 FF               rst  $38
SRA0:B361 FF               rst  $38
SRA0:B362 FF               rst  $38
SRA0:B363 FF               rst  $38
SRA0:B364 FF               rst  $38
SRA0:B365 FF               rst  $38
SRA0:B366 FF               rst  $38
SRA0:B367 FF               rst  $38
SRA0:B368 FF               rst  $38
SRA0:B369 FF               rst  $38
SRA0:B36A FF               rst  $38
SRA0:B36B FF               rst  $38
SRA0:B36C FF               rst  $38
SRA0:B36D FF               rst  $38
SRA0:B36E FF               rst  $38
SRA0:B36F FF               rst  $38
SRA0:B370 FF               rst  $38
SRA0:B371 FF               rst  $38
SRA0:B372 FF               rst  $38
SRA0:B373 FF               rst  $38
SRA0:B374 FF               rst  $38
SRA0:B375 FF               rst  $38
SRA0:B376 FF               rst  $38
SRA0:B377 FF               rst  $38
SRA0:B378 FF               rst  $38
SRA0:B379 FF               rst  $38
SRA0:B37A FF               rst  $38
SRA0:B37B FF               rst  $38
SRA0:B37C FF               rst  $38
SRA0:B37D FF               rst  $38
SRA0:B37E FF               rst  $38
SRA0:B37F FF               rst  $38
SRA0:B380 FF               rst  $38
SRA0:B381 FF               rst  $38
SRA0:B382 FF               rst  $38
SRA0:B383 FF               rst  $38
SRA0:B384 FF               rst  $38
SRA0:B385 FF               rst  $38
SRA0:B386 FF               rst  $38
SRA0:B387 FF               rst  $38
SRA0:B388 FF               rst  $38
SRA0:B389 FF               rst  $38
SRA0:B38A FF               rst  $38
SRA0:B38B FF               rst  $38
SRA0:B38C FF               rst  $38
SRA0:B38D FF               rst  $38
SRA0:B38E FF               rst  $38
SRA0:B38F FF               rst  $38
SRA0:B390 FF               rst  $38
SRA0:B391 FF               rst  $38
SRA0:B392 FF               rst  $38
SRA0:B393 FF               rst  $38
SRA0:B394 FF               rst  $38
SRA0:B395 FF               rst  $38
SRA0:B396 FF               rst  $38
SRA0:B397 FF               rst  $38
SRA0:B398 FF               rst  $38
SRA0:B399 FF               rst  $38
SRA0:B39A FF               rst  $38
SRA0:B39B FF               rst  $38
SRA0:B39C FF               rst  $38
SRA0:B39D FF               rst  $38
SRA0:B39E FF               rst  $38
SRA0:B39F FF               rst  $38
SRA0:B3A0 FF               rst  $38
SRA0:B3A1 FF               rst  $38
SRA0:B3A2 FF               rst  $38
SRA0:B3A3 FF               rst  $38
SRA0:B3A4 FF               rst  $38
SRA0:B3A5 FF               rst  $38
SRA0:B3A6 FF               rst  $38
SRA0:B3A7 FF               rst  $38
SRA0:B3A8 FF               rst  $38
SRA0:B3A9 FF               rst  $38
SRA0:B3AA FF               rst  $38
SRA0:B3AB FF               rst  $38
SRA0:B3AC FF               rst  $38
SRA0:B3AD FF               rst  $38
SRA0:B3AE FF               rst  $38
SRA0:B3AF FF               rst  $38
SRA0:B3B0 FF               rst  $38
SRA0:B3B1 FF               rst  $38
SRA0:B3B2 FF               rst  $38
SRA0:B3B3 FF               rst  $38
SRA0:B3B4 FF               rst  $38
SRA0:B3B5 FF               rst  $38
SRA0:B3B6 FF               rst  $38
SRA0:B3B7 FF               rst  $38
SRA0:B3B8 FF               rst  $38
SRA0:B3B9 FF               rst  $38
SRA0:B3BA FF               rst  $38
SRA0:B3BB FF               rst  $38
SRA0:B3BC FF               rst  $38
SRA0:B3BD FF               rst  $38
SRA0:B3BE FF               rst  $38
SRA0:B3BF FF               rst  $38
SRA0:B3C0 FF               rst  $38
SRA0:B3C1 FF               rst  $38
SRA0:B3C2 FF               rst  $38
SRA0:B3C3 FF               rst  $38
SRA0:B3C4 FF               rst  $38
SRA0:B3C5 FF               rst  $38
SRA0:B3C6 FF               rst  $38
SRA0:B3C7 FF               rst  $38
SRA0:B3C8 FF               rst  $38
SRA0:B3C9 FF               rst  $38
SRA0:B3CA FF               rst  $38
SRA0:B3CB FF               rst  $38
SRA0:B3CC FF               rst  $38
SRA0:B3CD FF               rst  $38
SRA0:B3CE FF               rst  $38
SRA0:B3CF FF               rst  $38
SRA0:B3D0 FF               rst  $38
SRA0:B3D1 FF               rst  $38
SRA0:B3D2 FF               rst  $38
SRA0:B3D3 FF               rst  $38
SRA0:B3D4 FF               rst  $38
SRA0:B3D5 FF               rst  $38
SRA0:B3D6 FF               rst  $38
SRA0:B3D7 FF               rst  $38
SRA0:B3D8 FF               rst  $38
SRA0:B3D9 FF               rst  $38
SRA0:B3DA FF               rst  $38
SRA0:B3DB FF               rst  $38
SRA0:B3DC FF               rst  $38
SRA0:B3DD FF               rst  $38
SRA0:B3DE FF               rst  $38
SRA0:B3DF FF               rst  $38
SRA0:B3E0 FF               rst  $38
SRA0:B3E1 FF               rst  $38
SRA0:B3E2 FF               rst  $38
SRA0:B3E3 FF               rst  $38
SRA0:B3E4 FF               rst  $38
SRA0:B3E5 FF               rst  $38
SRA0:B3E6 FF               rst  $38
SRA0:B3E7 FF               rst  $38
SRA0:B3E8 FF               rst  $38
SRA0:B3E9 FF               rst  $38
SRA0:B3EA FF               rst  $38
SRA0:B3EB FF               rst  $38
SRA0:B3EC FF               rst  $38
SRA0:B3ED FF               rst  $38
SRA0:B3EE FF               rst  $38
SRA0:B3EF FF               rst  $38
SRA0:B3F0 FF               rst  $38
SRA0:B3F1 FF               rst  $38
SRA0:B3F2 FF               rst  $38
SRA0:B3F3 FF               rst  $38
SRA0:B3F4 FF               rst  $38
SRA0:B3F5 FF               rst  $38
SRA0:B3F6 FF               rst  $38
SRA0:B3F7 FF               rst  $38
SRA0:B3F8 FF               rst  $38
SRA0:B3F9 FF               rst  $38
SRA0:B3FA FF               rst  $38
SRA0:B3FB FF               rst  $38
SRA0:B3FC FF               rst  $38
SRA0:B3FD FF               rst  $38
SRA0:B3FE FF               rst  $38
SRA0:B3FF FF               rst  $38
SRA0:B400 FF               rst  $38
SRA0:B401 FF               rst  $38
SRA0:B402 FF               rst  $38
SRA0:B403 FF               rst  $38
SRA0:B404 FF               rst  $38
SRA0:B405 FF               rst  $38
SRA0:B406 FF               rst  $38
SRA0:B407 FF               rst  $38
SRA0:B408 FF               rst  $38
SRA0:B409 FF               rst  $38
SRA0:B40A FF               rst  $38
SRA0:B40B FF               rst  $38
SRA0:B40C FF               rst  $38
SRA0:B40D FF               rst  $38
SRA0:B40E FF               rst  $38
SRA0:B40F FF               rst  $38
SRA0:B410 FF               rst  $38
SRA0:B411 FF               rst  $38
SRA0:B412 FF               rst  $38
SRA0:B413 FF               rst  $38
SRA0:B414 FF               rst  $38
SRA0:B415 FF               rst  $38
SRA0:B416 FF               rst  $38
SRA0:B417 FF               rst  $38
SRA0:B418 FF               rst  $38
SRA0:B419 FF               rst  $38
SRA0:B41A FF               rst  $38
SRA0:B41B FF               rst  $38
SRA0:B41C FF               rst  $38
SRA0:B41D FF               rst  $38
SRA0:B41E FF               rst  $38
SRA0:B41F FF               rst  $38
SRA0:B420 FF               rst  $38
SRA0:B421 FF               rst  $38
SRA0:B422 FF               rst  $38
SRA0:B423 FF               rst  $38
SRA0:B424 FF               rst  $38
SRA0:B425 FF               rst  $38
SRA0:B426 FF               rst  $38
SRA0:B427 FF               rst  $38
SRA0:B428 FF               rst  $38
SRA0:B429 FF               rst  $38
SRA0:B42A FF               rst  $38
SRA0:B42B FF               rst  $38
SRA0:B42C FF               rst  $38
SRA0:B42D FF               rst  $38
SRA0:B42E FF               rst  $38
SRA0:B42F FF               rst  $38
SRA0:B430 FF               rst  $38
SRA0:B431 FF               rst  $38
SRA0:B432 FF               rst  $38
SRA0:B433 FF               rst  $38
SRA0:B434 FF               rst  $38
SRA0:B435 FF               rst  $38
SRA0:B436 FF               rst  $38
SRA0:B437 FF               rst  $38
SRA0:B438 FF               rst  $38
SRA0:B439 FF               rst  $38
SRA0:B43A FF               rst  $38
SRA0:B43B FF               rst  $38
SRA0:B43C FF               rst  $38
SRA0:B43D FF               rst  $38
SRA0:B43E FF               rst  $38
SRA0:B43F FF               rst  $38
SRA0:B440 FF               rst  $38
SRA0:B441 FF               rst  $38
SRA0:B442 FF               rst  $38
SRA0:B443 FF               rst  $38
SRA0:B444 FF               rst  $38
SRA0:B445 FF               rst  $38
SRA0:B446 FF               rst  $38
SRA0:B447 FF               rst  $38
SRA0:B448 FF               rst  $38
SRA0:B449 FF               rst  $38
SRA0:B44A FF               rst  $38
SRA0:B44B FF               rst  $38
SRA0:B44C FF               rst  $38
SRA0:B44D FF               rst  $38
SRA0:B44E FF               rst  $38
SRA0:B44F FF               rst  $38
SRA0:B450 FF               rst  $38
SRA0:B451 FF               rst  $38
SRA0:B452 FF               rst  $38
SRA0:B453 FF               rst  $38
SRA0:B454 FF               rst  $38
SRA0:B455 FF               rst  $38
SRA0:B456 FF               rst  $38
SRA0:B457 FF               rst  $38
SRA0:B458 FF               rst  $38
SRA0:B459 FF               rst  $38
SRA0:B45A FF               rst  $38
SRA0:B45B FF               rst  $38
SRA0:B45C FF               rst  $38
SRA0:B45D FF               rst  $38
SRA0:B45E FF               rst  $38
SRA0:B45F FF               rst  $38
SRA0:B460 FF               rst  $38
SRA0:B461 FF               rst  $38
SRA0:B462 FF               rst  $38
SRA0:B463 FF               rst  $38
SRA0:B464 FF               rst  $38
SRA0:B465 FF               rst  $38
SRA0:B466 FF               rst  $38
SRA0:B467 FF               rst  $38
SRA0:B468 FF               rst  $38
SRA0:B469 FF               rst  $38
SRA0:B46A FF               rst  $38
SRA0:B46B FF               rst  $38
SRA0:B46C FF               rst  $38
SRA0:B46D FF               rst  $38
SRA0:B46E FF               rst  $38
SRA0:B46F FF               rst  $38
SRA0:B470 FF               rst  $38
SRA0:B471 FF               rst  $38
SRA0:B472 FF               rst  $38
SRA0:B473 FF               rst  $38
SRA0:B474 FF               rst  $38
SRA0:B475 FF               rst  $38
SRA0:B476 FF               rst  $38
SRA0:B477 FF               rst  $38
SRA0:B478 FF               rst  $38
SRA0:B479 FF               rst  $38
SRA0:B47A FF               rst  $38
SRA0:B47B FF               rst  $38
SRA0:B47C FF               rst  $38
SRA0:B47D FF               rst  $38
SRA0:B47E FF               rst  $38
SRA0:B47F FF               rst  $38
SRA0:B480 FF               rst  $38
SRA0:B481 FF               rst  $38
SRA0:B482 FF               rst  $38
SRA0:B483 FF               rst  $38
SRA0:B484 FF               rst  $38
SRA0:B485 FF               rst  $38
SRA0:B486 FF               rst  $38
SRA0:B487 FF               rst  $38
SRA0:B488 FF               rst  $38
SRA0:B489 FF               rst  $38
SRA0:B48A FF               rst  $38
SRA0:B48B FF               rst  $38
SRA0:B48C FF               rst  $38
SRA0:B48D FF               rst  $38
SRA0:B48E FF               rst  $38
SRA0:B48F FF               rst  $38
SRA0:B490 FF               rst  $38
SRA0:B491 FF               rst  $38
SRA0:B492 FF               rst  $38
SRA0:B493 FF               rst  $38
SRA0:B494 FF               rst  $38
SRA0:B495 FF               rst  $38
SRA0:B496 FF               rst  $38
SRA0:B497 FF               rst  $38
SRA0:B498 FF               rst  $38
SRA0:B499 FF               rst  $38
SRA0:B49A FF               rst  $38
SRA0:B49B FF               rst  $38
SRA0:B49C FF               rst  $38
SRA0:B49D FF               rst  $38
SRA0:B49E FF               rst  $38
SRA0:B49F FF               rst  $38
SRA0:B4A0 FF               rst  $38
SRA0:B4A1 FF               rst  $38
SRA0:B4A2 FF               rst  $38
SRA0:B4A3 FF               rst  $38
SRA0:B4A4 FF               rst  $38
SRA0:B4A5 FF               rst  $38
SRA0:B4A6 FF               rst  $38
SRA0:B4A7 FF               rst  $38
SRA0:B4A8 FF               rst  $38
SRA0:B4A9 FF               rst  $38
SRA0:B4AA FF               rst  $38
SRA0:B4AB FF               rst  $38
SRA0:B4AC FF               rst  $38
SRA0:B4AD FF               rst  $38
SRA0:B4AE FF               rst  $38
SRA0:B4AF FF               rst  $38
SRA0:B4B0 FF               rst  $38
SRA0:B4B1 FF               rst  $38
SRA0:B4B2 FF               rst  $38
SRA0:B4B3 FF               rst  $38
SRA0:B4B4 FF               rst  $38
SRA0:B4B5 FF               rst  $38
SRA0:B4B6 FF               rst  $38
SRA0:B4B7 FF               rst  $38
SRA0:B4B8 FF               rst  $38
SRA0:B4B9 FF               rst  $38
SRA0:B4BA FF               rst  $38
SRA0:B4BB FF               rst  $38
SRA0:B4BC FF               rst  $38
SRA0:B4BD FF               rst  $38
SRA0:B4BE FF               rst  $38
SRA0:B4BF FF               rst  $38
SRA0:B4C0 FF               rst  $38
SRA0:B4C1 FF               rst  $38
SRA0:B4C2 FF               rst  $38
SRA0:B4C3 FF               rst  $38
SRA0:B4C4 FF               rst  $38
SRA0:B4C5 FF               rst  $38
SRA0:B4C6 FF               rst  $38
SRA0:B4C7 FF               rst  $38
SRA0:B4C8 FF               rst  $38
SRA0:B4C9 FF               rst  $38
SRA0:B4CA FF               rst  $38
SRA0:B4CB FF               rst  $38
SRA0:B4CC FF               rst  $38
SRA0:B4CD FF               rst  $38
SRA0:B4CE FF               rst  $38
SRA0:B4CF FF               rst  $38
SRA0:B4D0 FF               rst  $38
SRA0:B4D1 FF               rst  $38
SRA0:B4D2 FF               rst  $38
SRA0:B4D3 FF               rst  $38
SRA0:B4D4 FF               rst  $38
SRA0:B4D5 FF               rst  $38
SRA0:B4D6 FF               rst  $38
SRA0:B4D7 FF               rst  $38
SRA0:B4D8 FF               rst  $38
SRA0:B4D9 FF               rst  $38
SRA0:B4DA FF               rst  $38
SRA0:B4DB FF               rst  $38
SRA0:B4DC FF               rst  $38
SRA0:B4DD FF               rst  $38
SRA0:B4DE FF               rst  $38
SRA0:B4DF FF               rst  $38
SRA0:B4E0 FF               rst  $38
SRA0:B4E1 FF               rst  $38
SRA0:B4E2 FF               rst  $38
SRA0:B4E3 FF               rst  $38
SRA0:B4E4 FF               rst  $38
SRA0:B4E5 FF               rst  $38
SRA0:B4E6 FF               rst  $38
SRA0:B4E7 FF               rst  $38
SRA0:B4E8 FF               rst  $38
SRA0:B4E9 FF               rst  $38
SRA0:B4EA FF               rst  $38
SRA0:B4EB FF               rst  $38
SRA0:B4EC FF               rst  $38
SRA0:B4ED FF               rst  $38
SRA0:B4EE FF               rst  $38
SRA0:B4EF FF               rst  $38
SRA0:B4F0 FF               rst  $38
SRA0:B4F1 FF               rst  $38
SRA0:B4F2 FF               rst  $38
SRA0:B4F3 FF               rst  $38
SRA0:B4F4 FF               rst  $38
SRA0:B4F5 FF               rst  $38
SRA0:B4F6 FF               rst  $38
SRA0:B4F7 FF               rst  $38
SRA0:B4F8 FF               rst  $38
SRA0:B4F9 FF               rst  $38
SRA0:B4FA FF               rst  $38
SRA0:B4FB FF               rst  $38
SRA0:B4FC FF               rst  $38
SRA0:B4FD FF               rst  $38
SRA0:B4FE FF               rst  $38
SRA0:B4FF FF               rst  $38
SRA0:B500 FF               rst  $38
SRA0:B501 FF               rst  $38
SRA0:B502 FF               rst  $38
SRA0:B503 FF               rst  $38
SRA0:B504 FF               rst  $38
SRA0:B505 FF               rst  $38
SRA0:B506 FF               rst  $38
SRA0:B507 FF               rst  $38
SRA0:B508 FF               rst  $38
SRA0:B509 FF               rst  $38
SRA0:B50A FF               rst  $38
SRA0:B50B FF               rst  $38
SRA0:B50C FF               rst  $38
SRA0:B50D FF               rst  $38
SRA0:B50E FF               rst  $38
SRA0:B50F FF               rst  $38
SRA0:B510 FF               rst  $38
SRA0:B511 FF               rst  $38
SRA0:B512 FF               rst  $38
SRA0:B513 FF               rst  $38
SRA0:B514 FF               rst  $38
SRA0:B515 FF               rst  $38
SRA0:B516 FF               rst  $38
SRA0:B517 FF               rst  $38
SRA0:B518 FF               rst  $38
SRA0:B519 FF               rst  $38
SRA0:B51A FF               rst  $38
SRA0:B51B FF               rst  $38
SRA0:B51C FF               rst  $38
SRA0:B51D FF               rst  $38
SRA0:B51E FF               rst  $38
SRA0:B51F FF               rst  $38
SRA0:B520 FF               rst  $38
SRA0:B521 FF               rst  $38
SRA0:B522 FF               rst  $38
SRA0:B523 FF               rst  $38
SRA0:B524 FF               rst  $38
SRA0:B525 FF               rst  $38
SRA0:B526 FF               rst  $38
SRA0:B527 FF               rst  $38
SRA0:B528 FF               rst  $38
SRA0:B529 FF               rst  $38
SRA0:B52A FF               rst  $38
SRA0:B52B FF               rst  $38
SRA0:B52C FF               rst  $38
SRA0:B52D FF               rst  $38
SRA0:B52E FF               rst  $38
SRA0:B52F FF               rst  $38
SRA0:B530 FF               rst  $38
SRA0:B531 FF               rst  $38
SRA0:B532 FF               rst  $38
SRA0:B533 FF               rst  $38
SRA0:B534 FF               rst  $38
SRA0:B535 FF               rst  $38
SRA0:B536 FF               rst  $38
SRA0:B537 FF               rst  $38
SRA0:B538 FF               rst  $38
SRA0:B539 FF               rst  $38
SRA0:B53A FF               rst  $38
SRA0:B53B FF               rst  $38
SRA0:B53C FF               rst  $38
SRA0:B53D FF               rst  $38
SRA0:B53E FF               rst  $38
SRA0:B53F FF               rst  $38
SRA0:B540 FF               rst  $38
SRA0:B541 FF               rst  $38
SRA0:B542 FF               rst  $38
SRA0:B543 FF               rst  $38
SRA0:B544 FF               rst  $38
SRA0:B545 FF               rst  $38
SRA0:B546 FF               rst  $38
SRA0:B547 FF               rst  $38
SRA0:B548 FF               rst  $38
SRA0:B549 FF               rst  $38
SRA0:B54A FF               rst  $38
SRA0:B54B FF               rst  $38
SRA0:B54C FF               rst  $38
SRA0:B54D FF               rst  $38
SRA0:B54E FF               rst  $38
SRA0:B54F FF               rst  $38
SRA0:B550 FF               rst  $38
SRA0:B551 FF               rst  $38
SRA0:B552 FF               rst  $38
SRA0:B553 FF               rst  $38
SRA0:B554 FF               rst  $38
SRA0:B555 FF               rst  $38
SRA0:B556 FF               rst  $38
SRA0:B557 FF               rst  $38
SRA0:B558 FF               rst  $38
SRA0:B559 FF               rst  $38
SRA0:B55A FF               rst  $38
SRA0:B55B FF               rst  $38
SRA0:B55C FF               rst  $38
SRA0:B55D FF               rst  $38
SRA0:B55E FF               rst  $38
SRA0:B55F FF               rst  $38
SRA0:B560 FF               rst  $38
SRA0:B561 FF               rst  $38
SRA0:B562 FF               rst  $38
SRA0:B563 FF               rst  $38
SRA0:B564 FF               rst  $38
SRA0:B565 FF               rst  $38
SRA0:B566 FF               rst  $38
SRA0:B567 FF               rst  $38
SRA0:B568 FF               rst  $38
SRA0:B569 FF               rst  $38
SRA0:B56A FF               rst  $38
SRA0:B56B FF               rst  $38
SRA0:B56C FF               rst  $38
SRA0:B56D FF               rst  $38
SRA0:B56E FF               rst  $38
SRA0:B56F FF               rst  $38
SRA0:B570 FF               rst  $38
SRA0:B571 FF               rst  $38
SRA0:B572 FF               rst  $38
SRA0:B573 FF               rst  $38
SRA0:B574 FF               rst  $38
SRA0:B575 FF               rst  $38
SRA0:B576 FF               rst  $38
SRA0:B577 FF               rst  $38
SRA0:B578 FF               rst  $38
SRA0:B579 FF               rst  $38
SRA0:B57A FF               rst  $38
SRA0:B57B FF               rst  $38
SRA0:B57C FF               rst  $38
SRA0:B57D FF               rst  $38
SRA0:B57E FF               rst  $38
SRA0:B57F FF               rst  $38
SRA0:B580 FF               rst  $38
SRA0:B581 FF               rst  $38
SRA0:B582 FF               rst  $38
SRA0:B583 FF               rst  $38
SRA0:B584 FF               rst  $38
SRA0:B585 FF               rst  $38
SRA0:B586 FF               rst  $38
SRA0:B587 FF               rst  $38
SRA0:B588 FF               rst  $38
SRA0:B589 FF               rst  $38
SRA0:B58A FF               rst  $38
SRA0:B58B FF               rst  $38
SRA0:B58C FF               rst  $38
SRA0:B58D FF               rst  $38
SRA0:B58E FF               rst  $38
SRA0:B58F FF               rst  $38
SRA0:B590 FF               rst  $38
SRA0:B591 FF               rst  $38
SRA0:B592 FF               rst  $38
SRA0:B593 FF               rst  $38
SRA0:B594 FF               rst  $38
SRA0:B595 FF               rst  $38
SRA0:B596 FF               rst  $38
SRA0:B597 FF               rst  $38
SRA0:B598 FF               rst  $38
SRA0:B599 FF               rst  $38
SRA0:B59A FF               rst  $38
SRA0:B59B FF               rst  $38
SRA0:B59C FF               rst  $38
SRA0:B59D FF               rst  $38
SRA0:B59E FF               rst  $38
SRA0:B59F FF               rst  $38
SRA0:B5A0 FF               rst  $38
SRA0:B5A1 FF               rst  $38
SRA0:B5A2 FF               rst  $38
SRA0:B5A3 FF               rst  $38
SRA0:B5A4 FF               rst  $38
SRA0:B5A5 FF               rst  $38
SRA0:B5A6 FF               rst  $38
SRA0:B5A7 FF               rst  $38
SRA0:B5A8 FF               rst  $38
SRA0:B5A9 FF               rst  $38
SRA0:B5AA FF               rst  $38
SRA0:B5AB FF               rst  $38
SRA0:B5AC FF               rst  $38
SRA0:B5AD FF               rst  $38
SRA0:B5AE FF               rst  $38
SRA0:B5AF FF               rst  $38
SRA0:B5B0 FF               rst  $38
SRA0:B5B1 FF               rst  $38
SRA0:B5B2 FF               rst  $38
SRA0:B5B3 FF               rst  $38
SRA0:B5B4 FF               rst  $38
SRA0:B5B5 FF               rst  $38
SRA0:B5B6 FF               rst  $38
SRA0:B5B7 FF               rst  $38
SRA0:B5B8 FF               rst  $38
SRA0:B5B9 FF               rst  $38
SRA0:B5BA FF               rst  $38
SRA0:B5BB FF               rst  $38
SRA0:B5BC FF               rst  $38
SRA0:B5BD FF               rst  $38
SRA0:B5BE FF               rst  $38
SRA0:B5BF FF               rst  $38
SRA0:B5C0 FF               rst  $38
SRA0:B5C1 FF               rst  $38
SRA0:B5C2 FF               rst  $38
SRA0:B5C3 FF               rst  $38
SRA0:B5C4 FF               rst  $38
SRA0:B5C5 FF               rst  $38
SRA0:B5C6 FF               rst  $38
SRA0:B5C7 FF               rst  $38
SRA0:B5C8 FF               rst  $38
SRA0:B5C9 FF               rst  $38
SRA0:B5CA FF               rst  $38
SRA0:B5CB FF               rst  $38
SRA0:B5CC FF               rst  $38
SRA0:B5CD FF               rst  $38
SRA0:B5CE FF               rst  $38
SRA0:B5CF FF               rst  $38
SRA0:B5D0 FF               rst  $38
SRA0:B5D1 FF               rst  $38
SRA0:B5D2 FF               rst  $38
SRA0:B5D3 FF               rst  $38
SRA0:B5D4 FF               rst  $38
SRA0:B5D5 FF               rst  $38
SRA0:B5D6 FF               rst  $38
SRA0:B5D7 FF               rst  $38
SRA0:B5D8 FF               rst  $38
SRA0:B5D9 FF               rst  $38
SRA0:B5DA FF               rst  $38
SRA0:B5DB FF               rst  $38
SRA0:B5DC FF               rst  $38
SRA0:B5DD FF               rst  $38
SRA0:B5DE FF               rst  $38
SRA0:B5DF FF               rst  $38
SRA0:B5E0 FF               rst  $38
SRA0:B5E1 FF               rst  $38
SRA0:B5E2 FF               rst  $38
SRA0:B5E3 FF               rst  $38
SRA0:B5E4 FF               rst  $38
SRA0:B5E5 FF               rst  $38
SRA0:B5E6 FF               rst  $38
SRA0:B5E7 FF               rst  $38
SRA0:B5E8 FF               rst  $38
SRA0:B5E9 FF               rst  $38
SRA0:B5EA FF               rst  $38
SRA0:B5EB FF               rst  $38
SRA0:B5EC FF               rst  $38
SRA0:B5ED FF               rst  $38
SRA0:B5EE FF               rst  $38
SRA0:B5EF FF               rst  $38
SRA0:B5F0 FF               rst  $38
SRA0:B5F1 FF               rst  $38
SRA0:B5F2 FF               rst  $38
SRA0:B5F3 FF               rst  $38
SRA0:B5F4 FF               rst  $38
SRA0:B5F5 FF               rst  $38
SRA0:B5F6 FF               rst  $38
SRA0:B5F7 FF               rst  $38
SRA0:B5F8 FF               rst  $38
SRA0:B5F9 FF               rst  $38
SRA0:B5FA FF               rst  $38
SRA0:B5FB FF               rst  $38
SRA0:B5FC FF               rst  $38
SRA0:B5FD FF               rst  $38
SRA0:B5FE FF               rst  $38
SRA0:B5FF FF               rst  $38
SRA0:B600 FF               rst  $38
SRA0:B601 FF               rst  $38
SRA0:B602 FF               rst  $38
SRA0:B603 FF               rst  $38
SRA0:B604 FF               rst  $38
SRA0:B605 FF               rst  $38
SRA0:B606 FF               rst  $38
SRA0:B607 FF               rst  $38
SRA0:B608 FF               rst  $38
SRA0:B609 FF               rst  $38
SRA0:B60A FF               rst  $38
SRA0:B60B FF               rst  $38
SRA0:B60C FF               rst  $38
SRA0:B60D FF               rst  $38
SRA0:B60E FF               rst  $38
SRA0:B60F FF               rst  $38
SRA0:B610 FF               rst  $38
SRA0:B611 FF               rst  $38
SRA0:B612 FF               rst  $38
SRA0:B613 FF               rst  $38
SRA0:B614 FF               rst  $38
SRA0:B615 FF               rst  $38
SRA0:B616 FF               rst  $38
SRA0:B617 FF               rst  $38
SRA0:B618 FF               rst  $38
SRA0:B619 FF               rst  $38
SRA0:B61A FF               rst  $38
SRA0:B61B FF               rst  $38
SRA0:B61C FF               rst  $38
SRA0:B61D FF               rst  $38
SRA0:B61E FF               rst  $38
SRA0:B61F FF               rst  $38
SRA0:B620 FF               rst  $38
SRA0:B621 FF               rst  $38
SRA0:B622 FF               rst  $38
SRA0:B623 FF               rst  $38
SRA0:B624 FF               rst  $38
SRA0:B625 FF               rst  $38
SRA0:B626 FF               rst  $38
SRA0:B627 FF               rst  $38
SRA0:B628 FF               rst  $38
SRA0:B629 FF               rst  $38
SRA0:B62A FF               rst  $38
SRA0:B62B FF               rst  $38
SRA0:B62C FF               rst  $38
SRA0:B62D FF               rst  $38
SRA0:B62E FF               rst  $38
SRA0:B62F FF               rst  $38
SRA0:B630 FF               rst  $38
SRA0:B631 FF               rst  $38
SRA0:B632 FF               rst  $38
SRA0:B633 FF               rst  $38
SRA0:B634 FF               rst  $38
SRA0:B635 FF               rst  $38
SRA0:B636 FF               rst  $38
SRA0:B637 FF               rst  $38
SRA0:B638 FF               rst  $38
SRA0:B639 FF               rst  $38
SRA0:B63A FF               rst  $38
SRA0:B63B FF               rst  $38
SRA0:B63C FF               rst  $38
SRA0:B63D FF               rst  $38
SRA0:B63E FF               rst  $38
SRA0:B63F FF               rst  $38
SRA0:B640 FF               rst  $38
SRA0:B641 FF               rst  $38
SRA0:B642 FF               rst  $38
SRA0:B643 FF               rst  $38
SRA0:B644 FF               rst  $38
SRA0:B645 FF               rst  $38
SRA0:B646 FF               rst  $38
SRA0:B647 FF               rst  $38
SRA0:B648 FF               rst  $38
SRA0:B649 FF               rst  $38
SRA0:B64A FF               rst  $38
SRA0:B64B FF               rst  $38
SRA0:B64C FF               rst  $38
SRA0:B64D FF               rst  $38
SRA0:B64E FF               rst  $38
SRA0:B64F FF               rst  $38
SRA0:B650 FF               rst  $38
SRA0:B651 FF               rst  $38
SRA0:B652 FF               rst  $38
SRA0:B653 FF               rst  $38
SRA0:B654 FF               rst  $38
SRA0:B655 FF               rst  $38
SRA0:B656 FF               rst  $38
SRA0:B657 FF               rst  $38
SRA0:B658 FF               rst  $38
SRA0:B659 FF               rst  $38
SRA0:B65A FF               rst  $38
SRA0:B65B FF               rst  $38
SRA0:B65C FF               rst  $38
SRA0:B65D FF               rst  $38
SRA0:B65E FF               rst  $38
SRA0:B65F FF               rst  $38
SRA0:B660 FF               rst  $38
SRA0:B661 FF               rst  $38
SRA0:B662 FF               rst  $38
SRA0:B663 FF               rst  $38
SRA0:B664 FF               rst  $38
SRA0:B665 FF               rst  $38
SRA0:B666 FF               rst  $38
SRA0:B667 FF               rst  $38
SRA0:B668 FF               rst  $38
SRA0:B669 FF               rst  $38
SRA0:B66A FF               rst  $38
SRA0:B66B FF               rst  $38
SRA0:B66C FF               rst  $38
SRA0:B66D FF               rst  $38
SRA0:B66E FF               rst  $38
SRA0:B66F FF               rst  $38
SRA0:B670 FF               rst  $38
SRA0:B671 FF               rst  $38
SRA0:B672 FF               rst  $38
SRA0:B673 FF               rst  $38
SRA0:B674 FF               rst  $38
SRA0:B675 FF               rst  $38
SRA0:B676 FF               rst  $38
SRA0:B677 FF               rst  $38
SRA0:B678 FF               rst  $38
SRA0:B679 FF               rst  $38
SRA0:B67A FF               rst  $38
SRA0:B67B FF               rst  $38
SRA0:B67C FF               rst  $38
SRA0:B67D FF               rst  $38
SRA0:B67E FF               rst  $38
SRA0:B67F FF               rst  $38
SRA0:B680 FF               rst  $38
SRA0:B681 FF               rst  $38
SRA0:B682 FF               rst  $38
SRA0:B683 FF               rst  $38
SRA0:B684 FF               rst  $38
SRA0:B685 FF               rst  $38
SRA0:B686 FF               rst  $38
SRA0:B687 FF               rst  $38
SRA0:B688 FF               rst  $38
SRA0:B689 FF               rst  $38
SRA0:B68A FF               rst  $38
SRA0:B68B FF               rst  $38
SRA0:B68C FF               rst  $38
SRA0:B68D FF               rst  $38
SRA0:B68E FF               rst  $38
SRA0:B68F FF               rst  $38
SRA0:B690 FF               rst  $38
SRA0:B691 FF               rst  $38
SRA0:B692 FF               rst  $38
SRA0:B693 FF               rst  $38
SRA0:B694 FF               rst  $38
SRA0:B695 FF               rst  $38
SRA0:B696 FF               rst  $38
SRA0:B697 FF               rst  $38
SRA0:B698 FF               rst  $38
SRA0:B699 FF               rst  $38
SRA0:B69A FF               rst  $38
SRA0:B69B FF               rst  $38
SRA0:B69C FF               rst  $38
SRA0:B69D FF               rst  $38
SRA0:B69E FF               rst  $38
SRA0:B69F FF               rst  $38
SRA0:B6A0 FF               rst  $38
SRA0:B6A1 FF               rst  $38
SRA0:B6A2 FF               rst  $38
SRA0:B6A3 FF               rst  $38
SRA0:B6A4 FF               rst  $38
SRA0:B6A5 FF               rst  $38
SRA0:B6A6 FF               rst  $38
SRA0:B6A7 FF               rst  $38
SRA0:B6A8 FF               rst  $38
SRA0:B6A9 FF               rst  $38
SRA0:B6AA FF               rst  $38
SRA0:B6AB FF               rst  $38
SRA0:B6AC FF               rst  $38
SRA0:B6AD FF               rst  $38
SRA0:B6AE FF               rst  $38
SRA0:B6AF FF               rst  $38
SRA0:B6B0 FF               rst  $38
SRA0:B6B1 FF               rst  $38
SRA0:B6B2 FF               rst  $38
SRA0:B6B3 FF               rst  $38
SRA0:B6B4 FF               rst  $38
SRA0:B6B5 FF               rst  $38
SRA0:B6B6 FF               rst  $38
SRA0:B6B7 FF               rst  $38
SRA0:B6B8 FF               rst  $38
SRA0:B6B9 FF               rst  $38
SRA0:B6BA FF               rst  $38
SRA0:B6BB FF               rst  $38
SRA0:B6BC FF               rst  $38
SRA0:B6BD FF               rst  $38
SRA0:B6BE FF               rst  $38
SRA0:B6BF FF               rst  $38
SRA0:B6C0 FF               rst  $38
SRA0:B6C1 FF               rst  $38
SRA0:B6C2 FF               rst  $38
SRA0:B6C3 FF               rst  $38
SRA0:B6C4 FF               rst  $38
SRA0:B6C5 FF               rst  $38
SRA0:B6C6 FF               rst  $38
SRA0:B6C7 FF               rst  $38
SRA0:B6C8 FF               rst  $38
SRA0:B6C9 FF               rst  $38
SRA0:B6CA FF               rst  $38
SRA0:B6CB FF               rst  $38
SRA0:B6CC FF               rst  $38
SRA0:B6CD FF               rst  $38
SRA0:B6CE FF               rst  $38
SRA0:B6CF FF               rst  $38
SRA0:B6D0 FF               rst  $38
SRA0:B6D1 FF               rst  $38
SRA0:B6D2 FF               rst  $38
SRA0:B6D3 FF               rst  $38
SRA0:B6D4 FF               rst  $38
SRA0:B6D5 FF               rst  $38
SRA0:B6D6 FF               rst  $38
SRA0:B6D7 FF               rst  $38
SRA0:B6D8 FF               rst  $38
SRA0:B6D9 FF               rst  $38
SRA0:B6DA FF               rst  $38
SRA0:B6DB FF               rst  $38
SRA0:B6DC FF               rst  $38
SRA0:B6DD FF               rst  $38
SRA0:B6DE FF               rst  $38
SRA0:B6DF FF               rst  $38
SRA0:B6E0 FF               rst  $38
SRA0:B6E1 FF               rst  $38
SRA0:B6E2 FF               rst  $38
SRA0:B6E3 FF               rst  $38
SRA0:B6E4 FF               rst  $38
SRA0:B6E5 FF               rst  $38
SRA0:B6E6 FF               rst  $38
SRA0:B6E7 FF               rst  $38
SRA0:B6E8 FF               rst  $38
SRA0:B6E9 FF               rst  $38
SRA0:B6EA FF               rst  $38
SRA0:B6EB FF               rst  $38
SRA0:B6EC FF               rst  $38
SRA0:B6ED FF               rst  $38
SRA0:B6EE FF               rst  $38
SRA0:B6EF FF               rst  $38
SRA0:B6F0 FF               rst  $38
SRA0:B6F1 FF               rst  $38
SRA0:B6F2 FF               rst  $38
SRA0:B6F3 FF               rst  $38
SRA0:B6F4 FF               rst  $38
SRA0:B6F5 FF               rst  $38
SRA0:B6F6 FF               rst  $38
SRA0:B6F7 FF               rst  $38
SRA0:B6F8 FF               rst  $38
SRA0:B6F9 FF               rst  $38
SRA0:B6FA FF               rst  $38
SRA0:B6FB FF               rst  $38
SRA0:B6FC FF               rst  $38
SRA0:B6FD FF               rst  $38
SRA0:B6FE FF               rst  $38
SRA0:B6FF FF               rst  $38
SRA0:B700 FF               rst  $38
SRA0:B701 FF               rst  $38
SRA0:B702 FF               rst  $38
SRA0:B703 FF               rst  $38
SRA0:B704 FF               rst  $38
SRA0:B705 FF               rst  $38
SRA0:B706 FF               rst  $38
SRA0:B707 FF               rst  $38
SRA0:B708 FF               rst  $38
SRA0:B709 FF               rst  $38
SRA0:B70A FF               rst  $38
SRA0:B70B FF               rst  $38
SRA0:B70C FF               rst  $38
SRA0:B70D FF               rst  $38
SRA0:B70E FF               rst  $38
SRA0:B70F FF               rst  $38
SRA0:B710 FF               rst  $38
SRA0:B711 FF               rst  $38
SRA0:B712 FF               rst  $38
SRA0:B713 FF               rst  $38
SRA0:B714 FF               rst  $38
SRA0:B715 FF               rst  $38
SRA0:B716 FF               rst  $38
SRA0:B717 FF               rst  $38
SRA0:B718 FF               rst  $38
SRA0:B719 FF               rst  $38
SRA0:B71A FF               rst  $38
SRA0:B71B FF               rst  $38
SRA0:B71C FF               rst  $38
SRA0:B71D FF               rst  $38
SRA0:B71E FF               rst  $38
SRA0:B71F FF               rst  $38
SRA0:B720 FF               rst  $38
SRA0:B721 FF               rst  $38
SRA0:B722 FF               rst  $38
SRA0:B723 FF               rst  $38
SRA0:B724 FF               rst  $38
SRA0:B725 FF               rst  $38
SRA0:B726 FF               rst  $38
SRA0:B727 FF               rst  $38
SRA0:B728 FF               rst  $38
SRA0:B729 FF               rst  $38
SRA0:B72A FF               rst  $38
SRA0:B72B FF               rst  $38
SRA0:B72C FF               rst  $38
SRA0:B72D FF               rst  $38
SRA0:B72E FF               rst  $38
SRA0:B72F FF               rst  $38
SRA0:B730 FF               rst  $38
SRA0:B731 FF               rst  $38
SRA0:B732 FF               rst  $38
SRA0:B733 FF               rst  $38
SRA0:B734 FF               rst  $38
SRA0:B735 FF               rst  $38
SRA0:B736 FF               rst  $38
SRA0:B737 FF               rst  $38
SRA0:B738 FF               rst  $38
SRA0:B739 FF               rst  $38
SRA0:B73A FF               rst  $38
SRA0:B73B FF               rst  $38
SRA0:B73C FF               rst  $38
SRA0:B73D FF               rst  $38
SRA0:B73E FF               rst  $38
SRA0:B73F FF               rst  $38
SRA0:B740 FF               rst  $38
SRA0:B741 FF               rst  $38
SRA0:B742 FF               rst  $38
SRA0:B743 FF               rst  $38
SRA0:B744 FF               rst  $38
SRA0:B745 FF               rst  $38
SRA0:B746 FF               rst  $38
SRA0:B747 FF               rst  $38
SRA0:B748 FF               rst  $38
SRA0:B749 FF               rst  $38
SRA0:B74A FF               rst  $38
SRA0:B74B FF               rst  $38
SRA0:B74C FF               rst  $38
SRA0:B74D FF               rst  $38
SRA0:B74E FF               rst  $38
SRA0:B74F FF               rst  $38
SRA0:B750 FF               rst  $38
SRA0:B751 FF               rst  $38
SRA0:B752 FF               rst  $38
SRA0:B753 FF               rst  $38
SRA0:B754 FF               rst  $38
SRA0:B755 FF               rst  $38
SRA0:B756 FF               rst  $38
SRA0:B757 FF               rst  $38
SRA0:B758 FF               rst  $38
SRA0:B759 FF               rst  $38
SRA0:B75A FF               rst  $38
SRA0:B75B FF               rst  $38
SRA0:B75C FF               rst  $38
SRA0:B75D FF               rst  $38
SRA0:B75E FF               rst  $38
SRA0:B75F FF               rst  $38
SRA0:B760 FF               rst  $38
SRA0:B761 FF               rst  $38
SRA0:B762 FF               rst  $38
SRA0:B763 FF               rst  $38
SRA0:B764 FF               rst  $38
SRA0:B765 FF               rst  $38
SRA0:B766 FF               rst  $38
SRA0:B767 FF               rst  $38
SRA0:B768 FF               rst  $38
SRA0:B769 FF               rst  $38
SRA0:B76A FF               rst  $38
SRA0:B76B FF               rst  $38
SRA0:B76C FF               rst  $38
SRA0:B76D FF               rst  $38
SRA0:B76E FF               rst  $38
SRA0:B76F FF               rst  $38
SRA0:B770 FF               rst  $38
SRA0:B771 FF               rst  $38
SRA0:B772 FF               rst  $38
SRA0:B773 FF               rst  $38
SRA0:B774 FF               rst  $38
SRA0:B775 FF               rst  $38
SRA0:B776 FF               rst  $38
SRA0:B777 FF               rst  $38
SRA0:B778 FF               rst  $38
SRA0:B779 FF               rst  $38
SRA0:B77A FF               rst  $38
SRA0:B77B FF               rst  $38
SRA0:B77C FF               rst  $38
SRA0:B77D FF               rst  $38
SRA0:B77E FF               rst  $38
SRA0:B77F FF               rst  $38
SRA0:B780 FF               rst  $38
SRA0:B781 FF               rst  $38
SRA0:B782 FF               rst  $38
SRA0:B783 FF               rst  $38
SRA0:B784 FF               rst  $38
SRA0:B785 FF               rst  $38
SRA0:B786 FF               rst  $38
SRA0:B787 FF               rst  $38
SRA0:B788 FF               rst  $38
SRA0:B789 FF               rst  $38
SRA0:B78A FF               rst  $38
SRA0:B78B FF               rst  $38
SRA0:B78C FF               rst  $38
SRA0:B78D FF               rst  $38
SRA0:B78E FF               rst  $38
SRA0:B78F FF               rst  $38
SRA0:B790 FF               rst  $38
SRA0:B791 FF               rst  $38
SRA0:B792 FF               rst  $38
SRA0:B793 FF               rst  $38
SRA0:B794 FF               rst  $38
SRA0:B795 FF               rst  $38
SRA0:B796 FF               rst  $38
SRA0:B797 FF               rst  $38
SRA0:B798 FF               rst  $38
SRA0:B799 FF               rst  $38
SRA0:B79A FF               rst  $38
SRA0:B79B FF               rst  $38
SRA0:B79C FF               rst  $38
SRA0:B79D FF               rst  $38
SRA0:B79E FF               rst  $38
SRA0:B79F FF               rst  $38
SRA0:B7A0 FF               rst  $38
SRA0:B7A1 FF               rst  $38
SRA0:B7A2 FF               rst  $38
SRA0:B7A3 FF               rst  $38
SRA0:B7A4 FF               rst  $38
SRA0:B7A5 FF               rst  $38
SRA0:B7A6 FF               rst  $38
SRA0:B7A7 FF               rst  $38
SRA0:B7A8 FF               rst  $38
SRA0:B7A9 FF               rst  $38
SRA0:B7AA FF               rst  $38
SRA0:B7AB FF               rst  $38
SRA0:B7AC FF               rst  $38
SRA0:B7AD FF               rst  $38
SRA0:B7AE FF               rst  $38
SRA0:B7AF FF               rst  $38
SRA0:B7B0 FF               rst  $38
SRA0:B7B1 FF               rst  $38
SRA0:B7B2 FF               rst  $38
SRA0:B7B3 FF               rst  $38
SRA0:B7B4 FF               rst  $38
SRA0:B7B5 FF               rst  $38
SRA0:B7B6 FF               rst  $38
SRA0:B7B7 FF               rst  $38
SRA0:B7B8 FF               rst  $38
SRA0:B7B9 FF               rst  $38
SRA0:B7BA FF               rst  $38
SRA0:B7BB FF               rst  $38
SRA0:B7BC FF               rst  $38
SRA0:B7BD FF               rst  $38
SRA0:B7BE FF               rst  $38
SRA0:B7BF FF               rst  $38
SRA0:B7C0 FF               rst  $38
SRA0:B7C1 FF               rst  $38
SRA0:B7C2 FF               rst  $38
SRA0:B7C3 FF               rst  $38
SRA0:B7C4 FF               rst  $38
SRA0:B7C5 FF               rst  $38
SRA0:B7C6 FF               rst  $38
SRA0:B7C7 FF               rst  $38
SRA0:B7C8 FF               rst  $38
SRA0:B7C9 FF               rst  $38
SRA0:B7CA FF               rst  $38
SRA0:B7CB FF               rst  $38
SRA0:B7CC FF               rst  $38
SRA0:B7CD FF               rst  $38
SRA0:B7CE FF               rst  $38
SRA0:B7CF FF               rst  $38
SRA0:B7D0 FF               rst  $38
SRA0:B7D1 FF               rst  $38
SRA0:B7D2 FF               rst  $38
SRA0:B7D3 FF               rst  $38
SRA0:B7D4 FF               rst  $38
SRA0:B7D5 FF               rst  $38
SRA0:B7D6 FF               rst  $38
SRA0:B7D7 FF               rst  $38
SRA0:B7D8 FF               rst  $38
SRA0:B7D9 FF               rst  $38
SRA0:B7DA FF               rst  $38
SRA0:B7DB FF               rst  $38
SRA0:B7DC FF               rst  $38
SRA0:B7DD FF               rst  $38
SRA0:B7DE FF               rst  $38
SRA0:B7DF FF               rst  $38
SRA0:B7E0 FF               rst  $38
SRA0:B7E1 FF               rst  $38
SRA0:B7E2 FF               rst  $38
SRA0:B7E3 FF               rst  $38
SRA0:B7E4 FF               rst  $38
SRA0:B7E5 FF               rst  $38
SRA0:B7E6 FF               rst  $38
SRA0:B7E7 FF               rst  $38
SRA0:B7E8 FF               rst  $38
SRA0:B7E9 FF               rst  $38
SRA0:B7EA FF               rst  $38
SRA0:B7EB FF               rst  $38
SRA0:B7EC FF               rst  $38
SRA0:B7ED FF               rst  $38
SRA0:B7EE FF               rst  $38
SRA0:B7EF FF               rst  $38
SRA0:B7F0 FF               rst  $38
SRA0:B7F1 FF               rst  $38
SRA0:B7F2 FF               rst  $38
SRA0:B7F3 FF               rst  $38
SRA0:B7F4 FF               rst  $38
SRA0:B7F5 FF               rst  $38
SRA0:B7F6 FF               rst  $38
SRA0:B7F7 FF               rst  $38
SRA0:B7F8 FF               rst  $38
SRA0:B7F9 FF               rst  $38
SRA0:B7FA FF               rst  $38
SRA0:B7FB FF               rst  $38
SRA0:B7FC FF               rst  $38
SRA0:B7FD FF               rst  $38
SRA0:B7FE FF               rst  $38
SRA0:B7FF FF               rst  $38
SRA0:B800 FF               rst  $38
SRA0:B801 FF               rst  $38
SRA0:B802 FF               rst  $38
SRA0:B803 FF               rst  $38
SRA0:B804 FF               rst  $38
SRA0:B805 FF               rst  $38
SRA0:B806 FF               rst  $38
SRA0:B807 FF               rst  $38
SRA0:B808 FF               rst  $38
SRA0:B809 FF               rst  $38
SRA0:B80A FF               rst  $38
SRA0:B80B FF               rst  $38
SRA0:B80C FF               rst  $38
SRA0:B80D FF               rst  $38
SRA0:B80E FF               rst  $38
SRA0:B80F FF               rst  $38
SRA0:B810 FF               rst  $38
SRA0:B811 FF               rst  $38
SRA0:B812 FF               rst  $38
SRA0:B813 FF               rst  $38
SRA0:B814 FF               rst  $38
SRA0:B815 FF               rst  $38
SRA0:B816 FF               rst  $38
SRA0:B817 FF               rst  $38
SRA0:B818 FF               rst  $38
SRA0:B819 FF               rst  $38
SRA0:B81A FF               rst  $38
SRA0:B81B FF               rst  $38
SRA0:B81C FF               rst  $38
SRA0:B81D FF               rst  $38
SRA0:B81E FF               rst  $38
SRA0:B81F FF               rst  $38
SRA0:B820 FF               rst  $38
SRA0:B821 FF               rst  $38
SRA0:B822 FF               rst  $38
SRA0:B823 FF               rst  $38
SRA0:B824 FF               rst  $38
SRA0:B825 FF               rst  $38
SRA0:B826 FF               rst  $38
SRA0:B827 FF               rst  $38
SRA0:B828 FF               rst  $38
SRA0:B829 FF               rst  $38
SRA0:B82A FF               rst  $38
SRA0:B82B FF               rst  $38
SRA0:B82C FF               rst  $38
SRA0:B82D FF               rst  $38
SRA0:B82E FF               rst  $38
SRA0:B82F FF               rst  $38
SRA0:B830 FF               rst  $38
SRA0:B831 FF               rst  $38
SRA0:B832 FF               rst  $38
SRA0:B833 FF               rst  $38
SRA0:B834 FF               rst  $38
SRA0:B835 FF               rst  $38
SRA0:B836 FF               rst  $38
SRA0:B837 FF               rst  $38
SRA0:B838 FF               rst  $38
SRA0:B839 FF               rst  $38
SRA0:B83A FF               rst  $38
SRA0:B83B FF               rst  $38
SRA0:B83C FF               rst  $38
SRA0:B83D FF               rst  $38
SRA0:B83E FF               rst  $38
SRA0:B83F FF               rst  $38
SRA0:B840 FF               rst  $38
SRA0:B841 FF               rst  $38
SRA0:B842 FF               rst  $38
SRA0:B843 FF               rst  $38
SRA0:B844 FF               rst  $38
SRA0:B845 FF               rst  $38
SRA0:B846 FF               rst  $38
SRA0:B847 FF               rst  $38
SRA0:B848 FF               rst  $38
SRA0:B849 FF               rst  $38
SRA0:B84A FF               rst  $38
SRA0:B84B FF               rst  $38
SRA0:B84C FF               rst  $38
SRA0:B84D FF               rst  $38
SRA0:B84E FF               rst  $38
SRA0:B84F FF               rst  $38
SRA0:B850 FF               rst  $38
SRA0:B851 FF               rst  $38
SRA0:B852 FF               rst  $38
SRA0:B853 FF               rst  $38
SRA0:B854 FF               rst  $38
SRA0:B855 FF               rst  $38
SRA0:B856 FF               rst  $38
SRA0:B857 FF               rst  $38
SRA0:B858 FF               rst  $38
SRA0:B859 FF               rst  $38
SRA0:B85A FF               rst  $38
SRA0:B85B FF               rst  $38
SRA0:B85C FF               rst  $38
SRA0:B85D FF               rst  $38
SRA0:B85E FF               rst  $38
SRA0:B85F FF               rst  $38
SRA0:B860 FF               rst  $38
SRA0:B861 FF               rst  $38
SRA0:B862 FF               rst  $38
SRA0:B863 FF               rst  $38
SRA0:B864 FF               rst  $38
SRA0:B865 FF               rst  $38
SRA0:B866 FF               rst  $38
SRA0:B867 FF               rst  $38
SRA0:B868 FF               rst  $38
SRA0:B869 FF               rst  $38
SRA0:B86A FF               rst  $38
SRA0:B86B FF               rst  $38
SRA0:B86C FF               rst  $38
SRA0:B86D FF               rst  $38
SRA0:B86E FF               rst  $38
SRA0:B86F FF               rst  $38
SRA0:B870 FF               rst  $38
SRA0:B871 FF               rst  $38
SRA0:B872 FF               rst  $38
SRA0:B873 FF               rst  $38
SRA0:B874 FF               rst  $38
SRA0:B875 FF               rst  $38
SRA0:B876 FF               rst  $38
SRA0:B877 FF               rst  $38
SRA0:B878 FF               rst  $38
SRA0:B879 FF               rst  $38
SRA0:B87A FF               rst  $38
SRA0:B87B FF               rst  $38
SRA0:B87C FF               rst  $38
SRA0:B87D FF               rst  $38
SRA0:B87E FF               rst  $38
SRA0:B87F FF               rst  $38
SRA0:B880 FF               rst  $38
SRA0:B881 FF               rst  $38
SRA0:B882 FF               rst  $38
SRA0:B883 FF               rst  $38
SRA0:B884 FF               rst  $38
SRA0:B885 FF               rst  $38
SRA0:B886 FF               rst  $38
SRA0:B887 FF               rst  $38
SRA0:B888 FF               rst  $38
SRA0:B889 FF               rst  $38
SRA0:B88A FF               rst  $38
SRA0:B88B FF               rst  $38
SRA0:B88C FF               rst  $38
SRA0:B88D FF               rst  $38
SRA0:B88E FF               rst  $38
SRA0:B88F FF               rst  $38
SRA0:B890 FF               rst  $38
SRA0:B891 FF               rst  $38
SRA0:B892 FF               rst  $38
SRA0:B893 FF               rst  $38
SRA0:B894 FF               rst  $38
SRA0:B895 FF               rst  $38
SRA0:B896 FF               rst  $38
SRA0:B897 FF               rst  $38
SRA0:B898 FF               rst  $38
SRA0:B899 FF               rst  $38
SRA0:B89A FF               rst  $38
SRA0:B89B FF               rst  $38
SRA0:B89C FF               rst  $38
SRA0:B89D FF               rst  $38
SRA0:B89E FF               rst  $38
SRA0:B89F FF               rst  $38
SRA0:B8A0 FF               rst  $38
SRA0:B8A1 FF               rst  $38
SRA0:B8A2 FF               rst  $38
SRA0:B8A3 FF               rst  $38
SRA0:B8A4 FF               rst  $38
SRA0:B8A5 FF               rst  $38
SRA0:B8A6 FF               rst  $38
SRA0:B8A7 FF               rst  $38
SRA0:B8A8 FF               rst  $38
SRA0:B8A9 FF               rst  $38
SRA0:B8AA FF               rst  $38
SRA0:B8AB FF               rst  $38
SRA0:B8AC FF               rst  $38
SRA0:B8AD FF               rst  $38
SRA0:B8AE FF               rst  $38
SRA0:B8AF FF               rst  $38
SRA0:B8B0 FF               rst  $38
SRA0:B8B1 FF               rst  $38
SRA0:B8B2 FF               rst  $38
SRA0:B8B3 FF               rst  $38
SRA0:B8B4 FF               rst  $38
SRA0:B8B5 FF               rst  $38
SRA0:B8B6 FF               rst  $38
SRA0:B8B7 FF               rst  $38
SRA0:B8B8 FF               rst  $38
SRA0:B8B9 FF               rst  $38
SRA0:B8BA FF               rst  $38
SRA0:B8BB FF               rst  $38
SRA0:B8BC FF               rst  $38
SRA0:B8BD FF               rst  $38
SRA0:B8BE FF               rst  $38
SRA0:B8BF FF               rst  $38
SRA0:B8C0 FF               rst  $38
SRA0:B8C1 FF               rst  $38
SRA0:B8C2 FF               rst  $38
SRA0:B8C3 FF               rst  $38
SRA0:B8C4 FF               rst  $38
SRA0:B8C5 FF               rst  $38
SRA0:B8C6 FF               rst  $38
SRA0:B8C7 FF               rst  $38
SRA0:B8C8 FF               rst  $38
SRA0:B8C9 FF               rst  $38
SRA0:B8CA FF               rst  $38
SRA0:B8CB FF               rst  $38
SRA0:B8CC FF               rst  $38
SRA0:B8CD FF               rst  $38
SRA0:B8CE FF               rst  $38
SRA0:B8CF FF               rst  $38
SRA0:B8D0 FF               rst  $38
SRA0:B8D1 FF               rst  $38
SRA0:B8D2 FF               rst  $38
SRA0:B8D3 FF               rst  $38
SRA0:B8D4 FF               rst  $38
SRA0:B8D5 FF               rst  $38
SRA0:B8D6 FF               rst  $38
SRA0:B8D7 FF               rst  $38
SRA0:B8D8 FF               rst  $38
SRA0:B8D9 FF               rst  $38
SRA0:B8DA FF               rst  $38
SRA0:B8DB FF               rst  $38
SRA0:B8DC FF               rst  $38
SRA0:B8DD FF               rst  $38
SRA0:B8DE FF               rst  $38
SRA0:B8DF FF               rst  $38
SRA0:B8E0 FF               rst  $38
SRA0:B8E1 FF               rst  $38
SRA0:B8E2 FF               rst  $38
SRA0:B8E3 FF               rst  $38
SRA0:B8E4 FF               rst  $38
SRA0:B8E5 FF               rst  $38
SRA0:B8E6 FF               rst  $38
SRA0:B8E7 FF               rst  $38
SRA0:B8E8 FF               rst  $38
SRA0:B8E9 FF               rst  $38
SRA0:B8EA FF               rst  $38
SRA0:B8EB FF               rst  $38
SRA0:B8EC FF               rst  $38
SRA0:B8ED FF               rst  $38
SRA0:B8EE FF               rst  $38
SRA0:B8EF FF               rst  $38
SRA0:B8F0 FF               rst  $38
SRA0:B8F1 FF               rst  $38
SRA0:B8F2 FF               rst  $38
SRA0:B8F3 FF               rst  $38
SRA0:B8F4 FF               rst  $38
SRA0:B8F5 FF               rst  $38
SRA0:B8F6 FF               rst  $38
SRA0:B8F7 FF               rst  $38
SRA0:B8F8 FF               rst  $38
SRA0:B8F9 FF               rst  $38
SRA0:B8FA FF               rst  $38
SRA0:B8FB FF               rst  $38
SRA0:B8FC FF               rst  $38
SRA0:B8FD FF               rst  $38
SRA0:B8FE FF               rst  $38
SRA0:B8FF FF               rst  $38
SRA0:B900 FF               rst  $38
SRA0:B901 FF               rst  $38
SRA0:B902 FF               rst  $38
SRA0:B903 FF               rst  $38
SRA0:B904 FF               rst  $38
SRA0:B905 FF               rst  $38
SRA0:B906 FF               rst  $38
SRA0:B907 FF               rst  $38
SRA0:B908 FF               rst  $38
SRA0:B909 FF               rst  $38
SRA0:B90A FF               rst  $38
SRA0:B90B FF               rst  $38
SRA0:B90C FF               rst  $38
SRA0:B90D FF               rst  $38
SRA0:B90E FF               rst  $38
SRA0:B90F FF               rst  $38
SRA0:B910 FF               rst  $38
SRA0:B911 FF               rst  $38
SRA0:B912 FF               rst  $38
SRA0:B913 FF               rst  $38
SRA0:B914 FF               rst  $38
SRA0:B915 FF               rst  $38
SRA0:B916 FF               rst  $38
SRA0:B917 FF               rst  $38
SRA0:B918 FF               rst  $38
SRA0:B919 FF               rst  $38
SRA0:B91A FF               rst  $38
SRA0:B91B FF               rst  $38
SRA0:B91C FF               rst  $38
SRA0:B91D FF               rst  $38
SRA0:B91E FF               rst  $38
SRA0:B91F FF               rst  $38
SRA0:B920 FF               rst  $38
SRA0:B921 FF               rst  $38
SRA0:B922 FF               rst  $38
SRA0:B923 FF               rst  $38
SRA0:B924 FF               rst  $38
SRA0:B925 FF               rst  $38
SRA0:B926 FF               rst  $38
SRA0:B927 FF               rst  $38
SRA0:B928 FF               rst  $38
SRA0:B929 FF               rst  $38
SRA0:B92A FF               rst  $38
SRA0:B92B FF               rst  $38
SRA0:B92C FF               rst  $38
SRA0:B92D FF               rst  $38
SRA0:B92E FF               rst  $38
SRA0:B92F FF               rst  $38
SRA0:B930 FF               rst  $38
SRA0:B931 FF               rst  $38
SRA0:B932 FF               rst  $38
SRA0:B933 FF               rst  $38
SRA0:B934 FF               rst  $38
SRA0:B935 FF               rst  $38
SRA0:B936 FF               rst  $38
SRA0:B937 FF               rst  $38
SRA0:B938 FF               rst  $38
SRA0:B939 FF               rst  $38
SRA0:B93A FF               rst  $38
SRA0:B93B FF               rst  $38
SRA0:B93C FF               rst  $38
SRA0:B93D FF               rst  $38
SRA0:B93E FF               rst  $38
SRA0:B93F FF               rst  $38
SRA0:B940 FF               rst  $38
SRA0:B941 FF               rst  $38
SRA0:B942 FF               rst  $38
SRA0:B943 FF               rst  $38
SRA0:B944 FF               rst  $38
SRA0:B945 FF               rst  $38
SRA0:B946 FF               rst  $38
SRA0:B947 FF               rst  $38
SRA0:B948 FF               rst  $38
SRA0:B949 FF               rst  $38
SRA0:B94A FF               rst  $38
SRA0:B94B FF               rst  $38
SRA0:B94C FF               rst  $38
SRA0:B94D FF               rst  $38
SRA0:B94E FF               rst  $38
SRA0:B94F FF               rst  $38
SRA0:B950 FF               rst  $38
SRA0:B951 FF               rst  $38
SRA0:B952 FF               rst  $38
SRA0:B953 FF               rst  $38
SRA0:B954 FF               rst  $38
SRA0:B955 FF               rst  $38
SRA0:B956 FF               rst  $38
SRA0:B957 FF               rst  $38
SRA0:B958 FF               rst  $38
SRA0:B959 FF               rst  $38
SRA0:B95A FF               rst  $38
SRA0:B95B FF               rst  $38
SRA0:B95C FF               rst  $38
SRA0:B95D FF               rst  $38
SRA0:B95E FF               rst  $38
SRA0:B95F FF               rst  $38
SRA0:B960 FF               rst  $38
SRA0:B961 FF               rst  $38
SRA0:B962 FF               rst  $38
SRA0:B963 FF               rst  $38
SRA0:B964 FF               rst  $38
SRA0:B965 FF               rst  $38
SRA0:B966 FF               rst  $38
SRA0:B967 FF               rst  $38
SRA0:B968 FF               rst  $38
SRA0:B969 FF               rst  $38
SRA0:B96A FF               rst  $38
SRA0:B96B FF               rst  $38
SRA0:B96C FF               rst  $38
SRA0:B96D FF               rst  $38
SRA0:B96E FF               rst  $38
SRA0:B96F FF               rst  $38
SRA0:B970 FF               rst  $38
SRA0:B971 FF               rst  $38
SRA0:B972 FF               rst  $38
SRA0:B973 FF               rst  $38
SRA0:B974 FF               rst  $38
SRA0:B975 FF               rst  $38
SRA0:B976 FF               rst  $38
SRA0:B977 FF               rst  $38
SRA0:B978 FF               rst  $38
SRA0:B979 FF               rst  $38
SRA0:B97A FF               rst  $38
SRA0:B97B FF               rst  $38
SRA0:B97C FF               rst  $38
SRA0:B97D FF               rst  $38
SRA0:B97E FF               rst  $38
SRA0:B97F FF               rst  $38
SRA0:B980 FF               rst  $38
SRA0:B981 FF               rst  $38
SRA0:B982 FF               rst  $38
SRA0:B983 FF               rst  $38
SRA0:B984 FF               rst  $38
SRA0:B985 FF               rst  $38
SRA0:B986 FF               rst  $38
SRA0:B987 FF               rst  $38
SRA0:B988 FF               rst  $38
SRA0:B989 FF               rst  $38
SRA0:B98A FF               rst  $38
SRA0:B98B FF               rst  $38
SRA0:B98C FF               rst  $38
SRA0:B98D FF               rst  $38
SRA0:B98E FF               rst  $38
SRA0:B98F FF               rst  $38
SRA0:B990 FF               rst  $38
SRA0:B991 FF               rst  $38
SRA0:B992 FF               rst  $38
SRA0:B993 FF               rst  $38
SRA0:B994 FF               rst  $38
SRA0:B995 FF               rst  $38
SRA0:B996 FF               rst  $38
SRA0:B997 FF               rst  $38
SRA0:B998 FF               rst  $38
SRA0:B999 FF               rst  $38
SRA0:B99A FF               rst  $38
SRA0:B99B FF               rst  $38
SRA0:B99C FF               rst  $38
SRA0:B99D FF               rst  $38
SRA0:B99E FF               rst  $38
SRA0:B99F FF               rst  $38
SRA0:B9A0 FF               rst  $38
SRA0:B9A1 FF               rst  $38
SRA0:B9A2 FF               rst  $38
SRA0:B9A3 FF               rst  $38
SRA0:B9A4 FF               rst  $38
SRA0:B9A5 FF               rst  $38
SRA0:B9A6 FF               rst  $38
SRA0:B9A7 FF               rst  $38
SRA0:B9A8 FF               rst  $38
SRA0:B9A9 FF               rst  $38
SRA0:B9AA FF               rst  $38
SRA0:B9AB FF               rst  $38
SRA0:B9AC FF               rst  $38
SRA0:B9AD FF               rst  $38
SRA0:B9AE FF               rst  $38
SRA0:B9AF FF               rst  $38
SRA0:B9B0 FF               rst  $38
SRA0:B9B1 FF               rst  $38
SRA0:B9B2 FF               rst  $38
SRA0:B9B3 FF               rst  $38
SRA0:B9B4 FF               rst  $38
SRA0:B9B5 FF               rst  $38
SRA0:B9B6 FF               rst  $38
SRA0:B9B7 FF               rst  $38
SRA0:B9B8 FF               rst  $38
SRA0:B9B9 FF               rst  $38
SRA0:B9BA FF               rst  $38
SRA0:B9BB FF               rst  $38
SRA0:B9BC FF               rst  $38
SRA0:B9BD FF               rst  $38
SRA0:B9BE FF               rst  $38
SRA0:B9BF FF               rst  $38
SRA0:B9C0 FF               rst  $38
SRA0:B9C1 FF               rst  $38
SRA0:B9C2 FF               rst  $38
SRA0:B9C3 FF               rst  $38
SRA0:B9C4 FF               rst  $38
SRA0:B9C5 FF               rst  $38
SRA0:B9C6 FF               rst  $38
SRA0:B9C7 FF               rst  $38
SRA0:B9C8 FF               rst  $38
SRA0:B9C9 FF               rst  $38
SRA0:B9CA FF               rst  $38
SRA0:B9CB FF               rst  $38
SRA0:B9CC FF               rst  $38
SRA0:B9CD FF               rst  $38
SRA0:B9CE FF               rst  $38
SRA0:B9CF FF               rst  $38
SRA0:B9D0 FF               rst  $38
SRA0:B9D1 FF               rst  $38
SRA0:B9D2 FF               rst  $38
SRA0:B9D3 FF               rst  $38
SRA0:B9D4 FF               rst  $38
SRA0:B9D5 FF               rst  $38
SRA0:B9D6 FF               rst  $38
SRA0:B9D7 FF               rst  $38
SRA0:B9D8 FF               rst  $38
SRA0:B9D9 FF               rst  $38
SRA0:B9DA FF               rst  $38
SRA0:B9DB FF               rst  $38
SRA0:B9DC FF               rst  $38
SRA0:B9DD FF               rst  $38
SRA0:B9DE FF               rst  $38
SRA0:B9DF FF               rst  $38
SRA0:B9E0 FF               rst  $38
SRA0:B9E1 FF               rst  $38
SRA0:B9E2 FF               rst  $38
SRA0:B9E3 FF               rst  $38
SRA0:B9E4 FF               rst  $38
SRA0:B9E5 FF               rst  $38
SRA0:B9E6 FF               rst  $38
SRA0:B9E7 FF               rst  $38
SRA0:B9E8 FF               rst  $38
SRA0:B9E9 FF               rst  $38
SRA0:B9EA FF               rst  $38
SRA0:B9EB FF               rst  $38
SRA0:B9EC FF               rst  $38
SRA0:B9ED FF               rst  $38
SRA0:B9EE FF               rst  $38
SRA0:B9EF FF               rst  $38
SRA0:B9F0 FF               rst  $38
SRA0:B9F1 FF               rst  $38
SRA0:B9F2 FF               rst  $38
SRA0:B9F3 FF               rst  $38
SRA0:B9F4 FF               rst  $38
SRA0:B9F5 FF               rst  $38
SRA0:B9F6 FF               rst  $38
SRA0:B9F7 FF               rst  $38
SRA0:B9F8 FF               rst  $38
SRA0:B9F9 FF               rst  $38
SRA0:B9FA FF               rst  $38
SRA0:B9FB FF               rst  $38
SRA0:B9FC FF               rst  $38
SRA0:B9FD FF               rst  $38
SRA0:B9FE FF               rst  $38
SRA0:B9FF FF               rst  $38
SRA0:BA00 FF               rst  $38
SRA0:BA01 FF               rst  $38
SRA0:BA02 FF               rst  $38
SRA0:BA03 FF               rst  $38
SRA0:BA04 FF               rst  $38
SRA0:BA05 FF               rst  $38
SRA0:BA06 FF               rst  $38
SRA0:BA07 FF               rst  $38
SRA0:BA08 FF               rst  $38
SRA0:BA09 FF               rst  $38
SRA0:BA0A FF               rst  $38
SRA0:BA0B FF               rst  $38
SRA0:BA0C FF               rst  $38
SRA0:BA0D FF               rst  $38
SRA0:BA0E FF               rst  $38
SRA0:BA0F FF               rst  $38
SRA0:BA10 FF               rst  $38
SRA0:BA11 FF               rst  $38
SRA0:BA12 FF               rst  $38
SRA0:BA13 FF               rst  $38
SRA0:BA14 FF               rst  $38
SRA0:BA15 FF               rst  $38
SRA0:BA16 FF               rst  $38
SRA0:BA17 FF               rst  $38
SRA0:BA18 FF               rst  $38
SRA0:BA19 FF               rst  $38
SRA0:BA1A FF               rst  $38
SRA0:BA1B FF               rst  $38
SRA0:BA1C FF               rst  $38
SRA0:BA1D FF               rst  $38
SRA0:BA1E FF               rst  $38
SRA0:BA1F FF               rst  $38
SRA0:BA20 FF               rst  $38
SRA0:BA21 FF               rst  $38
SRA0:BA22 FF               rst  $38
SRA0:BA23 FF               rst  $38
SRA0:BA24 FF               rst  $38
SRA0:BA25 FF               rst  $38
SRA0:BA26 FF               rst  $38
SRA0:BA27 FF               rst  $38
SRA0:BA28 FF               rst  $38
SRA0:BA29 FF               rst  $38
SRA0:BA2A FF               rst  $38
SRA0:BA2B FF               rst  $38
SRA0:BA2C FF               rst  $38
SRA0:BA2D FF               rst  $38
SRA0:BA2E FF               rst  $38
SRA0:BA2F FF               rst  $38
SRA0:BA30 FF               rst  $38
SRA0:BA31 FF               rst  $38
SRA0:BA32 FF               rst  $38
SRA0:BA33 FF               rst  $38
SRA0:BA34 FF               rst  $38
SRA0:BA35 FF               rst  $38
SRA0:BA36 FF               rst  $38
SRA0:BA37 FF               rst  $38
SRA0:BA38 FF               rst  $38
SRA0:BA39 FF               rst  $38
SRA0:BA3A FF               rst  $38
SRA0:BA3B FF               rst  $38
SRA0:BA3C FF               rst  $38
SRA0:BA3D FF               rst  $38
SRA0:BA3E FF               rst  $38
SRA0:BA3F FF               rst  $38
SRA0:BA40 FF               rst  $38
SRA0:BA41 FF               rst  $38
SRA0:BA42 FF               rst  $38
SRA0:BA43 FF               rst  $38
SRA0:BA44 FF               rst  $38
SRA0:BA45 FF               rst  $38
SRA0:BA46 FF               rst  $38
SRA0:BA47 FF               rst  $38
SRA0:BA48 FF               rst  $38
SRA0:BA49 FF               rst  $38
SRA0:BA4A FF               rst  $38
SRA0:BA4B FF               rst  $38
SRA0:BA4C FF               rst  $38
SRA0:BA4D FF               rst  $38
SRA0:BA4E FF               rst  $38
SRA0:BA4F FF               rst  $38
SRA0:BA50 FF               rst  $38
SRA0:BA51 FF               rst  $38
SRA0:BA52 FF               rst  $38
SRA0:BA53 FF               rst  $38
SRA0:BA54 FF               rst  $38
SRA0:BA55 FF               rst  $38
SRA0:BA56 FF               rst  $38
SRA0:BA57 FF               rst  $38
SRA0:BA58 FF               rst  $38
SRA0:BA59 FF               rst  $38
SRA0:BA5A FF               rst  $38
SRA0:BA5B FF               rst  $38
SRA0:BA5C FF               rst  $38
SRA0:BA5D FF               rst  $38
SRA0:BA5E FF               rst  $38
SRA0:BA5F FF               rst  $38
SRA0:BA60 FF               rst  $38
SRA0:BA61 FF               rst  $38
SRA0:BA62 FF               rst  $38
SRA0:BA63 FF               rst  $38
SRA0:BA64 FF               rst  $38
SRA0:BA65 FF               rst  $38
SRA0:BA66 FF               rst  $38
SRA0:BA67 FF               rst  $38
SRA0:BA68 FF               rst  $38
SRA0:BA69 FF               rst  $38
SRA0:BA6A FF               rst  $38
SRA0:BA6B FF               rst  $38
SRA0:BA6C FF               rst  $38
SRA0:BA6D FF               rst  $38
SRA0:BA6E FF               rst  $38
SRA0:BA6F FF               rst  $38
SRA0:BA70 FF               rst  $38
SRA0:BA71 FF               rst  $38
SRA0:BA72 FF               rst  $38
SRA0:BA73 FF               rst  $38
SRA0:BA74 FF               rst  $38
SRA0:BA75 FF               rst  $38
SRA0:BA76 FF               rst  $38
SRA0:BA77 FF               rst  $38
SRA0:BA78 FF               rst  $38
SRA0:BA79 FF               rst  $38
SRA0:BA7A FF               rst  $38
SRA0:BA7B FF               rst  $38
SRA0:BA7C FF               rst  $38
SRA0:BA7D FF               rst  $38
SRA0:BA7E FF               rst  $38
SRA0:BA7F FF               rst  $38
SRA0:BA80 FF               rst  $38
SRA0:BA81 FF               rst  $38
SRA0:BA82 FF               rst  $38
SRA0:BA83 FF               rst  $38
SRA0:BA84 FF               rst  $38
SRA0:BA85 FF               rst  $38
SRA0:BA86 FF               rst  $38
SRA0:BA87 FF               rst  $38
SRA0:BA88 FF               rst  $38
SRA0:BA89 FF               rst  $38
SRA0:BA8A FF               rst  $38
SRA0:BA8B FF               rst  $38
SRA0:BA8C FF               rst  $38
SRA0:BA8D FF               rst  $38
SRA0:BA8E FF               rst  $38
SRA0:BA8F FF               rst  $38
SRA0:BA90 FF               rst  $38
SRA0:BA91 FF               rst  $38
SRA0:BA92 FF               rst  $38
SRA0:BA93 FF               rst  $38
SRA0:BA94 FF               rst  $38
SRA0:BA95 FF               rst  $38
SRA0:BA96 FF               rst  $38
SRA0:BA97 FF               rst  $38
SRA0:BA98 FF               rst  $38
SRA0:BA99 FF               rst  $38
SRA0:BA9A FF               rst  $38
SRA0:BA9B FF               rst  $38
SRA0:BA9C FF               rst  $38
SRA0:BA9D FF               rst  $38
SRA0:BA9E FF               rst  $38
SRA0:BA9F FF               rst  $38
SRA0:BAA0 FF               rst  $38
SRA0:BAA1 FF               rst  $38
SRA0:BAA2 FF               rst  $38
SRA0:BAA3 FF               rst  $38
SRA0:BAA4 FF               rst  $38
SRA0:BAA5 FF               rst  $38
SRA0:BAA6 FF               rst  $38
SRA0:BAA7 FF               rst  $38
SRA0:BAA8 FF               rst  $38
SRA0:BAA9 FF               rst  $38
SRA0:BAAA FF               rst  $38
SRA0:BAAB FF               rst  $38
SRA0:BAAC FF               rst  $38
SRA0:BAAD FF               rst  $38
SRA0:BAAE FF               rst  $38
SRA0:BAAF FF               rst  $38
SRA0:BAB0 FF               rst  $38
SRA0:BAB1 FF               rst  $38
SRA0:BAB2 FF               rst  $38
SRA0:BAB3 FF               rst  $38
SRA0:BAB4 FF               rst  $38
SRA0:BAB5 FF               rst  $38
SRA0:BAB6 FF               rst  $38
SRA0:BAB7 FF               rst  $38
SRA0:BAB8 FF               rst  $38
SRA0:BAB9 FF               rst  $38
SRA0:BABA FF               rst  $38
SRA0:BABB FF               rst  $38
SRA0:BABC FF               rst  $38
SRA0:BABD FF               rst  $38
SRA0:BABE FF               rst  $38
SRA0:BABF FF               rst  $38
SRA0:BAC0 FF               rst  $38
SRA0:BAC1 FF               rst  $38
SRA0:BAC2 FF               rst  $38
SRA0:BAC3 FF               rst  $38
SRA0:BAC4 FF               rst  $38
SRA0:BAC5 FF               rst  $38
SRA0:BAC6 FF               rst  $38
SRA0:BAC7 FF               rst  $38
SRA0:BAC8 FF               rst  $38
SRA0:BAC9 FF               rst  $38
SRA0:BACA FF               rst  $38
SRA0:BACB FF               rst  $38
SRA0:BACC FF               rst  $38
SRA0:BACD FF               rst  $38
SRA0:BACE FF               rst  $38
SRA0:BACF FF               rst  $38
SRA0:BAD0 FF               rst  $38
SRA0:BAD1 FF               rst  $38
SRA0:BAD2 FF               rst  $38
SRA0:BAD3 FF               rst  $38
SRA0:BAD4 FF               rst  $38
SRA0:BAD5 FF               rst  $38
SRA0:BAD6 FF               rst  $38
SRA0:BAD7 FF               rst  $38
SRA0:BAD8 FF               rst  $38
SRA0:BAD9 FF               rst  $38
SRA0:BADA FF               rst  $38
SRA0:BADB FF               rst  $38
SRA0:BADC FF               rst  $38
SRA0:BADD FF               rst  $38
SRA0:BADE FF               rst  $38
SRA0:BADF FF               rst  $38
SRA0:BAE0 FF               rst  $38
SRA0:BAE1 FF               rst  $38
SRA0:BAE2 FF               rst  $38
SRA0:BAE3 FF               rst  $38
SRA0:BAE4 FF               rst  $38
SRA0:BAE5 FF               rst  $38
SRA0:BAE6 FF               rst  $38
SRA0:BAE7 FF               rst  $38
SRA0:BAE8 FF               rst  $38
SRA0:BAE9 FF               rst  $38
SRA0:BAEA FF               rst  $38
SRA0:BAEB FF               rst  $38
SRA0:BAEC FF               rst  $38
SRA0:BAED FF               rst  $38
SRA0:BAEE FF               rst  $38
SRA0:BAEF FF               rst  $38
SRA0:BAF0 FF               rst  $38
SRA0:BAF1 FF               rst  $38
SRA0:BAF2 FF               rst  $38
SRA0:BAF3 FF               rst  $38
SRA0:BAF4 FF               rst  $38
SRA0:BAF5 FF               rst  $38
SRA0:BAF6 FF               rst  $38
SRA0:BAF7 FF               rst  $38
SRA0:BAF8 FF               rst  $38
SRA0:BAF9 FF               rst  $38
SRA0:BAFA FF               rst  $38
SRA0:BAFB FF               rst  $38
SRA0:BAFC FF               rst  $38
SRA0:BAFD FF               rst  $38
SRA0:BAFE FF               rst  $38
SRA0:BAFF FF               rst  $38
SRA0:BB00 FF               rst  $38
SRA0:BB01 FF               rst  $38
SRA0:BB02 FF               rst  $38
SRA0:BB03 FF               rst  $38
SRA0:BB04 FF               rst  $38
SRA0:BB05 FF               rst  $38
SRA0:BB06 FF               rst  $38
SRA0:BB07 FF               rst  $38
SRA0:BB08 FF               rst  $38
SRA0:BB09 FF               rst  $38
SRA0:BB0A FF               rst  $38
SRA0:BB0B FF               rst  $38
SRA0:BB0C FF               rst  $38
SRA0:BB0D FF               rst  $38
SRA0:BB0E FF               rst  $38
SRA0:BB0F FF               rst  $38
SRA0:BB10 FF               rst  $38
SRA0:BB11 FF               rst  $38
SRA0:BB12 FF               rst  $38
SRA0:BB13 FF               rst  $38
SRA0:BB14 FF               rst  $38
SRA0:BB15 FF               rst  $38
SRA0:BB16 FF               rst  $38
SRA0:BB17 FF               rst  $38
SRA0:BB18 FF               rst  $38
SRA0:BB19 FF               rst  $38
SRA0:BB1A FF               rst  $38
SRA0:BB1B FF               rst  $38
SRA0:BB1C FF               rst  $38
SRA0:BB1D FF               rst  $38
SRA0:BB1E FF               rst  $38
SRA0:BB1F FF               rst  $38
SRA0:BB20 FF               rst  $38
SRA0:BB21 FF               rst  $38
SRA0:BB22 FF               rst  $38
SRA0:BB23 FF               rst  $38
SRA0:BB24 FF               rst  $38
SRA0:BB25 FF               rst  $38
SRA0:BB26 FF               rst  $38
SRA0:BB27 FF               rst  $38
SRA0:BB28 FF               rst  $38
SRA0:BB29 FF               rst  $38
SRA0:BB2A FF               rst  $38
SRA0:BB2B FF               rst  $38
SRA0:BB2C FF               rst  $38
SRA0:BB2D FF               rst  $38
SRA0:BB2E FF               rst  $38
SRA0:BB2F FF               rst  $38
SRA0:BB30 FF               rst  $38
SRA0:BB31 FF               rst  $38
SRA0:BB32 FF               rst  $38
SRA0:BB33 FF               rst  $38
SRA0:BB34 FF               rst  $38
SRA0:BB35 FF               rst  $38
SRA0:BB36 FF               rst  $38
SRA0:BB37 FF               rst  $38
SRA0:BB38 FF               rst  $38
SRA0:BB39 FF               rst  $38
SRA0:BB3A FF               rst  $38
SRA0:BB3B FF               rst  $38
SRA0:BB3C FF               rst  $38
SRA0:BB3D FF               rst  $38
SRA0:BB3E FF               rst  $38
SRA0:BB3F FF               rst  $38
SRA0:BB40 FF               rst  $38
SRA0:BB41 FF               rst  $38
SRA0:BB42 FF               rst  $38
SRA0:BB43 FF               rst  $38
SRA0:BB44 FF               rst  $38
SRA0:BB45 FF               rst  $38
SRA0:BB46 FF               rst  $38
SRA0:BB47 FF               rst  $38
SRA0:BB48 FF               rst  $38
SRA0:BB49 FF               rst  $38
SRA0:BB4A FF               rst  $38
SRA0:BB4B FF               rst  $38
SRA0:BB4C FF               rst  $38
SRA0:BB4D FF               rst  $38
SRA0:BB4E FF               rst  $38
SRA0:BB4F FF               rst  $38
SRA0:BB50 FF               rst  $38
SRA0:BB51 FF               rst  $38
SRA0:BB52 FF               rst  $38
SRA0:BB53 FF               rst  $38
SRA0:BB54 FF               rst  $38
SRA0:BB55 FF               rst  $38
SRA0:BB56 FF               rst  $38
SRA0:BB57 FF               rst  $38
SRA0:BB58 FF               rst  $38
SRA0:BB59 FF               rst  $38
SRA0:BB5A FF               rst  $38
SRA0:BB5B FF               rst  $38
SRA0:BB5C FF               rst  $38
SRA0:BB5D FF               rst  $38
SRA0:BB5E FF               rst  $38
SRA0:BB5F FF               rst  $38
SRA0:BB60 FF               rst  $38
SRA0:BB61 FF               rst  $38
SRA0:BB62 FF               rst  $38
SRA0:BB63 FF               rst  $38
SRA0:BB64 FF               rst  $38
SRA0:BB65 FF               rst  $38
SRA0:BB66 FF               rst  $38
SRA0:BB67 FF               rst  $38
SRA0:BB68 FF               rst  $38
SRA0:BB69 FF               rst  $38
SRA0:BB6A FF               rst  $38
SRA0:BB6B FF               rst  $38
SRA0:BB6C FF               rst  $38
SRA0:BB6D FF               rst  $38
SRA0:BB6E FF               rst  $38
SRA0:BB6F FF               rst  $38
SRA0:BB70 FF               rst  $38
SRA0:BB71 FF               rst  $38
SRA0:BB72 FF               rst  $38
SRA0:BB73 FF               rst  $38
SRA0:BB74 FF               rst  $38
SRA0:BB75 FF               rst  $38
SRA0:BB76 FF               rst  $38
SRA0:BB77 FF               rst  $38
SRA0:BB78 FF               rst  $38
SRA0:BB79 FF               rst  $38
SRA0:BB7A FF               rst  $38
SRA0:BB7B FF               rst  $38
SRA0:BB7C FF               rst  $38
SRA0:BB7D FF               rst  $38
SRA0:BB7E FF               rst  $38
SRA0:BB7F FF               rst  $38
SRA0:BB80 FF               rst  $38
SRA0:BB81 FF               rst  $38
SRA0:BB82 FF               rst  $38
SRA0:BB83 FF               rst  $38
SRA0:BB84 FF               rst  $38
SRA0:BB85 FF               rst  $38
SRA0:BB86 FF               rst  $38
SRA0:BB87 FF               rst  $38
SRA0:BB88 FF               rst  $38
SRA0:BB89 FF               rst  $38
SRA0:BB8A FF               rst  $38
SRA0:BB8B FF               rst  $38
SRA0:BB8C FF               rst  $38
SRA0:BB8D FF               rst  $38
SRA0:BB8E FF               rst  $38
SRA0:BB8F FF               rst  $38
SRA0:BB90 FF               rst  $38
SRA0:BB91 FF               rst  $38
SRA0:BB92 FF               rst  $38
SRA0:BB93 FF               rst  $38
SRA0:BB94 FF               rst  $38
SRA0:BB95 FF               rst  $38
SRA0:BB96 FF               rst  $38
SRA0:BB97 FF               rst  $38
SRA0:BB98 FF               rst  $38
SRA0:BB99 FF               rst  $38
SRA0:BB9A FF               rst  $38
SRA0:BB9B FF               rst  $38
SRA0:BB9C FF               rst  $38
SRA0:BB9D FF               rst  $38
SRA0:BB9E FF               rst  $38
SRA0:BB9F FF               rst  $38
SRA0:BBA0 FF               rst  $38
SRA0:BBA1 FF               rst  $38
SRA0:BBA2 FF               rst  $38
SRA0:BBA3 FF               rst  $38
SRA0:BBA4 FF               rst  $38
SRA0:BBA5 FF               rst  $38
SRA0:BBA6 FF               rst  $38
SRA0:BBA7 FF               rst  $38
SRA0:BBA8 FF               rst  $38
SRA0:BBA9 FF               rst  $38
SRA0:BBAA FF               rst  $38
SRA0:BBAB FF               rst  $38
SRA0:BBAC FF               rst  $38
SRA0:BBAD FF               rst  $38
SRA0:BBAE FF               rst  $38
SRA0:BBAF FF               rst  $38
SRA0:BBB0 FF               rst  $38
SRA0:BBB1 FF               rst  $38
SRA0:BBB2 FF               rst  $38
SRA0:BBB3 FF               rst  $38
SRA0:BBB4 FF               rst  $38
SRA0:BBB5 FF               rst  $38
SRA0:BBB6 FF               rst  $38
SRA0:BBB7 FF               rst  $38
SRA0:BBB8 FF               rst  $38
SRA0:BBB9 FF               rst  $38
SRA0:BBBA FF               rst  $38
SRA0:BBBB FF               rst  $38
SRA0:BBBC FF               rst  $38
SRA0:BBBD FF               rst  $38
SRA0:BBBE FF               rst  $38
SRA0:BBBF FF               rst  $38
SRA0:BBC0 FF               rst  $38
SRA0:BBC1 FF               rst  $38
SRA0:BBC2 FF               rst  $38
SRA0:BBC3 FF               rst  $38
SRA0:BBC4 FF               rst  $38
SRA0:BBC5 FF               rst  $38
SRA0:BBC6 FF               rst  $38
SRA0:BBC7 FF               rst  $38
SRA0:BBC8 FF               rst  $38
SRA0:BBC9 FF               rst  $38
SRA0:BBCA FF               rst  $38
SRA0:BBCB FF               rst  $38
SRA0:BBCC FF               rst  $38
SRA0:BBCD FF               rst  $38
SRA0:BBCE FF               rst  $38
SRA0:BBCF FF               rst  $38
SRA0:BBD0 FF               rst  $38
SRA0:BBD1 FF               rst  $38
SRA0:BBD2 FF               rst  $38
SRA0:BBD3 FF               rst  $38
SRA0:BBD4 FF               rst  $38
SRA0:BBD5 FF               rst  $38
SRA0:BBD6 FF               rst  $38
SRA0:BBD7 FF               rst  $38
SRA0:BBD8 FF               rst  $38
SRA0:BBD9 FF               rst  $38
SRA0:BBDA FF               rst  $38
SRA0:BBDB FF               rst  $38
SRA0:BBDC FF               rst  $38
SRA0:BBDD FF               rst  $38
SRA0:BBDE FF               rst  $38
SRA0:BBDF FF               rst  $38
SRA0:BBE0 FF               rst  $38
SRA0:BBE1 FF               rst  $38
SRA0:BBE2 FF               rst  $38
SRA0:BBE3 FF               rst  $38
SRA0:BBE4 FF               rst  $38
SRA0:BBE5 FF               rst  $38
SRA0:BBE6 FF               rst  $38
SRA0:BBE7 FF               rst  $38
SRA0:BBE8 FF               rst  $38
SRA0:BBE9 FF               rst  $38
SRA0:BBEA FF               rst  $38
SRA0:BBEB FF               rst  $38
SRA0:BBEC FF               rst  $38
SRA0:BBED FF               rst  $38
SRA0:BBEE FF               rst  $38
SRA0:BBEF FF               rst  $38
SRA0:BBF0 FF               rst  $38
SRA0:BBF1 FF               rst  $38
SRA0:BBF2 FF               rst  $38
SRA0:BBF3 FF               rst  $38
SRA0:BBF4 FF               rst  $38
SRA0:BBF5 FF               rst  $38
SRA0:BBF6 FF               rst  $38
SRA0:BBF7 FF               rst  $38
SRA0:BBF8 FF               rst  $38
SRA0:BBF9 FF               rst  $38
SRA0:BBFA FF               rst  $38
SRA0:BBFB FF               rst  $38
SRA0:BBFC FF               rst  $38
SRA0:BBFD FF               rst  $38
SRA0:BBFE FF               rst  $38
SRA0:BBFF FF               rst  $38
SRA0:BC00 FF               rst  $38
SRA0:BC01 FF               rst  $38
SRA0:BC02 FF               rst  $38
SRA0:BC03 FF               rst  $38
SRA0:BC04 FF               rst  $38
SRA0:BC05 FF               rst  $38
SRA0:BC06 FF               rst  $38
SRA0:BC07 FF               rst  $38
SRA0:BC08 FF               rst  $38
SRA0:BC09 FF               rst  $38
SRA0:BC0A FF               rst  $38
SRA0:BC0B FF               rst  $38
SRA0:BC0C FF               rst  $38
SRA0:BC0D FF               rst  $38
SRA0:BC0E FF               rst  $38
SRA0:BC0F FF               rst  $38
SRA0:BC10 FF               rst  $38
SRA0:BC11 FF               rst  $38
SRA0:BC12 FF               rst  $38
SRA0:BC13 FF               rst  $38
SRA0:BC14 FF               rst  $38
SRA0:BC15 FF               rst  $38
SRA0:BC16 FF               rst  $38
SRA0:BC17 FF               rst  $38
SRA0:BC18 FF               rst  $38
SRA0:BC19 FF               rst  $38
SRA0:BC1A FF               rst  $38
SRA0:BC1B FF               rst  $38
SRA0:BC1C FF               rst  $38
SRA0:BC1D FF               rst  $38
SRA0:BC1E FF               rst  $38
SRA0:BC1F FF               rst  $38
SRA0:BC20 FF               rst  $38
SRA0:BC21 FF               rst  $38
SRA0:BC22 FF               rst  $38
SRA0:BC23 FF               rst  $38
SRA0:BC24 FF               rst  $38
SRA0:BC25 FF               rst  $38
SRA0:BC26 FF               rst  $38
SRA0:BC27 FF               rst  $38
SRA0:BC28 FF               rst  $38
SRA0:BC29 FF               rst  $38
SRA0:BC2A FF               rst  $38
SRA0:BC2B FF               rst  $38
SRA0:BC2C FF               rst  $38
SRA0:BC2D FF               rst  $38
SRA0:BC2E FF               rst  $38
SRA0:BC2F FF               rst  $38
SRA0:BC30 FF               rst  $38
SRA0:BC31 FF               rst  $38
SRA0:BC32 FF               rst  $38
SRA0:BC33 FF               rst  $38
SRA0:BC34 FF               rst  $38
SRA0:BC35 FF               rst  $38
SRA0:BC36 FF               rst  $38
SRA0:BC37 FF               rst  $38
SRA0:BC38 FF               rst  $38
SRA0:BC39 FF               rst  $38
SRA0:BC3A FF               rst  $38
SRA0:BC3B FF               rst  $38
SRA0:BC3C FF               rst  $38
SRA0:BC3D FF               rst  $38
SRA0:BC3E FF               rst  $38
SRA0:BC3F FF               rst  $38
SRA0:BC40 FF               rst  $38
SRA0:BC41 FF               rst  $38
SRA0:BC42 FF               rst  $38
SRA0:BC43 FF               rst  $38
SRA0:BC44 FF               rst  $38
SRA0:BC45 FF               rst  $38
SRA0:BC46 FF               rst  $38
SRA0:BC47 FF               rst  $38
SRA0:BC48 FF               rst  $38
SRA0:BC49 FF               rst  $38
SRA0:BC4A FF               rst  $38
SRA0:BC4B FF               rst  $38
SRA0:BC4C FF               rst  $38
SRA0:BC4D FF               rst  $38
SRA0:BC4E FF               rst  $38
SRA0:BC4F FF               rst  $38
SRA0:BC50 FF               rst  $38
SRA0:BC51 FF               rst  $38
SRA0:BC52 FF               rst  $38
SRA0:BC53 FF               rst  $38
SRA0:BC54 FF               rst  $38
SRA0:BC55 FF               rst  $38
SRA0:BC56 FF               rst  $38
SRA0:BC57 FF               rst  $38
SRA0:BC58 FF               rst  $38
SRA0:BC59 FF               rst  $38
SRA0:BC5A FF               rst  $38
SRA0:BC5B FF               rst  $38
SRA0:BC5C FF               rst  $38
SRA0:BC5D FF               rst  $38
SRA0:BC5E FF               rst  $38
SRA0:BC5F FF               rst  $38
SRA0:BC60 FF               rst  $38
SRA0:BC61 FF               rst  $38
SRA0:BC62 FF               rst  $38
SRA0:BC63 FF               rst  $38
SRA0:BC64 FF               rst  $38
SRA0:BC65 FF               rst  $38
SRA0:BC66 FF               rst  $38
SRA0:BC67 FF               rst  $38
SRA0:BC68 FF               rst  $38
SRA0:BC69 FF               rst  $38
SRA0:BC6A FF               rst  $38
SRA0:BC6B FF               rst  $38
SRA0:BC6C FF               rst  $38
SRA0:BC6D FF               rst  $38
SRA0:BC6E FF               rst  $38
SRA0:BC6F FF               rst  $38
SRA0:BC70 FF               rst  $38
SRA0:BC71 FF               rst  $38
SRA0:BC72 FF               rst  $38
SRA0:BC73 FF               rst  $38
SRA0:BC74 FF               rst  $38
SRA0:BC75 FF               rst  $38
SRA0:BC76 FF               rst  $38
SRA0:BC77 FF               rst  $38
SRA0:BC78 FF               rst  $38
SRA0:BC79 FF               rst  $38
SRA0:BC7A FF               rst  $38
SRA0:BC7B FF               rst  $38
SRA0:BC7C FF               rst  $38
SRA0:BC7D FF               rst  $38
SRA0:BC7E FF               rst  $38
SRA0:BC7F FF               rst  $38
SRA0:BC80 FF               rst  $38
SRA0:BC81 FF               rst  $38
SRA0:BC82 FF               rst  $38
SRA0:BC83 FF               rst  $38
SRA0:BC84 FF               rst  $38
SRA0:BC85 FF               rst  $38
SRA0:BC86 FF               rst  $38
SRA0:BC87 FF               rst  $38
SRA0:BC88 FF               rst  $38
SRA0:BC89 FF               rst  $38
SRA0:BC8A FF               rst  $38
SRA0:BC8B FF               rst  $38
SRA0:BC8C FF               rst  $38
SRA0:BC8D FF               rst  $38
SRA0:BC8E FF               rst  $38
SRA0:BC8F FF               rst  $38
SRA0:BC90 FF               rst  $38
SRA0:BC91 FF               rst  $38
SRA0:BC92 FF               rst  $38
SRA0:BC93 FF               rst  $38
SRA0:BC94 FF               rst  $38
SRA0:BC95 FF               rst  $38
SRA0:BC96 FF               rst  $38
SRA0:BC97 FF               rst  $38
SRA0:BC98 FF               rst  $38
SRA0:BC99 FF               rst  $38
SRA0:BC9A FF               rst  $38
SRA0:BC9B FF               rst  $38
SRA0:BC9C FF               rst  $38
SRA0:BC9D FF               rst  $38
SRA0:BC9E FF               rst  $38
SRA0:BC9F FF               rst  $38
SRA0:BCA0 FF               rst  $38
SRA0:BCA1 FF               rst  $38
SRA0:BCA2 FF               rst  $38
SRA0:BCA3 FF               rst  $38
SRA0:BCA4 FF               rst  $38
SRA0:BCA5 FF               rst  $38
SRA0:BCA6 FF               rst  $38
SRA0:BCA7 FF               rst  $38
SRA0:BCA8 FF               rst  $38
SRA0:BCA9 FF               rst  $38
SRA0:BCAA FF               rst  $38
SRA0:BCAB FF               rst  $38
SRA0:BCAC FF               rst  $38
SRA0:BCAD FF               rst  $38
SRA0:BCAE FF               rst  $38
SRA0:BCAF FF               rst  $38
SRA0:BCB0 FF               rst  $38
SRA0:BCB1 FF               rst  $38
SRA0:BCB2 FF               rst  $38
SRA0:BCB3 FF               rst  $38
SRA0:BCB4 FF               rst  $38
SRA0:BCB5 FF               rst  $38
SRA0:BCB6 FF               rst  $38
SRA0:BCB7 FF               rst  $38
SRA0:BCB8 FF               rst  $38
SRA0:BCB9 FF               rst  $38
SRA0:BCBA FF               rst  $38
SRA0:BCBB FF               rst  $38
SRA0:BCBC FF               rst  $38
SRA0:BCBD FF               rst  $38
SRA0:BCBE FF               rst  $38
SRA0:BCBF FF               rst  $38
SRA0:BCC0 FF               rst  $38
SRA0:BCC1 FF               rst  $38
SRA0:BCC2 FF               rst  $38
SRA0:BCC3 FF               rst  $38
SRA0:BCC4 FF               rst  $38
SRA0:BCC5 FF               rst  $38
SRA0:BCC6 FF               rst  $38
SRA0:BCC7 FF               rst  $38
SRA0:BCC8 FF               rst  $38
SRA0:BCC9 FF               rst  $38
SRA0:BCCA FF               rst  $38
SRA0:BCCB FF               rst  $38
SRA0:BCCC FF               rst  $38
SRA0:BCCD FF               rst  $38
SRA0:BCCE FF               rst  $38
SRA0:BCCF FF               rst  $38
SRA0:BCD0 FF               rst  $38
SRA0:BCD1 FF               rst  $38
SRA0:BCD2 FF               rst  $38
SRA0:BCD3 FF               rst  $38
SRA0:BCD4 FF               rst  $38
SRA0:BCD5 FF               rst  $38
SRA0:BCD6 FF               rst  $38
SRA0:BCD7 FF               rst  $38
SRA0:BCD8 FF               rst  $38
SRA0:BCD9 FF               rst  $38
SRA0:BCDA FF               rst  $38
SRA0:BCDB FF               rst  $38
SRA0:BCDC FF               rst  $38
SRA0:BCDD FF               rst  $38
SRA0:BCDE FF               rst  $38
SRA0:BCDF FF               rst  $38
SRA0:BCE0 FF               rst  $38
SRA0:BCE1 FF               rst  $38
SRA0:BCE2 FF               rst  $38
SRA0:BCE3 FF               rst  $38
SRA0:BCE4 FF               rst  $38
SRA0:BCE5 FF               rst  $38
SRA0:BCE6 FF               rst  $38
SRA0:BCE7 FF               rst  $38
SRA0:BCE8 FF               rst  $38
SRA0:BCE9 FF               rst  $38
SRA0:BCEA FF               rst  $38
SRA0:BCEB FF               rst  $38
SRA0:BCEC FF               rst  $38
SRA0:BCED FF               rst  $38
SRA0:BCEE FF               rst  $38
SRA0:BCEF FF               rst  $38
SRA0:BCF0 FF               rst  $38
SRA0:BCF1 FF               rst  $38
SRA0:BCF2 FF               rst  $38
SRA0:BCF3 FF               rst  $38
SRA0:BCF4 FF               rst  $38
SRA0:BCF5 FF               rst  $38
SRA0:BCF6 FF               rst  $38
SRA0:BCF7 FF               rst  $38
SRA0:BCF8 FF               rst  $38
SRA0:BCF9 FF               rst  $38
SRA0:BCFA FF               rst  $38
SRA0:BCFB FF               rst  $38
SRA0:BCFC FF               rst  $38
SRA0:BCFD FF               rst  $38
SRA0:BCFE FF               rst  $38
SRA0:BCFF FF               rst  $38
SRA0:BD00 FF               rst  $38
SRA0:BD01 FF               rst  $38
SRA0:BD02 FF               rst  $38
SRA0:BD03 FF               rst  $38
SRA0:BD04 FF               rst  $38
SRA0:BD05 FF               rst  $38
SRA0:BD06 FF               rst  $38
SRA0:BD07 FF               rst  $38
SRA0:BD08 FF               rst  $38
SRA0:BD09 FF               rst  $38
SRA0:BD0A FF               rst  $38
SRA0:BD0B FF               rst  $38
SRA0:BD0C FF               rst  $38
SRA0:BD0D FF               rst  $38
SRA0:BD0E FF               rst  $38
SRA0:BD0F FF               rst  $38
SRA0:BD10 FF               rst  $38
SRA0:BD11 FF               rst  $38
SRA0:BD12 FF               rst  $38
SRA0:BD13 FF               rst  $38
SRA0:BD14 FF               rst  $38
SRA0:BD15 FF               rst  $38
SRA0:BD16 FF               rst  $38
SRA0:BD17 FF               rst  $38
SRA0:BD18 FF               rst  $38
SRA0:BD19 FF               rst  $38
SRA0:BD1A FF               rst  $38
SRA0:BD1B FF               rst  $38
SRA0:BD1C FF               rst  $38
SRA0:BD1D FF               rst  $38
SRA0:BD1E FF               rst  $38
SRA0:BD1F FF               rst  $38
SRA0:BD20 FF               rst  $38
SRA0:BD21 FF               rst  $38
SRA0:BD22 FF               rst  $38
SRA0:BD23 FF               rst  $38
SRA0:BD24 FF               rst  $38
SRA0:BD25 FF               rst  $38
SRA0:BD26 FF               rst  $38
SRA0:BD27 FF               rst  $38
SRA0:BD28 FF               rst  $38
SRA0:BD29 FF               rst  $38
SRA0:BD2A FF               rst  $38
SRA0:BD2B FF               rst  $38
SRA0:BD2C FF               rst  $38
SRA0:BD2D FF               rst  $38
SRA0:BD2E FF               rst  $38
SRA0:BD2F FF               rst  $38
SRA0:BD30 FF               rst  $38
SRA0:BD31 FF               rst  $38
SRA0:BD32 FF               rst  $38
SRA0:BD33 FF               rst  $38
SRA0:BD34 FF               rst  $38
SRA0:BD35 FF               rst  $38
SRA0:BD36 FF               rst  $38
SRA0:BD37 FF               rst  $38
SRA0:BD38 FF               rst  $38
SRA0:BD39 FF               rst  $38
SRA0:BD3A FF               rst  $38
SRA0:BD3B FF               rst  $38
SRA0:BD3C FF               rst  $38
SRA0:BD3D FF               rst  $38
SRA0:BD3E FF               rst  $38
SRA0:BD3F FF               rst  $38
SRA0:BD40 FF               rst  $38
SRA0:BD41 FF               rst  $38
SRA0:BD42 FF               rst  $38
SRA0:BD43 FF               rst  $38
SRA0:BD44 FF               rst  $38
SRA0:BD45 FF               rst  $38
SRA0:BD46 FF               rst  $38
SRA0:BD47 FF               rst  $38
SRA0:BD48 FF               rst  $38
SRA0:BD49 FF               rst  $38
SRA0:BD4A FF               rst  $38
SRA0:BD4B FF               rst  $38
SRA0:BD4C FF               rst  $38
SRA0:BD4D FF               rst  $38
SRA0:BD4E FF               rst  $38
SRA0:BD4F FF               rst  $38
SRA0:BD50 FF               rst  $38
SRA0:BD51 FF               rst  $38
SRA0:BD52 FF               rst  $38
SRA0:BD53 FF               rst  $38
SRA0:BD54 FF               rst  $38
SRA0:BD55 FF               rst  $38
SRA0:BD56 FF               rst  $38
SRA0:BD57 FF               rst  $38
SRA0:BD58 FF               rst  $38
SRA0:BD59 FF               rst  $38
SRA0:BD5A FF               rst  $38
SRA0:BD5B FF               rst  $38
SRA0:BD5C FF               rst  $38
SRA0:BD5D FF               rst  $38
SRA0:BD5E FF               rst  $38
SRA0:BD5F FF               rst  $38
SRA0:BD60 FF               rst  $38
SRA0:BD61 FF               rst  $38
SRA0:BD62 FF               rst  $38
SRA0:BD63 FF               rst  $38
SRA0:BD64 FF               rst  $38
SRA0:BD65 FF               rst  $38
SRA0:BD66 FF               rst  $38
SRA0:BD67 FF               rst  $38
SRA0:BD68 FF               rst  $38
SRA0:BD69 FF               rst  $38
SRA0:BD6A FF               rst  $38
SRA0:BD6B FF               rst  $38
SRA0:BD6C FF               rst  $38
SRA0:BD6D FF               rst  $38
SRA0:BD6E FF               rst  $38
SRA0:BD6F FF               rst  $38
SRA0:BD70 FF               rst  $38
SRA0:BD71 FF               rst  $38
SRA0:BD72 FF               rst  $38
SRA0:BD73 FF               rst  $38
SRA0:BD74 FF               rst  $38
SRA0:BD75 FF               rst  $38
SRA0:BD76 FF               rst  $38
SRA0:BD77 FF               rst  $38
SRA0:BD78 FF               rst  $38
SRA0:BD79 FF               rst  $38
SRA0:BD7A FF               rst  $38
SRA0:BD7B FF               rst  $38
SRA0:BD7C FF               rst  $38
SRA0:BD7D FF               rst  $38
SRA0:BD7E FF               rst  $38
SRA0:BD7F FF               rst  $38
SRA0:BD80 FF               rst  $38
SRA0:BD81 FF               rst  $38
SRA0:BD82 FF               rst  $38
SRA0:BD83 FF               rst  $38
SRA0:BD84 FF               rst  $38
SRA0:BD85 FF               rst  $38
SRA0:BD86 FF               rst  $38
SRA0:BD87 FF               rst  $38
SRA0:BD88 FF               rst  $38
SRA0:BD89 FF               rst  $38
SRA0:BD8A FF               rst  $38
SRA0:BD8B FF               rst  $38
SRA0:BD8C FF               rst  $38
SRA0:BD8D FF               rst  $38
SRA0:BD8E FF               rst  $38
SRA0:BD8F FF               rst  $38
SRA0:BD90 FF               rst  $38
SRA0:BD91 FF               rst  $38
SRA0:BD92 FF               rst  $38
SRA0:BD93 FF               rst  $38
SRA0:BD94 FF               rst  $38
SRA0:BD95 FF               rst  $38
SRA0:BD96 FF               rst  $38
SRA0:BD97 FF               rst  $38
SRA0:BD98 FF               rst  $38
SRA0:BD99 FF               rst  $38
SRA0:BD9A FF               rst  $38
SRA0:BD9B FF               rst  $38
SRA0:BD9C FF               rst  $38
SRA0:BD9D FF               rst  $38
SRA0:BD9E FF               rst  $38
SRA0:BD9F FF               rst  $38
SRA0:BDA0 FF               rst  $38
SRA0:BDA1 FF               rst  $38
SRA0:BDA2 FF               rst  $38
SRA0:BDA3 FF               rst  $38
SRA0:BDA4 FF               rst  $38
SRA0:BDA5 FF               rst  $38
SRA0:BDA6 FF               rst  $38
SRA0:BDA7 FF               rst  $38
SRA0:BDA8 FF               rst  $38
SRA0:BDA9 FF               rst  $38
SRA0:BDAA FF               rst  $38
SRA0:BDAB FF               rst  $38
SRA0:BDAC FF               rst  $38
SRA0:BDAD FF               rst  $38
SRA0:BDAE FF               rst  $38
SRA0:BDAF FF               rst  $38
SRA0:BDB0 FF               rst  $38
SRA0:BDB1 FF               rst  $38
SRA0:BDB2 FF               rst  $38
SRA0:BDB3 FF               rst  $38
SRA0:BDB4 FF               rst  $38
SRA0:BDB5 FF               rst  $38
SRA0:BDB6 FF               rst  $38
SRA0:BDB7 FF               rst  $38
SRA0:BDB8 FF               rst  $38
SRA0:BDB9 FF               rst  $38
SRA0:BDBA FF               rst  $38
SRA0:BDBB FF               rst  $38
SRA0:BDBC FF               rst  $38
SRA0:BDBD FF               rst  $38
SRA0:BDBE FF               rst  $38
SRA0:BDBF FF               rst  $38
SRA0:BDC0 FF               rst  $38
SRA0:BDC1 FF               rst  $38
SRA0:BDC2 FF               rst  $38
SRA0:BDC3 FF               rst  $38
SRA0:BDC4 FF               rst  $38
SRA0:BDC5 FF               rst  $38
SRA0:BDC6 FF               rst  $38
SRA0:BDC7 FF               rst  $38
SRA0:BDC8 FF               rst  $38
SRA0:BDC9 FF               rst  $38
SRA0:BDCA FF               rst  $38
SRA0:BDCB FF               rst  $38
SRA0:BDCC FF               rst  $38
SRA0:BDCD FF               rst  $38
SRA0:BDCE FF               rst  $38
SRA0:BDCF FF               rst  $38
SRA0:BDD0 FF               rst  $38
SRA0:BDD1 FF               rst  $38
SRA0:BDD2 FF               rst  $38
SRA0:BDD3 FF               rst  $38
SRA0:BDD4 FF               rst  $38
SRA0:BDD5 FF               rst  $38
SRA0:BDD6 FF               rst  $38
SRA0:BDD7 FF               rst  $38
SRA0:BDD8 FF               rst  $38
SRA0:BDD9 FF               rst  $38
SRA0:BDDA FF               rst  $38
SRA0:BDDB FF               rst  $38
SRA0:BDDC FF               rst  $38
SRA0:BDDD FF               rst  $38
SRA0:BDDE FF               rst  $38
SRA0:BDDF FF               rst  $38
SRA0:BDE0 FF               rst  $38
SRA0:BDE1 FF               rst  $38
SRA0:BDE2 FF               rst  $38
SRA0:BDE3 FF               rst  $38
SRA0:BDE4 FF               rst  $38
SRA0:BDE5 FF               rst  $38
SRA0:BDE6 FF               rst  $38
SRA0:BDE7 FF               rst  $38
SRA0:BDE8 FF               rst  $38
SRA0:BDE9 FF               rst  $38
SRA0:BDEA FF               rst  $38
SRA0:BDEB FF               rst  $38
SRA0:BDEC FF               rst  $38
SRA0:BDED FF               rst  $38
SRA0:BDEE FF               rst  $38
SRA0:BDEF FF               rst  $38
SRA0:BDF0 FF               rst  $38
SRA0:BDF1 FF               rst  $38
SRA0:BDF2 FF               rst  $38
SRA0:BDF3 FF               rst  $38
SRA0:BDF4 FF               rst  $38
SRA0:BDF5 FF               rst  $38
SRA0:BDF6 FF               rst  $38
SRA0:BDF7 FF               rst  $38
SRA0:BDF8 FF               rst  $38
SRA0:BDF9 FF               rst  $38
SRA0:BDFA FF               rst  $38
SRA0:BDFB FF               rst  $38
SRA0:BDFC FF               rst  $38
SRA0:BDFD FF               rst  $38
SRA0:BDFE FF               rst  $38
SRA0:BDFF FF               rst  $38
SRA0:BE00 FF               rst  $38
SRA0:BE01 FF               rst  $38
SRA0:BE02 FF               rst  $38
SRA0:BE03 FF               rst  $38
SRA0:BE04 FF               rst  $38
SRA0:BE05 FF               rst  $38
SRA0:BE06 FF               rst  $38
SRA0:BE07 FF               rst  $38
SRA0:BE08 FF               rst  $38
SRA0:BE09 FF               rst  $38
SRA0:BE0A FF               rst  $38
SRA0:BE0B FF               rst  $38
SRA0:BE0C FF               rst  $38
SRA0:BE0D FF               rst  $38
SRA0:BE0E FF               rst  $38
SRA0:BE0F FF               rst  $38
SRA0:BE10 FF               rst  $38
SRA0:BE11 FF               rst  $38
SRA0:BE12 FF               rst  $38
SRA0:BE13 FF               rst  $38
SRA0:BE14 FF               rst  $38
SRA0:BE15 FF               rst  $38
SRA0:BE16 FF               rst  $38
SRA0:BE17 FF               rst  $38
SRA0:BE18 FF               rst  $38
SRA0:BE19 FF               rst  $38
SRA0:BE1A FF               rst  $38
SRA0:BE1B FF               rst  $38
SRA0:BE1C FF               rst  $38
SRA0:BE1D FF               rst  $38
SRA0:BE1E FF               rst  $38
SRA0:BE1F FF               rst  $38
SRA0:BE20 FF               rst  $38
SRA0:BE21 FF               rst  $38
SRA0:BE22 FF               rst  $38
SRA0:BE23 FF               rst  $38
SRA0:BE24 FF               rst  $38
SRA0:BE25 FF               rst  $38
SRA0:BE26 FF               rst  $38
SRA0:BE27 FF               rst  $38
SRA0:BE28 FF               rst  $38
SRA0:BE29 FF               rst  $38
SRA0:BE2A FF               rst  $38
SRA0:BE2B FF               rst  $38
SRA0:BE2C FF               rst  $38
SRA0:BE2D FF               rst  $38
SRA0:BE2E FF               rst  $38
SRA0:BE2F FF               rst  $38
SRA0:BE30 FF               rst  $38
SRA0:BE31 FF               rst  $38
SRA0:BE32 FF               rst  $38
SRA0:BE33 FF               rst  $38
SRA0:BE34 FF               rst  $38
SRA0:BE35 FF               rst  $38
SRA0:BE36 FF               rst  $38
SRA0:BE37 FF               rst  $38
SRA0:BE38 FF               rst  $38
SRA0:BE39 FF               rst  $38
SRA0:BE3A FF               rst  $38
SRA0:BE3B FF               rst  $38
SRA0:BE3C FF               rst  $38
SRA0:BE3D FF               rst  $38
SRA0:BE3E FF               rst  $38
SRA0:BE3F FF               rst  $38
SRA0:BE40 FF               rst  $38
SRA0:BE41 FF               rst  $38
SRA0:BE42 FF               rst  $38
SRA0:BE43 FF               rst  $38
SRA0:BE44 FF               rst  $38
SRA0:BE45 FF               rst  $38
SRA0:BE46 FF               rst  $38
SRA0:BE47 FF               rst  $38
SRA0:BE48 FF               rst  $38
SRA0:BE49 FF               rst  $38
SRA0:BE4A FF               rst  $38
SRA0:BE4B FF               rst  $38
SRA0:BE4C FF               rst  $38
SRA0:BE4D FF               rst  $38
SRA0:BE4E FF               rst  $38
SRA0:BE4F FF               rst  $38
SRA0:BE50 FF               rst  $38
SRA0:BE51 FF               rst  $38
SRA0:BE52 FF               rst  $38
SRA0:BE53 FF               rst  $38
SRA0:BE54 FF               rst  $38
SRA0:BE55 FF               rst  $38
SRA0:BE56 FF               rst  $38
SRA0:BE57 FF               rst  $38
SRA0:BE58 FF               rst  $38
SRA0:BE59 FF               rst  $38
SRA0:BE5A FF               rst  $38
SRA0:BE5B FF               rst  $38
SRA0:BE5C FF               rst  $38
SRA0:BE5D FF               rst  $38
SRA0:BE5E FF               rst  $38
SRA0:BE5F FF               rst  $38
SRA0:BE60 FF               rst  $38
SRA0:BE61 FF               rst  $38
SRA0:BE62 FF               rst  $38
SRA0:BE63 FF               rst  $38
SRA0:BE64 FF               rst  $38
SRA0:BE65 FF               rst  $38
SRA0:BE66 FF               rst  $38
SRA0:BE67 FF               rst  $38
SRA0:BE68 FF               rst  $38
SRA0:BE69 FF               rst  $38
SRA0:BE6A FF               rst  $38
SRA0:BE6B FF               rst  $38
SRA0:BE6C FF               rst  $38
SRA0:BE6D FF               rst  $38
SRA0:BE6E FF               rst  $38
SRA0:BE6F FF               rst  $38
SRA0:BE70 FF               rst  $38
SRA0:BE71 FF               rst  $38
SRA0:BE72 FF               rst  $38
SRA0:BE73 FF               rst  $38
SRA0:BE74 FF               rst  $38
SRA0:BE75 FF               rst  $38
SRA0:BE76 FF               rst  $38
SRA0:BE77 FF               rst  $38
SRA0:BE78 FF               rst  $38
SRA0:BE79 FF               rst  $38
SRA0:BE7A FF               rst  $38
SRA0:BE7B FF               rst  $38
SRA0:BE7C FF               rst  $38
SRA0:BE7D FF               rst  $38
SRA0:BE7E FF               rst  $38
SRA0:BE7F FF               rst  $38
SRA0:BE80 FF               rst  $38
SRA0:BE81 FF               rst  $38
SRA0:BE82 FF               rst  $38
SRA0:BE83 FF               rst  $38
SRA0:BE84 FF               rst  $38
SRA0:BE85 FF               rst  $38
SRA0:BE86 FF               rst  $38
SRA0:BE87 FF               rst  $38
SRA0:BE88 FF               rst  $38
SRA0:BE89 FF               rst  $38
SRA0:BE8A FF               rst  $38
SRA0:BE8B FF               rst  $38
SRA0:BE8C FF               rst  $38
SRA0:BE8D FF               rst  $38
SRA0:BE8E FF               rst  $38
SRA0:BE8F FF               rst  $38
SRA0:BE90 FF               rst  $38
SRA0:BE91 FF               rst  $38
SRA0:BE92 FF               rst  $38
SRA0:BE93 FF               rst  $38
SRA0:BE94 FF               rst  $38
SRA0:BE95 FF               rst  $38
SRA0:BE96 FF               rst  $38
SRA0:BE97 FF               rst  $38
SRA0:BE98 FF               rst  $38
SRA0:BE99 FF               rst  $38
SRA0:BE9A FF               rst  $38
SRA0:BE9B FF               rst  $38
SRA0:BE9C FF               rst  $38
SRA0:BE9D FF               rst  $38
SRA0:BE9E FF               rst  $38
SRA0:BE9F FF               rst  $38
SRA0:BEA0 FF               rst  $38
SRA0:BEA1 FF               rst  $38
SRA0:BEA2 FF               rst  $38
SRA0:BEA3 FF               rst  $38
SRA0:BEA4 FF               rst  $38
SRA0:BEA5 FF               rst  $38
SRA0:BEA6 FF               rst  $38
SRA0:BEA7 FF               rst  $38
SRA0:BEA8 FF               rst  $38
SRA0:BEA9 FF               rst  $38
SRA0:BEAA FF               rst  $38
SRA0:BEAB FF               rst  $38
SRA0:BEAC FF               rst  $38
SRA0:BEAD FF               rst  $38
SRA0:BEAE FF               rst  $38
SRA0:BEAF FF               rst  $38
SRA0:BEB0 FF               rst  $38
SRA0:BEB1 FF               rst  $38
SRA0:BEB2 FF               rst  $38
SRA0:BEB3 FF               rst  $38
SRA0:BEB4 FF               rst  $38
SRA0:BEB5 FF               rst  $38
SRA0:BEB6 FF               rst  $38
SRA0:BEB7 FF               rst  $38
SRA0:BEB8 FF               rst  $38
SRA0:BEB9 FF               rst  $38
SRA0:BEBA FF               rst  $38
SRA0:BEBB FF               rst  $38
SRA0:BEBC FF               rst  $38
SRA0:BEBD FF               rst  $38
SRA0:BEBE FF               rst  $38
SRA0:BEBF FF               rst  $38
SRA0:BEC0 FF               rst  $38
SRA0:BEC1 FF               rst  $38
SRA0:BEC2 FF               rst  $38
SRA0:BEC3 FF               rst  $38
SRA0:BEC4 FF               rst  $38
SRA0:BEC5 FF               rst  $38
SRA0:BEC6 FF               rst  $38
SRA0:BEC7 FF               rst  $38
SRA0:BEC8 FF               rst  $38
SRA0:BEC9 FF               rst  $38
SRA0:BECA FF               rst  $38
SRA0:BECB FF               rst  $38
SRA0:BECC FF               rst  $38
SRA0:BECD FF               rst  $38
SRA0:BECE FF               rst  $38
SRA0:BECF FF               rst  $38
SRA0:BED0 FF               rst  $38
SRA0:BED1 FF               rst  $38
SRA0:BED2 FF               rst  $38
SRA0:BED3 FF               rst  $38
SRA0:BED4 FF               rst  $38
SRA0:BED5 FF               rst  $38
SRA0:BED6 FF               rst  $38
SRA0:BED7 FF               rst  $38
SRA0:BED8 FF               rst  $38
SRA0:BED9 FF               rst  $38
SRA0:BEDA FF               rst  $38
SRA0:BEDB FF               rst  $38
SRA0:BEDC FF               rst  $38
SRA0:BEDD FF               rst  $38
SRA0:BEDE FF               rst  $38
SRA0:BEDF FF               rst  $38
SRA0:BEE0 FF               rst  $38
SRA0:BEE1 FF               rst  $38
SRA0:BEE2 FF               rst  $38
SRA0:BEE3 FF               rst  $38
SRA0:BEE4 FF               rst  $38
SRA0:BEE5 FF               rst  $38
SRA0:BEE6 FF               rst  $38
SRA0:BEE7 FF               rst  $38
SRA0:BEE8 FF               rst  $38
SRA0:BEE9 FF               rst  $38
SRA0:BEEA FF               rst  $38
SRA0:BEEB FF               rst  $38
SRA0:BEEC FF               rst  $38
SRA0:BEED FF               rst  $38
SRA0:BEEE FF               rst  $38
SRA0:BEEF FF               rst  $38
SRA0:BEF0 FF               rst  $38
SRA0:BEF1 FF               rst  $38
SRA0:BEF2 FF               rst  $38
SRA0:BEF3 FF               rst  $38
SRA0:BEF4 FF               rst  $38
SRA0:BEF5 FF               rst  $38
SRA0:BEF6 FF               rst  $38
SRA0:BEF7 FF               rst  $38
SRA0:BEF8 FF               rst  $38
SRA0:BEF9 FF               rst  $38
SRA0:BEFA FF               rst  $38
SRA0:BEFB FF               rst  $38
SRA0:BEFC FF               rst  $38
SRA0:BEFD FF               rst  $38
SRA0:BEFE FF               rst  $38
SRA0:BEFF FF               rst  $38
SRA0:BF00 FF               rst  $38
SRA0:BF01 FF               rst  $38
SRA0:BF02 FF               rst  $38
SRA0:BF03 FF               rst  $38
SRA0:BF04 FF               rst  $38
SRA0:BF05 FF               rst  $38
SRA0:BF06 FF               rst  $38
SRA0:BF07 FF               rst  $38
SRA0:BF08 FF               rst  $38
SRA0:BF09 FF               rst  $38
SRA0:BF0A FF               rst  $38
SRA0:BF0B FF               rst  $38
SRA0:BF0C FF               rst  $38
SRA0:BF0D FF               rst  $38
SRA0:BF0E FF               rst  $38
SRA0:BF0F FF               rst  $38
SRA0:BF10 FF               rst  $38
SRA0:BF11 FF               rst  $38
SRA0:BF12 FF               rst  $38
SRA0:BF13 FF               rst  $38
SRA0:BF14 FF               rst  $38
SRA0:BF15 FF               rst  $38
SRA0:BF16 FF               rst  $38
SRA0:BF17 FF               rst  $38
SRA0:BF18 FF               rst  $38
SRA0:BF19 FF               rst  $38
SRA0:BF1A FF               rst  $38
SRA0:BF1B FF               rst  $38
SRA0:BF1C FF               rst  $38
SRA0:BF1D FF               rst  $38
SRA0:BF1E FF               rst  $38
SRA0:BF1F FF               rst  $38
SRA0:BF20 FF               rst  $38
SRA0:BF21 FF               rst  $38
SRA0:BF22 FF               rst  $38
SRA0:BF23 FF               rst  $38
SRA0:BF24 FF               rst  $38
SRA0:BF25 FF               rst  $38
SRA0:BF26 FF               rst  $38
SRA0:BF27 FF               rst  $38
SRA0:BF28 FF               rst  $38
SRA0:BF29 FF               rst  $38
SRA0:BF2A FF               rst  $38
SRA0:BF2B FF               rst  $38
SRA0:BF2C FF               rst  $38
SRA0:BF2D FF               rst  $38
SRA0:BF2E FF               rst  $38
SRA0:BF2F FF               rst  $38
SRA0:BF30 FF               rst  $38
SRA0:BF31 FF               rst  $38
SRA0:BF32 FF               rst  $38
SRA0:BF33 FF               rst  $38
SRA0:BF34 FF               rst  $38
SRA0:BF35 FF               rst  $38
SRA0:BF36 FF               rst  $38
SRA0:BF37 FF               rst  $38
SRA0:BF38 FF               rst  $38
SRA0:BF39 FF               rst  $38
SRA0:BF3A FF               rst  $38
SRA0:BF3B FF               rst  $38
SRA0:BF3C FF               rst  $38
SRA0:BF3D FF               rst  $38
SRA0:BF3E FF               rst  $38
SRA0:BF3F FF               rst  $38
SRA0:BF40 FF               rst  $38
SRA0:BF41 FF               rst  $38
SRA0:BF42 FF               rst  $38
SRA0:BF43 FF               rst  $38
SRA0:BF44 FF               rst  $38
SRA0:BF45 FF               rst  $38
SRA0:BF46 FF               rst  $38
SRA0:BF47 FF               rst  $38
SRA0:BF48 FF               rst  $38
SRA0:BF49 FF               rst  $38
SRA0:BF4A FF               rst  $38
SRA0:BF4B FF               rst  $38
SRA0:BF4C FF               rst  $38
SRA0:BF4D FF               rst  $38
SRA0:BF4E FF               rst  $38
SRA0:BF4F FF               rst  $38
SRA0:BF50 FF               rst  $38
SRA0:BF51 FF               rst  $38
SRA0:BF52 FF               rst  $38
SRA0:BF53 FF               rst  $38
SRA0:BF54 FF               rst  $38
SRA0:BF55 FF               rst  $38
SRA0:BF56 FF               rst  $38
SRA0:BF57 FF               rst  $38
SRA0:BF58 FF               rst  $38
SRA0:BF59 FF               rst  $38
SRA0:BF5A FF               rst  $38
SRA0:BF5B FF               rst  $38
SRA0:BF5C FF               rst  $38
SRA0:BF5D FF               rst  $38
SRA0:BF5E FF               rst  $38
SRA0:BF5F FF               rst  $38
SRA0:BF60 FF               rst  $38
SRA0:BF61 FF               rst  $38
SRA0:BF62 FF               rst  $38
SRA0:BF63 FF               rst  $38
SRA0:BF64 FF               rst  $38
SRA0:BF65 FF               rst  $38
SRA0:BF66 FF               rst  $38
SRA0:BF67 FF               rst  $38
SRA0:BF68 FF               rst  $38
SRA0:BF69 FF               rst  $38
SRA0:BF6A FF               rst  $38
SRA0:BF6B FF               rst  $38
SRA0:BF6C FF               rst  $38
SRA0:BF6D FF               rst  $38
SRA0:BF6E FF               rst  $38
SRA0:BF6F FF               rst  $38
SRA0:BF70 FF               rst  $38
SRA0:BF71 FF               rst  $38
SRA0:BF72 FF               rst  $38
SRA0:BF73 FF               rst  $38
SRA0:BF74 FF               rst  $38
SRA0:BF75 FF               rst  $38
SRA0:BF76 FF               rst  $38
SRA0:BF77 FF               rst  $38
SRA0:BF78 FF               rst  $38
SRA0:BF79 FF               rst  $38
SRA0:BF7A FF               rst  $38
SRA0:BF7B FF               rst  $38
SRA0:BF7C FF               rst  $38
SRA0:BF7D FF               rst  $38
SRA0:BF7E FF               rst  $38
SRA0:BF7F FF               rst  $38
SRA0:BF80 FF               rst  $38
SRA0:BF81 FF               rst  $38
SRA0:BF82 FF               rst  $38
SRA0:BF83 FF               rst  $38
SRA0:BF84 FF               rst  $38
SRA0:BF85 FF               rst  $38
SRA0:BF86 FF               rst  $38
SRA0:BF87 FF               rst  $38
SRA0:BF88 FF               rst  $38
SRA0:BF89 FF               rst  $38
SRA0:BF8A FF               rst  $38
SRA0:BF8B FF               rst  $38
SRA0:BF8C FF               rst  $38
SRA0:BF8D FF               rst  $38
SRA0:BF8E FF               rst  $38
SRA0:BF8F FF               rst  $38
SRA0:BF90 FF               rst  $38
SRA0:BF91 FF               rst  $38
SRA0:BF92 FF               rst  $38
SRA0:BF93 FF               rst  $38
SRA0:BF94 FF               rst  $38
SRA0:BF95 FF               rst  $38
SRA0:BF96 FF               rst  $38
SRA0:BF97 FF               rst  $38
SRA0:BF98 FF               rst  $38
SRA0:BF99 FF               rst  $38
SRA0:BF9A FF               rst  $38
SRA0:BF9B FF               rst  $38
SRA0:BF9C FF               rst  $38
SRA0:BF9D FF               rst  $38
SRA0:BF9E FF               rst  $38
SRA0:BF9F FF               rst  $38
SRA0:BFA0 FF               rst  $38
SRA0:BFA1 FF               rst  $38
SRA0:BFA2 FF               rst  $38
SRA0:BFA3 FF               rst  $38
SRA0:BFA4 FF               rst  $38
SRA0:BFA5 FF               rst  $38
SRA0:BFA6 FF               rst  $38
SRA0:BFA7 FF               rst  $38
SRA0:BFA8 FF               rst  $38
SRA0:BFA9 FF               rst  $38
SRA0:BFAA FF               rst  $38
SRA0:BFAB FF               rst  $38
SRA0:BFAC FF               rst  $38
SRA0:BFAD FF               rst  $38
SRA0:BFAE FF               rst  $38
SRA0:BFAF FF               rst  $38
SRA0:BFB0 FF               rst  $38
SRA0:BFB1 FF               rst  $38
SRA0:BFB2 FF               rst  $38
SRA0:BFB3 FF               rst  $38
SRA0:BFB4 FF               rst  $38
SRA0:BFB5 FF               rst  $38
SRA0:BFB6 FF               rst  $38
SRA0:BFB7 FF               rst  $38
SRA0:BFB8 FF               rst  $38
SRA0:BFB9 FF               rst  $38
SRA0:BFBA FF               rst  $38
SRA0:BFBB FF               rst  $38
SRA0:BFBC FF               rst  $38
SRA0:BFBD FF               rst  $38
SRA0:BFBE FF               rst  $38
SRA0:BFBF FF               rst  $38
SRA0:BFC0 FF               rst  $38
SRA0:BFC1 FF               rst  $38
SRA0:BFC2 FF               rst  $38
SRA0:BFC3 FF               rst  $38
SRA0:BFC4 FF               rst  $38
SRA0:BFC5 FF               rst  $38
SRA0:BFC6 FF               rst  $38
SRA0:BFC7 FF               rst  $38
SRA0:BFC8 FF               rst  $38
SRA0:BFC9 FF               rst  $38
SRA0:BFCA FF               rst  $38
SRA0:BFCB FF               rst  $38
SRA0:BFCC FF               rst  $38
SRA0:BFCD FF               rst  $38
SRA0:BFCE FF               rst  $38
SRA0:BFCF FF               rst  $38
SRA0:BFD0 FF               rst  $38
SRA0:BFD1 FF               rst  $38
SRA0:BFD2 FF               rst  $38
SRA0:BFD3 FF               rst  $38
SRA0:BFD4 FF               rst  $38
SRA0:BFD5 FF               rst  $38
SRA0:BFD6 FF               rst  $38
SRA0:BFD7 FF               rst  $38
SRA0:BFD8 FF               rst  $38
SRA0:BFD9 FF               rst  $38
SRA0:BFDA FF               rst  $38
SRA0:BFDB FF               rst  $38
SRA0:BFDC FF               rst  $38
SRA0:BFDD FF               rst  $38
SRA0:BFDE FF               rst  $38
SRA0:BFDF FF               rst  $38
SRA0:BFE0 FF               rst  $38
SRA0:BFE1 FF               rst  $38
SRA0:BFE2 FF               rst  $38
SRA0:BFE3 FF               rst  $38
SRA0:BFE4 FF               rst  $38
SRA0:BFE5 FF               rst  $38
SRA0:BFE6 FF               rst  $38
SRA0:BFE7 FF               rst  $38
SRA0:BFE8 FF               rst  $38
SRA0:BFE9 FF               rst  $38
SRA0:BFEA FF               rst  $38
SRA0:BFEB FF               rst  $38
SRA0:BFEC FF               rst  $38
SRA0:BFED FF               rst  $38
SRA0:BFEE FF               rst  $38
SRA0:BFEF FF               rst  $38
SRA0:BFF0 FF               rst  $38
SRA0:BFF1 FF               rst  $38
SRA0:BFF2 FF               rst  $38
SRA0:BFF3 FF               rst  $38
SRA0:BFF4 FF               rst  $38
SRA0:BFF5 FF               rst  $38
SRA0:BFF6 FF               rst  $38
SRA0:BFF7 FF               rst  $38
SRA0:BFF8 FF               rst  $38
SRA0:BFF9 FF               rst  $38
SRA0:BFFA FF               rst  $38
SRA0:BFFB FF               rst  $38
SRA0:BFFC FF               rst  $38
SRA0:BFFD FF               rst  $38
SRA0:BFFE FF               rst  $38
SRA0:BFFF FF               rst  $38
WRA0:C000 C3 20 C2         jp   $C220
WRA0:C003 D6 05            sub  a,$05
WRA0:C005 30 FC            jr   nc,$C003
WRA0:C007 1F               rra  
WRA0:C008 30 00            jr   nc,$C00A
WRA0:C00A CE 01            adc  a,$01
WRA0:C00C D0               ret  nc
WRA0:C00D C8               ret  z
WRA0:C00E 00               nop  
WRA0:C00F C9               ret  
WRA0:C010 B7               or   a
WRA0:C011 C8               ret  z
WRA0:C012 F5               push af
WRA0:C013 3E DF            ld   a,$DF
WRA0:C015 CD 03 C0         call $C003
WRA0:C018 F1               pop  af
WRA0:C019 3D               dec  a
WRA0:C01A 20 F6            jr   nz,$C012
WRA0:C01C C9               ret  
WRA0:C01D B7               or   a
WRA0:C01E C8               ret  z
WRA0:C01F F5               push af
WRA0:C020 3E FF            ld   a,$FF
WRA0:C022 CD 12 C0         call $C012
WRA0:C025 3E D4            ld   a,$D4
WRA0:C027 CD 03 C0         call $C003
WRA0:C02A F1               pop  af
WRA0:C02B 3D               dec  a
WRA0:C02C 20 F1            jr   nz,$C01F
WRA0:C02E C9               ret  
WRA0:C02F F5               push af
WRA0:C030 7C               ld   a,h
WRA0:C031 CD 10 C0         call $C010
WRA0:C034 7D               ld   a,l
WRA0:C035 CD 03 C0         call $C003
WRA0:C038 F1               pop  af
WRA0:C039 C9               ret  
WRA0:C03A 00               nop  
WRA0:C03B 00               nop  
WRA0:C03C 00               nop  
WRA0:C03D 00               nop  
WRA0:C03E 00               nop  
WRA0:C03F 00               nop  
WRA0:C040 00               nop  
WRA0:C041 00               nop  
WRA0:C042 00               nop  
WRA0:C043 00               nop  
WRA0:C044 00               nop  
WRA0:C045 00               nop  
WRA0:C046 00               nop  
WRA0:C047 00               nop  
WRA0:C048 00               nop  
WRA0:C049 00               nop  
WRA0:C04A 00               nop  
WRA0:C04B 00               nop  
WRA0:C04C C9               ret  
WRA0:C04D 18 00            jr   $C04F
WRA0:C04F 3E FF            ld   a,$FF
WRA0:C051 E0 80            ldh  [$FF80],a
WRA0:C053 E0 81            ldh  [$FF81],a
WRA0:C055 E0 82            ldh  [$FF82],a
WRA0:C057 E0 83            ldh  [$FF83],a
WRA0:C059 C9               ret  
WRA0:C05A F5               push af
WRA0:C05B C5               push bc
WRA0:C05C D5               push de
WRA0:C05D E5               push hl
WRA0:C05E 21 83 FF         ld   hl,$FF83
WRA0:C061 46               ld   b,[hl]
WRA0:C062 2D               dec  l
WRA0:C063 4E               ld   c,[hl]
WRA0:C064 2D               dec  l
WRA0:C065 56               ld   d,[hl]
WRA0:C066 2D               dec  l
WRA0:C067 AE               xor  [hl]
WRA0:C068 26 08            ld   h,$08
WRA0:C06A CB 38            srl  b
WRA0:C06C CB 19            rr   c
WRA0:C06E CB 1A            rr   d
WRA0:C070 1F               rra  
WRA0:C071 30 10            jr   nc,$C083
WRA0:C073 5F               ld   e,a
WRA0:C074 78               ld   a,b
WRA0:C075 EE ED            xor  a,$ED
WRA0:C077 47               ld   b,a
WRA0:C078 79               ld   a,c
WRA0:C079 EE B8            xor  a,$B8
WRA0:C07B 4F               ld   c,a
WRA0:C07C 7A               ld   a,d
WRA0:C07D EE 83            xor  a,$83
WRA0:C07F 57               ld   d,a
WRA0:C080 7B               ld   a,e
WRA0:C081 EE 20            xor  a,$20
WRA0:C083 25               dec  h
WRA0:C084 20 E4            jr   nz,$C06A
WRA0:C086 26 FF            ld   h,$FF
WRA0:C088 22               ldi  [hl],a
WRA0:C089 72               ld   [hl],d
WRA0:C08A 2C               inc  l
WRA0:C08B 71               ld   [hl],c
WRA0:C08C 2C               inc  l
WRA0:C08D 70               ld   [hl],b
WRA0:C08E E1               pop  hl
WRA0:C08F D1               pop  de
WRA0:C090 C1               pop  bc
WRA0:C091 F1               pop  af
WRA0:C092 C9               ret  
WRA0:C093 7D               ld   a,l
WRA0:C094 EA 02 D8         ld   [$D802],a
WRA0:C097 7C               ld   a,h
WRA0:C098 EA 03 D8         ld   [$D803],a
WRA0:C09B 18 04            jr   $C0A1
WRA0:C09D 3E C9            ld   a,$C9
WRA0:C09F 18 02            jr   $C0A3
WRA0:C0A1 3E C3            ld   a,$C3
WRA0:C0A3 EA 01 D8         ld   [$D801],a
WRA0:C0A6 C9               ret  
WRA0:C0A7 F5               push af
WRA0:C0A8 FE 0A            cp   a,$0A
WRA0:C0AA C4 5A C0         call nz,$C05A
WRA0:C0AD CD 01 D8         call $D801
WRA0:C0B0 F1               pop  af
WRA0:C0B1 C9               ret  
WRA0:C0B2 F5               push af
WRA0:C0B3 3E 20            ld   a,$20
WRA0:C0B5 CD 01 D8         call $D801
WRA0:C0B8 F1               pop  af
WRA0:C0B9 C9               ret  
WRA0:C0BA F5               push af
WRA0:C0BB 3E 0A            ld   a,$0A
WRA0:C0BD CD 01 D8         call $D801
WRA0:C0C0 F1               pop  af
WRA0:C0C1 C9               ret  
WRA0:C0C2 E1               pop  hl
WRA0:C0C3 CD C7 C0         call $C0C7
WRA0:C0C6 E9               jp   hl
WRA0:C0C7 F5               push af
WRA0:C0C8 18 03            jr   $C0CD
WRA0:C0CA CD A7 C0         call $C0A7
WRA0:C0CD 2A               ldi  a,[hl]
WRA0:C0CE B7               or   a
WRA0:C0CF 20 F9            jr   nz,$C0CA
WRA0:C0D1 F1               pop  af
WRA0:C0D2 C9               ret  
WRA0:C0D3 CD EE C0         call $C0EE
WRA0:C0D6 CD 13 C1         call $C113
WRA0:C0D9 CD 1D C1         call $C11D
WRA0:C0DC CD 23 C1         call $C123
WRA0:C0DF CD BA C0         call $C0BA
WRA0:C0E2 C9               ret  
WRA0:C0E3 F5               push af
WRA0:C0E4 CD 29 C1         call $C129
WRA0:C0E7 3E 20            ld   a,$20
WRA0:C0E9 CD 01 D8         call $D801
WRA0:C0EC F1               pop  af
WRA0:C0ED C9               ret  
WRA0:C0EE F5               push af
WRA0:C0EF CD 29 C1         call $C129
WRA0:C0F2 F1               pop  af
WRA0:C0F3 C5               push bc
WRA0:C0F4 F5               push af
WRA0:C0F5 C1               pop  bc
WRA0:C0F6 CD FF C0         call $C0FF
WRA0:C0F9 C1               pop  bc
WRA0:C0FA C9               ret  
WRA0:C0FB F5               push af
WRA0:C0FC 78               ld   a,b
WRA0:C0FD 18 E5            jr   $C0E4
WRA0:C0FF F5               push af
WRA0:C100 79               ld   a,c
WRA0:C101 18 E1            jr   $C0E4
WRA0:C103 F5               push af
WRA0:C104 7A               ld   a,d
WRA0:C105 18 DD            jr   $C0E4
WRA0:C107 F5               push af
WRA0:C108 7B               ld   a,e
WRA0:C109 18 D9            jr   $C0E4
WRA0:C10B F5               push af
WRA0:C10C 7C               ld   a,h
WRA0:C10D 18 D5            jr   $C0E4
WRA0:C10F F5               push af
WRA0:C110 7D               ld   a,l
WRA0:C111 18 D1            jr   $C0E4
WRA0:C113 F5               push af
WRA0:C114 C5               push bc
WRA0:C115 78               ld   a,b
WRA0:C116 CD 29 C1         call $C129
WRA0:C119 79               ld   a,c
WRA0:C11A C1               pop  bc
WRA0:C11B 18 C7            jr   $C0E4
WRA0:C11D F5               push af
WRA0:C11E C5               push bc
WRA0:C11F 42               ld   b,d
WRA0:C120 4B               ld   c,e
WRA0:C121 18 F2            jr   $C115
WRA0:C123 F5               push af
WRA0:C124 C5               push bc
WRA0:C125 44               ld   b,h
WRA0:C126 4D               ld   c,l
WRA0:C127 18 EC            jr   $C115
WRA0:C129 CD 5A C0         call $C05A
WRA0:C12C F5               push af
WRA0:C12D CB 37            swap a
WRA0:C12F CD 33 C1         call $C133
WRA0:C132 F1               pop  af
WRA0:C133 E6 0F            and  a,$0F
WRA0:C135 FE 0A            cp   a,$0A
WRA0:C137 38 02            jr   c,$C13B
WRA0:C139 C6 07            add  a,$07
WRA0:C13B C6 30            add  a,$30
WRA0:C13D C3 01 D8         jp   $D801
WRA0:C140 F5               push af
WRA0:C141 C5               push bc
WRA0:C142 18 0C            jr   $C150
WRA0:C144 F5               push af
WRA0:C145 C5               push bc
WRA0:C146 FE 0A            cp   a,$0A
WRA0:C148 38 0B            jr   c,$C155
WRA0:C14A 0E 64            ld   c,$64
WRA0:C14C B9               cp   c
WRA0:C14D D4 5D C1         call nc,$C15D
WRA0:C150 0E 0A            ld   c,$0A
WRA0:C152 CD 5D C1         call $C15D
WRA0:C155 C6 30            add  a,$30
WRA0:C157 CD A7 C0         call $C0A7
WRA0:C15A C1               pop  bc
WRA0:C15B F1               pop  af
WRA0:C15C C9               ret  
WRA0:C15D 06 2F            ld   b,$2F
WRA0:C15F 04               inc  b
WRA0:C160 91               sub  c
WRA0:C161 30 FC            jr   nc,$C15F
WRA0:C163 81               add  c
WRA0:C164 4F               ld   c,a
WRA0:C165 78               ld   a,b
WRA0:C166 CD A7 C0         call $C0A7
WRA0:C169 79               ld   a,c
WRA0:C16A C9               ret  
WRA0:C16B E1               pop  hl
WRA0:C16C E5               push hl
WRA0:C16D F5               push af
WRA0:C16E 23               inc  hl
WRA0:C16F 23               inc  hl
WRA0:C170 2A               ldi  a,[hl]
WRA0:C171 EA 04 D8         ld   [$D804],a
WRA0:C174 7D               ld   a,l
WRA0:C175 EA 05 D8         ld   [$D805],a
WRA0:C178 7C               ld   a,h
WRA0:C179 EA 06 D8         ld   [$D806],a
WRA0:C17C F1               pop  af
WRA0:C17D C9               ret  
WRA0:C17E E5               push hl
WRA0:C17F CD 6B C1         call $C16B
WRA0:C182 18 02            jr   $C186
WRA0:C184 FF               rst  $38
WRA0:C185 00               nop  
WRA0:C186 E1               pop  hl
WRA0:C187 CD 4D C0         call $C04D
WRA0:C18A C9               ret  
WRA0:C18B CD BA C0         call $C0BA
WRA0:C18E E5               push hl
WRA0:C18F CD C2 C0         call $C0C2
WRA0:C192 50               ld   d,b
WRA0:C193 61               ld   h,c
WRA0:C194 73               ld   [hl],e
WRA0:C195 73               ld   [hl],e
WRA0:C196 65               ld   h,l
WRA0:C197 64               ld   h,h
WRA0:C198 00               nop  
WRA0:C199 E1               pop  hl
WRA0:C19A 3E 00            ld   a,$00
WRA0:C19C C3 6B C2         jp   $C26B
WRA0:C19F FA 04 D8         ld   a,[$D804]
WRA0:C1A2 3C               inc  a
WRA0:C1A3 28 05            jr   z,$C1AA
WRA0:C1A5 3D               dec  a
WRA0:C1A6 28 E3            jr   z,$C18B
WRA0:C1A8 18 0F            jr   $C1B9
WRA0:C1AA E5               push hl
WRA0:C1AB CD C2 C0         call $C0C2
WRA0:C1AE 44               ld   b,h
WRA0:C1AF 6F               ld   l,a
WRA0:C1B0 6E               ld   l,[hl]
WRA0:C1B1 65               ld   h,l
WRA0:C1B2 00               nop  
WRA0:C1B3 E1               pop  hl
WRA0:C1B4 3E 00            ld   a,$00
WRA0:C1B6 C3 6B C2         jp   $C26B
WRA0:C1B9 FA 05 D8         ld   a,[$D805]
WRA0:C1BC 6F               ld   l,a
WRA0:C1BD FA 06 D8         ld   a,[$D806]
WRA0:C1C0 67               ld   h,a
WRA0:C1C1 7E               ld   a,[hl]
WRA0:C1C2 B7               or   a
WRA0:C1C3 28 09            jr   z,$C1CE
WRA0:C1C5 CD BA C0         call $C0BA
WRA0:C1C8 CD C7 C0         call $C0C7
WRA0:C1CB CD BA C0         call $C0BA
WRA0:C1CE FA 04 D8         ld   a,[$D804]
WRA0:C1D1 FE 01            cp   a,$01
WRA0:C1D3 CE 00            adc  a,$00
WRA0:C1D5 C3 6B C2         jp   $C26B
WRA0:C1D8 F5               push af
WRA0:C1D9 F0 80            ldh  a,[$FF80]
WRA0:C1DB 2F               cpl  
WRA0:C1DC F5               push af
WRA0:C1DD F0 81            ldh  a,[$FF81]
WRA0:C1DF 2F               cpl  
WRA0:C1E0 F5               push af
WRA0:C1E1 F0 82            ldh  a,[$FF82]
WRA0:C1E3 2F               cpl  
WRA0:C1E4 F5               push af
WRA0:C1E5 F0 83            ldh  a,[$FF83]
WRA0:C1E7 2F               cpl  
WRA0:C1E8 CD 29 C1         call $C129
WRA0:C1EB F1               pop  af
WRA0:C1EC CD 29 C1         call $C129
WRA0:C1EF F1               pop  af
WRA0:C1F0 CD 29 C1         call $C129
WRA0:C1F3 F1               pop  af
WRA0:C1F4 CD E3 C0         call $C0E3
WRA0:C1F7 F1               pop  af
WRA0:C1F8 C9               ret  
WRA0:C1F9 F0 80            ldh  a,[$FF80]
WRA0:C1FB BB               cp   e
WRA0:C1FC 20 12            jr   nz,$C210
WRA0:C1FE F0 81            ldh  a,[$FF81]
WRA0:C200 BA               cp   d
WRA0:C201 20 0D            jr   nz,$C210
WRA0:C203 F0 82            ldh  a,[$FF82]
WRA0:C205 B9               cp   c
WRA0:C206 20 08            jr   nz,$C210
WRA0:C208 F0 83            ldh  a,[$FF83]
WRA0:C20A B8               cp   b
WRA0:C20B 20 03            jr   nz,$C210
WRA0:C20D C3 4F C0         jp   $C04F
WRA0:C210 CD D8 C1         call $C1D8
WRA0:C213 C3 B9 C1         jp   $C1B9
WRA0:C216 2A               ldi  a,[hl]
WRA0:C217 CD 5A C0         call $C05A
WRA0:C21A 0B               dec  bc
WRA0:C21B 78               ld   a,b
WRA0:C21C B1               or   c
WRA0:C21D 20 F7            jr   nz,$C216
WRA0:C21F C9               ret  
WRA0:C220 F3               di   
WRA0:C221 31 FF DF         ld   sp,$DFFF
WRA0:C224 EA 00 D8         ld   [$D800],a
WRA0:C227 3E 00            ld   a,$00
WRA0:C229 E0 07            ldh  [$FF07],a
WRA0:C22B 3E 00            ld   a,$00
WRA0:C22D E0 0F            ldh  [$FF0F],a
WRA0:C22F 3E 00            ld   a,$00
WRA0:C231 E0 FF            ldh  [$FFFF],a
WRA0:C233 3E 00            ld   a,$00
WRA0:C235 E0 26            ldh  [$FF26],a
WRA0:C237 3E 80            ld   a,$80
WRA0:C239 E0 26            ldh  [$FF26],a
WRA0:C23B 3E FF            ld   a,$FF
WRA0:C23D E0 25            ldh  [$FF25],a
WRA0:C23F 3E 77            ld   a,$77
WRA0:C241 E0 24            ldh  [$FF24],a
WRA0:C243 21 23 CB         ld   hl,$CB23
WRA0:C246 CD 93 C0         call $C093
WRA0:C249 CD 7E C1         call $C17E
WRA0:C24C CD 0C CB         call $CB0C
WRA0:C24F CD 4F C0         call $C04F
WRA0:C252 F5               push af
WRA0:C253 3E 03            ld   a,$03
WRA0:C255 CD 1F C0         call $C01F
WRA0:C258 3E FF            ld   a,$FF
WRA0:C25A CD 12 C0         call $C012
WRA0:C25D 3E CD            ld   a,$CD
WRA0:C25F CD 03 C0         call $C003
WRA0:C262 F1               pop  af
WRA0:C263 CD AC C4         call $C4AC
WRA0:C266 3E 00            ld   a,$00
WRA0:C268 C3 6B C2         jp   $C26B
WRA0:C26B 31 FF DF         ld   sp,$DFFF
WRA0:C26E F5               push af
WRA0:C26F CD 76 C2         call $C276
WRA0:C272 F1               pop  af
WRA0:C273 C3 3A CB         jp   $CB3A
WRA0:C276 F5               push af
WRA0:C277 CD BA C0         call $C0BA
WRA0:C27A CD A1 C0         call $C0A1
WRA0:C27D F1               pop  af
WRA0:C27E FE 01            cp   a,$01
WRA0:C280 D8               ret  c
WRA0:C281 20 0E            jr   nz,$C291
WRA0:C283 E5               push hl
WRA0:C284 CD C2 C0         call $C0C2
WRA0:C287 46               ld   b,[hl]
WRA0:C288 61               ld   h,c
WRA0:C289 69               ld   l,c
WRA0:C28A 6C               ld   l,h
WRA0:C28B 65               ld   h,l
WRA0:C28C 64               ld   h,h
WRA0:C28D 0A               ld   a,[bc]
WRA0:C28E 00               nop  
WRA0:C28F E1               pop  hl
WRA0:C290 C9               ret  
WRA0:C291 E5               push hl
WRA0:C292 CD C2 C0         call $C0C2
WRA0:C295 46               ld   b,[hl]
WRA0:C296 61               ld   h,c
WRA0:C297 69               ld   l,c
WRA0:C298 6C               ld   l,h
WRA0:C299 65               ld   h,l
WRA0:C29A 64               ld   h,h
WRA0:C29B 20 23            jr   nz,$C2C0
WRA0:C29D 00               nop  
WRA0:C29E E1               pop  hl
WRA0:C29F CD 44 C1         call $C144
WRA0:C2A2 CD BA C0         call $C0BA
WRA0:C2A5 C9               ret  
WRA0:C2A6 3E AD            ld   a,$AD
WRA0:C2A8 EA 1E D8         ld   [$D81E],a
WRA0:C2AB 3E C6            ld   a,$C6
WRA0:C2AD EA 1F D8         ld   [$D81F],a
WRA0:C2B0 C9               ret  
WRA0:C2B1 C5               push bc
WRA0:C2B2 D5               push de
WRA0:C2B3 E5               push hl
WRA0:C2B4 FA 1E D8         ld   a,[$D81E]
WRA0:C2B7 6F               ld   l,a
WRA0:C2B8 FA 1F D8         ld   a,[$D81F]
WRA0:C2BB 67               ld   h,a
WRA0:C2BC 11 80 FF         ld   de,$FF80
WRA0:C2BF 06 00            ld   b,$00
WRA0:C2C1 1A               ld   a,[de]
WRA0:C2C2 AE               xor  [hl]
WRA0:C2C3 B0               or   b
WRA0:C2C4 47               ld   b,a
WRA0:C2C5 23               inc  hl
WRA0:C2C6 1C               inc  e
WRA0:C2C7 7B               ld   a,e
WRA0:C2C8 FE 84            cp   a,$84
WRA0:C2CA 20 F5            jr   nz,$C2C1
WRA0:C2CC 7D               ld   a,l
WRA0:C2CD EA 1E D8         ld   [$D81E],a
WRA0:C2D0 7C               ld   a,h
WRA0:C2D1 EA 1F D8         ld   [$D81F],a
WRA0:C2D4 78               ld   a,b
WRA0:C2D5 FE 00            cp   a,$00
WRA0:C2D7 E1               pop  hl
WRA0:C2D8 D1               pop  de
WRA0:C2D9 C1               pop  bc
WRA0:C2DA C9               ret  
WRA0:C2DB FA 00 D8         ld   a,[$D800]
WRA0:C2DE E6 10            and  a,$10
WRA0:C2E0 C8               ret  z
WRA0:C2E1 F0 4D            ldh  a,[$FF4D]
WRA0:C2E3 07               rlca 
WRA0:C2E4 D0               ret  nc
WRA0:C2E5 18 0A            jr   $C2F1
WRA0:C2E7 FA 00 D8         ld   a,[$D800]
WRA0:C2EA E6 10            and  a,$10
WRA0:C2EC C8               ret  z
WRA0:C2ED F0 4D            ldh  a,[$FF4D]
WRA0:C2EF 07               rlca 
WRA0:C2F0 D8               ret  c
WRA0:C2F1 F3               di   
WRA0:C2F2 F0 FF            ldh  a,[$FFFF]
WRA0:C2F4 F5               push af
WRA0:C2F5 AF               xor  a
WRA0:C2F6 E0 FF            ldh  [$FFFF],a
WRA0:C2F8 E0 0F            ldh  [$FF0F],a
WRA0:C2FA 3E 30            ld   a,$30
WRA0:C2FC E0 00            ldh  [$FF00],a
WRA0:C2FE 3E 01            ld   a,$01
WRA0:C300 E0 4D            ldh  [$FF4D],a
WRA0:C302 10 00            stop
WRA0:C304 F1               pop  af
WRA0:C305 E0 FF            ldh  [$FFFF],a
WRA0:C307 C9               ret  
WRA0:C308 C5               push bc
WRA0:C309 CD 41 C3         call $C341
WRA0:C30C 3E C0            ld   a,$C0
WRA0:C30E E0 14            ldh  [$FF14],a
WRA0:C310 3E FF            ld   a,$FF
WRA0:C312 E0 11            ldh  [$FF11],a
WRA0:C314 3E 08            ld   a,$08
WRA0:C316 E0 12            ldh  [$FF12],a
WRA0:C318 3E C0            ld   a,$C0
WRA0:C31A E0 14            ldh  [$FF14],a
WRA0:C31C 01 9E FD         ld   bc,$FD9E
WRA0:C31F 03               inc  bc
WRA0:C320 F0 26            ldh  a,[$FF26]
WRA0:C322 E6 01            and  a,$01
WRA0:C324 20 F9            jr   nz,$C31F
WRA0:C326 3E 00            ld   a,$00
WRA0:C328 CB 78            bit  7,b
WRA0:C32A 20 01            jr   nz,$C32D
WRA0:C32C 3C               inc  a
WRA0:C32D C1               pop  bc
WRA0:C32E C9               ret  
WRA0:C32F 3E 00            ld   a,$00
WRA0:C331 E0 26            ldh  [$FF26],a
WRA0:C333 C9               ret  
WRA0:C334 3E 80            ld   a,$80
WRA0:C336 E0 26            ldh  [$FF26],a
WRA0:C338 3E FF            ld   a,$FF
WRA0:C33A E0 25            ldh  [$FF25],a
WRA0:C33C 3E 77            ld   a,$77
WRA0:C33E E0 24            ldh  [$FF24],a
WRA0:C340 C9               ret  
WRA0:C341 3E 00            ld   a,$00
WRA0:C343 E0 19            ldh  [$FF19],a
WRA0:C345 3E 3E            ld   a,$3E
WRA0:C347 E0 16            ldh  [$FF16],a
WRA0:C349 3E 08            ld   a,$08
WRA0:C34B E0 17            ldh  [$FF17],a
WRA0:C34D 3E C0            ld   a,$C0
WRA0:C34F E0 19            ldh  [$FF19],a
WRA0:C351 F0 26            ldh  a,[$FF26]
WRA0:C353 E6 02            and  a,$02
WRA0:C355 20 FA            jr   nz,$C351
WRA0:C357 C9               ret  
WRA0:C358 3E 11            ld   a,$11
WRA0:C35A E0 10            ldh  [$FF10],a
WRA0:C35C 3E 08            ld   a,$08
WRA0:C35E E0 12            ldh  [$FF12],a
WRA0:C360 3E FF            ld   a,$FF
WRA0:C362 E0 13            ldh  [$FF13],a
WRA0:C364 3E 83            ld   a,$83
WRA0:C366 E0 14            ldh  [$FF14],a
WRA0:C368 F0 26            ldh  a,[$FF26]
WRA0:C36A E6 01            and  a,$01
WRA0:C36C 20 FA            jr   nz,$C368
WRA0:C36E C9               ret  
WRA0:C36F C5               push bc
WRA0:C370 3E 00            ld   a,$00
WRA0:C372 E0 1A            ldh  [$FF1A],a
WRA0:C374 0E 30            ld   c,$30
WRA0:C376 2A               ldi  a,[hl]
WRA0:C377 E2               ld   [$ff00+c],a
WRA0:C378 0C               inc  c
WRA0:C379 CB 71            bit  6,c
WRA0:C37B 28 F9            jr   z,$C376
WRA0:C37D C1               pop  bc
WRA0:C37E C9               ret  
WRA0:C37F AF               xor  a
WRA0:C380 E0 26            ldh  [$FF26],a
WRA0:C382 3D               dec  a
WRA0:C383 E0 26            ldh  [$FF26],a
WRA0:C385 E0 25            ldh  [$FF25],a
WRA0:C387 E0 24            ldh  [$FF24],a
WRA0:C389 3E F1            ld   a,$F1
WRA0:C38B E0 12            ldh  [$FF12],a
WRA0:C38D 3E 86            ld   a,$86
WRA0:C38F E0 14            ldh  [$FF14],a
WRA0:C391 F5               push af
WRA0:C392 3E 03            ld   a,$03
WRA0:C394 CD 1F C0         call $C01F
WRA0:C397 3E FF            ld   a,$FF
WRA0:C399 CD 12 C0         call $C012
WRA0:C39C 3E CD            ld   a,$CD
WRA0:C39E CD 03 C0         call $C003
WRA0:C3A1 F1               pop  af
WRA0:C3A2 C9               ret  
WRA0:C3A3 C5               push bc
WRA0:C3A4 4F               ld   c,a
WRA0:C3A5 06 08            ld   b,$08
WRA0:C3A7 3E 00            ld   a,$00
WRA0:C3A9 E0 10            ldh  [$FF10],a
WRA0:C3AB 3E 80            ld   a,$80
WRA0:C3AD E0 11            ldh  [$FF11],a
WRA0:C3AF 3E F8            ld   a,$F8
WRA0:C3B1 E0 13            ldh  [$FF13],a
WRA0:C3B3 3E 60            ld   a,$60
WRA0:C3B5 CB 11            rl   c
WRA0:C3B7 30 02            jr   nc,$C3BB
WRA0:C3B9 3E A0            ld   a,$A0
WRA0:C3BB E0 12            ldh  [$FF12],a
WRA0:C3BD 3E 87            ld   a,$87
WRA0:C3BF E0 14            ldh  [$FF14],a
WRA0:C3C1 F5               push af
WRA0:C3C2 3E 01            ld   a,$01
WRA0:C3C4 CD 12 C0         call $C012
WRA0:C3C7 3E 13            ld   a,$13
WRA0:C3C9 CD 03 C0         call $C003
WRA0:C3CC F1               pop  af
WRA0:C3CD 3E 00            ld   a,$00
WRA0:C3CF E0 12            ldh  [$FF12],a
WRA0:C3D1 F5               push af
WRA0:C3D2 3E 4C            ld   a,$4C
WRA0:C3D4 CD 03 C0         call $C003
WRA0:C3D7 F1               pop  af
WRA0:C3D8 05               dec  b
WRA0:C3D9 20 D8            jr   nz,$C3B3
WRA0:C3DB C1               pop  bc
WRA0:C3DC C9               ret  
WRA0:C3DD C5               push bc
WRA0:C3DE 0E 30            ld   c,$30
WRA0:C3E0 E2               ld   [$ff00+c],a
WRA0:C3E1 0C               inc  c
WRA0:C3E2 CB 71            bit  6,c
WRA0:C3E4 28 FA            jr   z,$C3E0
WRA0:C3E6 C1               pop  bc
WRA0:C3E7 C9               ret  
WRA0:C3E8 C5               push bc
WRA0:C3E9 4F               ld   c,a
WRA0:C3EA 06 00            ld   b,$00
WRA0:C3EC F0 26            ldh  a,[$FF26]
WRA0:C3EE A1               and  c
WRA0:C3EF 28 0F            jr   z,$C400
WRA0:C3F1 F5               push af
WRA0:C3F2 3E 0F            ld   a,$0F
WRA0:C3F4 CD 12 C0         call $C012
WRA0:C3F7 3E CE            ld   a,$CE
WRA0:C3F9 CD 03 C0         call $C003
WRA0:C3FC F1               pop  af
WRA0:C3FD 04               inc  b
WRA0:C3FE 20 EC            jr   nz,$C3EC
WRA0:C400 78               ld   a,b
WRA0:C401 C1               pop  bc
WRA0:C402 C9               ret  
WRA0:C403 F5               push af
WRA0:C404 E5               push hl
WRA0:C405 21 26 FF         ld   hl,$FF26
WRA0:C408 3E 08            ld   a,$08
WRA0:C40A E0 17            ldh  [$FF17],a
WRA0:C40C 3E 40            ld   a,$40
WRA0:C40E E0 19            ldh  [$FF19],a
WRA0:C410 3E FE            ld   a,$FE
WRA0:C412 E0 16            ldh  [$FF16],a
WRA0:C414 3E C0            ld   a,$C0
WRA0:C416 E0 19            ldh  [$FF19],a
WRA0:C418 3E 02            ld   a,$02
WRA0:C41A A6               and  [hl]
WRA0:C41B 20 FD            jr   nz,$C41A
WRA0:C41D F5               push af
WRA0:C41E 3E 0F            ld   a,$0F
WRA0:C420 CD 12 C0         call $C012
WRA0:C423 3E C5            ld   a,$C5
WRA0:C425 CD 03 C0         call $C003
WRA0:C428 F1               pop  af
WRA0:C429 3E FF            ld   a,$FF
WRA0:C42B E0 16            ldh  [$FF16],a
WRA0:C42D 3E C0            ld   a,$C0
WRA0:C42F E0 19            ldh  [$FF19],a
WRA0:C431 F0 26            ldh  a,[$FF26]
WRA0:C433 00               nop  
WRA0:C434 00               nop  
WRA0:C435 E6 02            and  a,$02
WRA0:C437 20 E4            jr   nz,$C41D
WRA0:C439 E1               pop  hl
WRA0:C43A F1               pop  af
WRA0:C43B C9               ret  
WRA0:C43C B7               or   a
WRA0:C43D 20 06            jr   nz,$C445
WRA0:C43F C9               ret  
WRA0:C440 F5               push af
WRA0:C441 3E D3            ld   a,$D3
WRA0:C443 18 03            jr   $C448
WRA0:C445 F5               push af
WRA0:C446 3E DF            ld   a,$DF
WRA0:C448 CD 03 C0         call $C003
WRA0:C44B F5               push af
WRA0:C44C 3E 0E            ld   a,$0E
WRA0:C44E CD 12 C0         call $C012
WRA0:C451 3E D8            ld   a,$D8
WRA0:C453 CD 03 C0         call $C003
WRA0:C456 F1               pop  af
WRA0:C457 F1               pop  af
WRA0:C458 3D               dec  a
WRA0:C459 20 EA            jr   nz,$C445
WRA0:C45B C9               ret  
WRA0:C45C 2E 00            ld   l,$00
WRA0:C45E AF               xor  a
WRA0:C45F 4F               ld   c,a
WRA0:C460 57               ld   d,a
WRA0:C461 5D               ld   e,l
WRA0:C462 26 08            ld   h,$08
WRA0:C464 1F               rra  
WRA0:C465 CB 19            rr   c
WRA0:C467 CB 1A            rr   d
WRA0:C469 CB 1B            rr   e
WRA0:C46B 30 10            jr   nc,$C47D
WRA0:C46D EE ED            xor  a,$ED
WRA0:C46F 47               ld   b,a
WRA0:C470 79               ld   a,c
WRA0:C471 EE B8            xor  a,$B8
WRA0:C473 4F               ld   c,a
WRA0:C474 7A               ld   a,d
WRA0:C475 EE 83            xor  a,$83
WRA0:C477 57               ld   d,a
WRA0:C478 7B               ld   a,e
WRA0:C479 EE 20            xor  a,$20
WRA0:C47B 5F               ld   e,a
WRA0:C47C 78               ld   a,b
WRA0:C47D 25               dec  h
WRA0:C47E 20 E4            jr   nz,$C464
WRA0:C480 26 D9            ld   h,$D9
WRA0:C482 73               ld   [hl],e
WRA0:C483 24               inc  h
WRA0:C484 72               ld   [hl],d
WRA0:C485 24               inc  h
WRA0:C486 71               ld   [hl],c
WRA0:C487 24               inc  h
WRA0:C488 77               ld   [hl],a
WRA0:C489 2C               inc  l
WRA0:C48A 20 D2            jr   nz,$C45E
WRA0:C48C C3 4D C0         jp   $C04D
WRA0:C48F 6F               ld   l,a
WRA0:C490 F0 80            ldh  a,[$FF80]
WRA0:C492 AD               xor  l
WRA0:C493 6F               ld   l,a
WRA0:C494 26 D9            ld   h,$D9
WRA0:C496 F0 81            ldh  a,[$FF81]
WRA0:C498 AE               xor  [hl]
WRA0:C499 24               inc  h
WRA0:C49A E0 80            ldh  [$FF80],a
WRA0:C49C F0 82            ldh  a,[$FF82]
WRA0:C49E AE               xor  [hl]
WRA0:C49F 24               inc  h
WRA0:C4A0 E0 81            ldh  [$FF81],a
WRA0:C4A2 F0 83            ldh  a,[$FF83]
WRA0:C4A4 AE               xor  [hl]
WRA0:C4A5 24               inc  h
WRA0:C4A6 E0 82            ldh  [$FF82],a
WRA0:C4A8 7E               ld   a,[hl]
WRA0:C4A9 E0 83            ldh  [$FF83],a
WRA0:C4AB C9               ret  
WRA0:C4AC CD E7 C2         call $C2E7
WRA0:C4AF CD 5C C4         call $C45C
WRA0:C4B2 CD A6 C2         call $C2A6
WRA0:C4B5 E5               push hl
WRA0:C4B6 CD 6B C1         call $C16B
WRA0:C4B9 18 02            jr   $C4BD
WRA0:C4BB 00               nop  
WRA0:C4BC 00               nop  
WRA0:C4BD E1               pop  hl
WRA0:C4BE 21 FB C5         ld   hl,$C5FB
WRA0:C4C1 2A               ldi  a,[hl]
WRA0:C4C2 EA F8 DE         ld   [$DEF8],a
WRA0:C4C5 2A               ldi  a,[hl]
WRA0:C4C6 EA F9 DE         ld   [$DEF9],a
WRA0:C4C9 2A               ldi  a,[hl]
WRA0:C4CA EA FA DE         ld   [$DEFA],a
WRA0:C4CD E5               push hl
WRA0:C4CE 3E C3            ld   a,$C3
WRA0:C4D0 EA FB DE         ld   [$DEFB],a
WRA0:C4D3 3E 42            ld   a,$42
WRA0:C4D5 EA FC DE         ld   [$DEFC],a
WRA0:C4D8 3E C6            ld   a,$C6
WRA0:C4DA EA FD DE         ld   [$DEFD],a
WRA0:C4DD CD 4F C0         call $C04F
WRA0:C4E0 CD 13 C6         call $C613
WRA0:C4E3 CD B1 C2         call $C2B1
WRA0:C4E6 28 19            jr   z,$C501
WRA0:C4E8 E5               push hl
WRA0:C4E9 CD 6B C1         call $C16B
WRA0:C4EC 18 02            jr   $C4F0
WRA0:C4EE 01 00 E1         ld   bc,$E100
WRA0:C4F1 FA F8 DE         ld   a,[$DEF8]
WRA0:C4F4 CD E3 C0         call $C0E3
WRA0:C4F7 FE CB            cp   a,$CB
WRA0:C4F9 20 06            jr   nz,$C501
WRA0:C4FB FA F9 DE         ld   a,[$DEF9]
WRA0:C4FE CD E3 C0         call $C0E3
WRA0:C501 E1               pop  hl
WRA0:C502 7D               ld   a,l
WRA0:C503 FE 13            cp   a,$13
WRA0:C505 20 BA            jr   nz,$C4C1
WRA0:C507 7C               ld   a,h
WRA0:C508 FE C6            cp   a,$C6
WRA0:C50A 20 B5            jr   nz,$C4C1
WRA0:C50C C3 9F C1         jp   $C19F
WRA0:C50F E5               push hl
WRA0:C510 F5               push af
WRA0:C511 6F               ld   l,a
WRA0:C512 F0 80            ldh  a,[$FF80]
WRA0:C514 AD               xor  l
WRA0:C515 6F               ld   l,a
WRA0:C516 26 D9            ld   h,$D9
WRA0:C518 F0 81            ldh  a,[$FF81]
WRA0:C51A AE               xor  [hl]
WRA0:C51B 24               inc  h
WRA0:C51C E0 80            ldh  [$FF80],a
WRA0:C51E F0 82            ldh  a,[$FF82]
WRA0:C520 AE               xor  [hl]
WRA0:C521 24               inc  h
WRA0:C522 E0 81            ldh  [$FF81],a
WRA0:C524 F0 83            ldh  a,[$FF83]
WRA0:C526 AE               xor  [hl]
WRA0:C527 24               inc  h
WRA0:C528 E0 82            ldh  [$FF82],a
WRA0:C52A 7E               ld   a,[hl]
WRA0:C52B E0 83            ldh  [$FF83],a
WRA0:C52D E1               pop  hl
WRA0:C52E 7D               ld   a,l
WRA0:C52F 6F               ld   l,a
WRA0:C530 F0 80            ldh  a,[$FF80]
WRA0:C532 AD               xor  l
WRA0:C533 6F               ld   l,a
WRA0:C534 26 D9            ld   h,$D9
WRA0:C536 F0 81            ldh  a,[$FF81]
WRA0:C538 AE               xor  [hl]
WRA0:C539 24               inc  h
WRA0:C53A E0 80            ldh  [$FF80],a
WRA0:C53C F0 82            ldh  a,[$FF82]
WRA0:C53E AE               xor  [hl]
WRA0:C53F 24               inc  h
WRA0:C540 E0 81            ldh  [$FF81],a
WRA0:C542 F0 83            ldh  a,[$FF83]
WRA0:C544 AE               xor  [hl]
WRA0:C545 24               inc  h
WRA0:C546 E0 82            ldh  [$FF82],a
WRA0:C548 7E               ld   a,[hl]
WRA0:C549 E0 83            ldh  [$FF83],a
WRA0:C54B 78               ld   a,b
WRA0:C54C 6F               ld   l,a
WRA0:C54D F0 80            ldh  a,[$FF80]
WRA0:C54F AD               xor  l
WRA0:C550 6F               ld   l,a
WRA0:C551 26 D9            ld   h,$D9
WRA0:C553 F0 81            ldh  a,[$FF81]
WRA0:C555 AE               xor  [hl]
WRA0:C556 24               inc  h
WRA0:C557 E0 80            ldh  [$FF80],a
WRA0:C559 F0 82            ldh  a,[$FF82]
WRA0:C55B AE               xor  [hl]
WRA0:C55C 24               inc  h
WRA0:C55D E0 81            ldh  [$FF81],a
WRA0:C55F F0 83            ldh  a,[$FF83]
WRA0:C561 AE               xor  [hl]
WRA0:C562 24               inc  h
WRA0:C563 E0 82            ldh  [$FF82],a
WRA0:C565 7E               ld   a,[hl]
WRA0:C566 E0 83            ldh  [$FF83],a
WRA0:C568 79               ld   a,c
WRA0:C569 6F               ld   l,a
WRA0:C56A F0 80            ldh  a,[$FF80]
WRA0:C56C AD               xor  l
WRA0:C56D 6F               ld   l,a
WRA0:C56E 26 D9            ld   h,$D9
WRA0:C570 F0 81            ldh  a,[$FF81]
WRA0:C572 AE               xor  [hl]
WRA0:C573 24               inc  h
WRA0:C574 E0 80            ldh  [$FF80],a
WRA0:C576 F0 82            ldh  a,[$FF82]
WRA0:C578 AE               xor  [hl]
WRA0:C579 24               inc  h
WRA0:C57A E0 81            ldh  [$FF81],a
WRA0:C57C F0 83            ldh  a,[$FF83]
WRA0:C57E AE               xor  [hl]
WRA0:C57F 24               inc  h
WRA0:C580 E0 82            ldh  [$FF82],a
WRA0:C582 7E               ld   a,[hl]
WRA0:C583 E0 83            ldh  [$FF83],a
WRA0:C585 7A               ld   a,d
WRA0:C586 6F               ld   l,a
WRA0:C587 F0 80            ldh  a,[$FF80]
WRA0:C589 AD               xor  l
WRA0:C58A 6F               ld   l,a
WRA0:C58B 26 D9            ld   h,$D9
WRA0:C58D F0 81            ldh  a,[$FF81]
WRA0:C58F AE               xor  [hl]
WRA0:C590 24               inc  h
WRA0:C591 E0 80            ldh  [$FF80],a
WRA0:C593 F0 82            ldh  a,[$FF82]
WRA0:C595 AE               xor  [hl]
WRA0:C596 24               inc  h
WRA0:C597 E0 81            ldh  [$FF81],a
WRA0:C599 F0 83            ldh  a,[$FF83]
WRA0:C59B AE               xor  [hl]
WRA0:C59C 24               inc  h
WRA0:C59D E0 82            ldh  [$FF82],a
WRA0:C59F 7E               ld   a,[hl]
WRA0:C5A0 E0 83            ldh  [$FF83],a
WRA0:C5A2 7B               ld   a,e
WRA0:C5A3 6F               ld   l,a
WRA0:C5A4 F0 80            ldh  a,[$FF80]
WRA0:C5A6 AD               xor  l
WRA0:C5A7 6F               ld   l,a
WRA0:C5A8 26 D9            ld   h,$D9
WRA0:C5AA F0 81            ldh  a,[$FF81]
WRA0:C5AC AE               xor  [hl]
WRA0:C5AD 24               inc  h
WRA0:C5AE E0 80            ldh  [$FF80],a
WRA0:C5B0 F0 82            ldh  a,[$FF82]
WRA0:C5B2 AE               xor  [hl]
WRA0:C5B3 24               inc  h
WRA0:C5B4 E0 81            ldh  [$FF81],a
WRA0:C5B6 F0 83            ldh  a,[$FF83]
WRA0:C5B8 AE               xor  [hl]
WRA0:C5B9 24               inc  h
WRA0:C5BA E0 82            ldh  [$FF82],a
WRA0:C5BC 7E               ld   a,[hl]
WRA0:C5BD E0 83            ldh  [$FF83],a
WRA0:C5BF D1               pop  de
WRA0:C5C0 7A               ld   a,d
WRA0:C5C1 6F               ld   l,a
WRA0:C5C2 F0 80            ldh  a,[$FF80]
WRA0:C5C4 AD               xor  l
WRA0:C5C5 6F               ld   l,a
WRA0:C5C6 26 D9            ld   h,$D9
WRA0:C5C8 F0 81            ldh  a,[$FF81]
WRA0:C5CA AE               xor  [hl]
WRA0:C5CB 24               inc  h
WRA0:C5CC E0 80            ldh  [$FF80],a
WRA0:C5CE F0 82            ldh  a,[$FF82]
WRA0:C5D0 AE               xor  [hl]
WRA0:C5D1 24               inc  h
WRA0:C5D2 E0 81            ldh  [$FF81],a
WRA0:C5D4 F0 83            ldh  a,[$FF83]
WRA0:C5D6 AE               xor  [hl]
WRA0:C5D7 24               inc  h
WRA0:C5D8 E0 82            ldh  [$FF82],a
WRA0:C5DA 7E               ld   a,[hl]
WRA0:C5DB E0 83            ldh  [$FF83],a
WRA0:C5DD 7B               ld   a,e
WRA0:C5DE 6F               ld   l,a
WRA0:C5DF F0 80            ldh  a,[$FF80]
WRA0:C5E1 AD               xor  l
WRA0:C5E2 6F               ld   l,a
WRA0:C5E3 26 D9            ld   h,$D9
WRA0:C5E5 F0 81            ldh  a,[$FF81]
WRA0:C5E7 AE               xor  [hl]
WRA0:C5E8 24               inc  h
WRA0:C5E9 E0 80            ldh  [$FF80],a
WRA0:C5EB F0 82            ldh  a,[$FF82]
WRA0:C5ED AE               xor  [hl]
WRA0:C5EE 24               inc  h
WRA0:C5EF E0 81            ldh  [$FF81],a
WRA0:C5F1 F0 83            ldh  a,[$FF83]
WRA0:C5F3 AE               xor  [hl]
WRA0:C5F4 24               inc  h
WRA0:C5F5 E0 82            ldh  [$FF82],a
WRA0:C5F7 7E               ld   a,[hl]
WRA0:C5F8 E0 83            ldh  [$FF83],a
WRA0:C5FA C9               ret  
WRA0:C5FB 33               inc  sp
WRA0:C5FC 00               nop  
WRA0:C5FD 00               nop  
WRA0:C5FE 3B               dec  sp
WRA0:C5FF 00               nop  
WRA0:C600 00               nop  
WRA0:C601 39               add  hl,sp
WRA0:C602 00               nop  
WRA0:C603 00               nop  
WRA0:C604 F9               ld   sp,hl
WRA0:C605 00               nop  
WRA0:C606 00               nop  
WRA0:C607 E8 01            add  sp,$01
WRA0:C609 00               nop  
WRA0:C60A E8 FF            add  sp,-$01
WRA0:C60C 00               nop  
WRA0:C60D F8 01            ld   hl,sp+$01
WRA0:C60F 00               nop  
WRA0:C610 F8 FF            ld   hl,sp-$01
WRA0:C612 00               nop  
WRA0:C613 0E 00            ld   c,$00
WRA0:C615 CD 1E C6         call $C61E
WRA0:C618 0E F0            ld   c,$F0
WRA0:C61A CD 1E C6         call $C61E
WRA0:C61D C9               ret  
WRA0:C61E 21 71 C6         ld   hl,$C671
WRA0:C621 5E               ld   e,[hl]
WRA0:C622 23               inc  hl
WRA0:C623 56               ld   d,[hl]
WRA0:C624 23               inc  hl
WRA0:C625 E5               push hl
WRA0:C626 21 71 C6         ld   hl,$C671
WRA0:C629 C5               push bc
WRA0:C62A D5               push de
WRA0:C62B E5               push hl
WRA0:C62C C5               push bc
WRA0:C62D F1               pop  af
WRA0:C62E 08 00 DD         ld   [$DD00],sp
WRA0:C631 2A               ldi  a,[hl]
WRA0:C632 66               ld   h,[hl]
WRA0:C633 6F               ld   l,a
WRA0:C634 F9               ld   sp,hl
WRA0:C635 62               ld   h,d
WRA0:C636 6B               ld   l,e
WRA0:C637 3E 12            ld   a,$12
WRA0:C639 01 91 56         ld   bc,$5691
WRA0:C63C 11 BC 9A         ld   de,$9ABC
WRA0:C63F C3 F8 DE         jp   $DEF8
WRA0:C642 08 02 DD         ld   [$DD02],sp
WRA0:C645 31 70 DF         ld   sp,$DF70
WRA0:C648 CD 0F C5         call $C50F
WRA0:C64B FA 02 DD         ld   a,[$DD02]
WRA0:C64E CD 8F C4         call $C48F
WRA0:C651 FA 03 DD         ld   a,[$DD03]
WRA0:C654 CD 8F C4         call $C48F
WRA0:C657 FA 00 DD         ld   a,[$DD00]
WRA0:C65A 6F               ld   l,a
WRA0:C65B FA 01 DD         ld   a,[$DD01]
WRA0:C65E 67               ld   h,a
WRA0:C65F F9               ld   sp,hl
WRA0:C660 E1               pop  hl
WRA0:C661 D1               pop  de
WRA0:C662 C1               pop  bc
WRA0:C663 23               inc  hl
WRA0:C664 23               inc  hl
WRA0:C665 7D               ld   a,l
WRA0:C666 FE 8F            cp   a,$8F
WRA0:C668 20 BF            jr   nz,$C629
WRA0:C66A E1               pop  hl
WRA0:C66B 7D               ld   a,l
WRA0:C66C FE 8F            cp   a,$8F
WRA0:C66E 20 B1            jr   nz,$C621
WRA0:C670 C9               ret  
WRA0:C671 00               nop  
WRA0:C672 00               nop  
WRA0:C673 01 00 0F         ld   bc,$0F00
WRA0:C676 00               nop  
WRA0:C677 10 00            stop
WRA0:C679 1F               rra  
WRA0:C67A 00               nop  
WRA0:C67B 7F               ld   a,a
WRA0:C67C 00               nop  
WRA0:C67D 80               add  b
WRA0:C67E 00               nop  
WRA0:C67F FF               rst  $38
WRA0:C680 00               nop  
WRA0:C681 00               nop  
WRA0:C682 01 00 0F         ld   bc,$0F00
WRA0:C685 00               nop  
WRA0:C686 1F               rra  
WRA0:C687 00               nop  
WRA0:C688 10 FF            <corrupted stop>
WRA0:C68A 7F               ld   a,a
WRA0:C68B 00               nop  
WRA0:C68C 80               add  b
WRA0:C68D FF               rst  $38
WRA0:C68E FF               rst  $38
WRA0:C68F 00               nop  
WRA0:C690 00               nop  
WRA0:C691 01 00 0F         ld   bc,$0F00
WRA0:C694 00               nop  
WRA0:C695 10 00            stop
WRA0:C697 1F               rra  
WRA0:C698 00               nop  
WRA0:C699 7F               ld   a,a
WRA0:C69A 00               nop  
WRA0:C69B 80               add  b
WRA0:C69C 00               nop  
WRA0:C69D FF               rst  $38
WRA0:C69E 00               nop  
WRA0:C69F 00               nop  
WRA0:C6A0 01 00 0F         ld   bc,$0F00
WRA0:C6A3 00               nop  
WRA0:C6A4 1F               rra  
WRA0:C6A5 00               nop  
WRA0:C6A6 10 FF            <corrupted stop>
WRA0:C6A8 7F               ld   a,a
WRA0:C6A9 00               nop  
WRA0:C6AA 80               add  b
WRA0:C6AB FF               rst  $38
WRA0:C6AC FF               rst  $38
WRA0:C6AD BC               cp   h
WRA0:C6AE F4               db   $F4 ; undefined opcode
WRA0:C6AF CD 8C C7         call $C78C
WRA0:C6B2 5E               ld   e,[hl]
WRA0:C6B3 89               adc  c
WRA0:C6B4 E5               push hl
WRA0:C6B5 36 65            ld   [hl],$65
WRA0:C6B7 21 55 D6         ld   hl,$D655
WRA0:C6BA 6A               ld   l,d
WRA0:C6BB 2A               ldi  a,[hl]
WRA0:C6BC FF               rst  $38
WRA0:C6BD EB               db   $EB ; undefined opcode
WRA0:C6BE 34               inc  [hl]
WRA0:C6BF 37               scf  
WRA0:C6C0 B9               cp   c
WRA0:C6C1 08 5F 22         ld   [$225F],sp
WRA0:C6C4 13               inc  de
WRA0:C6C5 B6               or   [hl]
WRA0:C6C6 2A               ldi  a,[hl]
WRA0:C6C7 37               scf  
WRA0:C6C8 C3 72 43         jp   $4372
WRA0:C6CB 5C               ld   e,h
WRA0:C6CC 4D               ld   c,l
WRA0:C6CD C5               push bc
WRA0:C6CE 01 1E FB         ld   bc,$FB1E
WRA0:C6D1 03               inc  bc
WRA0:C6D2 78               ld   a,b
WRA0:C6D3 B1               or   c
WRA0:C6D4 28 06            jr   z,$C6DC
WRA0:C6D6 F0 44            ldh  a,[$FF44]
WRA0:C6D8 FE 90            cp   a,$90
WRA0:C6DA 20 F5            jr   nz,$C6D1
WRA0:C6DC C1               pop  bc
WRA0:C6DD C9               ret  
WRA0:C6DE CD 81 C7         call $C781
WRA0:C6E1 FA 00 D8         ld   a,[$D800]
WRA0:C6E4 E6 10            and  a,$10
WRA0:C6E6 C4 20 C7         call nz,$C720
WRA0:C6E9 3E 20            ld   a,$20
WRA0:C6EB CD 12 C7         call $C712
WRA0:C6EE 21 00 82         ld   hl,$8200
WRA0:C6F1 0E 00            ld   c,$00
WRA0:C6F3 CD 59 C7         call $C759
WRA0:C6F6 21 00 8A         ld   hl,$8A00
WRA0:C6F9 0E FF            ld   c,$FF
WRA0:C6FB CD 59 C7         call $C759
WRA0:C6FE 3E 14            ld   a,$14
WRA0:C700 EA 1B D8         ld   [$D81B],a
WRA0:C703 3E 00            ld   a,$00
WRA0:C705 EA 1C D8         ld   [$D81C],a
WRA0:C708 3E F8            ld   a,$F8
WRA0:C70A EA 1D D8         ld   [$D81D],a
WRA0:C70D CD C7 C7         call $C7C7
WRA0:C710 18 5C            jr   $C76E
WRA0:C712 21 00 98         ld   hl,$9800
WRA0:C715 06 04            ld   b,$04
WRA0:C717 77               ld   [hl],a
WRA0:C718 2C               inc  l
WRA0:C719 20 FC            jr   nz,$C717
WRA0:C71B 24               inc  h
WRA0:C71C 05               dec  b
WRA0:C71D 20 F8            jr   nz,$C717
WRA0:C71F C9               ret  
WRA0:C720 3E 80            ld   a,$80
WRA0:C722 E0 68            ldh  [$FF68],a
WRA0:C724 06 10            ld   b,$10
WRA0:C726 3E FF            ld   a,$FF
WRA0:C728 E0 69            ldh  [$FF69],a
WRA0:C72A 3E 7F            ld   a,$7F
WRA0:C72C E0 69            ldh  [$FF69],a
WRA0:C72E 3E 00            ld   a,$00
WRA0:C730 E0 69            ldh  [$FF69],a
WRA0:C732 3E 00            ld   a,$00
WRA0:C734 E0 69            ldh  [$FF69],a
WRA0:C736 3E 00            ld   a,$00
WRA0:C738 E0 69            ldh  [$FF69],a
WRA0:C73A 3E 00            ld   a,$00
WRA0:C73C E0 69            ldh  [$FF69],a
WRA0:C73E 3E 00            ld   a,$00
WRA0:C740 E0 69            ldh  [$FF69],a
WRA0:C742 3E 00            ld   a,$00
WRA0:C744 E0 69            ldh  [$FF69],a
WRA0:C746 05               dec  b
WRA0:C747 20 DD            jr   nz,$C726
WRA0:C749 3E 01            ld   a,$01
WRA0:C74B EA 4F FF         ld   [$FF4F],a
WRA0:C74E 3E 00            ld   a,$00
WRA0:C750 CD 12 C7         call $C712
WRA0:C753 3E 00            ld   a,$00
WRA0:C755 EA 4F FF         ld   [$FF4F],a
WRA0:C758 C9               ret  
WRA0:C759 11 0C C8         ld   de,$C80C
WRA0:C75C 06 60            ld   b,$60
WRA0:C75E C5               push bc
WRA0:C75F 06 08            ld   b,$08
WRA0:C761 1A               ld   a,[de]
WRA0:C762 13               inc  de
WRA0:C763 A9               xor  c
WRA0:C764 22               ldi  [hl],a
WRA0:C765 22               ldi  [hl],a
WRA0:C766 05               dec  b
WRA0:C767 20 F8            jr   nz,$C761
WRA0:C769 C1               pop  bc
WRA0:C76A 05               dec  b
WRA0:C76B 20 F1            jr   nz,$C75E
WRA0:C76D C9               ret  
WRA0:C76E F5               push af
WRA0:C76F CD CD C6         call $C6CD
WRA0:C772 3E 91            ld   a,$91
WRA0:C774 E0 40            ldh  [$FF40],a
WRA0:C776 3E 00            ld   a,$00
WRA0:C778 E0 43            ldh  [$FF43],a
WRA0:C77A 3E E4            ld   a,$E4
WRA0:C77C E0 47            ldh  [$FF47],a
WRA0:C77E C3 EB C7         jp   $C7EB
WRA0:C781 F5               push af
WRA0:C782 CD CD C6         call $C6CD
WRA0:C785 3E 11            ld   a,$11
WRA0:C787 E0 40            ldh  [$FF40],a
WRA0:C789 F1               pop  af
WRA0:C78A C9               ret  
WRA0:C78B AF               xor  a
WRA0:C78C 18 02            jr   $C790
WRA0:C78E 3E 80            ld   a,$80
WRA0:C790 E6 80            and  a,$80
WRA0:C792 EA 1C D8         ld   [$D81C],a
WRA0:C795 C9               ret  
WRA0:C796 F5               push af
WRA0:C797 FE 0A            cp   a,$0A
WRA0:C799 28 1D            jr   z,$C7B8
WRA0:C79B E5               push hl
WRA0:C79C F5               push af
WRA0:C79D 21 1B D8         ld   hl,$D81B
WRA0:C7A0 2A               ldi  a,[hl]
WRA0:C7A1 FE 07            cp   a,$07
WRA0:C7A3 20 09            jr   nz,$C7AE
WRA0:C7A5 F1               pop  af
WRA0:C7A6 FE 20            cp   a,$20
WRA0:C7A8 28 0A            jr   z,$C7B4
WRA0:C7AA CD B7 C7         call $C7B7
WRA0:C7AD F5               push af
WRA0:C7AE F1               pop  af
WRA0:C7AF B6               or   [hl]
WRA0:C7B0 2D               dec  l
WRA0:C7B1 35               dec  [hl]
WRA0:C7B2 6E               ld   l,[hl]
WRA0:C7B3 77               ld   [hl],a
WRA0:C7B4 E1               pop  hl
WRA0:C7B5 F1               pop  af
WRA0:C7B6 C9               ret  
WRA0:C7B7 F5               push af
WRA0:C7B8 CD CD C6         call $C6CD
WRA0:C7BB CD F4 C7         call $C7F4
WRA0:C7BE CD C7 C7         call $C7C7
WRA0:C7C1 CD F4 C7         call $C7F4
WRA0:C7C4 C3 EB C7         jp   $C7EB
WRA0:C7C7 C5               push bc
WRA0:C7C8 E5               push hl
WRA0:C7C9 FA 1D D8         ld   a,[$D81D]
WRA0:C7CC C6 08            add  a,$08
WRA0:C7CE EA 1D D8         ld   [$D81D],a
WRA0:C7D1 3E 20            ld   a,$20
WRA0:C7D3 21 1A D8         ld   hl,$D81A
WRA0:C7D6 06 14            ld   b,$14
WRA0:C7D8 32               ldd  [hl],a
WRA0:C7D9 05               dec  b
WRA0:C7DA 20 FC            jr   nz,$C7D8
WRA0:C7DC 3E 1B            ld   a,$1B
WRA0:C7DE EA 1B D8         ld   [$D81B],a
WRA0:C7E1 E1               pop  hl
WRA0:C7E2 C1               pop  bc
WRA0:C7E3 C9               ret  
WRA0:C7E4 F5               push af
WRA0:C7E5 CD CD C6         call $C6CD
WRA0:C7E8 CD F4 C7         call $C7F4
WRA0:C7EB FA 1D D8         ld   a,[$D81D]
WRA0:C7EE D6 88            sub  a,$88
WRA0:C7F0 E0 42            ldh  [$FF42],a
WRA0:C7F2 F1               pop  af
WRA0:C7F3 C9               ret  
WRA0:C7F4 D5               push de
WRA0:C7F5 E5               push hl
WRA0:C7F6 FA 1D D8         ld   a,[$D81D]
WRA0:C7F9 6F               ld   l,a
WRA0:C7FA 26 26            ld   h,$26
WRA0:C7FC 29               add  hl,hl
WRA0:C7FD 29               add  hl,hl
WRA0:C7FE 11 1B D8         ld   de,$D81B
WRA0:C801 1D               dec  e
WRA0:C802 1A               ld   a,[de]
WRA0:C803 22               ldi  [hl],a
WRA0:C804 7B               ld   a,e
WRA0:C805 FE 07            cp   a,$07
WRA0:C807 20 F8            jr   nz,$C801
WRA0:C809 E1               pop  hl
WRA0:C80A D1               pop  de
WRA0:C80B C9               ret  
WRA0:C80C 00               nop  
WRA0:C80D 00               nop  
WRA0:C80E 00               nop  
WRA0:C80F 00               nop  
WRA0:C810 00               nop  
WRA0:C811 00               nop  
WRA0:C812 00               nop  
WRA0:C813 00               nop  
WRA0:C814 18 18            jr   $C82E
WRA0:C816 18 18            jr   $C830
WRA0:C818 18 00            jr   $C81A
WRA0:C81A 18 00            jr   $C81C
WRA0:C81C 6C               ld   l,h
WRA0:C81D 6C               ld   l,h
WRA0:C81E 6C               ld   l,h
WRA0:C81F 00               nop  
WRA0:C820 00               nop  
WRA0:C821 00               nop  
WRA0:C822 00               nop  
WRA0:C823 00               nop  
WRA0:C824 6C               ld   l,h
WRA0:C825 FE 6C            cp   a,$6C
WRA0:C827 6C               ld   l,h
WRA0:C828 FE 6C            cp   a,$6C
WRA0:C82A 00               nop  
WRA0:C82B 00               nop  
WRA0:C82C 18 3E            jr   $C86C
WRA0:C82E 60               ld   h,b
WRA0:C82F 3C               inc  a
WRA0:C830 06 7C            ld   b,$7C
WRA0:C832 18 00            jr   $C834
WRA0:C834 66               ld   h,[hl]
WRA0:C835 6C               ld   l,h
WRA0:C836 18 30            jr   $C868
WRA0:C838 60               ld   h,b
WRA0:C839 C6 86            add  a,$86
WRA0:C83B 00               nop  
WRA0:C83C 1C               inc  e
WRA0:C83D 36 1C            ld   [hl],$1C
WRA0:C83F 38 6F            jr   c,$C8B0
WRA0:C841 66               ld   h,[hl]
WRA0:C842 3B               dec  sp
WRA0:C843 00               nop  
WRA0:C844 0C               inc  c
WRA0:C845 0C               inc  c
WRA0:C846 0C               inc  c
WRA0:C847 00               nop  
WRA0:C848 00               nop  
WRA0:C849 00               nop  
WRA0:C84A 00               nop  
WRA0:C84B 00               nop  
WRA0:C84C 0E 1C            ld   c,$1C
WRA0:C84E 18 18            jr   $C868
WRA0:C850 18 1C            jr   $C86E
WRA0:C852 0E 00            ld   c,$00
WRA0:C854 70               ld   [hl],b
WRA0:C855 38 18            jr   c,$C86F
WRA0:C857 18 18            jr   $C871
WRA0:C859 38 70            jr   c,$C8CB
WRA0:C85B 00               nop  
WRA0:C85C 00               nop  
WRA0:C85D 66               ld   h,[hl]
WRA0:C85E 3C               inc  a
WRA0:C85F FF               rst  $38
WRA0:C860 3C               inc  a
WRA0:C861 66               ld   h,[hl]
WRA0:C862 00               nop  
WRA0:C863 00               nop  
WRA0:C864 00               nop  
WRA0:C865 18 18            jr   $C87F
WRA0:C867 7E               ld   a,[hl]
WRA0:C868 18 18            jr   $C882
WRA0:C86A 00               nop  
WRA0:C86B 00               nop  
WRA0:C86C 00               nop  
WRA0:C86D 00               nop  
WRA0:C86E 00               nop  
WRA0:C86F 00               nop  
WRA0:C870 00               nop  
WRA0:C871 30 30            jr   nc,$C8A3
WRA0:C873 60               ld   h,b
WRA0:C874 00               nop  
WRA0:C875 00               nop  
WRA0:C876 00               nop  
WRA0:C877 7E               ld   a,[hl]
WRA0:C878 00               nop  
WRA0:C879 00               nop  
WRA0:C87A 00               nop  
WRA0:C87B 00               nop  
WRA0:C87C 00               nop  
WRA0:C87D 00               nop  
WRA0:C87E 00               nop  
WRA0:C87F 00               nop  
WRA0:C880 00               nop  
WRA0:C881 60               ld   h,b
WRA0:C882 60               ld   h,b
WRA0:C883 00               nop  
WRA0:C884 02               ld   [bc],a
WRA0:C885 06 0C            ld   b,$0C
WRA0:C887 18 30            jr   $C8B9
WRA0:C889 60               ld   h,b
WRA0:C88A 40               ld   b,b
WRA0:C88B 00               nop  
WRA0:C88C 3C               inc  a
WRA0:C88D 66               ld   h,[hl]
WRA0:C88E 6E               ld   l,[hl]
WRA0:C88F 76               halt 
WRA0:C890 66               ld   h,[hl]
WRA0:C891 66               ld   h,[hl]
WRA0:C892 3C               inc  a
WRA0:C893 00               nop  
WRA0:C894 18 38            jr   $C8CE
WRA0:C896 18 18            jr   $C8B0
WRA0:C898 18 18            jr   $C8B2
WRA0:C89A 7E               ld   a,[hl]
WRA0:C89B 00               nop  
WRA0:C89C 3C               inc  a
WRA0:C89D 66               ld   h,[hl]
WRA0:C89E 06 0C            ld   b,$0C
WRA0:C8A0 18 30            jr   $C8D2
WRA0:C8A2 7E               ld   a,[hl]
WRA0:C8A3 00               nop  
WRA0:C8A4 7E               ld   a,[hl]
WRA0:C8A5 0C               inc  c
WRA0:C8A6 18 0C            jr   $C8B4
WRA0:C8A8 06 66            ld   b,$66
WRA0:C8AA 3C               inc  a
WRA0:C8AB 00               nop  
WRA0:C8AC 0C               inc  c
WRA0:C8AD 1C               inc  e
WRA0:C8AE 3C               inc  a
WRA0:C8AF 6C               ld   l,h
WRA0:C8B0 7E               ld   a,[hl]
WRA0:C8B1 0C               inc  c
WRA0:C8B2 0C               inc  c
WRA0:C8B3 00               nop  
WRA0:C8B4 7E               ld   a,[hl]
WRA0:C8B5 60               ld   h,b
WRA0:C8B6 7C               ld   a,h
WRA0:C8B7 06 06            ld   b,$06
WRA0:C8B9 66               ld   h,[hl]
WRA0:C8BA 3C               inc  a
WRA0:C8BB 00               nop  
WRA0:C8BC 3C               inc  a
WRA0:C8BD 60               ld   h,b
WRA0:C8BE 60               ld   h,b
WRA0:C8BF 7C               ld   a,h
WRA0:C8C0 66               ld   h,[hl]
WRA0:C8C1 66               ld   h,[hl]
WRA0:C8C2 3C               inc  a
WRA0:C8C3 00               nop  
WRA0:C8C4 7E               ld   a,[hl]
WRA0:C8C5 06 0C            ld   b,$0C
WRA0:C8C7 18 30            jr   $C8F9
WRA0:C8C9 30 30            jr   nc,$C8FB
WRA0:C8CB 00               nop  
WRA0:C8CC 3C               inc  a
WRA0:C8CD 66               ld   h,[hl]
WRA0:C8CE 66               ld   h,[hl]
WRA0:C8CF 3C               inc  a
WRA0:C8D0 66               ld   h,[hl]
WRA0:C8D1 66               ld   h,[hl]
WRA0:C8D2 3C               inc  a
WRA0:C8D3 00               nop  
WRA0:C8D4 3C               inc  a
WRA0:C8D5 66               ld   h,[hl]
WRA0:C8D6 66               ld   h,[hl]
WRA0:C8D7 3E 06            ld   a,$06
WRA0:C8D9 0C               inc  c
WRA0:C8DA 38 00            jr   c,$C8DC
WRA0:C8DC 00               nop  
WRA0:C8DD 18 18            jr   $C8F7
WRA0:C8DF 00               nop  
WRA0:C8E0 18 18            jr   $C8FA
WRA0:C8E2 00               nop  
WRA0:C8E3 00               nop  
WRA0:C8E4 00               nop  
WRA0:C8E5 18 18            jr   $C8FF
WRA0:C8E7 00               nop  
WRA0:C8E8 18 18            jr   $C902
WRA0:C8EA 30 00            jr   nc,$C8EC
WRA0:C8EC 0C               inc  c
WRA0:C8ED 18 30            jr   $C91F
WRA0:C8EF 60               ld   h,b
WRA0:C8F0 30 18            jr   nc,$C90A
WRA0:C8F2 0C               inc  c
WRA0:C8F3 00               nop  
WRA0:C8F4 00               nop  
WRA0:C8F5 00               nop  
WRA0:C8F6 7E               ld   a,[hl]
WRA0:C8F7 00               nop  
WRA0:C8F8 00               nop  
WRA0:C8F9 7E               ld   a,[hl]
WRA0:C8FA 00               nop  
WRA0:C8FB 00               nop  
WRA0:C8FC 30 18            jr   nc,$C916
WRA0:C8FE 0C               inc  c
WRA0:C8FF 06 0C            ld   b,$0C
WRA0:C901 18 30            jr   $C933
WRA0:C903 00               nop  
WRA0:C904 3C               inc  a
WRA0:C905 66               ld   h,[hl]
WRA0:C906 06 0C            ld   b,$0C
WRA0:C908 18 00            jr   $C90A
WRA0:C90A 18 00            jr   $C90C
WRA0:C90C 3C               inc  a
WRA0:C90D 66               ld   h,[hl]
WRA0:C90E 6E               ld   l,[hl]
WRA0:C90F 6A               ld   l,d
WRA0:C910 6E               ld   l,[hl]
WRA0:C911 60               ld   h,b
WRA0:C912 3E 00            ld   a,$00
WRA0:C914 18 3C            jr   $C952
WRA0:C916 66               ld   h,[hl]
WRA0:C917 66               ld   h,[hl]
WRA0:C918 7E               ld   a,[hl]
WRA0:C919 66               ld   h,[hl]
WRA0:C91A 66               ld   h,[hl]
WRA0:C91B 00               nop  
WRA0:C91C 7C               ld   a,h
WRA0:C91D 66               ld   h,[hl]
WRA0:C91E 66               ld   h,[hl]
WRA0:C91F 7C               ld   a,h
WRA0:C920 66               ld   h,[hl]
WRA0:C921 66               ld   h,[hl]
WRA0:C922 7C               ld   a,h
WRA0:C923 00               nop  
WRA0:C924 3C               inc  a
WRA0:C925 66               ld   h,[hl]
WRA0:C926 60               ld   h,b
WRA0:C927 60               ld   h,b
WRA0:C928 60               ld   h,b
WRA0:C929 66               ld   h,[hl]
WRA0:C92A 3C               inc  a
WRA0:C92B 00               nop  
WRA0:C92C 78               ld   a,b
WRA0:C92D 6C               ld   l,h
WRA0:C92E 66               ld   h,[hl]
WRA0:C92F 66               ld   h,[hl]
WRA0:C930 66               ld   h,[hl]
WRA0:C931 6C               ld   l,h
WRA0:C932 78               ld   a,b
WRA0:C933 00               nop  
WRA0:C934 7E               ld   a,[hl]
WRA0:C935 60               ld   h,b
WRA0:C936 60               ld   h,b
WRA0:C937 7C               ld   a,h
WRA0:C938 60               ld   h,b
WRA0:C939 60               ld   h,b
WRA0:C93A 7E               ld   a,[hl]
WRA0:C93B 00               nop  
WRA0:C93C 7E               ld   a,[hl]
WRA0:C93D 60               ld   h,b
WRA0:C93E 60               ld   h,b
WRA0:C93F 7C               ld   a,h
WRA0:C940 60               ld   h,b
WRA0:C941 60               ld   h,b
WRA0:C942 60               ld   h,b
WRA0:C943 00               nop  
WRA0:C944 3E 60            ld   a,$60
WRA0:C946 60               ld   h,b
WRA0:C947 6E               ld   l,[hl]
WRA0:C948 66               ld   h,[hl]
WRA0:C949 66               ld   h,[hl]
WRA0:C94A 3E 00            ld   a,$00
WRA0:C94C 66               ld   h,[hl]
WRA0:C94D 66               ld   h,[hl]
WRA0:C94E 66               ld   h,[hl]
WRA0:C94F 7E               ld   a,[hl]
WRA0:C950 66               ld   h,[hl]
WRA0:C951 66               ld   h,[hl]
WRA0:C952 66               ld   h,[hl]
WRA0:C953 00               nop  
WRA0:C954 3C               inc  a
WRA0:C955 18 18            jr   $C96F
WRA0:C957 18 18            jr   $C971
WRA0:C959 18 3C            jr   $C997
WRA0:C95B 00               nop  
WRA0:C95C 06 06            ld   b,$06
WRA0:C95E 06 06            ld   b,$06
WRA0:C960 06 66            ld   b,$66
WRA0:C962 3C               inc  a
WRA0:C963 00               nop  
WRA0:C964 66               ld   h,[hl]
WRA0:C965 6C               ld   l,h
WRA0:C966 78               ld   a,b
WRA0:C967 70               ld   [hl],b
WRA0:C968 78               ld   a,b
WRA0:C969 6C               ld   l,h
WRA0:C96A 66               ld   h,[hl]
WRA0:C96B 00               nop  
WRA0:C96C 60               ld   h,b
WRA0:C96D 60               ld   h,b
WRA0:C96E 60               ld   h,b
WRA0:C96F 60               ld   h,b
WRA0:C970 60               ld   h,b
WRA0:C971 60               ld   h,b
WRA0:C972 7E               ld   a,[hl]
WRA0:C973 00               nop  
WRA0:C974 C6 EE            add  a,$EE
WRA0:C976 FE D6            cp   a,$D6
WRA0:C978 C6 C6            add  a,$C6
WRA0:C97A C6 00            add  a,$00
WRA0:C97C 66               ld   h,[hl]
WRA0:C97D 76               halt 
WRA0:C97E 7E               ld   a,[hl]
WRA0:C97F 7E               ld   a,[hl]
WRA0:C980 6E               ld   l,[hl]
WRA0:C981 66               ld   h,[hl]
WRA0:C982 66               ld   h,[hl]
WRA0:C983 00               nop  
WRA0:C984 3C               inc  a
WRA0:C985 66               ld   h,[hl]
WRA0:C986 66               ld   h,[hl]
WRA0:C987 66               ld   h,[hl]
WRA0:C988 66               ld   h,[hl]
WRA0:C989 66               ld   h,[hl]
WRA0:C98A 3C               inc  a
WRA0:C98B 00               nop  
WRA0:C98C 7C               ld   a,h
WRA0:C98D 66               ld   h,[hl]
WRA0:C98E 66               ld   h,[hl]
WRA0:C98F 7C               ld   a,h
WRA0:C990 60               ld   h,b
WRA0:C991 60               ld   h,b
WRA0:C992 60               ld   h,b
WRA0:C993 00               nop  
WRA0:C994 3C               inc  a
WRA0:C995 66               ld   h,[hl]
WRA0:C996 66               ld   h,[hl]
WRA0:C997 66               ld   h,[hl]
WRA0:C998 76               halt 
WRA0:C999 6C               ld   l,h
WRA0:C99A 36 00            ld   [hl],$00
WRA0:C99C 7C               ld   a,h
WRA0:C99D 66               ld   h,[hl]
WRA0:C99E 66               ld   h,[hl]
WRA0:C99F 7C               ld   a,h
WRA0:C9A0 6C               ld   l,h
WRA0:C9A1 66               ld   h,[hl]
WRA0:C9A2 66               ld   h,[hl]
WRA0:C9A3 00               nop  
WRA0:C9A4 3C               inc  a
WRA0:C9A5 66               ld   h,[hl]
WRA0:C9A6 60               ld   h,b
WRA0:C9A7 3C               inc  a
WRA0:C9A8 06 66            ld   b,$66
WRA0:C9AA 3C               inc  a
WRA0:C9AB 00               nop  
WRA0:C9AC 7E               ld   a,[hl]
WRA0:C9AD 18 18            jr   $C9C7
WRA0:C9AF 18 18            jr   $C9C9
WRA0:C9B1 18 18            jr   $C9CB
WRA0:C9B3 00               nop  
WRA0:C9B4 66               ld   h,[hl]
WRA0:C9B5 66               ld   h,[hl]
WRA0:C9B6 66               ld   h,[hl]
WRA0:C9B7 66               ld   h,[hl]
WRA0:C9B8 66               ld   h,[hl]
WRA0:C9B9 66               ld   h,[hl]
WRA0:C9BA 3E 00            ld   a,$00
WRA0:C9BC 66               ld   h,[hl]
WRA0:C9BD 66               ld   h,[hl]
WRA0:C9BE 66               ld   h,[hl]
WRA0:C9BF 66               ld   h,[hl]
WRA0:C9C0 3C               inc  a
WRA0:C9C1 3C               inc  a
WRA0:C9C2 18 00            jr   $C9C4
WRA0:C9C4 C6 C6            add  a,$C6
WRA0:C9C6 C6 D6            add  a,$D6
WRA0:C9C8 FE EE            cp   a,$EE
WRA0:C9CA C6 00            add  a,$00
WRA0:C9CC 66               ld   h,[hl]
WRA0:C9CD 66               ld   h,[hl]
WRA0:C9CE 3C               inc  a
WRA0:C9CF 18 3C            jr   $CA0D
WRA0:C9D1 66               ld   h,[hl]
WRA0:C9D2 66               ld   h,[hl]
WRA0:C9D3 00               nop  
WRA0:C9D4 66               ld   h,[hl]
WRA0:C9D5 66               ld   h,[hl]
WRA0:C9D6 66               ld   h,[hl]
WRA0:C9D7 3C               inc  a
WRA0:C9D8 18 18            jr   $C9F2
WRA0:C9DA 18 00            jr   $C9DC
WRA0:C9DC 7E               ld   a,[hl]
WRA0:C9DD 06 0C            ld   b,$0C
WRA0:C9DF 18 30            jr   $CA11
WRA0:C9E1 60               ld   h,b
WRA0:C9E2 7E               ld   a,[hl]
WRA0:C9E3 00               nop  
WRA0:C9E4 1E 18            ld   e,$18
WRA0:C9E6 18 18            jr   $CA00
WRA0:C9E8 18 18            jr   $CA02
WRA0:C9EA 1E 00            ld   e,$00
WRA0:C9EC 40               ld   b,b
WRA0:C9ED 60               ld   h,b
WRA0:C9EE 30 18            jr   nc,$CA08
WRA0:C9F0 0C               inc  c
WRA0:C9F1 06 02            ld   b,$02
WRA0:C9F3 00               nop  
WRA0:C9F4 78               ld   a,b
WRA0:C9F5 18 18            jr   $CA0F
WRA0:C9F7 18 18            jr   $CA11
WRA0:C9F9 18 78            jr   $CA73
WRA0:C9FB 00               nop  
WRA0:C9FC 10 38            <corrupted stop>
WRA0:C9FE 6C               ld   l,h
WRA0:C9FF C6 00            add  a,$00
WRA0:CA01 00               nop  
WRA0:CA02 00               nop  
WRA0:CA03 00               nop  
WRA0:CA04 00               nop  
WRA0:CA05 00               nop  
WRA0:CA06 00               nop  
WRA0:CA07 00               nop  
WRA0:CA08 00               nop  
WRA0:CA09 00               nop  
WRA0:CA0A 00               nop  
WRA0:CA0B FE C0            cp   a,$C0
WRA0:CA0D 60               ld   h,b
WRA0:CA0E 30 00            jr   nc,$CA10
WRA0:CA10 00               nop  
WRA0:CA11 00               nop  
WRA0:CA12 00               nop  
WRA0:CA13 00               nop  
WRA0:CA14 00               nop  
WRA0:CA15 00               nop  
WRA0:CA16 3C               inc  a
WRA0:CA17 06 3E            ld   b,$3E
WRA0:CA19 66               ld   h,[hl]
WRA0:CA1A 3E 00            ld   a,$00
WRA0:CA1C 60               ld   h,b
WRA0:CA1D 60               ld   h,b
WRA0:CA1E 7C               ld   a,h
WRA0:CA1F 66               ld   h,[hl]
WRA0:CA20 66               ld   h,[hl]
WRA0:CA21 66               ld   h,[hl]
WRA0:CA22 7C               ld   a,h
WRA0:CA23 00               nop  
WRA0:CA24 00               nop  
WRA0:CA25 00               nop  
WRA0:CA26 3C               inc  a
WRA0:CA27 60               ld   h,b
WRA0:CA28 60               ld   h,b
WRA0:CA29 60               ld   h,b
WRA0:CA2A 3C               inc  a
WRA0:CA2B 00               nop  
WRA0:CA2C 06 06            ld   b,$06
WRA0:CA2E 3E 66            ld   a,$66
WRA0:CA30 66               ld   h,[hl]
WRA0:CA31 66               ld   h,[hl]
WRA0:CA32 3E 00            ld   a,$00
WRA0:CA34 00               nop  
WRA0:CA35 00               nop  
WRA0:CA36 3C               inc  a
WRA0:CA37 66               ld   h,[hl]
WRA0:CA38 7E               ld   a,[hl]
WRA0:CA39 60               ld   h,b
WRA0:CA3A 3C               inc  a
WRA0:CA3B 00               nop  
WRA0:CA3C 1C               inc  e
WRA0:CA3D 30 7C            jr   nc,$CABB
WRA0:CA3F 30 30            jr   nc,$CA71
WRA0:CA41 30 30            jr   nc,$CA73
WRA0:CA43 00               nop  
WRA0:CA44 00               nop  
WRA0:CA45 00               nop  
WRA0:CA46 3E 66            ld   a,$66
WRA0:CA48 66               ld   h,[hl]
WRA0:CA49 3E 06            ld   a,$06
WRA0:CA4B 7C               ld   a,h
WRA0:CA4C 60               ld   h,b
WRA0:CA4D 60               ld   h,b
WRA0:CA4E 7C               ld   a,h
WRA0:CA4F 66               ld   h,[hl]
WRA0:CA50 66               ld   h,[hl]
WRA0:CA51 66               ld   h,[hl]
WRA0:CA52 66               ld   h,[hl]
WRA0:CA53 00               nop  
WRA0:CA54 18 00            jr   $CA56
WRA0:CA56 38 18            jr   c,$CA70
WRA0:CA58 18 18            jr   $CA72
WRA0:CA5A 3C               inc  a
WRA0:CA5B 00               nop  
WRA0:CA5C 18 00            jr   $CA5E
WRA0:CA5E 18 18            jr   $CA78
WRA0:CA60 18 18            jr   $CA7A
WRA0:CA62 18 70            jr   $CAD4
WRA0:CA64 60               ld   h,b
WRA0:CA65 60               ld   h,b
WRA0:CA66 66               ld   h,[hl]
WRA0:CA67 6C               ld   l,h
WRA0:CA68 78               ld   a,b
WRA0:CA69 6C               ld   l,h
WRA0:CA6A 66               ld   h,[hl]
WRA0:CA6B 00               nop  
WRA0:CA6C 38 18            jr   c,$CA86
WRA0:CA6E 18 18            jr   $CA88
WRA0:CA70 18 18            jr   $CA8A
WRA0:CA72 3C               inc  a
WRA0:CA73 00               nop  
WRA0:CA74 00               nop  
WRA0:CA75 00               nop  
WRA0:CA76 EC               db   $EC ; undefined opcode
WRA0:CA77 FE D6            cp   a,$D6
WRA0:CA79 C6 C6            add  a,$C6
WRA0:CA7B 00               nop  
WRA0:CA7C 00               nop  
WRA0:CA7D 00               nop  
WRA0:CA7E 7C               ld   a,h
WRA0:CA7F 66               ld   h,[hl]
WRA0:CA80 66               ld   h,[hl]
WRA0:CA81 66               ld   h,[hl]
WRA0:CA82 66               ld   h,[hl]
WRA0:CA83 00               nop  
WRA0:CA84 00               nop  
WRA0:CA85 00               nop  
WRA0:CA86 3C               inc  a
WRA0:CA87 66               ld   h,[hl]
WRA0:CA88 66               ld   h,[hl]
WRA0:CA89 66               ld   h,[hl]
WRA0:CA8A 3C               inc  a
WRA0:CA8B 00               nop  
WRA0:CA8C 00               nop  
WRA0:CA8D 00               nop  
WRA0:CA8E 7C               ld   a,h
WRA0:CA8F 66               ld   h,[hl]
WRA0:CA90 66               ld   h,[hl]
WRA0:CA91 66               ld   h,[hl]
WRA0:CA92 7C               ld   a,h
WRA0:CA93 60               ld   h,b
WRA0:CA94 00               nop  
WRA0:CA95 00               nop  
WRA0:CA96 3E 66            ld   a,$66
WRA0:CA98 66               ld   h,[hl]
WRA0:CA99 66               ld   h,[hl]
WRA0:CA9A 3E 06            ld   a,$06
WRA0:CA9C 00               nop  
WRA0:CA9D 00               nop  
WRA0:CA9E 7C               ld   a,h
WRA0:CA9F 66               ld   h,[hl]
WRA0:CAA0 60               ld   h,b
WRA0:CAA1 60               ld   h,b
WRA0:CAA2 60               ld   h,b
WRA0:CAA3 00               nop  
WRA0:CAA4 00               nop  
WRA0:CAA5 00               nop  
WRA0:CAA6 3E 60            ld   a,$60
WRA0:CAA8 3C               inc  a
WRA0:CAA9 06 7C            ld   b,$7C
WRA0:CAAB 00               nop  
WRA0:CAAC 00               nop  
WRA0:CAAD 18 7E            jr   $CB2D
WRA0:CAAF 18 18            jr   $CAC9
WRA0:CAB1 18 0E            jr   $CAC1
WRA0:CAB3 00               nop  
WRA0:CAB4 00               nop  
WRA0:CAB5 00               nop  
WRA0:CAB6 66               ld   h,[hl]
WRA0:CAB7 66               ld   h,[hl]
WRA0:CAB8 66               ld   h,[hl]
WRA0:CAB9 66               ld   h,[hl]
WRA0:CABA 3E 00            ld   a,$00
WRA0:CABC 00               nop  
WRA0:CABD 00               nop  
WRA0:CABE 66               ld   h,[hl]
WRA0:CABF 66               ld   h,[hl]
WRA0:CAC0 66               ld   h,[hl]
WRA0:CAC1 3C               inc  a
WRA0:CAC2 18 00            jr   $CAC4
WRA0:CAC4 00               nop  
WRA0:CAC5 00               nop  
WRA0:CAC6 C6 C6            add  a,$C6
WRA0:CAC8 D6 7C            sub  a,$7C
WRA0:CACA 6C               ld   l,h
WRA0:CACB 00               nop  
WRA0:CACC 00               nop  
WRA0:CACD 00               nop  
WRA0:CACE 66               ld   h,[hl]
WRA0:CACF 3C               inc  a
WRA0:CAD0 18 3C            jr   $CB0E
WRA0:CAD2 66               ld   h,[hl]
WRA0:CAD3 00               nop  
WRA0:CAD4 00               nop  
WRA0:CAD5 00               nop  
WRA0:CAD6 66               ld   h,[hl]
WRA0:CAD7 66               ld   h,[hl]
WRA0:CAD8 66               ld   h,[hl]
WRA0:CAD9 3E 06            ld   a,$06
WRA0:CADB 7C               ld   a,h
WRA0:CADC 00               nop  
WRA0:CADD 00               nop  
WRA0:CADE 7E               ld   a,[hl]
WRA0:CADF 0C               inc  c
WRA0:CAE0 18 30            jr   $CB12
WRA0:CAE2 7E               ld   a,[hl]
WRA0:CAE3 00               nop  
WRA0:CAE4 0E 18            ld   c,$18
WRA0:CAE6 18 30            jr   $CB18
WRA0:CAE8 18 18            jr   $CB02
WRA0:CAEA 0E 00            ld   c,$00
WRA0:CAEC 18 18            jr   $CB06
WRA0:CAEE 18 18            jr   $CB08
WRA0:CAF0 18 18            jr   $CB0A
WRA0:CAF2 18 00            jr   $CAF4
WRA0:CAF4 70               ld   [hl],b
WRA0:CAF5 18 18            jr   $CB0F
WRA0:CAF7 0C               inc  c
WRA0:CAF8 18 18            jr   $CB12
WRA0:CAFA 70               ld   [hl],b
WRA0:CAFB 00               nop  
WRA0:CAFC 00               nop  
WRA0:CAFD 00               nop  
WRA0:CAFE 60               ld   h,b
WRA0:CAFF F2               ld   a,[$ff00+c]
WRA0:CB00 9E               sbc  [hl]
WRA0:CB01 0C               inc  c
WRA0:CB02 00               nop  
WRA0:CB03 00               nop  
WRA0:CB04 00               nop  
WRA0:CB05 00               nop  
WRA0:CB06 00               nop  
WRA0:CB07 00               nop  
WRA0:CB08 00               nop  
WRA0:CB09 00               nop  
WRA0:CB0A 00               nop  
WRA0:CB0B 00               nop  
WRA0:CB0C CD DE C6         call $C6DE
WRA0:CB0F E5               push hl
WRA0:CB10 CD C2 C0         call $C0C2
WRA0:CB13 30 33            jr   nc,$CB48
WRA0:CB15 2D               dec  l
WRA0:CB16 6F               ld   l,a
WRA0:CB17 70               ld   [hl],b
WRA0:CB18 20 73            jr   nz,$CB8D
WRA0:CB1A 70               ld   [hl],b
WRA0:CB1B 2C               inc  l
WRA0:CB1C 68               ld   l,b
WRA0:CB1D 6C               ld   l,h
WRA0:CB1E 0A               ld   a,[bc]
WRA0:CB1F 0A               ld   a,[bc]
WRA0:CB20 00               nop  
WRA0:CB21 E1               pop  hl
WRA0:CB22 C9               ret  
WRA0:CB23 F5               push af
WRA0:CB24 E0 01            ldh  [$FF01],a
WRA0:CB26 3E 81            ld   a,$81
WRA0:CB28 E0 02            ldh  [$FF02],a
WRA0:CB2A F5               push af
WRA0:CB2B 3E 08            ld   a,$08
WRA0:CB2D CD 12 C0         call $C012
WRA0:CB30 3E D8            ld   a,$D8
WRA0:CB32 CD 03 C0         call $C003
WRA0:CB35 F1               pop  af
WRA0:CB36 F1               pop  af
WRA0:CB37 C3 96 C7         jp   $C796
WRA0:CB3A CD 6E C7         call $C76E
WRA0:CB3D CD 46 CB         call $CB46
WRA0:CB40 3E 00            ld   a,$00
WRA0:CB42 E0 26            ldh  [$FF26],a
WRA0:CB44 18 FE            jr   $CB44
WRA0:CB46 C9               ret  
WRA0:CB47 00               nop  
WRA0:CB48 00               nop  
WRA0:CB49 00               nop  
WRA0:CB4A 00               nop  
WRA0:CB4B 00               nop  
WRA0:CB4C 00               nop  
WRA0:CB4D 00               nop  
WRA0:CB4E 00               nop  
WRA0:CB4F 00               nop  
WRA0:CB50 00               nop  
WRA0:CB51 00               nop  
WRA0:CB52 00               nop  
WRA0:CB53 00               nop  
WRA0:CB54 00               nop  
WRA0:CB55 00               nop  
WRA0:CB56 00               nop  
WRA0:CB57 00               nop  
WRA0:CB58 00               nop  
WRA0:CB59 00               nop  
WRA0:CB5A 00               nop  
WRA0:CB5B 00               nop  
WRA0:CB5C 00               nop  
WRA0:CB5D 00               nop  
WRA0:CB5E 00               nop  
WRA0:CB5F 00               nop  
WRA0:CB60 00               nop  
WRA0:CB61 00               nop  
WRA0:CB62 00               nop  
WRA0:CB63 00               nop  
WRA0:CB64 00               nop  
WRA0:CB65 00               nop  
WRA0:CB66 00               nop  
WRA0:CB67 00               nop  
WRA0:CB68 00               nop  
WRA0:CB69 00               nop  
WRA0:CB6A 00               nop  
WRA0:CB6B 00               nop  
WRA0:CB6C 00               nop  
WRA0:CB6D 00               nop  
WRA0:CB6E 00               nop  
WRA0:CB6F 00               nop  
WRA0:CB70 00               nop  
WRA0:CB71 00               nop  
WRA0:CB72 00               nop  
WRA0:CB73 00               nop  
WRA0:CB74 00               nop  
WRA0:CB75 00               nop  
WRA0:CB76 00               nop  
WRA0:CB77 00               nop  
WRA0:CB78 00               nop  
WRA0:CB79 00               nop  
WRA0:CB7A 00               nop  
WRA0:CB7B 00               nop  
WRA0:CB7C 00               nop  
WRA0:CB7D 00               nop  
WRA0:CB7E 00               nop  
WRA0:CB7F 00               nop  
WRA0:CB80 00               nop  
WRA0:CB81 00               nop  
WRA0:CB82 00               nop  
WRA0:CB83 00               nop  
WRA0:CB84 00               nop  
WRA0:CB85 00               nop  
WRA0:CB86 00               nop  
WRA0:CB87 00               nop  
WRA0:CB88 00               nop  
WRA0:CB89 00               nop  
WRA0:CB8A 00               nop  
WRA0:CB8B 00               nop  
WRA0:CB8C 00               nop  
WRA0:CB8D 00               nop  
WRA0:CB8E 00               nop  
WRA0:CB8F 00               nop  
WRA0:CB90 00               nop  
WRA0:CB91 00               nop  
WRA0:CB92 00               nop  
WRA0:CB93 00               nop  
WRA0:CB94 00               nop  
WRA0:CB95 00               nop  
WRA0:CB96 00               nop  
WRA0:CB97 00               nop  
WRA0:CB98 00               nop  
WRA0:CB99 00               nop  
WRA0:CB9A 00               nop  
WRA0:CB9B 00               nop  
WRA0:CB9C 00               nop  
WRA0:CB9D 00               nop  
WRA0:CB9E 00               nop  
WRA0:CB9F 00               nop  
WRA0:CBA0 00               nop  
WRA0:CBA1 00               nop  
WRA0:CBA2 00               nop  
WRA0:CBA3 00               nop  
WRA0:CBA4 00               nop  
WRA0:CBA5 00               nop  
WRA0:CBA6 00               nop  
WRA0:CBA7 00               nop  
WRA0:CBA8 00               nop  
WRA0:CBA9 00               nop  
WRA0:CBAA 00               nop  
WRA0:CBAB 00               nop  
WRA0:CBAC 00               nop  
WRA0:CBAD 00               nop  
WRA0:CBAE 00               nop  
WRA0:CBAF 00               nop  
WRA0:CBB0 00               nop  
WRA0:CBB1 00               nop  
WRA0:CBB2 00               nop  
WRA0:CBB3 00               nop  
WRA0:CBB4 00               nop  
WRA0:CBB5 00               nop  
WRA0:CBB6 00               nop  
WRA0:CBB7 00               nop  
WRA0:CBB8 00               nop  
WRA0:CBB9 00               nop  
WRA0:CBBA 00               nop  
WRA0:CBBB 00               nop  
WRA0:CBBC 00               nop  
WRA0:CBBD 00               nop  
WRA0:CBBE 00               nop  
WRA0:CBBF 00               nop  
WRA0:CBC0 00               nop  
WRA0:CBC1 00               nop  
WRA0:CBC2 00               nop  
WRA0:CBC3 00               nop  
WRA0:CBC4 00               nop  
WRA0:CBC5 00               nop  
WRA0:CBC6 00               nop  
WRA0:CBC7 00               nop  
WRA0:CBC8 00               nop  
WRA0:CBC9 00               nop  
WRA0:CBCA 00               nop  
WRA0:CBCB 00               nop  
WRA0:CBCC 00               nop  
WRA0:CBCD 00               nop  
WRA0:CBCE 00               nop  
WRA0:CBCF 00               nop  
WRA0:CBD0 00               nop  
WRA0:CBD1 00               nop  
WRA0:CBD2 00               nop  
WRA0:CBD3 00               nop  
WRA0:CBD4 00               nop  
WRA0:CBD5 00               nop  
WRA0:CBD6 00               nop  
WRA0:CBD7 00               nop  
WRA0:CBD8 00               nop  
WRA0:CBD9 00               nop  
WRA0:CBDA 00               nop  
WRA0:CBDB 00               nop  
WRA0:CBDC 00               nop  
WRA0:CBDD 00               nop  
WRA0:CBDE 00               nop  
WRA0:CBDF 00               nop  
WRA0:CBE0 00               nop  
WRA0:CBE1 00               nop  
WRA0:CBE2 00               nop  
WRA0:CBE3 00               nop  
WRA0:CBE4 00               nop  
WRA0:CBE5 00               nop  
WRA0:CBE6 00               nop  
WRA0:CBE7 00               nop  
WRA0:CBE8 00               nop  
WRA0:CBE9 00               nop  
WRA0:CBEA 00               nop  
WRA0:CBEB 00               nop  
WRA0:CBEC 00               nop  
WRA0:CBED 00               nop  
WRA0:CBEE 00               nop  
WRA0:CBEF 00               nop  
WRA0:CBF0 00               nop  
WRA0:CBF1 00               nop  
WRA0:CBF2 00               nop  
WRA0:CBF3 00               nop  
WRA0:CBF4 00               nop  
WRA0:CBF5 00               nop  
WRA0:CBF6 00               nop  
WRA0:CBF7 00               nop  
WRA0:CBF8 00               nop  
WRA0:CBF9 00               nop  
WRA0:CBFA 00               nop  
WRA0:CBFB 00               nop  
WRA0:CBFC 00               nop  
WRA0:CBFD 00               nop  
WRA0:CBFE 00               nop  
WRA0:CBFF 00               nop  
WRA0:CC00 00               nop  
WRA0:CC01 00               nop  
WRA0:CC02 00               nop  
WRA0:CC03 00               nop  
WRA0:CC04 00               nop  
WRA0:CC05 00               nop  
WRA0:CC06 00               nop  
WRA0:CC07 00               nop  
WRA0:CC08 00               nop  
WRA0:CC09 00               nop  
WRA0:CC0A 00               nop  
WRA0:CC0B 00               nop  
WRA0:CC0C 00               nop  
WRA0:CC0D 00               nop  
WRA0:CC0E 00               nop  
WRA0:CC0F 00               nop  
WRA0:CC10 00               nop  
WRA0:CC11 00               nop  
WRA0:CC12 00               nop  
WRA0:CC13 00               nop  
WRA0:CC14 00               nop  
WRA0:CC15 00               nop  
WRA0:CC16 00               nop  
WRA0:CC17 00               nop  
WRA0:CC18 00               nop  
WRA0:CC19 00               nop  
WRA0:CC1A 00               nop  
WRA0:CC1B 00               nop  
WRA0:CC1C 00               nop  
WRA0:CC1D 00               nop  
WRA0:CC1E 00               nop  
WRA0:CC1F 00               nop  
WRA0:CC20 00               nop  
WRA0:CC21 00               nop  
WRA0:CC22 00               nop  
WRA0:CC23 00               nop  
WRA0:CC24 00               nop  
WRA0:CC25 00               nop  
WRA0:CC26 00               nop  
WRA0:CC27 00               nop  
WRA0:CC28 00               nop  
WRA0:CC29 00               nop  
WRA0:CC2A 00               nop  
WRA0:CC2B 00               nop  
WRA0:CC2C 00               nop  
WRA0:CC2D 00               nop  
WRA0:CC2E 00               nop  
WRA0:CC2F 00               nop  
WRA0:CC30 00               nop  
WRA0:CC31 00               nop  
WRA0:CC32 00               nop  
WRA0:CC33 00               nop  
WRA0:CC34 00               nop  
WRA0:CC35 00               nop  
WRA0:CC36 00               nop  
WRA0:CC37 00               nop  
WRA0:CC38 00               nop  
WRA0:CC39 00               nop  
WRA0:CC3A 00               nop  
WRA0:CC3B 00               nop  
WRA0:CC3C 00               nop  
WRA0:CC3D 00               nop  
WRA0:CC3E 00               nop  
WRA0:CC3F 00               nop  
WRA0:CC40 00               nop  
WRA0:CC41 00               nop  
WRA0:CC42 00               nop  
WRA0:CC43 00               nop  
WRA0:CC44 00               nop  
WRA0:CC45 00               nop  
WRA0:CC46 00               nop  
WRA0:CC47 00               nop  
WRA0:CC48 00               nop  
WRA0:CC49 00               nop  
WRA0:CC4A 00               nop  
WRA0:CC4B 00               nop  
WRA0:CC4C 00               nop  
WRA0:CC4D 00               nop  
WRA0:CC4E 00               nop  
WRA0:CC4F 00               nop  
WRA0:CC50 00               nop  
WRA0:CC51 00               nop  
WRA0:CC52 00               nop  
WRA0:CC53 00               nop  
WRA0:CC54 00               nop  
WRA0:CC55 00               nop  
WRA0:CC56 00               nop  
WRA0:CC57 00               nop  
WRA0:CC58 00               nop  
WRA0:CC59 00               nop  
WRA0:CC5A 00               nop  
WRA0:CC5B 00               nop  
WRA0:CC5C 00               nop  
WRA0:CC5D 00               nop  
WRA0:CC5E 00               nop  
WRA0:CC5F 00               nop  
WRA0:CC60 00               nop  
WRA0:CC61 00               nop  
WRA0:CC62 00               nop  
WRA0:CC63 00               nop  
WRA0:CC64 00               nop  
WRA0:CC65 00               nop  
WRA0:CC66 00               nop  
WRA0:CC67 00               nop  
WRA0:CC68 00               nop  
WRA0:CC69 00               nop  
WRA0:CC6A 00               nop  
WRA0:CC6B 00               nop  
WRA0:CC6C 00               nop  
WRA0:CC6D 00               nop  
WRA0:CC6E 00               nop  
WRA0:CC6F 00               nop  
WRA0:CC70 00               nop  
WRA0:CC71 00               nop  
WRA0:CC72 00               nop  
WRA0:CC73 00               nop  
WRA0:CC74 00               nop  
WRA0:CC75 00               nop  
WRA0:CC76 00               nop  
WRA0:CC77 00               nop  
WRA0:CC78 00               nop  
WRA0:CC79 00               nop  
WRA0:CC7A 00               nop  
WRA0:CC7B 00               nop  
WRA0:CC7C 00               nop  
WRA0:CC7D 00               nop  
WRA0:CC7E 00               nop  
WRA0:CC7F 00               nop  
WRA0:CC80 00               nop  
WRA0:CC81 00               nop  
WRA0:CC82 00               nop  
WRA0:CC83 00               nop  
WRA0:CC84 00               nop  
WRA0:CC85 00               nop  
WRA0:CC86 00               nop  
WRA0:CC87 00               nop  
WRA0:CC88 00               nop  
WRA0:CC89 00               nop  
WRA0:CC8A 00               nop  
WRA0:CC8B 00               nop  
WRA0:CC8C 00               nop  
WRA0:CC8D 00               nop  
WRA0:CC8E 00               nop  
WRA0:CC8F 00               nop  
WRA0:CC90 00               nop  
WRA0:CC91 00               nop  
WRA0:CC92 00               nop  
WRA0:CC93 00               nop  
WRA0:CC94 00               nop  
WRA0:CC95 00               nop  
WRA0:CC96 00               nop  
WRA0:CC97 00               nop  
WRA0:CC98 00               nop  
WRA0:CC99 00               nop  
WRA0:CC9A 00               nop  
WRA0:CC9B 00               nop  
WRA0:CC9C 00               nop  
WRA0:CC9D 00               nop  
WRA0:CC9E 00               nop  
WRA0:CC9F 00               nop  
WRA0:CCA0 00               nop  
WRA0:CCA1 00               nop  
WRA0:CCA2 00               nop  
WRA0:CCA3 00               nop  
WRA0:CCA4 00               nop  
WRA0:CCA5 00               nop  
WRA0:CCA6 00               nop  
WRA0:CCA7 00               nop  
WRA0:CCA8 00               nop  
WRA0:CCA9 00               nop  
WRA0:CCAA 00               nop  
WRA0:CCAB 00               nop  
WRA0:CCAC 00               nop  
WRA0:CCAD 00               nop  
WRA0:CCAE 00               nop  
WRA0:CCAF 00               nop  
WRA0:CCB0 00               nop  
WRA0:CCB1 00               nop  
WRA0:CCB2 00               nop  
WRA0:CCB3 00               nop  
WRA0:CCB4 00               nop  
WRA0:CCB5 00               nop  
WRA0:CCB6 00               nop  
WRA0:CCB7 00               nop  
WRA0:CCB8 00               nop  
WRA0:CCB9 00               nop  
WRA0:CCBA 00               nop  
WRA0:CCBB 00               nop  
WRA0:CCBC 00               nop  
WRA0:CCBD 00               nop  
WRA0:CCBE 00               nop  
WRA0:CCBF 00               nop  
WRA0:CCC0 00               nop  
WRA0:CCC1 00               nop  
WRA0:CCC2 00               nop  
WRA0:CCC3 00               nop  
WRA0:CCC4 00               nop  
WRA0:CCC5 00               nop  
WRA0:CCC6 00               nop  
WRA0:CCC7 00               nop  
WRA0:CCC8 00               nop  
WRA0:CCC9 00               nop  
WRA0:CCCA 00               nop  
WRA0:CCCB 00               nop  
WRA0:CCCC 00               nop  
WRA0:CCCD 00               nop  
WRA0:CCCE 00               nop  
WRA0:CCCF 00               nop  
WRA0:CCD0 00               nop  
WRA0:CCD1 00               nop  
WRA0:CCD2 00               nop  
WRA0:CCD3 00               nop  
WRA0:CCD4 00               nop  
WRA0:CCD5 00               nop  
WRA0:CCD6 00               nop  
WRA0:CCD7 00               nop  
WRA0:CCD8 00               nop  
WRA0:CCD9 00               nop  
WRA0:CCDA 00               nop  
WRA0:CCDB 00               nop  
WRA0:CCDC 00               nop  
WRA0:CCDD 00               nop  
WRA0:CCDE 00               nop  
WRA0:CCDF 00               nop  
WRA0:CCE0 00               nop  
WRA0:CCE1 00               nop  
WRA0:CCE2 00               nop  
WRA0:CCE3 00               nop  
WRA0:CCE4 00               nop  
WRA0:CCE5 00               nop  
WRA0:CCE6 00               nop  
WRA0:CCE7 00               nop  
WRA0:CCE8 00               nop  
WRA0:CCE9 00               nop  
WRA0:CCEA 00               nop  
WRA0:CCEB 00               nop  
WRA0:CCEC 00               nop  
WRA0:CCED 00               nop  
WRA0:CCEE 00               nop  
WRA0:CCEF 00               nop  
WRA0:CCF0 00               nop  
WRA0:CCF1 00               nop  
WRA0:CCF2 00               nop  
WRA0:CCF3 00               nop  
WRA0:CCF4 00               nop  
WRA0:CCF5 00               nop  
WRA0:CCF6 00               nop  
WRA0:CCF7 00               nop  
WRA0:CCF8 00               nop  
WRA0:CCF9 00               nop  
WRA0:CCFA 00               nop  
WRA0:CCFB 00               nop  
WRA0:CCFC 00               nop  
WRA0:CCFD 00               nop  
WRA0:CCFE 00               nop  
WRA0:CCFF 00               nop  
WRA0:CD00 00               nop  
WRA0:CD01 00               nop  
WRA0:CD02 00               nop  
WRA0:CD03 00               nop  
WRA0:CD04 00               nop  
WRA0:CD05 00               nop  
WRA0:CD06 00               nop  
WRA0:CD07 00               nop  
WRA0:CD08 00               nop  
WRA0:CD09 00               nop  
WRA0:CD0A 00               nop  
WRA0:CD0B 00               nop  
WRA0:CD0C 00               nop  
WRA0:CD0D 00               nop  
WRA0:CD0E 00               nop  
WRA0:CD0F 00               nop  
WRA0:CD10 00               nop  
WRA0:CD11 00               nop  
WRA0:CD12 00               nop  
WRA0:CD13 00               nop  
WRA0:CD14 00               nop  
WRA0:CD15 00               nop  
WRA0:CD16 00               nop  
WRA0:CD17 00               nop  
WRA0:CD18 00               nop  
WRA0:CD19 00               nop  
WRA0:CD1A 00               nop  
WRA0:CD1B 00               nop  
WRA0:CD1C 00               nop  
WRA0:CD1D 00               nop  
WRA0:CD1E 00               nop  
WRA0:CD1F 00               nop  
WRA0:CD20 00               nop  
WRA0:CD21 00               nop  
WRA0:CD22 00               nop  
WRA0:CD23 00               nop  
WRA0:CD24 00               nop  
WRA0:CD25 00               nop  
WRA0:CD26 00               nop  
WRA0:CD27 00               nop  
WRA0:CD28 00               nop  
WRA0:CD29 00               nop  
WRA0:CD2A 00               nop  
WRA0:CD2B 00               nop  
WRA0:CD2C 00               nop  
WRA0:CD2D 00               nop  
WRA0:CD2E 00               nop  
WRA0:CD2F 00               nop  
WRA0:CD30 00               nop  
WRA0:CD31 00               nop  
WRA0:CD32 00               nop  
WRA0:CD33 00               nop  
WRA0:CD34 00               nop  
WRA0:CD35 00               nop  
WRA0:CD36 00               nop  
WRA0:CD37 00               nop  
WRA0:CD38 00               nop  
WRA0:CD39 00               nop  
WRA0:CD3A 00               nop  
WRA0:CD3B 00               nop  
WRA0:CD3C 00               nop  
WRA0:CD3D 00               nop  
WRA0:CD3E 00               nop  
WRA0:CD3F 00               nop  
WRA0:CD40 00               nop  
WRA0:CD41 00               nop  
WRA0:CD42 00               nop  
WRA0:CD43 00               nop  
WRA0:CD44 00               nop  
WRA0:CD45 00               nop  
WRA0:CD46 00               nop  
WRA0:CD47 00               nop  
WRA0:CD48 00               nop  
WRA0:CD49 00               nop  
WRA0:CD4A 00               nop  
WRA0:CD4B 00               nop  
WRA0:CD4C 00               nop  
WRA0:CD4D 00               nop  
WRA0:CD4E 00               nop  
WRA0:CD4F 00               nop  
WRA0:CD50 00               nop  
WRA0:CD51 00               nop  
WRA0:CD52 00               nop  
WRA0:CD53 00               nop  
WRA0:CD54 00               nop  
WRA0:CD55 00               nop  
WRA0:CD56 00               nop  
WRA0:CD57 00               nop  
WRA0:CD58 00               nop  
WRA0:CD59 00               nop  
WRA0:CD5A 00               nop  
WRA0:CD5B 00               nop  
WRA0:CD5C 00               nop  
WRA0:CD5D 00               nop  
WRA0:CD5E 00               nop  
WRA0:CD5F 00               nop  
WRA0:CD60 00               nop  
WRA0:CD61 00               nop  
WRA0:CD62 00               nop  
WRA0:CD63 00               nop  
WRA0:CD64 00               nop  
WRA0:CD65 00               nop  
WRA0:CD66 00               nop  
WRA0:CD67 00               nop  
WRA0:CD68 00               nop  
WRA0:CD69 00               nop  
WRA0:CD6A 00               nop  
WRA0:CD6B 00               nop  
WRA0:CD6C 00               nop  
WRA0:CD6D 00               nop  
WRA0:CD6E 00               nop  
WRA0:CD6F 00               nop  
WRA0:CD70 00               nop  
WRA0:CD71 00               nop  
WRA0:CD72 00               nop  
WRA0:CD73 00               nop  
WRA0:CD74 00               nop  
WRA0:CD75 00               nop  
WRA0:CD76 00               nop  
WRA0:CD77 00               nop  
WRA0:CD78 00               nop  
WRA0:CD79 00               nop  
WRA0:CD7A 00               nop  
WRA0:CD7B 00               nop  
WRA0:CD7C 00               nop  
WRA0:CD7D 00               nop  
WRA0:CD7E 00               nop  
WRA0:CD7F 00               nop  
WRA0:CD80 00               nop  
WRA0:CD81 00               nop  
WRA0:CD82 00               nop  
WRA0:CD83 00               nop  
WRA0:CD84 00               nop  
WRA0:CD85 00               nop  
WRA0:CD86 00               nop  
WRA0:CD87 00               nop  
WRA0:CD88 00               nop  
WRA0:CD89 00               nop  
WRA0:CD8A 00               nop  
WRA0:CD8B 00               nop  
WRA0:CD8C 00               nop  
WRA0:CD8D 00               nop  
WRA0:CD8E 00               nop  
WRA0:CD8F 00               nop  
WRA0:CD90 00               nop  
WRA0:CD91 00               nop  
WRA0:CD92 00               nop  
WRA0:CD93 00               nop  
WRA0:CD94 00               nop  
WRA0:CD95 00               nop  
WRA0:CD96 00               nop  
WRA0:CD97 00               nop  
WRA0:CD98 00               nop  
WRA0:CD99 00               nop  
WRA0:CD9A 00               nop  
WRA0:CD9B 00               nop  
WRA0:CD9C 00               nop  
WRA0:CD9D 00               nop  
WRA0:CD9E 00               nop  
WRA0:CD9F 00               nop  
WRA0:CDA0 00               nop  
WRA0:CDA1 00               nop  
WRA0:CDA2 00               nop  
WRA0:CDA3 00               nop  
WRA0:CDA4 00               nop  
WRA0:CDA5 00               nop  
WRA0:CDA6 00               nop  
WRA0:CDA7 00               nop  
WRA0:CDA8 00               nop  
WRA0:CDA9 00               nop  
WRA0:CDAA 00               nop  
WRA0:CDAB 00               nop  
WRA0:CDAC 00               nop  
WRA0:CDAD 00               nop  
WRA0:CDAE 00               nop  
WRA0:CDAF 00               nop  
WRA0:CDB0 00               nop  
WRA0:CDB1 00               nop  
WRA0:CDB2 00               nop  
WRA0:CDB3 00               nop  
WRA0:CDB4 00               nop  
WRA0:CDB5 00               nop  
WRA0:CDB6 00               nop  
WRA0:CDB7 00               nop  
WRA0:CDB8 00               nop  
WRA0:CDB9 00               nop  
WRA0:CDBA 00               nop  
WRA0:CDBB 00               nop  
WRA0:CDBC 00               nop  
WRA0:CDBD 00               nop  
WRA0:CDBE 00               nop  
WRA0:CDBF 00               nop  
WRA0:CDC0 00               nop  
WRA0:CDC1 00               nop  
WRA0:CDC2 00               nop  
WRA0:CDC3 00               nop  
WRA0:CDC4 00               nop  
WRA0:CDC5 00               nop  
WRA0:CDC6 00               nop  
WRA0:CDC7 00               nop  
WRA0:CDC8 00               nop  
WRA0:CDC9 00               nop  
WRA0:CDCA 00               nop  
WRA0:CDCB 00               nop  
WRA0:CDCC 00               nop  
WRA0:CDCD 00               nop  
WRA0:CDCE 00               nop  
WRA0:CDCF 00               nop  
WRA0:CDD0 00               nop  
WRA0:CDD1 00               nop  
WRA0:CDD2 00               nop  
WRA0:CDD3 00               nop  
WRA0:CDD4 00               nop  
WRA0:CDD5 00               nop  
WRA0:CDD6 00               nop  
WRA0:CDD7 00               nop  
WRA0:CDD8 00               nop  
WRA0:CDD9 00               nop  
WRA0:CDDA 00               nop  
WRA0:CDDB 00               nop  
WRA0:CDDC 00               nop  
WRA0:CDDD 00               nop  
WRA0:CDDE 00               nop  
WRA0:CDDF 00               nop  
WRA0:CDE0 00               nop  
WRA0:CDE1 00               nop  
WRA0:CDE2 00               nop  
WRA0:CDE3 00               nop  
WRA0:CDE4 00               nop  
WRA0:CDE5 00               nop  
WRA0:CDE6 00               nop  
WRA0:CDE7 00               nop  
WRA0:CDE8 00               nop  
WRA0:CDE9 00               nop  
WRA0:CDEA 00               nop  
WRA0:CDEB 00               nop  
WRA0:CDEC 00               nop  
WRA0:CDED 00               nop  
WRA0:CDEE 00               nop  
WRA0:CDEF 00               nop  
WRA0:CDF0 00               nop  
WRA0:CDF1 00               nop  
WRA0:CDF2 00               nop  
WRA0:CDF3 00               nop  
WRA0:CDF4 00               nop  
WRA0:CDF5 00               nop  
WRA0:CDF6 00               nop  
WRA0:CDF7 00               nop  
WRA0:CDF8 00               nop  
WRA0:CDF9 00               nop  
WRA0:CDFA 00               nop  
WRA0:CDFB 00               nop  
WRA0:CDFC 00               nop  
WRA0:CDFD 00               nop  
WRA0:CDFE 00               nop  
WRA0:CDFF 00               nop  
WRA0:CE00 00               nop  
WRA0:CE01 00               nop  
WRA0:CE02 00               nop  
WRA0:CE03 00               nop  
WRA0:CE04 00               nop  
WRA0:CE05 00               nop  
WRA0:CE06 00               nop  
WRA0:CE07 00               nop  
WRA0:CE08 00               nop  
WRA0:CE09 00               nop  
WRA0:CE0A 00               nop  
WRA0:CE0B 00               nop  
WRA0:CE0C 00               nop  
WRA0:CE0D 00               nop  
WRA0:CE0E 00               nop  
WRA0:CE0F 00               nop  
WRA0:CE10 00               nop  
WRA0:CE11 00               nop  
WRA0:CE12 00               nop  
WRA0:CE13 00               nop  
WRA0:CE14 00               nop  
WRA0:CE15 00               nop  
WRA0:CE16 00               nop  
WRA0:CE17 00               nop  
WRA0:CE18 00               nop  
WRA0:CE19 00               nop  
WRA0:CE1A 00               nop  
WRA0:CE1B 00               nop  
WRA0:CE1C 00               nop  
WRA0:CE1D 00               nop  
WRA0:CE1E 00               nop  
WRA0:CE1F 00               nop  
WRA0:CE20 00               nop  
WRA0:CE21 00               nop  
WRA0:CE22 00               nop  
WRA0:CE23 00               nop  
WRA0:CE24 00               nop  
WRA0:CE25 00               nop  
WRA0:CE26 00               nop  
WRA0:CE27 00               nop  
WRA0:CE28 00               nop  
WRA0:CE29 00               nop  
WRA0:CE2A 00               nop  
WRA0:CE2B 00               nop  
WRA0:CE2C 00               nop  
WRA0:CE2D 00               nop  
WRA0:CE2E 00               nop  
WRA0:CE2F 00               nop  
WRA0:CE30 00               nop  
WRA0:CE31 00               nop  
WRA0:CE32 00               nop  
WRA0:CE33 00               nop  
WRA0:CE34 00               nop  
WRA0:CE35 00               nop  
WRA0:CE36 00               nop  
WRA0:CE37 00               nop  
WRA0:CE38 00               nop  
WRA0:CE39 00               nop  
WRA0:CE3A 00               nop  
WRA0:CE3B 00               nop  
WRA0:CE3C 00               nop  
WRA0:CE3D 00               nop  
WRA0:CE3E 00               nop  
WRA0:CE3F 00               nop  
WRA0:CE40 00               nop  
WRA0:CE41 00               nop  
WRA0:CE42 00               nop  
WRA0:CE43 00               nop  
WRA0:CE44 00               nop  
WRA0:CE45 00               nop  
WRA0:CE46 00               nop  
WRA0:CE47 00               nop  
WRA0:CE48 00               nop  
WRA0:CE49 00               nop  
WRA0:CE4A 00               nop  
WRA0:CE4B 00               nop  
WRA0:CE4C 00               nop  
WRA0:CE4D 00               nop  
WRA0:CE4E 00               nop  
WRA0:CE4F 00               nop  
WRA0:CE50 00               nop  
WRA0:CE51 00               nop  
WRA0:CE52 00               nop  
WRA0:CE53 00               nop  
WRA0:CE54 00               nop  
WRA0:CE55 00               nop  
WRA0:CE56 00               nop  
WRA0:CE57 00               nop  
WRA0:CE58 00               nop  
WRA0:CE59 00               nop  
WRA0:CE5A 00               nop  
WRA0:CE5B 00               nop  
WRA0:CE5C 00               nop  
WRA0:CE5D 00               nop  
WRA0:CE5E 00               nop  
WRA0:CE5F 00               nop  
WRA0:CE60 00               nop  
WRA0:CE61 00               nop  
WRA0:CE62 00               nop  
WRA0:CE63 00               nop  
WRA0:CE64 00               nop  
WRA0:CE65 00               nop  
WRA0:CE66 00               nop  
WRA0:CE67 00               nop  
WRA0:CE68 00               nop  
WRA0:CE69 00               nop  
WRA0:CE6A 00               nop  
WRA0:CE6B 00               nop  
WRA0:CE6C 00               nop  
WRA0:CE6D 00               nop  
WRA0:CE6E 00               nop  
WRA0:CE6F 00               nop  
WRA0:CE70 00               nop  
WRA0:CE71 00               nop  
WRA0:CE72 00               nop  
WRA0:CE73 00               nop  
WRA0:CE74 00               nop  
WRA0:CE75 00               nop  
WRA0:CE76 00               nop  
WRA0:CE77 00               nop  
WRA0:CE78 00               nop  
WRA0:CE79 00               nop  
WRA0:CE7A 00               nop  
WRA0:CE7B 00               nop  
WRA0:CE7C 00               nop  
WRA0:CE7D 00               nop  
WRA0:CE7E 00               nop  
WRA0:CE7F 00               nop  
WRA0:CE80 00               nop  
WRA0:CE81 00               nop  
WRA0:CE82 00               nop  
WRA0:CE83 00               nop  
WRA0:CE84 00               nop  
WRA0:CE85 00               nop  
WRA0:CE86 00               nop  
WRA0:CE87 00               nop  
WRA0:CE88 00               nop  
WRA0:CE89 00               nop  
WRA0:CE8A 00               nop  
WRA0:CE8B 00               nop  
WRA0:CE8C 00               nop  
WRA0:CE8D 00               nop  
WRA0:CE8E 00               nop  
WRA0:CE8F 00               nop  
WRA0:CE90 00               nop  
WRA0:CE91 00               nop  
WRA0:CE92 00               nop  
WRA0:CE93 00               nop  
WRA0:CE94 00               nop  
WRA0:CE95 00               nop  
WRA0:CE96 00               nop  
WRA0:CE97 00               nop  
WRA0:CE98 00               nop  
WRA0:CE99 00               nop  
WRA0:CE9A 00               nop  
WRA0:CE9B 00               nop  
WRA0:CE9C 00               nop  
WRA0:CE9D 00               nop  
WRA0:CE9E 00               nop  
WRA0:CE9F 00               nop  
WRA0:CEA0 00               nop  
WRA0:CEA1 00               nop  
WRA0:CEA2 00               nop  
WRA0:CEA3 00               nop  
WRA0:CEA4 00               nop  
WRA0:CEA5 00               nop  
WRA0:CEA6 00               nop  
WRA0:CEA7 00               nop  
WRA0:CEA8 00               nop  
WRA0:CEA9 00               nop  
WRA0:CEAA 00               nop  
WRA0:CEAB 00               nop  
WRA0:CEAC 00               nop  
WRA0:CEAD 00               nop  
WRA0:CEAE 00               nop  
WRA0:CEAF 00               nop  
WRA0:CEB0 00               nop  
WRA0:CEB1 00               nop  
WRA0:CEB2 00               nop  
WRA0:CEB3 00               nop  
WRA0:CEB4 00               nop  
WRA0:CEB5 00               nop  
WRA0:CEB6 00               nop  
WRA0:CEB7 00               nop  
WRA0:CEB8 00               nop  
WRA0:CEB9 00               nop  
WRA0:CEBA 00               nop  
WRA0:CEBB 00               nop  
WRA0:CEBC 00               nop  
WRA0:CEBD 00               nop  
WRA0:CEBE 00               nop  
WRA0:CEBF 00               nop  
WRA0:CEC0 00               nop  
WRA0:CEC1 00               nop  
WRA0:CEC2 00               nop  
WRA0:CEC3 00               nop  
WRA0:CEC4 00               nop  
WRA0:CEC5 00               nop  
WRA0:CEC6 00               nop  
WRA0:CEC7 00               nop  
WRA0:CEC8 00               nop  
WRA0:CEC9 00               nop  
WRA0:CECA 00               nop  
WRA0:CECB 00               nop  
WRA0:CECC 00               nop  
WRA0:CECD 00               nop  
WRA0:CECE 00               nop  
WRA0:CECF 00               nop  
WRA0:CED0 00               nop  
WRA0:CED1 00               nop  
WRA0:CED2 00               nop  
WRA0:CED3 00               nop  
WRA0:CED4 00               nop  
WRA0:CED5 00               nop  
WRA0:CED6 00               nop  
WRA0:CED7 00               nop  
WRA0:CED8 00               nop  
WRA0:CED9 00               nop  
WRA0:CEDA 00               nop  
WRA0:CEDB 00               nop  
WRA0:CEDC 00               nop  
WRA0:CEDD 00               nop  
WRA0:CEDE 00               nop  
WRA0:CEDF 00               nop  
WRA0:CEE0 00               nop  
WRA0:CEE1 00               nop  
WRA0:CEE2 00               nop  
WRA0:CEE3 00               nop  
WRA0:CEE4 00               nop  
WRA0:CEE5 00               nop  
WRA0:CEE6 00               nop  
WRA0:CEE7 00               nop  
WRA0:CEE8 00               nop  
WRA0:CEE9 00               nop  
WRA0:CEEA 00               nop  
WRA0:CEEB 00               nop  
WRA0:CEEC 00               nop  
WRA0:CEED 00               nop  
WRA0:CEEE 00               nop  
WRA0:CEEF 00               nop  
WRA0:CEF0 00               nop  
WRA0:CEF1 00               nop  
WRA0:CEF2 00               nop  
WRA0:CEF3 00               nop  
WRA0:CEF4 00               nop  
WRA0:CEF5 00               nop  
WRA0:CEF6 00               nop  
WRA0:CEF7 00               nop  
WRA0:CEF8 00               nop  
WRA0:CEF9 00               nop  
WRA0:CEFA 00               nop  
WRA0:CEFB 00               nop  
WRA0:CEFC 00               nop  
WRA0:CEFD 00               nop  
WRA0:CEFE 00               nop  
WRA0:CEFF 00               nop  
WRA0:CF00 00               nop  
WRA0:CF01 00               nop  
WRA0:CF02 00               nop  
WRA0:CF03 00               nop  
WRA0:CF04 00               nop  
WRA0:CF05 00               nop  
WRA0:CF06 00               nop  
WRA0:CF07 00               nop  
WRA0:CF08 00               nop  
WRA0:CF09 00               nop  
WRA0:CF0A 00               nop  
WRA0:CF0B 00               nop  
WRA0:CF0C 00               nop  
WRA0:CF0D 00               nop  
WRA0:CF0E 00               nop  
WRA0:CF0F 00               nop  
WRA0:CF10 00               nop  
WRA0:CF11 00               nop  
WRA0:CF12 00               nop  
WRA0:CF13 00               nop  
WRA0:CF14 00               nop  
WRA0:CF15 00               nop  
WRA0:CF16 00               nop  
WRA0:CF17 00               nop  
WRA0:CF18 00               nop  
WRA0:CF19 00               nop  
WRA0:CF1A 00               nop  
WRA0:CF1B 00               nop  
WRA0:CF1C 00               nop  
WRA0:CF1D 00               nop  
WRA0:CF1E 00               nop  
WRA0:CF1F 00               nop  
WRA0:CF20 00               nop  
WRA0:CF21 00               nop  
WRA0:CF22 00               nop  
WRA0:CF23 00               nop  
WRA0:CF24 00               nop  
WRA0:CF25 00               nop  
WRA0:CF26 00               nop  
WRA0:CF27 00               nop  
WRA0:CF28 00               nop  
WRA0:CF29 00               nop  
WRA0:CF2A 00               nop  
WRA0:CF2B 00               nop  
WRA0:CF2C 00               nop  
WRA0:CF2D 00               nop  
WRA0:CF2E 00               nop  
WRA0:CF2F 00               nop  
WRA0:CF30 00               nop  
WRA0:CF31 00               nop  
WRA0:CF32 00               nop  
WRA0:CF33 00               nop  
WRA0:CF34 00               nop  
WRA0:CF35 00               nop  
WRA0:CF36 00               nop  
WRA0:CF37 00               nop  
WRA0:CF38 00               nop  
WRA0:CF39 00               nop  
WRA0:CF3A 00               nop  
WRA0:CF3B 00               nop  
WRA0:CF3C 00               nop  
WRA0:CF3D 00               nop  
WRA0:CF3E 00               nop  
WRA0:CF3F 00               nop  
WRA0:CF40 00               nop  
WRA0:CF41 00               nop  
WRA0:CF42 00               nop  
WRA0:CF43 00               nop  
WRA0:CF44 00               nop  
WRA0:CF45 00               nop  
WRA0:CF46 00               nop  
WRA0:CF47 00               nop  
WRA0:CF48 00               nop  
WRA0:CF49 00               nop  
WRA0:CF4A 00               nop  
WRA0:CF4B 00               nop  
WRA0:CF4C 00               nop  
WRA0:CF4D 00               nop  
WRA0:CF4E 00               nop  
WRA0:CF4F 00               nop  
WRA0:CF50 00               nop  
WRA0:CF51 00               nop  
WRA0:CF52 00               nop  
WRA0:CF53 00               nop  
WRA0:CF54 00               nop  
WRA0:CF55 00               nop  
WRA0:CF56 00               nop  
WRA0:CF57 00               nop  
WRA0:CF58 00               nop  
WRA0:CF59 00               nop  
WRA0:CF5A 00               nop  
WRA0:CF5B 00               nop  
WRA0:CF5C 00               nop  
WRA0:CF5D 00               nop  
WRA0:CF5E 00               nop  
WRA0:CF5F 00               nop  
WRA0:CF60 00               nop  
WRA0:CF61 00               nop  
WRA0:CF62 00               nop  
WRA0:CF63 00               nop  
WRA0:CF64 00               nop  
WRA0:CF65 00               nop  
WRA0:CF66 00               nop  
WRA0:CF67 00               nop  
WRA0:CF68 00               nop  
WRA0:CF69 00               nop  
WRA0:CF6A 00               nop  
WRA0:CF6B 00               nop  
WRA0:CF6C 00               nop  
WRA0:CF6D 00               nop  
WRA0:CF6E 00               nop  
WRA0:CF6F 00               nop  
WRA0:CF70 00               nop  
WRA0:CF71 00               nop  
WRA0:CF72 00               nop  
WRA0:CF73 00               nop  
WRA0:CF74 00               nop  
WRA0:CF75 00               nop  
WRA0:CF76 00               nop  
WRA0:CF77 00               nop  
WRA0:CF78 00               nop  
WRA0:CF79 00               nop  
WRA0:CF7A 00               nop  
WRA0:CF7B 00               nop  
WRA0:CF7C 00               nop  
WRA0:CF7D 00               nop  
WRA0:CF7E 00               nop  
WRA0:CF7F 00               nop  
WRA0:CF80 00               nop  
WRA0:CF81 00               nop  
WRA0:CF82 00               nop  
WRA0:CF83 00               nop  
WRA0:CF84 00               nop  
WRA0:CF85 00               nop  
WRA0:CF86 00               nop  
WRA0:CF87 00               nop  
WRA0:CF88 00               nop  
WRA0:CF89 00               nop  
WRA0:CF8A 00               nop  
WRA0:CF8B 00               nop  
WRA0:CF8C 00               nop  
WRA0:CF8D 00               nop  
WRA0:CF8E 00               nop  
WRA0:CF8F 00               nop  
WRA0:CF90 00               nop  
WRA0:CF91 00               nop  
WRA0:CF92 00               nop  
WRA0:CF93 00               nop  
WRA0:CF94 00               nop  
WRA0:CF95 00               nop  
WRA0:CF96 00               nop  
WRA0:CF97 00               nop  
WRA0:CF98 00               nop  
WRA0:CF99 00               nop  
WRA0:CF9A 00               nop  
WRA0:CF9B 00               nop  
WRA0:CF9C 00               nop  
WRA0:CF9D 00               nop  
WRA0:CF9E 00               nop  
WRA0:CF9F 00               nop  
WRA0:CFA0 00               nop  
WRA0:CFA1 00               nop  
WRA0:CFA2 00               nop  
WRA0:CFA3 00               nop  
WRA0:CFA4 00               nop  
WRA0:CFA5 00               nop  
WRA0:CFA6 00               nop  
WRA0:CFA7 00               nop  
WRA0:CFA8 00               nop  
WRA0:CFA9 00               nop  
WRA0:CFAA 00               nop  
WRA0:CFAB 00               nop  
WRA0:CFAC 00               nop  
WRA0:CFAD 00               nop  
WRA0:CFAE 00               nop  
WRA0:CFAF 00               nop  
WRA0:CFB0 00               nop  
WRA0:CFB1 00               nop  
WRA0:CFB2 00               nop  
WRA0:CFB3 00               nop  
WRA0:CFB4 00               nop  
WRA0:CFB5 00               nop  
WRA0:CFB6 00               nop  
WRA0:CFB7 00               nop  
WRA0:CFB8 00               nop  
WRA0:CFB9 00               nop  
WRA0:CFBA 00               nop  
WRA0:CFBB 00               nop  
WRA0:CFBC 00               nop  
WRA0:CFBD 00               nop  
WRA0:CFBE 00               nop  
WRA0:CFBF 00               nop  
WRA0:CFC0 00               nop  
WRA0:CFC1 00               nop  
WRA0:CFC2 00               nop  
WRA0:CFC3 00               nop  
WRA0:CFC4 00               nop  
WRA0:CFC5 00               nop  
WRA0:CFC6 00               nop  
WRA0:CFC7 00               nop  
WRA0:CFC8 00               nop  
WRA0:CFC9 00               nop  
WRA0:CFCA 00               nop  
WRA0:CFCB 00               nop  
WRA0:CFCC 00               nop  
WRA0:CFCD 00               nop  
WRA0:CFCE 00               nop  
WRA0:CFCF 00               nop  
WRA0:CFD0 00               nop  
WRA0:CFD1 00               nop  
WRA0:CFD2 00               nop  
WRA0:CFD3 00               nop  
WRA0:CFD4 00               nop  
WRA0:CFD5 00               nop  
WRA0:CFD6 00               nop  
WRA0:CFD7 00               nop  
WRA0:CFD8 00               nop  
WRA0:CFD9 00               nop  
WRA0:CFDA 00               nop  
WRA0:CFDB 00               nop  
WRA0:CFDC 00               nop  
WRA0:CFDD 00               nop  
WRA0:CFDE 00               nop  
WRA0:CFDF 00               nop  
WRA0:CFE0 00               nop  
WRA0:CFE1 00               nop  
WRA0:CFE2 00               nop  
WRA0:CFE3 00               nop  
WRA0:CFE4 00               nop  
WRA0:CFE5 00               nop  
WRA0:CFE6 00               nop  
WRA0:CFE7 00               nop  
WRA0:CFE8 00               nop  
WRA0:CFE9 00               nop  
WRA0:CFEA 00               nop  
WRA0:CFEB 00               nop  
WRA0:CFEC 00               nop  
WRA0:CFED 00               nop  
WRA0:CFEE 00               nop  
WRA0:CFEF 00               nop  
WRA0:CFF0 00               nop  
WRA0:CFF1 00               nop  
WRA0:CFF2 00               nop  
WRA0:CFF3 00               nop  
WRA0:CFF4 00               nop  
WRA0:CFF5 00               nop  
WRA0:CFF6 00               nop  
WRA0:CFF7 00               nop  
WRA0:CFF8 00               nop  
WRA0:CFF9 00               nop  
WRA0:CFFA 00               nop  
WRA0:CFFB 00               nop  
WRA0:CFFC 00               nop  
WRA0:CFFD 00               nop  
WRA0:CFFE 00               nop  
WRA0:CFFF 00               nop  
WRA1:D000 89               adc  c
WRA1:D001 98               sbc  b
WRA1:D002 21 B3 C0         ld   hl,$C0B3
WRA1:D005 78               ld   a,b
WRA1:D006 63               ld   h,e
WRA1:D007 DA 97 0F         jp   c,$0F97
WRA1:D00A 6C               ld   l,h
WRA1:D00B 06 D6            ld   b,$D6
WRA1:D00D 86               add  [hl]
WRA1:D00E 34               inc  [hl]
WRA1:D00F 86               add  [hl]
WRA1:D010 6C               ld   l,h
WRA1:D011 20 0C            jr   nz,$D01F
WRA1:D013 06 94            ld   b,$94
WRA1:D015 DD               db   $DD ; undefined opcode
WRA1:D016 E0 D2            ldh  [$FFD2],a
WRA1:D018 CF               rst  $08
WRA1:D019 0D               dec  c
WRA1:D01A C8               ret  z
WRA1:D01B 1D               dec  e
WRA1:D01C 0F               rrca 
WRA1:D01D 07               rlca 
WRA1:D01E 1E DF            ld   e,$DF
WRA1:D020 F9               ld   sp,hl
WRA1:D021 4C               ld   c,h
WRA1:D022 B0               or   b
WRA1:D023 54               ld   d,h
WRA1:D024 44               ld   b,h
WRA1:D025 A0               and  b
WRA1:D026 B0               or   b
WRA1:D027 C0               ret  nz
WRA1:D028 3D               dec  a
WRA1:D029 1D               dec  e
WRA1:D02A 1B               dec  de
WRA1:D02B 1E AD            ld   e,$AD
WRA1:D02D 1D               dec  e
WRA1:D02E 8B               adc  e
WRA1:D02F C5               push bc
WRA1:D030 F0 26            ldh  a,[$FF26]
WRA1:D032 FA D0 B6         ld   a,[$B6D0]
WRA1:D035 FE 11            cp   a,$11
WRA1:D037 51               ld   d,c
WRA1:D038 CF               rst  $08
WRA1:D039 AF               xor  a
WRA1:D03A 0B               dec  bc
WRA1:D03B 16 DD            ld   d,$DD
WRA1:D03D 0C               inc  c
WRA1:D03E 5F               ld   e,a
WRA1:D03F 99               sbc  c
WRA1:D040 5A               ld   e,d
WRA1:D041 82               add  d
WRA1:D042 7D               ld   a,l
WRA1:D043 60               ld   h,b
WRA1:D044 F3               di   
WRA1:D045 94               sub  h
WRA1:D046 78               ld   a,b
WRA1:D047 FC               db   $FC ; undefined opcode
WRA1:D048 3F               ccf  
WRA1:D049 AE               xor  [hl]
WRA1:D04A 6B               ld   l,e
WRA1:D04B 64               ld   h,h
WRA1:D04C AE               xor  [hl]
WRA1:D04D 63               ld   h,e
WRA1:D04E 5B               ld   e,e
WRA1:D04F 3E F5            ld   a,$F5
WRA1:D051 F0 F0            ldh  a,[$FFF0]
WRA1:D053 71               ld   [hl],c
WRA1:D054 6B               ld   l,e
WRA1:D055 BE               cp   [hl]
WRA1:D056 50               ld   d,b
WRA1:D057 F0 07            ldh  a,[$FF07]
WRA1:D059 0C               inc  c
WRA1:D05A 6D               ld   l,l
WRA1:D05B 7B               ld   a,e
WRA1:D05C 8D               adc  l
WRA1:D05D 4E               ld   c,[hl]
WRA1:D05E 19               add  hl,de
WRA1:D05F 77               ld   [hl],a
WRA1:D060 8E               adc  [hl]
WRA1:D061 78               ld   a,b
WRA1:D062 F0 E3            ldh  a,[$FFE3]
WRA1:D064 32               ldd  [hl],a
WRA1:D065 73               ld   [hl],e
WRA1:D066 D6 F3            sub  a,$F3
WRA1:D068 A5               and  l
WRA1:D069 11 06 35         ld   de,$3506
WRA1:D06C E1               pop  hl
WRA1:D06D 02               ld   [bc],a
WRA1:D06E 4F               ld   c,a
WRA1:D06F 0F               rrca 
WRA1:D070 D9               reti 
WRA1:D071 30 80            jr   nc,$CFF3
WRA1:D073 E5               push hl
WRA1:D074 B9               cp   c
WRA1:D075 F2               ld   a,[$ff00+c]
WRA1:D076 B2               or   d
WRA1:D077 E0 05            ldh  [$FF05],a
WRA1:D079 A6               and  [hl]
WRA1:D07A 07               rlca 
WRA1:D07B 37               scf  
WRA1:D07C 2C               inc  l
WRA1:D07D 17               rla  
WRA1:D07E 5B               ld   e,e
WRA1:D07F 2D               dec  l
WRA1:D080 F1               pop  af
WRA1:D081 51               ld   d,c
WRA1:D082 F6 B2            or   a,$B2
WRA1:D084 F4               db   $F4 ; undefined opcode
WRA1:D085 C1               pop  bc
WRA1:D086 68               ld   l,b
WRA1:D087 C0               ret  nz
WRA1:D088 0F               rrca 
WRA1:D089 2F               cpl  
WRA1:D08A 3D               dec  a
WRA1:D08B 2D               dec  l
WRA1:D08C 8F               adc  a
WRA1:D08D 57               ld   d,a
WRA1:D08E 1E 3F            ld   e,$3F
WRA1:D090 80               add  b
WRA1:D091 DA F2 A2         jp   c,$A2F2
WRA1:D094 50               ld   d,b
WRA1:D095 52               ld   d,d
WRA1:D096 E8 64            add  sp,$64
WRA1:D098 33               inc  sp
WRA1:D099 C9               ret  
WRA1:D09A 7A               ld   a,d
WRA1:D09B 1E 6A            ld   e,$6A
WRA1:D09D 17               rla  
WRA1:D09E 1C               inc  e
WRA1:D09F CB F5            set  6,l
WRA1:D0A1 A0               and  b
WRA1:D0A2 B0               or   b
WRA1:D0A3 D0               ret  nc
WRA1:D0A4 E1               pop  hl
WRA1:D0A5 B1               or   c
WRA1:D0A6 D8               ret  c
WRA1:D0A7 70               ld   [hl],b
WRA1:D0A8 AF               xor  a
WRA1:D0A9 03               inc  bc
WRA1:D0AA 0F               rrca 
WRA1:D0AB 09               add  hl,bc
WRA1:D0AC 4E               ld   c,[hl]
WRA1:D0AD 07               rlca 
WRA1:D0AE 87               add  a
WRA1:D0AF 87               add  a
WRA1:D0B0 C0               ret  nz
WRA1:D0B1 60               ld   h,b
WRA1:D0B2 40               ld   b,b
WRA1:D0B3 10 E6            <corrupted stop>
WRA1:D0B5 61               ld   h,c
WRA1:D0B6 90               sub  b
WRA1:D0B7 B1               or   c
WRA1:D0B8 6B               ld   l,e
WRA1:D0B9 2F               cpl  
WRA1:D0BA 56               ld   d,[hl]
WRA1:D0BB 9F               sbc  a
WRA1:D0BC 0E 01            ld   c,$01
WRA1:D0BE 12               ld   [de],a
WRA1:D0BF 02               ld   [bc],a
WRA1:D0C0 E2               ld   [$ff00+c],a
WRA1:D0C1 5B               ld   e,e
WRA1:D0C2 F8 7C            ld   hl,sp+$7C
WRA1:D0C4 A4               and  h
WRA1:D0C5 E1               pop  hl
WRA1:D0C6 F4               db   $F4 ; undefined opcode
WRA1:D0C7 F5               push af
WRA1:D0C8 2B               dec  hl
WRA1:D0C9 86               add  [hl]
WRA1:D0CA 4E               ld   c,[hl]
WRA1:D0CB 05               dec  b
WRA1:D0CC AB               xor  e
WRA1:D0CD 40               ld   b,b
WRA1:D0CE 1D               dec  e
WRA1:D0CF 85               add  l
WRA1:D0D0 30 B5            jr   nc,$D087
WRA1:D0D2 F0 52            ldh  a,[$FF52]
WRA1:D0D4 78               ld   a,b
WRA1:D0D5 68               ld   l,b
WRA1:D0D6 D5               push de
WRA1:D0D7 F5               push af
WRA1:D0D8 7D               ld   a,l
WRA1:D0D9 07               rlca 
WRA1:D0DA 5D               ld   e,l
WRA1:D0DB 98               sbc  b
WRA1:D0DC F9               ld   sp,hl
WRA1:D0DD 6F               ld   l,a
WRA1:D0DE 9D               sbc  l
WRA1:D0DF CE 30            adc  a,$30
WRA1:D0E1 52               ld   d,d
WRA1:D0E2 E1               pop  hl
WRA1:D0E3 82               add  d
WRA1:D0E4 90               sub  b
WRA1:D0E5 70               ld   [hl],b
WRA1:D0E6 90               sub  b
WRA1:D0E7 C1               pop  bc
WRA1:D0E8 0F               rrca 
WRA1:D0E9 E7               rst  $20
WRA1:D0EA 3B               dec  sp
WRA1:D0EB AF               xor  a
WRA1:D0EC 0D               dec  c
WRA1:D0ED FB               ei   
WRA1:D0EE 44               ld   b,h
WRA1:D0EF DB               db   $DB ; undefined opcode
WRA1:D0F0 D3               db   $D3 ; undefined opcode
WRA1:D0F1 F5               push af
WRA1:D0F2 93               sub  e
WRA1:D0F3 E0 9A            ldh  [$FF9A],a
WRA1:D0F5 61               ld   h,c
WRA1:D0F6 F0 B8            ldh  a,[$FFB8]
WRA1:D0F8 03               inc  bc
WRA1:D0F9 02               ld   [bc],a
WRA1:D0FA 23               inc  hl
WRA1:D0FB 75               ld   [hl],l
WRA1:D0FC 09               add  hl,bc
WRA1:D0FD 4C               ld   c,h
WRA1:D0FE 55               ld   d,l
WRA1:D0FF 4A               ld   c,d
WRA1:D100 4C               ld   c,h
WRA1:D101 0E 5B            ld   c,$5B
WRA1:D103 60               ld   h,b
WRA1:D104 8D               adc  l
WRA1:D105 87               add  a
WRA1:D106 13               inc  de
WRA1:D107 C7               rst  $00
WRA1:D108 F2               ld   a,[$ff00+c]
WRA1:D109 F0 F0            ldh  a,[$FFF0]
WRA1:D10B 50               ld   d,b
WRA1:D10C F0 B2            ldh  a,[$FFB2]
WRA1:D10E 82               add  d
WRA1:D10F 72               ld   [hl],d
WRA1:D110 61               ld   h,c
WRA1:D111 46               ld   b,[hl]
WRA1:D112 1A               ld   a,[de]
WRA1:D113 2F               cpl  
WRA1:D114 17               rla  
WRA1:D115 EF               rst  $28
WRA1:D116 1C               inc  e
WRA1:D117 27               daa  
WRA1:D118 CB 91            res  2,c
WRA1:D11A F0 C0            ldh  a,[$FFC0]
WRA1:D11C AA               xor  d
WRA1:D11D F1               pop  af
WRA1:D11E E8 15            add  sp,$15
WRA1:D120 1F               rra  
WRA1:D121 5F               ld   e,a
WRA1:D122 8C               adc  h
WRA1:D123 CB 47            bit  0,a
WRA1:D125 FD               db   $FD ; undefined opcode
WRA1:D126 0F               rrca 
WRA1:D127 0F               rrca 
WRA1:D128 FA 79 23         ld   a,[$2379]
WRA1:D12B 96               sub  [hl]
WRA1:D12C DC 73 78         call c,$7873
WRA1:D12F A2               and  d
WRA1:D130 0F               rrca 
WRA1:D131 56               ld   d,[hl]
WRA1:D132 E6 CC            and  a,$CC
WRA1:D134 0C               inc  c
WRA1:D135 07               rlca 
WRA1:D136 2F               cpl  
WRA1:D137 0F               rrca 
WRA1:D138 B4               or   h
WRA1:D139 F0 30            ldh  a,[$FF30]
WRA1:D13B 77               ld   [hl],a
WRA1:D13C B0               or   b
WRA1:D13D 40               ld   b,b
WRA1:D13E 63               ld   h,e
WRA1:D13F 31 29 46         ld   sp,$4629
WRA1:D142 4B               ld   c,e
WRA1:D143 8F               adc  a
WRA1:D144 4E               ld   c,[hl]
WRA1:D145 8B               adc  e
WRA1:D146 0F               rrca 
WRA1:D147 BC               cp   h
WRA1:D148 FC               db   $FC ; undefined opcode
WRA1:D149 44               ld   b,h
WRA1:D14A 90               sub  b
WRA1:D14B FD               db   $FD ; undefined opcode
WRA1:D14C D3               db   $D3 ; undefined opcode
WRA1:D14D FE E9            cp   a,$E9
WRA1:D14F 78               ld   a,b
WRA1:D150 1F               rra  
WRA1:D151 5A               ld   e,d
WRA1:D152 86               add  [hl]
WRA1:D153 84               add  h
WRA1:D154 2E 06            ld   l,$06
WRA1:D156 0E 14            ld   c,$14
WRA1:D158 5F               ld   e,a
WRA1:D159 D4 91 70         call nc,$7091
WRA1:D15C 9C               sbc  h
WRA1:D15D 48               ld   c,b
WRA1:D15E C1               pop  bc
WRA1:D15F 61               ld   h,c
WRA1:D160 0F               rrca 
WRA1:D161 25               dec  h
WRA1:D162 0F               rrca 
WRA1:D163 D4 39 F3         call nc,$F339
WRA1:D166 0B               dec  bc
WRA1:D167 6F               ld   l,a
WRA1:D168 BC               cp   h
WRA1:D169 32               ldd  [hl],a
WRA1:D16A F4               db   $F4 ; undefined opcode
WRA1:D16B F3               di   
WRA1:D16C 4C               ld   c,h
WRA1:D16D B6               or   [hl]
WRA1:D16E 90               sub  b
WRA1:D16F 90               sub  b
WRA1:D170 0C               inc  c
WRA1:D171 84               add  h
WRA1:D172 17               rla  
WRA1:D173 19               add  hl,de
WRA1:D174 06 03            ld   b,$03
WRA1:D176 0B               dec  bc
WRA1:D177 DB               db   $DB ; undefined opcode
WRA1:D178 62               ld   h,d
WRA1:D179 70               ld   [hl],b
WRA1:D17A F3               di   
WRA1:D17B 72               ld   [hl],d
WRA1:D17C FB               ei   
WRA1:D17D DA EA A1         jp   c,$A1EA
WRA1:D180 86               add  [hl]
WRA1:D181 B7               or   a
WRA1:D182 0E 5F            ld   c,$5F
WRA1:D184 87               add  a
WRA1:D185 83               add  e
WRA1:D186 9B               sbc  e
WRA1:D187 0F               rrca 
WRA1:D188 34               inc  [hl]
WRA1:D189 C4 E5 C9         call nz,$C9E5
WRA1:D18C 60               ld   h,b
WRA1:D18D E5               push hl
WRA1:D18E A0               and  b
WRA1:D18F E0 CF            ldh  [$FFCF],a
WRA1:D191 8C               adc  h
WRA1:D192 27               daa  
WRA1:D193 69               ld   l,c
WRA1:D194 59               ld   e,c
WRA1:D195 AA               xor  d
WRA1:D196 3E 25            ld   a,$25
WRA1:D198 91               sub  c
WRA1:D199 D3               db   $D3 ; undefined opcode
WRA1:D19A A0               and  b
WRA1:D19B 18 F1            jr   $D18E
WRA1:D19D F0 54            ldh  a,[$FF54]
WRA1:D19F A1               and  c
WRA1:D1A0 5F               ld   e,a
WRA1:D1A1 CF               rst  $08
WRA1:D1A2 8D               adc  l
WRA1:D1A3 0D               dec  c
WRA1:D1A4 0E 0F            ld   c,$0F
WRA1:D1A6 87               add  a
WRA1:D1A7 57               ld   d,a
WRA1:D1A8 58               ld   e,b
WRA1:D1A9 F1               pop  af
WRA1:D1AA DC BC 61         call c,$61BC
WRA1:D1AD F6 51            or   a,$51
WRA1:D1AF D1               pop  de
WRA1:D1B0 0D               dec  c
WRA1:D1B1 66               ld   h,[hl]
WRA1:D1B2 C5               push bc
WRA1:D1B3 05               dec  b
WRA1:D1B4 8B               adc  e
WRA1:D1B5 A9               xor  c
WRA1:D1B6 09               add  hl,bc
WRA1:D1B7 89               adc  c
WRA1:D1B8 C4 F1 0C         call nz,$0CF1
WRA1:D1BB DC 89 F3         call c,$F389
WRA1:D1BE D0               ret  nc
WRA1:D1BF 7F               ld   a,a
WRA1:D1C0 2F               cpl  
WRA1:D1C1 29               add  hl,hl
WRA1:D1C2 9E               sbc  [hl]
WRA1:D1C3 0E 8D            ld   c,$8D
WRA1:D1C5 8B               adc  e
WRA1:D1C6 28 4E            jr   z,$D216
WRA1:D1C8 CC 62 F0         call z,$F062
WRA1:D1CB C2 64 30         jp   nz,$3064
WRA1:D1CE 45               ld   b,l
WRA1:D1CF E8 E3            add  sp,-$1D
WRA1:D1D1 D5               push de
WRA1:D1D2 2F               cpl  
WRA1:D1D3 35               dec  [hl]
WRA1:D1D4 CF               rst  $08
WRA1:D1D5 AB               xor  e
WRA1:D1D6 03               inc  bc
WRA1:D1D7 2C               inc  l
WRA1:D1D8 D5               push de
WRA1:D1D9 F8 20            ld   hl,sp+$20
WRA1:D1DB B3               or   e
WRA1:D1DC 3A               ldd  a,[hl]
WRA1:D1DD 5D               ld   e,l
WRA1:D1DE F4               db   $F4 ; undefined opcode
WRA1:D1DF F1               pop  af
WRA1:D1E0 4F               ld   c,a
WRA1:D1E1 2D               dec  l
WRA1:D1E2 7D               ld   a,l
WRA1:D1E3 47               ld   b,a
WRA1:D1E4 65               ld   h,l
WRA1:D1E5 89               adc  c
WRA1:D1E6 6E               ld   l,[hl]
WRA1:D1E7 AF               xor  a
WRA1:D1E8 EC               db   $EC ; undefined opcode
WRA1:D1E9 B0               or   b
WRA1:D1EA 75               ld   [hl],l
WRA1:D1EB 76               halt 
WRA1:D1EC 21 E1 78         ld   hl,$78E1
WRA1:D1EF FD               db   $FD ; undefined opcode
WRA1:D1F0 70               ld   [hl],b
WRA1:D1F1 3B               dec  sp
WRA1:D1F2 4B               ld   c,e
WRA1:D1F3 03               inc  bc
WRA1:D1F4 57               ld   d,a
WRA1:D1F5 4F               ld   c,a
WRA1:D1F6 0F               rrca 
WRA1:D1F7 4F               ld   c,a
WRA1:D1F8 E6 36            and  a,$36
WRA1:D1FA F4               db   $F4 ; undefined opcode
WRA1:D1FB D6 EC            sub  a,$EC
WRA1:D1FD A0               and  b
WRA1:D1FE F5               push af
WRA1:D1FF F3               di   
WRA1:D200 69               ld   l,c
WRA1:D201 A6               and  [hl]
WRA1:D202 C3 AA E1         jp   $E1AA
WRA1:D205 85               add  l
WRA1:D206 E9               jp   hl
WRA1:D207 60               ld   h,b
WRA1:D208 3F               ccf  
WRA1:D209 BC               cp   h
WRA1:D20A CF               rst  $08
WRA1:D20B 1F               rra  
WRA1:D20C 4F               ld   c,a
WRA1:D20D 0B               dec  bc
WRA1:D20E B1               or   c
WRA1:D20F 4F               ld   c,a
WRA1:D210 9C               sbc  h
WRA1:D211 7A               ld   a,d
WRA1:D212 64               ld   h,h
WRA1:D213 F1               pop  af
WRA1:D214 B9               cp   c
WRA1:D215 A2               and  d
WRA1:D216 60               ld   h,b
WRA1:D217 20 0E            jr   nz,$D227
WRA1:D219 67               ld   h,a
WRA1:D21A 80               add  b
WRA1:D21B 29               add  hl,hl
WRA1:D21C 0D               dec  c
WRA1:D21D 97               sub  a
WRA1:D21E 07               rlca 
WRA1:D21F 80               add  b
WRA1:D220 FA 9D 7E         ld   a,[$7E9D]
WRA1:D223 3F               ccf  
WRA1:D224 E8 31            add  sp,$31
WRA1:D226 7B               ld   a,e
WRA1:D227 71               ld   [hl],c
WRA1:D228 3F               ccf  
WRA1:D229 2B               dec  hl
WRA1:D22A 37               scf  
WRA1:D22B 0F               rrca 
WRA1:D22C 6B               ld   l,e
WRA1:D22D A7               and  a
WRA1:D22E 86               add  [hl]
WRA1:D22F 54               ld   d,h
WRA1:D230 70               ld   [hl],b
WRA1:D231 FC               db   $FC ; undefined opcode
WRA1:D232 54               ld   d,h
WRA1:D233 FF               rst  $38
WRA1:D234 F5               push af
WRA1:D235 25               dec  h
WRA1:D236 E1               pop  hl
WRA1:D237 E2               ld   [$ff00+c],a
WRA1:D238 0B               dec  bc
WRA1:D239 4A               ld   c,d
WRA1:D23A A2               and  d
WRA1:D23B 41               ld   b,c
WRA1:D23C 4B               ld   c,e
WRA1:D23D 19               add  hl,de
WRA1:D23E 8F               adc  a
WRA1:D23F 0C               inc  c
WRA1:D240 F2               ld   a,[$ff00+c]
WRA1:D241 D6 70            sub  a,$70
WRA1:D243 FC               db   $FC ; undefined opcode
WRA1:D244 F0 C9            ldh  a,[$FFC9]
WRA1:D246 31 F1 3E         ld   sp,$3EF1
WRA1:D249 B5               or   l
WRA1:D24A E6 DD            and  a,$DD
WRA1:D24C A6               and  [hl]
WRA1:D24D 5C               ld   e,h
WRA1:D24E DD               db   $DD ; undefined opcode
WRA1:D24F CF               rst  $08
WRA1:D250 70               ld   [hl],b
WRA1:D251 F4               db   $F4 ; undefined opcode
WRA1:D252 B0               or   b
WRA1:D253 6C               ld   l,h
WRA1:D254 E1               pop  hl
WRA1:D255 22               ldi  [hl],a
WRA1:D256 78               ld   a,b
WRA1:D257 FF               rst  $38
WRA1:D258 4A               ld   c,d
WRA1:D259 49               ld   c,c
WRA1:D25A 2F               cpl  
WRA1:D25B 4D               ld   c,l
WRA1:D25C 2F               cpl  
WRA1:D25D 0F               rrca 
WRA1:D25E 0F               rrca 
WRA1:D25F 02               ld   [bc],a
WRA1:D260 A4               and  h
WRA1:D261 EF               rst  $28
WRA1:D262 71               ld   [hl],c
WRA1:D263 30 B0            jr   nc,$D215
WRA1:D265 F1               pop  af
WRA1:D266 E1               pop  hl
WRA1:D267 64               ld   h,h
WRA1:D268 1A               ld   a,[de]
WRA1:D269 08 0F 0C         ld   [$0C0F],sp
WRA1:D26C 8F               adc  a
WRA1:D26D 23               inc  hl
WRA1:D26E 07               rlca 
WRA1:D26F 98               sbc  b
WRA1:D270 31 08 E4         ld   sp,$E408
WRA1:D273 7A               ld   a,d
WRA1:D274 F4               db   $F4 ; undefined opcode
WRA1:D275 A1               and  c
WRA1:D276 B9               cp   c
WRA1:D277 F5               push af
WRA1:D278 2B               dec  hl
WRA1:D279 93               sub  e
WRA1:D27A 83               add  e
WRA1:D27B CE 09            adc  a,$09
WRA1:D27D 0C               inc  c
WRA1:D27E 67               ld   h,a
WRA1:D27F 0E 57            ld   c,$57
WRA1:D281 90               sub  b
WRA1:D282 38 A7            jr   c,$D22B
WRA1:D284 50               ld   d,b
WRA1:D285 70               ld   [hl],b
WRA1:D286 A7               and  a
WRA1:D287 FE 2A            cp   a,$2A
WRA1:D289 4A               ld   c,d
WRA1:D28A 57               ld   d,a
WRA1:D28B 3E 2F            ld   a,$2F
WRA1:D28D 67               ld   h,a
WRA1:D28E 9C               sbc  h
WRA1:D28F 6F               ld   l,a
WRA1:D290 A0               and  b
WRA1:D291 D0               ret  nc
WRA1:D292 51               ld   d,c
WRA1:D293 F0 FC            ldh  a,[$FFFC]
WRA1:D295 38 E0            jr   c,$D277
WRA1:D297 7E               ld   a,[hl]
WRA1:D298 3E 1F            ld   a,$1F
WRA1:D29A 5B               ld   e,e
WRA1:D29B C3 5E C9         jp   $C95E
WRA1:D29E 0C               inc  c
WRA1:D29F B8               cp   b
WRA1:D2A0 FE F1            cp   a,$F1
WRA1:D2A2 91               sub  c
WRA1:D2A3 72               ld   [hl],d
WRA1:D2A4 F5               push af
WRA1:D2A5 24               inc  h
WRA1:D2A6 F0 D9            ldh  a,[$FFD9]
WRA1:D2A8 AE               xor  [hl]
WRA1:D2A9 21 86 CE         ld   hl,$CE86
WRA1:D2AC 8D               adc  l
WRA1:D2AD 1E 85            ld   e,$85
WRA1:D2AF 0C               inc  c
WRA1:D2B0 C0               ret  nz
WRA1:D2B1 B6               or   [hl]
WRA1:D2B2 51               ld   d,c
WRA1:D2B3 A0               and  b
WRA1:D2B4 A4               and  h
WRA1:D2B5 F0 A5            ldh  a,[$FFA5]
WRA1:D2B7 D6 27            sub  a,$27
WRA1:D2B9 19               add  hl,de
WRA1:D2BA 95               sub  l
WRA1:D2BB 09               add  hl,bc
WRA1:D2BC 02               ld   [bc],a
WRA1:D2BD 8F               adc  a
WRA1:D2BE CF               rst  $08
WRA1:D2BF 38 6C            jr   c,$D32D
WRA1:D2C1 F0 24            ldh  a,[$FF24]
WRA1:D2C3 D1               pop  de
WRA1:D2C4 62               ld   h,d
WRA1:D2C5 3A               ldd  a,[hl]
WRA1:D2C6 F0 74            ldh  a,[$FF74]
WRA1:D2C8 2C               inc  l
WRA1:D2C9 2D               dec  l
WRA1:D2CA 07               rlca 
WRA1:D2CB 75               ld   [hl],l
WRA1:D2CC 27               daa  
WRA1:D2CD 07               rlca 
WRA1:D2CE DF               rst  $18
WRA1:D2CF BF               cp   a
WRA1:D2D0 F6 D4            or   a,$D4
WRA1:D2D2 F9               ld   sp,hl
WRA1:D2D3 A8               xor  b
WRA1:D2D4 F4               db   $F4 ; undefined opcode
WRA1:D2D5 F0 B6            ldh  a,[$FFB6]
WRA1:D2D7 F0 1E            ldh  a,[$FF1E]
WRA1:D2D9 1E 1A            ld   e,$1A
WRA1:D2DB 2E DE            ld   l,$DE
WRA1:D2DD 1D               dec  e
WRA1:D2DE 0F               rrca 
WRA1:D2DF 97               sub  a
WRA1:D2E0 F1               pop  af
WRA1:D2E1 E8 E1            add  sp,-$1F
WRA1:D2E3 90               sub  b
WRA1:D2E4 78               ld   a,b
WRA1:D2E5 64               ld   h,h
WRA1:D2E6 C8               ret  z
WRA1:D2E7 F2               ld   a,[$ff00+c]
WRA1:D2E8 06 3E            ld   b,$3E
WRA1:D2EA E7               rst  $20
WRA1:D2EB 0F               rrca 
WRA1:D2EC 4E               ld   c,[hl]
WRA1:D2ED 23               inc  hl
WRA1:D2EE 08 4E 75         ld   [$754E],sp
WRA1:D2F1 4C               ld   c,h
WRA1:D2F2 31 7F 72         ld   sp,$727F
WRA1:D2F5 56               ld   d,[hl]
WRA1:D2F6 30 01            jr   nc,$D2F9
WRA1:D2F8 85               add  l
WRA1:D2F9 5B               ld   e,e
WRA1:D2FA 0F               rrca 
WRA1:D2FB 0D               dec  c
WRA1:D2FC 2D               dec  l
WRA1:D2FD 97               sub  a
WRA1:D2FE 8F               adc  a
WRA1:D2FF C1               pop  bc
WRA1:D300 0A               ld   a,[bc]
WRA1:D301 67               ld   h,a
WRA1:D302 15               dec  d
WRA1:D303 8D               adc  l
WRA1:D304 46               ld   b,[hl]
WRA1:D305 A3               and  e
WRA1:D306 1D               dec  e
WRA1:D307 D1               pop  de
WRA1:D308 B9               cp   c
WRA1:D309 FA D7 76         ld   a,[$76D7]
WRA1:D30C 9A               sbc  d
WRA1:D30D E7               rst  $20
WRA1:D30E 49               ld   c,c
WRA1:D30F 62               ld   h,d
WRA1:D310 08 DF 7E         ld   [$7EDF],sp
WRA1:D313 08 7A 42         ld   [$427A],sp
WRA1:D316 9D               sbc  l
WRA1:D317 5D               ld   e,l
WRA1:D318 23               inc  hl
WRA1:D319 22               ldi  [hl],a
WRA1:D31A D0               ret  nc
WRA1:D31B 51               ld   d,c
WRA1:D31C A2               and  d
WRA1:D31D 79               ld   a,c
WRA1:D31E B8               cp   b
WRA1:D31F F2               ld   a,[$ff00+c]
WRA1:D320 6F               ld   l,a
WRA1:D321 CB AF            res  5,a
WRA1:D323 36 47            ld   [hl],$47
WRA1:D325 8B               adc  e
WRA1:D326 4F               ld   c,a
WRA1:D327 2A               ldi  a,[hl]
WRA1:D328 79               ld   a,c
WRA1:D329 C6 80            add  a,$80
WRA1:D32B 10 34            <corrupted stop>
WRA1:D32D F8 72            ld   hl,sp+$72
WRA1:D32F 95               sub  l
WRA1:D330 FF               rst  $38
WRA1:D331 4D               ld   c,l
WRA1:D332 65               ld   h,l
WRA1:D333 15               dec  d
WRA1:D334 26 A7            ld   h,$A7
WRA1:D336 D7               rst  $10
WRA1:D337 0B               dec  bc
WRA1:D338 70               ld   [hl],b
WRA1:D339 80               add  b
WRA1:D33A DC 7A B2         call c,$B27A
WRA1:D33D 35               dec  [hl]
WRA1:D33E D7               rst  $10
WRA1:D33F 9C               sbc  h
WRA1:D340 5B               ld   e,e
WRA1:D341 17               rla  
WRA1:D342 06 E5            ld   b,$E5
WRA1:D344 89               adc  c
WRA1:D345 1D               dec  e
WRA1:D346 A1               and  c
WRA1:D347 2F               cpl  
WRA1:D348 FB               ei   
WRA1:D349 F7               rst  $30
WRA1:D34A DC D8 AB         call c,$ABD8
WRA1:D34D 70               ld   [hl],b
WRA1:D34E 40               ld   b,b
WRA1:D34F 5E               ld   e,[hl]
WRA1:D350 7D               ld   a,l
WRA1:D351 87               add  a
WRA1:D352 4D               ld   c,l
WRA1:D353 49               ld   c,c
WRA1:D354 29               add  hl,hl
WRA1:D355 2A               ldi  a,[hl]
WRA1:D356 44               ld   b,h
WRA1:D357 05               dec  b
WRA1:D358 D1               pop  de
WRA1:D359 48               ld   c,b
WRA1:D35A DE F0            sbc  a,$F0
WRA1:D35C D2 38 F8         jp   nc,$F838
WRA1:D35F B8               cp   b
WRA1:D360 06 0F            ld   b,$0F
WRA1:D362 0F               rrca 
WRA1:D363 0F               rrca 
WRA1:D364 5A               ld   e,d
WRA1:D365 67               ld   h,a
WRA1:D366 77               ld   [hl],a
WRA1:D367 13               inc  de
WRA1:D368 11 AC B4         ld   de,$B4AC
WRA1:D36B 52               ld   d,d
WRA1:D36C 68               ld   l,b
WRA1:D36D C3 15 29         jp   $2915
WRA1:D370 0B               dec  bc
WRA1:D371 87               add  a
WRA1:D372 1B               dec  de
WRA1:D373 47               ld   b,a
WRA1:D374 3F               ccf  
WRA1:D375 1F               rra  
WRA1:D376 81               add  c
WRA1:D377 86               add  [hl]
WRA1:D378 78               ld   a,b
WRA1:D379 E3               db   $E3 ; undefined opcode
WRA1:D37A D1               pop  de
WRA1:D37B D1               pop  de
WRA1:D37C A6               and  [hl]
WRA1:D37D 9C               sbc  h
WRA1:D37E F4               db   $F4 ; undefined opcode
WRA1:D37F F2               ld   a,[$ff00+c]
WRA1:D380 A1               and  c
WRA1:D381 86               add  [hl]
WRA1:D382 2C               inc  l
WRA1:D383 CE 35            adc  a,$35
WRA1:D385 FE 59            cp   a,$59
WRA1:D387 25               dec  h
WRA1:D388 51               ld   d,c
WRA1:D389 74               ld   [hl],h
WRA1:D38A 21 76 A3         ld   hl,$A376
WRA1:D38D 94               sub  h
WRA1:D38E A0               and  b
WRA1:D38F 7C               ld   a,h
WRA1:D390 2E 5F            ld   l,$5F
WRA1:D392 87               add  a
WRA1:D393 83               add  e
WRA1:D394 0B               dec  bc
WRA1:D395 9B               sbc  e
WRA1:D396 32               ldd  [hl],a
WRA1:D397 0F               rrca 
WRA1:D398 F1               pop  af
WRA1:D399 60               ld   h,b
WRA1:D39A 1D               dec  e
WRA1:D39B 70               ld   [hl],b
WRA1:D39C D2 E4 70         jp   nc,$70E4
WRA1:D39F 98               sbc  b
WRA1:D3A0 3D               dec  a
WRA1:D3A1 83               add  e
WRA1:D3A2 8F               adc  a
WRA1:D3A3 D7               rst  $10
WRA1:D3A4 4B               ld   c,e
WRA1:D3A5 8C               adc  h
WRA1:D3A6 AF               xor  a
WRA1:D3A7 6A               ld   l,d
WRA1:D3A8 93               sub  e
WRA1:D3A9 46               ld   b,[hl]
WRA1:D3AA FE 6B            cp   a,$6B
WRA1:D3AC 40               ld   b,b
WRA1:D3AD 14               inc  d
WRA1:D3AE DC E0 0F         call c,$0FE0
WRA1:D3B1 59               ld   e,c
WRA1:D3B2 8F               adc  a
WRA1:D3B3 50               ld   d,b
WRA1:D3B4 0B               dec  bc
WRA1:D3B5 34               inc  [hl]
WRA1:D3B6 B9               cp   c
WRA1:D3B7 5F               ld   e,a
WRA1:D3B8 08 FC C0         ld   [$C0FC],sp
WRA1:D3BB 91               sub  c
WRA1:D3BC E9               jp   hl
WRA1:D3BD 80               add  b
WRA1:D3BE 78               ld   a,b
WRA1:D3BF 92               sub  d
WRA1:D3C0 69               ld   l,c
WRA1:D3C1 1A               ld   a,[de]
WRA1:D3C2 5B               ld   e,e
WRA1:D3C3 85               add  l
WRA1:D3C4 09               add  hl,bc
WRA1:D3C5 04               inc  b
WRA1:D3C6 89               adc  c
WRA1:D3C7 95               sub  l
WRA1:D3C8 F9               ld   sp,hl
WRA1:D3C9 31 A8 57         ld   sp,$57A8
WRA1:D3CC 60               ld   h,b
WRA1:D3CD 4B               ld   c,e
WRA1:D3CE A5               and  l
WRA1:D3CF D0               ret  nc
WRA1:D3D0 1F               rra  
WRA1:D3D1 8A               adc  d
WRA1:D3D2 3D               dec  a
WRA1:D3D3 06 4F            ld   b,$4F
WRA1:D3D5 DB               db   $DB ; undefined opcode
WRA1:D3D6 4E               ld   c,[hl]
WRA1:D3D7 5F               ld   e,a
WRA1:D3D8 B5               or   l
WRA1:D3D9 D2 40 B0         jp   nc,$B040
WRA1:D3DC D5               push de
WRA1:D3DD F9               ld   sp,hl
WRA1:D3DE DB               db   $DB ; undefined opcode
WRA1:D3DF 80               add  b
WRA1:D3E0 4C               ld   c,h
WRA1:D3E1 8F               adc  a
WRA1:D3E2 7F               ld   a,a
WRA1:D3E3 00               nop  
WRA1:D3E4 4F               ld   c,a
WRA1:D3E5 8A               adc  d
WRA1:D3E6 17               rla  
WRA1:D3E7 0B               dec  bc
WRA1:D3E8 E5               push hl
WRA1:D3E9 E0 FD            ldh  [$FFFD],a
WRA1:D3EB C7               rst  $00
WRA1:D3EC D3               db   $D3 ; undefined opcode
WRA1:D3ED B0               or   b
WRA1:D3EE F0 70            ldh  a,[$FF70]
WRA1:D3F0 5F               ld   e,a
WRA1:D3F1 04               inc  b
WRA1:D3F2 2B               dec  hl
WRA1:D3F3 0A               ld   a,[bc]
WRA1:D3F4 9E               sbc  [hl]
WRA1:D3F5 0E C5            ld   c,$C5
WRA1:D3F7 5E               ld   e,[hl]
WRA1:D3F8 C4 B1 58         call nz,$58B1
WRA1:D3FB B4               or   h
WRA1:D3FC E1               pop  hl
WRA1:D3FD F7               rst  $30
WRA1:D3FE B0               or   b
WRA1:D3FF 48               ld   c,b
WRA1:D400 39               add  hl,sp
WRA1:D401 0E 87            ld   c,$87
WRA1:D403 A5               and  l
WRA1:D404 7C               ld   a,h
WRA1:D405 83               add  e
WRA1:D406 1B               dec  de
WRA1:D407 26 29            ld   h,$29
WRA1:D409 76               halt 
WRA1:D40A 70               ld   [hl],b
WRA1:D40B D0               ret  nc
WRA1:D40C D4 B0 4C         call nc,$4CB0
WRA1:D40F E8 82            add  sp,-$7E
WRA1:D411 4E               ld   c,[hl]
WRA1:D412 BF               cp   a
WRA1:D413 1F               rra  
WRA1:D414 0C               inc  c
WRA1:D415 4F               ld   c,a
WRA1:D416 D6 CE            sub  a,$CE
WRA1:D418 D9               reti 
WRA1:D419 F9               ld   sp,hl
WRA1:D41A 52               ld   d,d
WRA1:D41B 53               ld   d,e
WRA1:D41C 9E               sbc  [hl]
WRA1:D41D F6 D0            or   a,$D0
WRA1:D41F 8C               adc  h
WRA1:D420 6B               ld   l,e
WRA1:D421 B7               or   a
WRA1:D422 2E 5F            ld   l,$5F
WRA1:D424 5B               ld   e,e
WRA1:D425 B7               or   a
WRA1:D426 CF               rst  $08
WRA1:D427 1A               ld   a,[de]
WRA1:D428 ED               db   $ED ; undefined opcode
WRA1:D429 B5               or   l
WRA1:D42A 60               ld   h,b
WRA1:D42B EC               db   $EC ; undefined opcode
WRA1:D42C F9               ld   sp,hl
WRA1:D42D A1               and  c
WRA1:D42E F5               push af
WRA1:D42F 98               sbc  b
WRA1:D430 6D               ld   l,l
WRA1:D431 1A               ld   a,[de]
WRA1:D432 07               rlca 
WRA1:D433 A1               and  c
WRA1:D434 0F               rrca 
WRA1:D435 2F               cpl  
WRA1:D436 1F               rra  
WRA1:D437 43               ld   b,e
WRA1:D438 EC               db   $EC ; undefined opcode
WRA1:D439 D0               ret  nc
WRA1:D43A 15               dec  d
WRA1:D43B A4               and  h
WRA1:D43C FC               db   $FC ; undefined opcode
WRA1:D43D 76               halt 
WRA1:D43E DC 32 8F         call c,$8F32
WRA1:D441 86               add  [hl]
WRA1:D442 83               add  e
WRA1:D443 F2               ld   a,[$ff00+c]
WRA1:D444 CF               rst  $08
WRA1:D445 CD 0C 85         call $850C
WRA1:D448 C7               rst  $00
WRA1:D449 F0 D9            ldh  a,[$FFD9]
WRA1:D44B F4               db   $F4 ; undefined opcode
WRA1:D44C F4               db   $F4 ; undefined opcode
WRA1:D44D 54               ld   d,h
WRA1:D44E AD               xor  l
WRA1:D44F C8               ret  z
WRA1:D450 27               daa  
WRA1:D451 4A               ld   c,d
WRA1:D452 C6 2B            add  a,$2B
WRA1:D454 17               rla  
WRA1:D455 21 AF 05         ld   hl,$05AF
WRA1:D458 F3               di   
WRA1:D459 B0               or   b
WRA1:D45A 91               sub  c
WRA1:D45B 65               ld   h,l
WRA1:D45C BC               cp   h
WRA1:D45D C2 F4 F0         jp   nz,$F0F4
WRA1:D460 D6 E7            sub  a,$E7
WRA1:D462 08 CB 2E         ld   [$2ECB],sp
WRA1:D465 0B               dec  bc
WRA1:D466 96               sub  [hl]
WRA1:D467 0D               dec  c
WRA1:D468 E9               jp   hl
WRA1:D469 B0               or   b
WRA1:D46A 9E               sbc  [hl]
WRA1:D46B 4A               ld   c,d
WRA1:D46C B8               cp   b
WRA1:D46D D0               ret  nc
WRA1:D46E F4               db   $F4 ; undefined opcode
WRA1:D46F 7C               ld   a,h
WRA1:D470 A9               xor  c
WRA1:D471 46               ld   b,[hl]
WRA1:D472 16 0B            ld   d,$0B
WRA1:D474 8F               adc  a
WRA1:D475 EF               rst  $28
WRA1:D476 67               ld   h,a
WRA1:D477 AF               xor  a
WRA1:D478 76               halt 
WRA1:D479 F4               db   $F4 ; undefined opcode
WRA1:D47A 96               sub  [hl]
WRA1:D47B EA 9A 64         ld   [$649A],a
WRA1:D47E D1               pop  de
WRA1:D47F B0               or   b
WRA1:D480 0F               rrca 
WRA1:D481 4F               ld   c,a
WRA1:D482 09               add  hl,bc
WRA1:D483 C8               ret  z
WRA1:D484 8D               adc  l
WRA1:D485 21 1E 36         ld   hl,$361E
WRA1:D488 E3               db   $E3 ; undefined opcode
WRA1:D489 B0               or   b
WRA1:D48A C4 FC 75         call nz,$75FC
WRA1:D48D C7               rst  $00
WRA1:D48E 24               inc  h
WRA1:D48F D4 92 8E         call nc,$8E92
WRA1:D492 4E               ld   c,[hl]
WRA1:D493 36 89            ld   [hl],$89
WRA1:D495 6C               ld   l,h
WRA1:D496 1F               rra  
WRA1:D497 3E F0            ld   a,$F0
WRA1:D499 D1               pop  de
WRA1:D49A 74               ld   [hl],h
WRA1:D49B 28 A0            jr   z,$D43D
WRA1:D49D 97               sub  a
WRA1:D49E B0               or   b
WRA1:D49F 58               ld   e,b
WRA1:D4A0 4F               ld   c,a
WRA1:D4A1 1B               dec  de
WRA1:D4A2 4D               ld   c,l
WRA1:D4A3 6B               ld   l,e
WRA1:D4A4 05               dec  b
WRA1:D4A5 2D               dec  l
WRA1:D4A6 88               adc  b
WRA1:D4A7 65               ld   h,l
WRA1:D4A8 B5               or   l
WRA1:D4A9 B1               or   c
WRA1:D4AA 51               ld   d,c
WRA1:D4AB E4               db   $E4 ; undefined opcode
WRA1:D4AC F0 D0            ldh  a,[$FFD0]
WRA1:D4AE B1               or   c
WRA1:D4AF 8C               adc  h
WRA1:D4B0 A7               and  a
WRA1:D4B1 9F               sbc  a
WRA1:D4B2 02               ld   [bc],a
WRA1:D4B3 2E 1D            ld   l,$1D
WRA1:D4B5 47               ld   b,a
WRA1:D4B6 1E 73            ld   e,$73
WRA1:D4B8 D0               ret  nc
WRA1:D4B9 B7               or   a
WRA1:D4BA EA 2B F2         ld   [$F22B],a
WRA1:D4BD FD               db   $FD ; undefined opcode
WRA1:D4BE 9C               sbc  h
WRA1:D4BF FA 9F 07         ld   a,[$079F]
WRA1:D4C2 B3               or   e
WRA1:D4C3 1D               dec  e
WRA1:D4C4 1E 17            ld   e,$17
WRA1:D4C6 C2 89 B1         jp   nz,$B189
WRA1:D4C9 00               nop  
WRA1:D4CA E2               ld   [$ff00+c],a
WRA1:D4CB B3               or   e
WRA1:D4CC 30 30            jr   nc,$D4FE
WRA1:D4CE E0 F3            ldh  [$FFF3],a
WRA1:D4D0 AF               xor  a
WRA1:D4D1 1D               dec  e
WRA1:D4D2 59               ld   e,c
WRA1:D4D3 0E 64            ld   c,$64
WRA1:D4D5 16 AF            ld   d,$AF
WRA1:D4D7 0F               rrca 
WRA1:D4D8 E8 D2            add  sp,-$2E
WRA1:D4DA E6 E0            and  a,$E0
WRA1:D4DC A1               and  c
WRA1:D4DD 34               inc  [hl]
WRA1:D4DE B0               or   b
WRA1:D4DF 72               ld   [hl],d
WRA1:D4E0 3C               inc  a
WRA1:D4E1 8C               adc  h
WRA1:D4E2 9D               sbc  l
WRA1:D4E3 2A               ldi  a,[hl]
WRA1:D4E4 DB               db   $DB ; undefined opcode
WRA1:D4E5 2D               dec  l
WRA1:D4E6 1E 1B            ld   e,$1B
WRA1:D4E8 D1               pop  de
WRA1:D4E9 DE F0            sbc  a,$F0
WRA1:D4EB 41               ld   b,c
WRA1:D4EC F0 A1            ldh  a,[$FFA1]
WRA1:D4EE FA 64 6F         ld   a,[$6F64]
WRA1:D4F1 85               add  l
WRA1:D4F2 0F               rrca 
WRA1:D4F3 13               inc  de
WRA1:D4F4 6A               ld   l,d
WRA1:D4F5 11 A0 43         ld   de,$43A0
WRA1:D4F8 F0 F0            ldh  a,[$FFF0]
WRA1:D4FA E3               db   $E3 ; undefined opcode
WRA1:D4FB 65               ld   h,l
WRA1:D4FC F9               ld   sp,hl
WRA1:D4FD 30 56            jr   nc,$D555
WRA1:D4FF 74               ld   [hl],h
WRA1:D500 18 CA            jr   $D4CC
WRA1:D502 31 F2 70         ld   sp,$70F2
WRA1:D505 E9               jp   hl
WRA1:D506 F8 91            ld   hl,sp-$6F
WRA1:D508 2E BC            ld   l,$BC
WRA1:D50A 08 42 0F         ld   [$0F42],sp
WRA1:D50D 4F               ld   c,a
WRA1:D50E BE               cp   [hl]
WRA1:D50F 4C               ld   c,h
WRA1:D510 73               ld   [hl],e
WRA1:D511 72               ld   [hl],d
WRA1:D512 20 E4            jr   nz,$D4F8
WRA1:D514 E1               pop  hl
WRA1:D515 88               adc  b
WRA1:D516 36 91            ld   [hl],$91
WRA1:D518 1F               rra  
WRA1:D519 8F               adc  a
WRA1:D51A CB BF            res  7,a
WRA1:D51C 28 1D            jr   z,$D53B
WRA1:D51E 6A               ld   l,d
WRA1:D51F 17               rla  
WRA1:D520 D2 F9 F0         jp   nc,$F0F9
WRA1:D523 B0               or   b
WRA1:D524 90               sub  b
WRA1:D525 B9               cp   c
WRA1:D526 F4               db   $F4 ; undefined opcode
WRA1:D527 B0               or   b
WRA1:D528 6A               ld   l,d
WRA1:D529 0D               dec  c
WRA1:D52A 11 A3 DE         ld   de,$DEA3
WRA1:D52D A9               xor  c
WRA1:D52E A3               and  e
WRA1:D52F 2F               cpl  
WRA1:D530 82               add  d
WRA1:D531 10 F8            <corrupted stop>
WRA1:D533 72               ld   [hl],d
WRA1:D534 DE C1            sbc  a,$C1
WRA1:D536 E3               db   $E3 ; undefined opcode
WRA1:D537 F0 07            ldh  a,[$FF07]
WRA1:D539 C2 6F 9F         jp   nz,$9F6F
WRA1:D53C 0F               rrca 
WRA1:D53D 3F               ccf  
WRA1:D53E 0B               dec  bc
WRA1:D53F 13               inc  de
WRA1:D540 E4               db   $E4 ; undefined opcode
WRA1:D541 7A               ld   a,d
WRA1:D542 B9               cp   c
WRA1:D543 E1               pop  hl
WRA1:D544 F0 F9            ldh  a,[$FFF9]
WRA1:D546 3E C4            ld   a,$C4
WRA1:D548 0A               ld   a,[bc]
WRA1:D549 1F               rra  
WRA1:D54A AD               xor  l
WRA1:D54B 8F               adc  a
WRA1:D54C 15               dec  d
WRA1:D54D 56               ld   d,[hl]
WRA1:D54E 1F               rra  
WRA1:D54F 1A               ld   a,[de]
WRA1:D550 C0               ret  nz
WRA1:D551 44               ld   b,h
WRA1:D552 F0 B0            ldh  a,[$FFB0]
WRA1:D554 7A               ld   a,d
WRA1:D555 D8               ret  c
WRA1:D556 B0               or   b
WRA1:D557 18 9F            jr   $D4F8
WRA1:D559 AC               xor  h
WRA1:D55A AF               xor  a
WRA1:D55B BE               cp   [hl]
WRA1:D55C 0F               rrca 
WRA1:D55D 9C               sbc  h
WRA1:D55E 27               daa  
WRA1:D55F FB               ei   
WRA1:D560 B1               or   c
WRA1:D561 F3               di   
WRA1:D562 BE               cp   [hl]
WRA1:D563 E0 E3            ldh  [$FFE3],a
WRA1:D565 63               ld   h,e
WRA1:D566 82               add  d
WRA1:D567 F1               pop  af
WRA1:D568 88               adc  b
WRA1:D569 0E 2E            ld   c,$2E
WRA1:D56B 0F               rrca 
WRA1:D56C 1F               rra  
WRA1:D56D 05               dec  b
WRA1:D56E 42               ld   b,d
WRA1:D56F 05               dec  b
WRA1:D570 F4               db   $F4 ; undefined opcode
WRA1:D571 B4               or   h
WRA1:D572 C8               ret  z
WRA1:D573 25               dec  h
WRA1:D574 E0 D3            ldh  [$FFD3],a
WRA1:D576 F4               db   $F4 ; undefined opcode
WRA1:D577 88               adc  b
WRA1:D578 09               add  hl,bc
WRA1:D579 2B               dec  hl
WRA1:D57A 07               rlca 
WRA1:D57B 13               inc  de
WRA1:D57C 15               dec  d
WRA1:D57D 0A               ld   a,[bc]
WRA1:D57E 8D               adc  l
WRA1:D57F 57               ld   d,a
WRA1:D580 B4               or   h
WRA1:D581 EA F0 F0         ld   [$F0F0],a
WRA1:D584 6A               ld   l,d
WRA1:D585 B0               or   b
WRA1:D586 7C               ld   a,h
WRA1:D587 F1               pop  af
WRA1:D588 0C               inc  c
WRA1:D589 17               rla  
WRA1:D58A 05               dec  b
WRA1:D58B 4B               ld   c,e
WRA1:D58C 3E 69            ld   a,$69
WRA1:D58E 9A               sbc  d
WRA1:D58F 1E B5            ld   e,$B5
WRA1:D591 F0 D2            ldh  a,[$FFD2]
WRA1:D593 B1               or   c
WRA1:D594 94               sub  h
WRA1:D595 38 98            jr   c,$D52F
WRA1:D597 ED               db   $ED ; undefined opcode
WRA1:D598 01 0B 06         ld   bc,$060B
WRA1:D59B 13               inc  de
WRA1:D59C 8D               adc  l
WRA1:D59D C7               rst  $00
WRA1:D59E CD 6D E0         call $E06D
WRA1:D5A1 71               ld   [hl],c
WRA1:D5A2 C4 F1 90         call nz,$90F1
WRA1:D5A5 C6 D2            add  a,$D2
WRA1:D5A7 F0 46            ldh  a,[$FF46]
WRA1:D5A9 4B               ld   c,e
WRA1:D5AA 47               ld   b,a
WRA1:D5AB 8F               adc  a
WRA1:D5AC B5               or   l
WRA1:D5AD DC 8F 05         call c,$058F
WRA1:D5B0 F1               pop  af
WRA1:D5B1 30 50            jr   nc,$D603
WRA1:D5B3 D1               pop  de
WRA1:D5B4 70               ld   [hl],b
WRA1:D5B5 F8 E8            ld   hl,sp-$18
WRA1:D5B7 35               dec  [hl]
WRA1:D5B8 2B               dec  hl
WRA1:D5B9 2F               cpl  
WRA1:D5BA 1A               ld   a,[de]
WRA1:D5BB 2B               dec  hl
WRA1:D5BC 5F               ld   e,a
WRA1:D5BD C7               rst  $00
WRA1:D5BE 8C               adc  h
WRA1:D5BF 09               add  hl,bc
WRA1:D5C0 9B               sbc  e
WRA1:D5C1 70               ld   [hl],b
WRA1:D5C2 E0 D0            ldh  [$FFD0],a
WRA1:D5C4 F9               ld   sp,hl
WRA1:D5C5 70               ld   [hl],b
WRA1:D5C6 52               ld   d,d
WRA1:D5C7 F2               ld   a,[$ff00+c]
WRA1:D5C8 89               adc  c
WRA1:D5C9 1F               rra  
WRA1:D5CA 5A               ld   e,d
WRA1:D5CB 07               rlca 
WRA1:D5CC CA 07 27         jp   z,$2707
WRA1:D5CF CA 64 54         jp   z,$5464
WRA1:D5D2 A0               and  b
WRA1:D5D3 B0               or   b
WRA1:D5D4 C3 B0 51         jp   $51B0
WRA1:D5D7 F8 0F            ld   hl,sp+$0F
WRA1:D5D9 24               inc  h
WRA1:D5DA 3B               dec  sp
WRA1:D5DB 29               add  hl,hl
WRA1:D5DC 4B               ld   c,e
WRA1:D5DD 8D               adc  l
WRA1:D5DE 47               ld   b,a
WRA1:D5DF 07               rlca 
WRA1:D5E0 73               ld   [hl],e
WRA1:D5E1 0A               ld   a,[bc]
WRA1:D5E2 E5               push hl
WRA1:D5E3 A0               and  b
WRA1:D5E4 B6               or   [hl]
WRA1:D5E5 90               sub  b
WRA1:D5E6 E8 E1            add  sp,-$1F
WRA1:D5E8 AF               xor  a
WRA1:D5E9 4E               ld   c,[hl]
WRA1:D5EA 67               ld   h,a
WRA1:D5EB CD 0F A3         call $A30F
WRA1:D5EE 2E 31            ld   l,$31
WRA1:D5F0 60               ld   h,b
WRA1:D5F1 E2               ld   [$ff00+c],a
WRA1:D5F2 F3               di   
WRA1:D5F3 A0               and  b
WRA1:D5F4 95               sub  l
WRA1:D5F5 9C               sbc  h
WRA1:D5F6 54               ld   d,h
WRA1:D5F7 54               ld   d,h
WRA1:D5F8 9D               sbc  l
WRA1:D5F9 0D               dec  c
WRA1:D5FA 1D               dec  e
WRA1:D5FB 2E 4E            ld   l,$4E
WRA1:D5FD 17               rla  
WRA1:D5FE 27               daa  
WRA1:D5FF 2B               dec  hl
WRA1:D600 9F               sbc  a
WRA1:D601 03               inc  bc
WRA1:D602 ED               db   $ED ; undefined opcode
WRA1:D603 2C               inc  l
WRA1:D604 0F               rrca 
WRA1:D605 DF               rst  $18
WRA1:D606 0D               dec  c
WRA1:D607 45               ld   b,l
WRA1:D608 22               ldi  [hl],a
WRA1:D609 F2               ld   a,[$ff00+c]
WRA1:D60A B0               or   b
WRA1:D60B 29               add  hl,hl
WRA1:D60C F0 EB            ldh  a,[$FFEB]
WRA1:D60E 14               inc  d
WRA1:D60F B9               cp   c
WRA1:D610 86               add  [hl]
WRA1:D611 0F               rrca 
WRA1:D612 06 01            ld   b,$01
WRA1:D614 AF               xor  a
WRA1:D615 AC               xor  h
WRA1:D616 86               add  [hl]
WRA1:D617 4D               ld   c,l
WRA1:D618 FA C2 70         ld   a,[$70C2]
WRA1:D61B F2               ld   a,[$ff00+c]
WRA1:D61C D5               push de
WRA1:D61D E3               db   $E3 ; undefined opcode
WRA1:D61E D8               ret  c
WRA1:D61F 54               ld   d,h
WRA1:D620 2F               cpl  
WRA1:D621 67               ld   h,a
WRA1:D622 0A               ld   a,[bc]
WRA1:D623 0B               dec  bc
WRA1:D624 1A               ld   a,[de]
WRA1:D625 8D               adc  l
WRA1:D626 09               add  hl,bc
WRA1:D627 2F               cpl  
WRA1:D628 E2               ld   [$ff00+c],a
WRA1:D629 10 E1            <corrupted stop>
WRA1:D62B 77               ld   [hl],a
WRA1:D62C F5               push af
WRA1:D62D F0 9E            ldh  a,[$FF9E]
WRA1:D62F 68               ld   l,b
WRA1:D630 2C               inc  l
WRA1:D631 6F               ld   l,a
WRA1:D632 4A               ld   c,d
WRA1:D633 0D               dec  c
WRA1:D634 0D               dec  c
WRA1:D635 3B               dec  sp
WRA1:D636 35               dec  [hl]
WRA1:D637 DC 24 A8         call c,$A824
WRA1:D63A 72               ld   [hl],d
WRA1:D63B F4               db   $F4 ; undefined opcode
WRA1:D63C FB               ei   
WRA1:D63D DD               db   $DD ; undefined opcode
WRA1:D63E F8 D0            ld   hl,sp-$30
WRA1:D640 0A               ld   a,[bc]
WRA1:D641 07               rlca 
WRA1:D642 47               ld   b,a
WRA1:D643 C9               ret  
WRA1:D644 BB               cp   e
WRA1:D645 D3               db   $D3 ; undefined opcode
WRA1:D646 8D               adc  l
WRA1:D647 9D               sbc  l
WRA1:D648 E0 FB            ldh  [$FFFB],a
WRA1:D64A 5E               ld   e,[hl]
WRA1:D64B A9               xor  c
WRA1:D64C F0 70            ldh  a,[$FF70]
WRA1:D64E B1               or   c
WRA1:D64F BD               cp   l
WRA1:D650 2D               dec  l
WRA1:D651 6F               ld   l,a
WRA1:D652 0C               inc  c
WRA1:D653 14               inc  d
WRA1:D654 73               ld   [hl],e
WRA1:D655 3E 8E            ld   a,$8E
WRA1:D657 BF               cp   a
WRA1:D658 52               ld   d,d
WRA1:D659 AC               xor  h
WRA1:D65A D5               push de
WRA1:D65B DA 66 3C         jp   c,$3C66
WRA1:D65E F3               di   
WRA1:D65F 74               ld   [hl],h
WRA1:D660 BF               cp   a
WRA1:D661 59               ld   e,c
WRA1:D662 A3               and  e
WRA1:D663 5F               ld   e,a
WRA1:D664 8B               adc  e
WRA1:D665 ED               db   $ED ; undefined opcode
WRA1:D666 17               rla  
WRA1:D667 EE 8C            xor  a,$8C
WRA1:D669 F0 D2            ldh  a,[$FFD2]
WRA1:D66B 74               ld   [hl],h
WRA1:D66C 52               ld   d,d
WRA1:D66D E5               push hl
WRA1:D66E D8               ret  c
WRA1:D66F D8               ret  c
WRA1:D670 5B               ld   e,e
WRA1:D671 F1               pop  af
WRA1:D672 34               inc  [hl]
WRA1:D673 0C               inc  c
WRA1:D674 6D               ld   l,l
WRA1:D675 1D               dec  e
WRA1:D676 69               ld   l,c
WRA1:D677 45               ld   b,l
WRA1:D678 D1               pop  de
WRA1:D679 E1               pop  hl
WRA1:D67A 31 90 B2         ld   sp,$B290
WRA1:D67D F2               ld   a,[$ff00+c]
WRA1:D67E DA 26 2F         jp   c,$2F26
WRA1:D681 48               ld   c,b
WRA1:D682 07               rlca 
WRA1:D683 9D               sbc  l
WRA1:D684 03               inc  bc
WRA1:D685 C8               ret  z
WRA1:D686 C3 4B E2         jp   $E24B
WRA1:D689 30 F3            jr   nc,$D67E
WRA1:D68B 6A               ld   l,d
WRA1:D68C F8 96            ld   hl,sp-$6A
WRA1:D68E 38 89            jr   c,$D619
WRA1:D690 BF               cp   a
WRA1:D691 9D               sbc  l
WRA1:D692 8F               adc  a
WRA1:D693 09               add  hl,bc
WRA1:D694 2F               cpl  
WRA1:D695 5F               ld   e,a
WRA1:D696 0B               dec  bc
WRA1:D697 43               ld   b,e
WRA1:D698 B2               or   d
WRA1:D699 6E               ld   l,[hl]
WRA1:D69A F0 91            ldh  a,[$FF91]
WRA1:D69C E8 D8            add  sp,-$28
WRA1:D69E D8               ret  c
WRA1:D69F 60               ld   h,b
WRA1:D6A0 8F               adc  a
WRA1:D6A1 0B               dec  bc
WRA1:D6A2 1F               rra  
WRA1:D6A3 8A               adc  d
WRA1:D6A4 ED               db   $ED ; undefined opcode
WRA1:D6A5 4C               ld   c,h
WRA1:D6A6 4F               ld   c,a
WRA1:D6A7 1D               dec  e
WRA1:D6A8 E6 C4            and  a,$C4
WRA1:D6AA 98               sbc  b
WRA1:D6AB B0               or   b
WRA1:D6AC F8 B0            ld   hl,sp-$50
WRA1:D6AE D3               db   $D3 ; undefined opcode
WRA1:D6AF 70               ld   [hl],b
WRA1:D6B0 20 86            jr   nz,$D638
WRA1:D6B2 CD 0B 9E         call $9E0B
WRA1:D6B5 44               ld   b,h
WRA1:D6B6 3D               dec  a
WRA1:D6B7 4C               ld   c,h
WRA1:D6B8 D1               pop  de
WRA1:D6B9 A2               and  d
WRA1:D6BA 80               add  b
WRA1:D6BB 3C               inc  a
WRA1:D6BC F0 48            ldh  a,[$FF48]
WRA1:D6BE B2               or   d
WRA1:D6BF 6C               ld   l,h
WRA1:D6C0 C6 5E            add  a,$5E
WRA1:D6C2 BA               cp   d
WRA1:D6C3 4B               ld   c,e
WRA1:D6C4 16 8C            ld   d,$8C
WRA1:D6C6 C6 8F            add  a,$8F
WRA1:D6C8 70               ld   [hl],b
WRA1:D6C9 F3               di   
WRA1:D6CA 64               ld   h,h
WRA1:D6CB 64               ld   h,h
WRA1:D6CC B1               or   c
WRA1:D6CD 45               ld   b,l
WRA1:D6CE BA               cp   d
WRA1:D6CF E4               db   $E4 ; undefined opcode
WRA1:D6D0 29               add  hl,hl
WRA1:D6D1 80               add  b
WRA1:D6D2 5F               ld   e,a
WRA1:D6D3 1B               dec  de
WRA1:D6D4 AC               xor  h
WRA1:D6D5 6B               ld   l,e
WRA1:D6D6 0D               dec  c
WRA1:D6D7 0D               dec  c
WRA1:D6D8 E0 86            ldh  [$FF86],a
WRA1:D6DA 24               inc  h
WRA1:D6DB 38 82            jr   c,$D65F
WRA1:D6DD C1               pop  bc
WRA1:D6DE F2               ld   a,[$ff00+c]
WRA1:D6DF 92               sub  d
WRA1:D6E0 1D               dec  e
WRA1:D6E1 0B               dec  bc
WRA1:D6E2 1D               dec  e
WRA1:D6E3 2B               dec  hl
WRA1:D6E4 BF               cp   a
WRA1:D6E5 1E 5E            ld   e,$5E
WRA1:D6E7 8C               adc  h
WRA1:D6E8 F2               ld   a,[$ff00+c]
WRA1:D6E9 80               add  b
WRA1:D6EA 79               ld   a,c
WRA1:D6EB FC               db   $FC ; undefined opcode
WRA1:D6EC DA F0 92         jp   c,$92F0
WRA1:D6EF 92               sub  d
WRA1:D6F0 4D               ld   c,l
WRA1:D6F1 2C               inc  l
WRA1:D6F2 2B               dec  hl
WRA1:D6F3 45               ld   b,l
WRA1:D6F4 4B               ld   c,e
WRA1:D6F5 86               add  [hl]
WRA1:D6F6 E3               db   $E3 ; undefined opcode
WRA1:D6F7 47               ld   b,a
WRA1:D6F8 BB               cp   e
WRA1:D6F9 E8 C0            add  sp,-$40
WRA1:D6FB D8               ret  c
WRA1:D6FC D0               ret  nc
WRA1:D6FD 77               ld   [hl],a
WRA1:D6FE 51               ld   d,c
WRA1:D6FF FA F6 75         ld   a,[$75F6]
WRA1:D702 F7               rst  $30
WRA1:D703 67               ld   h,a
WRA1:D704 DA 52 F1         jp   c,$F152
WRA1:D707 E4               db   $E4 ; undefined opcode
WRA1:D708 4F               ld   c,a
WRA1:D709 41               ld   b,c
WRA1:D70A AF               xor  a
WRA1:D70B 9F               sbc  a
WRA1:D70C 15               dec  d
WRA1:D70D 0B               dec  bc
WRA1:D70E 6B               ld   l,e
WRA1:D70F 45               ld   b,l
WRA1:D710 92               sub  d
WRA1:D711 E1               pop  hl
WRA1:D712 F0 D0            ldh  a,[$FFD0]
WRA1:D714 60               ld   h,b
WRA1:D715 B0               or   b
WRA1:D716 F2               ld   a,[$ff00+c]
WRA1:D717 60               ld   h,b
WRA1:D718 FF               rst  $38
WRA1:D719 76               halt 
WRA1:D71A 4A               ld   c,d
WRA1:D71B 47               ld   b,a
WRA1:D71C 02               ld   [bc],a
WRA1:D71D 8D               adc  l
WRA1:D71E 65               ld   h,l
WRA1:D71F 02               ld   [bc],a
WRA1:D720 B8               cp   b
WRA1:D721 74               ld   [hl],h
WRA1:D722 B0               or   b
WRA1:D723 D2 B9 40         jp   nc,$40B9
WRA1:D726 D5               push de
WRA1:D727 B2               or   d
WRA1:D728 6D               ld   l,l
WRA1:D729 36 9F            ld   [hl],$9F
WRA1:D72B 2A               ldi  a,[hl]
WRA1:D72C 18 52            jr   $D780
WRA1:D72E 2C               inc  l
WRA1:D72F 0B               dec  bc
WRA1:D730 87               add  a
WRA1:D731 93               sub  e
WRA1:D732 E2               ld   [$ff00+c],a
WRA1:D733 53               ld   d,e
WRA1:D734 50               ld   d,b
WRA1:D735 F2               ld   a,[$ff00+c]
WRA1:D736 C1               pop  bc
WRA1:D737 E9               jp   hl
WRA1:D738 82               add  d
WRA1:D739 2F               cpl  
WRA1:D73A 0C               inc  c
WRA1:D73B 4E               ld   c,[hl]
WRA1:D73C 14               inc  d
WRA1:D73D 4F               ld   c,a
WRA1:D73E 0B               dec  bc
WRA1:D73F 0E E1            ld   c,$E1
WRA1:D741 CC D4 76         call z,$76D4
WRA1:D744 F8 78            ld   hl,sp+$78
WRA1:D746 57               ld   d,a
WRA1:D747 95               sub  l
WRA1:D748 0F               rrca 
WRA1:D749 07               rlca 
WRA1:D74A 00               nop  
WRA1:D74B 1C               inc  e
WRA1:D74C 19               add  hl,de
WRA1:D74D 0F               rrca 
WRA1:D74E 29               add  hl,hl
WRA1:D74F 21 B8 F7         ld   hl,$F7B8
WRA1:D752 F8 E1            ld   hl,sp-$1F
WRA1:D754 30 9C            jr   nc,$D6F2
WRA1:D756 96               sub  [hl]
WRA1:D757 95               sub  l
WRA1:D758 57               ld   d,a
WRA1:D759 0D               dec  c
WRA1:D75A 4D               ld   c,l
WRA1:D75B 0B               dec  bc
WRA1:D75C 46               ld   b,[hl]
WRA1:D75D 2F               cpl  
WRA1:D75E 01 8E 54         ld   bc,$548E
WRA1:D761 F4               db   $F4 ; undefined opcode
WRA1:D762 90               sub  b
WRA1:D763 F9               ld   sp,hl
WRA1:D764 D4 30 AF         call nc,$AF30
WRA1:D767 E5               push hl
WRA1:D768 CD 9B 13         call $139B
WRA1:D76B 26 98            ld   h,$98
WRA1:D76D 4B               ld   c,e
WRA1:D76E 47               ld   b,a
WRA1:D76F 13               inc  de
WRA1:D770 36 F5            ld   [hl],$F5
WRA1:D772 86               add  [hl]
WRA1:D773 52               ld   d,d
WRA1:D774 E2               ld   [$ff00+c],a
WRA1:D775 72               ld   [hl],d
WRA1:D776 F1               pop  af
WRA1:D777 B8               cp   b
WRA1:D778 06 67            ld   b,$67
WRA1:D77A 0D               dec  c
WRA1:D77B 05               dec  b
WRA1:D77C 17               rla  
WRA1:D77D 15               dec  d
WRA1:D77E 4B               ld   c,e
WRA1:D77F 4E               ld   c,[hl]
WRA1:D780 7C               ld   a,h
WRA1:D781 5A               ld   e,d
WRA1:D782 B2               or   d
WRA1:D783 C4 C1 88         call nz,$88C1
WRA1:D786 32               ldd  [hl],a
WRA1:D787 D0               ret  nc
WRA1:D788 65               ld   h,l
WRA1:D789 2C               inc  l
WRA1:D78A C5               push bc
WRA1:D78B 8F               adc  a
WRA1:D78C 99               sbc  c
WRA1:D78D B6               or   [hl]
WRA1:D78E 08 0F FC         ld   [$FC0F],sp
WRA1:D791 13               inc  de
WRA1:D792 B6               or   [hl]
WRA1:D793 D2 D3 85         jp   nc,$85D3
WRA1:D796 D0               ret  nc
WRA1:D797 12               ld   [de],a
WRA1:D798 CD A8 AF         call $AFA8
WRA1:D79B 82               add  d
WRA1:D79C 8F               adc  a
WRA1:D79D 1E 8C            ld   e,$8C
WRA1:D79F 86               add  [hl]
WRA1:D7A0 EA 60 EF         ld   [$EF60],a
WRA1:D7A3 28 40            jr   z,$D7E5
WRA1:D7A5 FA FC 70         ld   a,[$70FC]
WRA1:D7A8 4F               ld   c,a
WRA1:D7A9 EE 44            xor  a,$44
WRA1:D7AB 4D               ld   c,l
WRA1:D7AC 2D               dec  l
WRA1:D7AD 07               rlca 
WRA1:D7AE 8D               adc  l
WRA1:D7AF 27               daa  
WRA1:D7B0 B1               or   c
WRA1:D7B1 AA               xor  d
WRA1:D7B2 73               ld   [hl],e
WRA1:D7B3 E4               db   $E4 ; undefined opcode
WRA1:D7B4 37               scf  
WRA1:D7B5 60               ld   h,b
WRA1:D7B6 A1               and  c
WRA1:D7B7 72               ld   [hl],d
WRA1:D7B8 6E               ld   l,[hl]
WRA1:D7B9 0E 8C            ld   c,$8C
WRA1:D7BB 45               ld   b,l
WRA1:D7BC 17               rla  
WRA1:D7BD 0A               ld   a,[bc]
WRA1:D7BE A9               xor  c
WRA1:D7BF 36 F1            ld   [hl],$F1
WRA1:D7C1 B2               or   d
WRA1:D7C2 E0 F1            ldh  [$FFF1],a
WRA1:D7C4 78               ld   a,b
WRA1:D7C5 E8 38            add  sp,$38
WRA1:D7C7 AD               xor  l
WRA1:D7C8 4B               ld   c,e
WRA1:D7C9 2B               dec  hl
WRA1:D7CA 5F               ld   e,a
WRA1:D7CB 4F               ld   c,a
WRA1:D7CC A6               and  [hl]
WRA1:D7CD 37               scf  
WRA1:D7CE C5               push bc
WRA1:D7CF 6F               ld   l,a
WRA1:D7D0 EA F8 61         ld   [$61F8],a
WRA1:D7D3 B0               or   b
WRA1:D7D4 EF               rst  $28
WRA1:D7D5 69               ld   l,c
WRA1:D7D6 F8 E9            ld   hl,sp-$17
WRA1:D7D8 0D               dec  c
WRA1:D7D9 27               daa  
WRA1:D7DA FE 0E            cp   a,$0E
WRA1:D7DC 01 2F 8F         ld   bc,$8F2F
WRA1:D7DF DE D6            sbc  a,$D6
WRA1:D7E1 B9               cp   c
WRA1:D7E2 79               ld   a,c
WRA1:D7E3 B0               or   b
WRA1:D7E4 50               ld   d,b
WRA1:D7E5 3E 84            ld   a,$84
WRA1:D7E7 B4               or   h
WRA1:D7E8 4D               ld   c,l
WRA1:D7E9 8F               adc  a
WRA1:D7EA 8F               adc  a
WRA1:D7EB 6F               ld   l,a
WRA1:D7EC 07               rlca 
WRA1:D7ED 66               ld   h,[hl]
WRA1:D7EE 62               ld   h,d
WRA1:D7EF A8               xor  b
WRA1:D7F0 CA D2 F3         jp   z,$F3D2
WRA1:D7F3 34               inc  [hl]
WRA1:D7F4 74               ld   [hl],h
WRA1:D7F5 A6               and  [hl]
WRA1:D7F6 50               ld   d,b
WRA1:D7F7 E0 3E            ldh  [$FF3E],a
WRA1:D7F9 07               rlca 
WRA1:D7FA 1F               rra  
WRA1:D7FB 05               dec  b
WRA1:D7FC 0D               dec  c
WRA1:D7FD 03               inc  bc
WRA1:D7FE 2D               dec  l
WRA1:D7FF B4               or   h
WRA1:D800 01 C3 23         ld   bc,$23C3
WRA1:D803 CB FF            set  7,a
WRA1:D805 85               add  l
WRA1:D806 C1               pop  bc
WRA1:D807 20 20            jr   nz,$D829
WRA1:D809 20 20            jr   nz,$D82B
WRA1:D80B 20 20            jr   nz,$D82D
WRA1:D80D 20 20            jr   nz,$D82F
WRA1:D80F 20 20            jr   nz,$D831
WRA1:D811 20 20            jr   nz,$D833
WRA1:D813 20 20            jr   nz,$D835
WRA1:D815 20 20            jr   nz,$D837
WRA1:D817 20 20            jr   nz,$D839
WRA1:D819 20 20            jr   nz,$D83B
WRA1:D81B 1B               dec  de
WRA1:D81C 00               nop  
WRA1:D81D 10 6D            <corrupted stop>
WRA1:D81F 4C               ld   c,h
WRA1:D820 F5               push af
WRA1:D821 C1               pop  bc
WRA1:D822 F6 6D            or   a,$6D
WRA1:D824 AD               xor  l
WRA1:D825 6F               ld   l,a
WRA1:D826 58               ld   e,b
WRA1:D827 62               ld   h,d
WRA1:D828 53               ld   d,e
WRA1:D829 89               adc  c
WRA1:D82A 54               ld   d,h
WRA1:D82B 8B               adc  e
WRA1:D82C C9               ret  
WRA1:D82D F7               rst  $30
WRA1:D82E 4B               ld   c,e
WRA1:D82F 44               ld   b,h
WRA1:D830 15               dec  d
WRA1:D831 48               ld   c,b
WRA1:D832 E0 ED            ldh  [$FFED],a
WRA1:D834 E8 77            add  sp,$77
WRA1:D836 64               ld   h,h
WRA1:D837 70               ld   [hl],b
WRA1:D838 9E               sbc  [hl]
WRA1:D839 4A               ld   c,d
WRA1:D83A 49               ld   c,c
WRA1:D83B 2E 42            ld   l,$42
WRA1:D83D DF               rst  $18
WRA1:D83E CA CE B1         jp   z,$B1CE
WRA1:D841 F0 D1            ldh  a,[$FFD1]
WRA1:D843 F0 C2            ldh  a,[$FFC2]
WRA1:D845 FB               ei   
WRA1:D846 D6 F5            sub  a,$F5
WRA1:D848 1D               dec  e
WRA1:D849 B7               or   a
WRA1:D84A 0F               rrca 
WRA1:D84B 2F               cpl  
WRA1:D84C 07               rlca 
WRA1:D84D AC               xor  h
WRA1:D84E 0F               rrca 
WRA1:D84F 8F               adc  a
WRA1:D850 7D               ld   a,l
WRA1:D851 E6 F0            and  a,$F0
WRA1:D853 B6               or   [hl]
WRA1:D854 58               ld   e,b
WRA1:D855 50               ld   d,b
WRA1:D856 FD               db   $FD ; undefined opcode
WRA1:D857 D5               push de
WRA1:D858 07               rlca 
WRA1:D859 8E               adc  [hl]
WRA1:D85A 0F               rrca 
WRA1:D85B 8B               adc  e
WRA1:D85C 1A               ld   a,[de]
WRA1:D85D 9E               sbc  [hl]
WRA1:D85E 6F               ld   l,a
WRA1:D85F 06 74            ld   b,$74
WRA1:D861 51               ld   d,c
WRA1:D862 50               ld   d,b
WRA1:D863 F1               pop  af
WRA1:D864 F0 E1            ldh  a,[$FFE1]
WRA1:D866 C4 F6 53         call nz,$53F6
WRA1:D869 06 11            ld   b,$11
WRA1:D86B BE               cp   [hl]
WRA1:D86C 02               ld   [bc],a
WRA1:D86D 03               inc  bc
WRA1:D86E 8E               adc  [hl]
WRA1:D86F 8A               adc  d
WRA1:D870 48               ld   c,b
WRA1:D871 B2               or   d
WRA1:D872 A6               and  [hl]
WRA1:D873 B4               or   h
WRA1:D874 FA 75 36         ld   a,[$3675]
WRA1:D877 B6               or   [hl]
WRA1:D878 18 0D            jr   $D887
WRA1:D87A 4A               ld   c,d
WRA1:D87B C6 2B            add  a,$2B
WRA1:D87D 0E 4F            ld   c,$4F
WRA1:D87F 8E               adc  [hl]
WRA1:D880 A6               and  [hl]
WRA1:D881 88               adc  b
WRA1:D882 93               sub  e
WRA1:D883 1A               ld   a,[de]
WRA1:D884 F1               pop  af
WRA1:D885 32               ldd  [hl],a
WRA1:D886 DA 3A B5         jp   c,$B53A
WRA1:D889 3F               ccf  
WRA1:D88A 62               ld   h,d
WRA1:D88B E6 A7            and  a,$A7
WRA1:D88D F7               rst  $30
WRA1:D88E 0B               dec  bc
WRA1:D88F 0F               rrca 
WRA1:D890 E4               db   $E4 ; undefined opcode
WRA1:D891 F0 F4            ldh  a,[$FFF4]
WRA1:D893 60               ld   h,b
WRA1:D894 E9               jp   hl
WRA1:D895 B2               or   d
WRA1:D896 B1               or   c
WRA1:D897 36 2F            ld   [hl],$2F
WRA1:D899 0F               rrca 
WRA1:D89A 0E 67            ld   c,$67
WRA1:D89C 37               scf  
WRA1:D89D 4B               ld   c,e
WRA1:D89E 27               daa  
WRA1:D89F 0E D1            ld   c,$D1
WRA1:D8A1 7D               ld   a,l
WRA1:D8A2 C0               ret  nz
WRA1:D8A3 C6 F2            add  a,$F2
WRA1:D8A5 F0 10            ldh  a,[$FF10]
WRA1:D8A7 B3               or   e
WRA1:D8A8 5F               ld   e,a
WRA1:D8A9 43               ld   b,e
WRA1:D8AA 0D               dec  c
WRA1:D8AB 92               sub  d
WRA1:D8AC 07               rlca 
WRA1:D8AD 02               ld   [bc],a
WRA1:D8AE 0B               dec  bc
WRA1:D8AF 5E               ld   e,[hl]
WRA1:D8B0 B5               or   l
WRA1:D8B1 92               sub  d
WRA1:D8B2 74               ld   [hl],h
WRA1:D8B3 60               ld   h,b
WRA1:D8B4 69               ld   l,c
WRA1:D8B5 50               ld   d,b
WRA1:D8B6 A0               and  b
WRA1:D8B7 E4               db   $E4 ; undefined opcode
WRA1:D8B8 AE               xor  [hl]
WRA1:D8B9 81               add  c
WRA1:D8BA 2F               cpl  
WRA1:D8BB 0F               rrca 
WRA1:D8BC 4B               ld   c,e
WRA1:D8BD 8F               adc  a
WRA1:D8BE 85               add  l
WRA1:D8BF 6A               ld   l,d
WRA1:D8C0 F1               pop  af
WRA1:D8C1 FA 01 C3         ld   a,[$C301]
WRA1:D8C4 70               ld   [hl],b
WRA1:D8C5 B4               or   h
WRA1:D8C6 D8               ret  c
WRA1:D8C7 E1               pop  hl
WRA1:D8C8 19               add  hl,de
WRA1:D8C9 13               inc  de
WRA1:D8CA 1F               rra  
WRA1:D8CB 0B               dec  bc
WRA1:D8CC C2 0D 0E         jp   nz,$0E0D
WRA1:D8CF 89               adc  c
WRA1:D8D0 31 46 68         ld   sp,$6846
WRA1:D8D3 D0               ret  nc
WRA1:D8D4 B4               or   h
WRA1:D8D5 D0               ret  nc
WRA1:D8D6 79               ld   a,c
WRA1:D8D7 85               add  l
WRA1:D8D8 2D               dec  l
WRA1:D8D9 4E               ld   c,[hl]
WRA1:D8DA 1F               rra  
WRA1:D8DB 3A               ldd  a,[hl]
WRA1:D8DC CF               rst  $08
WRA1:D8DD 45               ld   b,l
WRA1:D8DE 6E               ld   l,[hl]
WRA1:D8DF 4E               ld   c,[hl]
WRA1:D8E0 66               ld   h,[hl]
WRA1:D8E1 72               ld   [hl],d
WRA1:D8E2 98               sbc  b
WRA1:D8E3 7E               ld   a,[hl]
WRA1:D8E4 ED               db   $ED ; undefined opcode
WRA1:D8E5 BC               cp   h
WRA1:D8E6 C0               ret  nz
WRA1:D8E7 90               sub  b
WRA1:D8E8 09               add  hl,bc
WRA1:D8E9 EA 46 BF         ld   [$BF46],a
WRA1:D8EC 57               ld   d,a
WRA1:D8ED 97               sub  a
WRA1:D8EE 8D               adc  l
WRA1:D8EF 0A               ld   a,[bc]
WRA1:D8F0 B2               or   d
WRA1:D8F1 3A               ldd  a,[hl]
WRA1:D8F2 34               inc  [hl]
WRA1:D8F3 F9               ld   sp,hl
WRA1:D8F4 F0 D4            ldh  a,[$FFD4]
WRA1:D8F6 78               ld   a,b
WRA1:D8F7 19               add  hl,de
WRA1:D8F8 8E               adc  [hl]
WRA1:D8F9 8C               adc  h
WRA1:D8FA 93               sub  e
WRA1:D8FB 95               sub  l
WRA1:D8FC 0F               rrca 
WRA1:D8FD 8F               adc  a
WRA1:D8FE 2B               dec  hl
WRA1:D8FF 56               ld   d,[hl]
WRA1:D900 EF               rst  $28
WRA1:D901 5B               ld   e,e
WRA1:D902 27               daa  
WRA1:D903 2D               dec  l
WRA1:D904 8B               adc  e
WRA1:D905 1D               dec  e
WRA1:D906 0D               dec  c
WRA1:D907 E1               pop  hl
WRA1:D908 D0               ret  nc
WRA1:D909 A2               and  d
WRA1:D90A 30 52            jr   nc,$D95E
WRA1:D90C C1               pop  bc
WRA1:D90D F5               push af
WRA1:D90E 58               ld   e,b
WRA1:D90F 7A               ld   a,d
WRA1:D910 95               sub  l
WRA1:D911 2F               cpl  
WRA1:D912 0F               rrca 
WRA1:D913 1C               inc  e
WRA1:D914 B5               or   l
WRA1:D915 14               inc  d
WRA1:D916 85               add  l
WRA1:D917 0D               dec  c
WRA1:D918 C2 F6 C2         jp   nz,$C2F6
WRA1:D91B E9               jp   hl
WRA1:D91C F8 C5            ld   hl,sp-$3B
WRA1:D91E FA A3 0C         ld   a,[$0CA3]
WRA1:D921 4F               ld   c,a
WRA1:D922 20 06            jr   nz,$D92A
WRA1:D924 4F               ld   c,a
WRA1:D925 0F               rrca 
WRA1:D926 E4               db   $E4 ; undefined opcode
WRA1:D927 34               inc  [hl]
WRA1:D928 DC FC 42         call c,$42FC
WRA1:D92B 48               ld   c,b
WRA1:D92C E2               ld   [$ff00+c],a
WRA1:D92D B2               or   d
WRA1:D92E B5               or   l
WRA1:D92F F7               rst  $30
WRA1:D930 7F               ld   a,a
WRA1:D931 63               ld   h,e
WRA1:D932 57               ld   d,a
WRA1:D933 03               inc  bc
WRA1:D934 2B               dec  hl
WRA1:D935 D1               pop  de
WRA1:D936 13               inc  de
WRA1:D937 0D               dec  c
WRA1:D938 39               add  hl,sp
WRA1:D939 38 FF            jr   c,$D93A
WRA1:D93B 88               adc  b
WRA1:D93C E1               pop  hl
WRA1:D93D A1               and  c
WRA1:D93E D0               ret  nc
WRA1:D93F CA DB 02         jp   z,$02DB
WRA1:D942 2F               cpl  
WRA1:D943 9F               sbc  a
WRA1:D944 07               rlca 
WRA1:D945 01 0E A7         ld   bc,$A70E
WRA1:D948 5A               ld   e,d
WRA1:D949 C1               pop  bc
WRA1:D94A 7D               ld   a,l
WRA1:D94B 32               ldd  [hl],a
WRA1:D94C A2               and  d
WRA1:D94D CA F8 28         jp   z,$28F8
WRA1:D950 0A               ld   a,[bc]
WRA1:D951 05               dec  b
WRA1:D952 6C               ld   l,h
WRA1:D953 27               daa  
WRA1:D954 0F               rrca 
WRA1:D955 FA C3 27         ld   a,[$27C3]
WRA1:D958 82               add  d
WRA1:D959 B8               cp   b
WRA1:D95A B9               cp   c
WRA1:D95B EC               db   $EC ; undefined opcode
WRA1:D95C 53               ld   d,e
WRA1:D95D 70               ld   [hl],b
WRA1:D95E F0 FA            ldh  a,[$FFFA]
WRA1:D960 01 19 2E         ld   bc,$2E19
WRA1:D963 4D               ld   c,l
WRA1:D964 4D               ld   c,l
WRA1:D965 0F               rrca 
WRA1:D966 5E               ld   e,[hl]
WRA1:D967 0D               dec  c
WRA1:D968 D2 F0 E8         jp   nc,$E8F0
WRA1:D96B E4               db   $E4 ; undefined opcode
WRA1:D96C 61               ld   h,c
WRA1:D96D 39               add  hl,sp
WRA1:D96E 10 5D            <corrupted stop>
WRA1:D970 6F               ld   l,a
WRA1:D971 7B               ld   a,e
WRA1:D972 0C               inc  c
WRA1:D973 E7               rst  $20
WRA1:D974 14               inc  d
WRA1:D975 8F               adc  a
WRA1:D976 6E               ld   l,[hl]
WRA1:D977 1A               ld   a,[de]
WRA1:D978 F3               di   
WRA1:D979 BD               cp   l
WRA1:D97A 58               ld   e,b
WRA1:D97B 05               dec  b
WRA1:D97C A5               and  l
WRA1:D97D 74               ld   [hl],h
WRA1:D97E F5               push af
WRA1:D97F 70               ld   [hl],b
WRA1:D980 0D               dec  c
WRA1:D981 06 DB            ld   b,$DB
WRA1:D983 A6               and  [hl]
WRA1:D984 DA 4F 86         jp   c,$864F
WRA1:D987 15               dec  d
WRA1:D988 F8 92            ld   hl,sp-$6E
WRA1:D98A 70               ld   [hl],b
WRA1:D98B D7               rst  $10
WRA1:D98C 74               ld   [hl],h
WRA1:D98D D0               ret  nc
WRA1:D98E F4               db   $F4 ; undefined opcode
WRA1:D98F F0 2F            ldh  a,[$FF2F]
WRA1:D991 8E               adc  [hl]
WRA1:D992 A8               xor  b
WRA1:D993 5F               ld   e,a
WRA1:D994 8E               adc  [hl]
WRA1:D995 01 0F 55         ld   bc,$550F
WRA1:D998 40               ld   b,b
WRA1:D999 A0               and  b
WRA1:D99A F8 E0            ld   hl,sp-$20
WRA1:D99C B8               cp   b
WRA1:D99D D6 78            sub  a,$78
WRA1:D99F F2               ld   a,[$ff00+c]
WRA1:D9A0 92               sub  d
WRA1:D9A1 8F               adc  a
WRA1:D9A2 5F               ld   e,a
WRA1:D9A3 6D               ld   l,l
WRA1:D9A4 1B               dec  de
WRA1:D9A5 1E 4C            ld   e,$4C
WRA1:D9A7 2E 32            ld   l,$32
WRA1:D9A9 F7               rst  $30
WRA1:D9AA D9               reti 
WRA1:D9AB 21 FD 22         ld   hl,$22FD
WRA1:D9AE 91               sub  c
WRA1:D9AF D1               pop  de
WRA1:D9B0 1F               rra  
WRA1:D9B1 0E 4E            ld   c,$4E
WRA1:D9B3 A7               and  a
WRA1:D9B4 87               add  a
WRA1:D9B5 8F               adc  a
WRA1:D9B6 34               inc  [hl]
WRA1:D9B7 7B               ld   a,e
WRA1:D9B8 D1               pop  de
WRA1:D9B9 E4               db   $E4 ; undefined opcode
WRA1:D9BA 7A               ld   a,d
WRA1:D9BB E5               push hl
WRA1:D9BC 32               ldd  [hl],a
WRA1:D9BD F4               db   $F4 ; undefined opcode
WRA1:D9BE FA 74 0F         ld   a,[$0F74]
WRA1:D9C1 2C               inc  l
WRA1:D9C2 DF               rst  $18
WRA1:D9C3 1F               rra  
WRA1:D9C4 07               rlca 
WRA1:D9C5 8C               adc  h
WRA1:D9C6 6E               ld   l,[hl]
WRA1:D9C7 0B               dec  bc
WRA1:D9C8 F8 71            ld   hl,sp+$71
WRA1:D9CA 22               ldi  [hl],a
WRA1:D9CB 99               sbc  c
WRA1:D9CC 10 F9            <corrupted stop>
WRA1:D9CE D4 70 D6         call nc,$D670
WRA1:D9D1 42               ld   b,d
WRA1:D9D2 10 22            <corrupted stop>
WRA1:D9D4 1B               dec  de
WRA1:D9D5 0F               rrca 
WRA1:D9D6 2F               cpl  
WRA1:D9D7 8B               adc  e
WRA1:D9D8 92               sub  d
WRA1:D9D9 EC               db   $EC ; undefined opcode
WRA1:D9DA 63               ld   h,e
WRA1:D9DB 62               ld   h,d
WRA1:D9DC 90               sub  b
WRA1:D9DD E5               push hl
WRA1:D9DE 1A               ld   a,[de]
WRA1:D9DF 90               sub  b
WRA1:D9E0 0D               dec  c
WRA1:D9E1 3D               dec  a
WRA1:D9E2 09               add  hl,bc
WRA1:D9E3 96               sub  [hl]
WRA1:D9E4 0C               inc  c
WRA1:D9E5 9A               sbc  d
WRA1:D9E6 14               inc  d
WRA1:D9E7 7D               ld   a,l
WRA1:D9E8 D6 BE            sub  a,$BE
WRA1:D9EA 74               ld   [hl],h
WRA1:D9EB 38 54            jr   c,$DA41
WRA1:D9ED 30 70            jr   nc,$DA5F
WRA1:D9EF E9               jp   hl
WRA1:D9F0 0F               rrca 
WRA1:D9F1 1A               ld   a,[de]
WRA1:D9F2 6B               ld   l,e
WRA1:D9F3 18 25            jr   $DA1A
WRA1:D9F5 0E 46            ld   c,$46
WRA1:D9F7 06 B6            ld   b,$B6
WRA1:D9F9 44               ld   b,h
WRA1:D9FA 45               ld   b,l
WRA1:D9FB E2               ld   [$ff00+c],a
WRA1:D9FC B6               or   [hl]
WRA1:D9FD E9               jp   hl
WRA1:D9FE 70               ld   [hl],b
WRA1:D9FF 78               ld   a,b
WRA1:DA00 F6 77            or   a,$77
WRA1:DA02 F1               pop  af
WRA1:DA03 30 D2            jr   nc,$D9D7
WRA1:DA05 F3               di   
WRA1:DA06 38 30            jr   c,$DA38
WRA1:DA08 49               ld   c,c
WRA1:DA09 29               add  hl,hl
WRA1:DA0A CA 8F 22         jp   z,$228F
WRA1:DA0D 37               scf  
WRA1:DA0E 64               ld   h,h
WRA1:DA0F 0B               dec  bc
WRA1:DA10 F0 81            ldh  a,[$FF81]
WRA1:DA12 74               ld   [hl],h
WRA1:DA13 F0 F2            ldh  a,[$FFF2]
WRA1:DA15 DA 90 98         jp   c,$9890
WRA1:DA18 8F               adc  a
WRA1:DA19 1A               ld   a,[de]
WRA1:DA1A D3               db   $D3 ; undefined opcode
WRA1:DA1B 58               ld   e,b
WRA1:DA1C 1F               rra  
WRA1:DA1D 67               ld   h,a
WRA1:DA1E 08 0F E5         ld   [$E50F],sp
WRA1:DA21 50               ld   d,b
WRA1:DA22 96               sub  [hl]
WRA1:DA23 D3               db   $D3 ; undefined opcode
WRA1:DA24 50               ld   d,b
WRA1:DA25 F4               db   $F4 ; undefined opcode
WRA1:DA26 98               sbc  b
WRA1:DA27 B7               or   a
WRA1:DA28 07               rlca 
WRA1:DA29 7A               ld   a,d
WRA1:DA2A A3               and  e
WRA1:DA2B 47               ld   b,a
WRA1:DA2C 4F               ld   c,a
WRA1:DA2D 0C               inc  c
WRA1:DA2E 0D               dec  c
WRA1:DA2F 05               dec  b
WRA1:DA30 D0               ret  nc
WRA1:DA31 D3               db   $D3 ; undefined opcode
WRA1:DA32 62               ld   h,d
WRA1:DA33 FC               db   $FC ; undefined opcode
WRA1:DA34 EE F9            xor  a,$F9
WRA1:DA36 65               ld   h,l
WRA1:DA37 DC 1B 37         call c,$371B
WRA1:DA3A 87               add  a
WRA1:DA3B BD               cp   l
WRA1:DA3C 0D               dec  c
WRA1:DA3D EF               rst  $28
WRA1:DA3E 0D               dec  c
WRA1:DA3F 1F               rra  
WRA1:DA40 B6               or   [hl]
WRA1:DA41 A2               and  d
WRA1:DA42 D1               pop  de
WRA1:DA43 12               ld   [de],a
WRA1:DA44 01 E0 E0         ld   bc,$E0E0
WRA1:DA47 E8 5F            add  sp,$5F
WRA1:DA49 21 87 47         ld   hl,$4787
WRA1:DA4C 4F               ld   c,a
WRA1:DA4D 4F               ld   c,a
WRA1:DA4E 85               add  l
WRA1:DA4F 8B               adc  e
WRA1:DA50 F3               di   
WRA1:DA51 BF               cp   a
WRA1:DA52 90               sub  b
WRA1:DA53 F4               db   $F4 ; undefined opcode
WRA1:DA54 F3               di   
WRA1:DA55 F8 E0            ld   hl,sp-$20
WRA1:DA57 C4 0F BB         call nz,$BB0F
WRA1:DA5A 01 69 F6         ld   bc,$F669
WRA1:DA5D 61               ld   h,c
WRA1:DA5E 8F               adc  a
WRA1:DA5F 35               dec  [hl]
WRA1:DA60 7C               ld   a,h
WRA1:DA61 B6               or   [hl]
WRA1:DA62 B8               cp   b
WRA1:DA63 A6               and  [hl]
WRA1:DA64 F0 B2            ldh  a,[$FFB2]
WRA1:DA66 6C               ld   l,h
WRA1:DA67 B0               or   b
WRA1:DA68 D3               db   $D3 ; undefined opcode
WRA1:DA69 1D               dec  e
WRA1:DA6A D4 8F 4F         call nc,$4F8F
WRA1:DA6D 9F               sbc  a
WRA1:DA6E 02               ld   [bc],a
WRA1:DA6F 89               adc  c
WRA1:DA70 E2               ld   [$ff00+c],a
WRA1:DA71 77               ld   [hl],a
WRA1:DA72 70               ld   [hl],b
WRA1:DA73 24               inc  h
WRA1:DA74 5F               ld   e,a
WRA1:DA75 84               add  h
WRA1:DA76 F4               db   $F4 ; undefined opcode
WRA1:DA77 C3 7B 1F         jp   $1F7B
WRA1:DA7A E5               push hl
WRA1:DA7B 0F               rrca 
WRA1:DA7C 0E AB            ld   c,$AB
WRA1:DA7E 85               add  l
WRA1:DA7F 51               ld   d,c
WRA1:DA80 4A               ld   c,d
WRA1:DA81 BC               cp   h
WRA1:DA82 E0 D3            ldh  [$FFD3],a
WRA1:DA84 36 E2            ld   [hl],$E2
WRA1:DA86 D0               ret  nc
WRA1:DA87 7F               ld   a,a
WRA1:DA88 5B               ld   e,e
WRA1:DA89 02               ld   [bc],a
WRA1:DA8A 0F               rrca 
WRA1:DA8B F7               rst  $30
WRA1:DA8C 0F               rrca 
WRA1:DA8D 2E 0F            ld   l,$0F
WRA1:DA8F DB               db   $DB ; undefined opcode
WRA1:DA90 B4               or   h
WRA1:DA91 E0 B0            ldh  [$FFB0],a
WRA1:DA93 90               sub  b
WRA1:DA94 E7               rst  $20
WRA1:DA95 01 74 39         ld   bc,$3974
WRA1:DA98 8B               adc  e
WRA1:DA99 3F               ccf  
WRA1:DA9A 6A               ld   l,d
WRA1:DA9B E7               rst  $20
WRA1:DA9C 1C               inc  e
WRA1:DA9D 5A               ld   e,d
WRA1:DA9E 67               ld   h,a
WRA1:DA9F 53               ld   d,e
WRA1:DAA0 75               ld   [hl],l
WRA1:DAA1 B0               or   b
WRA1:DAA2 E8 70            add  sp,$70
WRA1:DAA4 F6 B4            or   a,$B4
WRA1:DAA6 5A               ld   e,d
WRA1:DAA7 C2 1F 35         jp   nz,$351F
WRA1:DAAA 0F               rrca 
WRA1:DAAB C5               push bc
WRA1:DAAC 08 27 07         ld   [$0727],sp
WRA1:DAAF 85               add  l
WRA1:DAB0 F4               db   $F4 ; undefined opcode
WRA1:DAB1 54               ld   d,h
WRA1:DAB2 90               sub  b
WRA1:DAB3 7F               ld   a,a
WRA1:DAB4 76               halt 
WRA1:DAB5 C0               ret  nz
WRA1:DAB6 68               ld   l,b
WRA1:DAB7 70               ld   [hl],b
WRA1:DAB8 47               ld   b,a
WRA1:DAB9 BA               cp   d
WRA1:DABA 6E               ld   l,[hl]
WRA1:DABB A6               and  [hl]
WRA1:DABC 47               ld   b,a
WRA1:DABD 3E 0C            ld   a,$0C
WRA1:DABF 4F               ld   c,a
WRA1:DAC0 BA               cp   d
WRA1:DAC1 44               ld   b,h
WRA1:DAC2 80               add  b
WRA1:DAC3 B8               cp   b
WRA1:DAC4 72               ld   [hl],d
WRA1:DAC5 F0 E6            ldh  a,[$FFE6]
WRA1:DAC7 78               ld   a,b
WRA1:DAC8 17               rla  
WRA1:DAC9 09               add  hl,bc
WRA1:DACA 3A               ldd  a,[hl]
WRA1:DACB 3E 53            ld   a,$53
WRA1:DACD 7F               ld   a,a
WRA1:DACE 0F               rrca 
WRA1:DACF 0B               dec  bc
WRA1:DAD0 F9               ld   sp,hl
WRA1:DAD1 70               ld   [hl],b
WRA1:DAD2 20 CB            jr   nz,$DA9F
WRA1:DAD4 F0 19            ldh  a,[$FF19]
WRA1:DAD6 AB               xor  e
WRA1:DAD7 50               ld   d,b
WRA1:DAD8 2B               dec  hl
WRA1:DAD9 0F               rrca 
WRA1:DADA 9B               sbc  e
WRA1:DADB 03               inc  bc
WRA1:DADC 43               ld   b,e
WRA1:DADD 43               ld   b,e
WRA1:DADE 0B               dec  bc
WRA1:DADF 0F               rrca 
WRA1:DAE0 C2 5D 51         jp   nz,$515D
WRA1:DAE3 E1               pop  hl
WRA1:DAE4 61               ld   h,c
WRA1:DAE5 E2               ld   [$ff00+c],a
WRA1:DAE6 A2               and  d
WRA1:DAE7 50               ld   d,b
WRA1:DAE8 F5               push af
WRA1:DAE9 B7               or   a
WRA1:DAEA 67               ld   h,a
WRA1:DAEB 0C               inc  c
WRA1:DAEC 9B               sbc  e
WRA1:DAED 6E               ld   l,[hl]
WRA1:DAEE 08 4F B1         ld   [$B14F],sp
WRA1:DAF1 38 F4            jr   c,$DAE7
WRA1:DAF3 20 68            jr   nz,$DB5D
WRA1:DAF5 76               halt 
WRA1:DAF6 F0 70            ldh  a,[$FF70]
WRA1:DAF8 03               inc  bc
WRA1:DAF9 AF               xor  a
WRA1:DAFA 9D               sbc  l
WRA1:DAFB 8B               adc  e
WRA1:DAFC 2B               dec  hl
WRA1:DAFD 01 C7 0F         ld   bc,$0FC7
WRA1:DB00 0E 2F            ld   c,$2F
WRA1:DB02 0D               dec  c
WRA1:DB03 37               scf  
WRA1:DB04 B7               or   a
WRA1:DB05 E5               push hl
WRA1:DB06 AF               xor  a
WRA1:DB07 9E               sbc  [hl]
WRA1:DB08 B0               or   b
WRA1:DB09 FB               ei   
WRA1:DB0A 46               ld   b,[hl]
WRA1:DB0B E9               jp   hl
WRA1:DB0C A3               and  e
WRA1:DB0D 3A               ldd  a,[hl]
WRA1:DB0E 16 BA            ld   d,$BA
WRA1:DB10 5B               ld   e,e
WRA1:DB11 95               sub  l
WRA1:DB12 42               ld   b,d
WRA1:DB13 4F               ld   c,a
WRA1:DB14 07               rlca 
WRA1:DB15 2F               cpl  
WRA1:DB16 2C               inc  l
WRA1:DB17 82               add  d
WRA1:DB18 AA               xor  d
WRA1:DB19 50               ld   d,b
WRA1:DB1A 62               ld   h,d
WRA1:DB1B 70               ld   [hl],b
WRA1:DB1C 78               ld   a,b
WRA1:DB1D 58               ld   e,b
WRA1:DB1E F0 D0            ldh  a,[$FFD0]
WRA1:DB20 02               ld   [bc],a
WRA1:DB21 5A               ld   e,d
WRA1:DB22 0E 8F            ld   c,$8F
WRA1:DB24 41               ld   b,c
WRA1:DB25 5E               ld   e,[hl]
WRA1:DB26 8F               adc  a
WRA1:DB27 41               ld   b,c
WRA1:DB28 F6 82            or   a,$82
WRA1:DB2A 99               sbc  c
WRA1:DB2B 56               ld   d,[hl]
WRA1:DB2C A0               and  b
WRA1:DB2D CC 6C 40         call z,$406C
WRA1:DB30 BB               cp   e
WRA1:DB31 37               scf  
WRA1:DB32 BE               cp   [hl]
WRA1:DB33 2B               dec  hl
WRA1:DB34 69               ld   l,c
WRA1:DB35 0B               dec  bc
WRA1:DB36 9F               sbc  a
WRA1:DB37 3B               dec  sp
WRA1:DB38 7C               ld   a,h
WRA1:DB39 B5               or   l
WRA1:DB3A F0 D2            ldh  a,[$FFD2]
WRA1:DB3C EC               db   $EC ; undefined opcode
WRA1:DB3D D2 B0 32         jp   nc,$32B0
WRA1:DB40 15               dec  d
WRA1:DB41 8B               adc  e
WRA1:DB42 AF               xor  a
WRA1:DB43 AE               xor  [hl]
WRA1:DB44 06 8E            ld   b,$8E
WRA1:DB46 DF               rst  $18
WRA1:DB47 29               add  hl,hl
WRA1:DB48 50               ld   d,b
WRA1:DB49 BC               cp   h
WRA1:DB4A F0 CC            ldh  a,[$FFCC]
WRA1:DB4C E1               pop  hl
WRA1:DB4D 71               ld   [hl],c
WRA1:DB4E 51               ld   d,c
WRA1:DB4F DF               rst  $18
WRA1:DB50 0E 63            ld   c,$63
WRA1:DB52 2A               ldi  a,[hl]
WRA1:DB53 97               sub  a
WRA1:DB54 26 0F            ld   h,$0F
WRA1:DB56 F8 3B            ld   hl,sp+$3B
WRA1:DB58 C8               ret  z
WRA1:DB59 B5               or   l
WRA1:DB5A F5               push af
WRA1:DB5B 55               ld   d,l
WRA1:DB5C FC               db   $FC ; undefined opcode
WRA1:DB5D 63               ld   h,e
WRA1:DB5E 51               ld   d,c
WRA1:DB5F 9A               sbc  d
WRA1:DB60 01 6E 87         ld   bc,$876E
WRA1:DB63 89               adc  c
WRA1:DB64 8F               adc  a
WRA1:DB65 24               inc  h
WRA1:DB66 FF               rst  $38
WRA1:DB67 3F               ccf  
WRA1:DB68 74               ld   [hl],h
WRA1:DB69 FB               ei   
WRA1:DB6A A0               and  b
WRA1:DB6B 58               ld   e,b
WRA1:DB6C 90               sub  b
WRA1:DB6D D0               ret  nc
WRA1:DB6E 04               inc  b
WRA1:DB6F CC 0E 87         call z,$870E
WRA1:DB72 0E 2D            ld   c,$2D
WRA1:DB74 14               inc  d
WRA1:DB75 22               ldi  [hl],a
WRA1:DB76 AD               xor  l
WRA1:DB77 6F               ld   l,a
WRA1:DB78 7C               ld   a,h
WRA1:DB79 F8 71            ld   hl,sp+$71
WRA1:DB7B F0 21            ldh  a,[$FF21]
WRA1:DB7D E7               rst  $20
WRA1:DB7E D6 F0            sub  a,$F0
WRA1:DB80 82               add  d
WRA1:DB81 0B               dec  bc
WRA1:DB82 9D               sbc  l
WRA1:DB83 17               rla  
WRA1:DB84 BD               cp   l
WRA1:DB85 E2               ld   [$ff00+c],a
WRA1:DB86 0F               rrca 
WRA1:DB87 AE               xor  [hl]
WRA1:DB88 F0 32            ldh  a,[$FF32]
WRA1:DB8A 39               add  hl,sp
WRA1:DB8B E4               db   $E4 ; undefined opcode
WRA1:DB8C D6 40            sub  a,$40
WRA1:DB8E F0 F1            ldh  a,[$FFF1]
WRA1:DB90 0F               rrca 
WRA1:DB91 CD 99 4E         call $4E99
WRA1:DB94 4F               ld   c,a
WRA1:DB95 07               rlca 
WRA1:DB96 4B               ld   c,e
WRA1:DB97 2E EC            ld   l,$EC
WRA1:DB99 30 38            jr   nc,$DBD3
WRA1:DB9B FC               db   $FC ; undefined opcode
WRA1:DB9C 15               dec  d
WRA1:DB9D DA F4 E4         jp   c,$E4F4
WRA1:DBA0 09               add  hl,bc
WRA1:DBA1 9F               sbc  a
WRA1:DBA2 37               scf  
WRA1:DBA3 C2 16 E3         jp   nz,$E316
WRA1:DBA6 06 3F            ld   b,$3F
WRA1:DBA8 74               ld   [hl],h
WRA1:DBA9 DC F6 78         call c,$78F6
WRA1:DBAC 79               ld   a,c
WRA1:DBAD D1               pop  de
WRA1:DBAE 83               add  e
WRA1:DBAF F4               db   $F4 ; undefined opcode
WRA1:DBB0 15               dec  d
WRA1:DBB1 1F               rra  
WRA1:DBB2 0F               rrca 
WRA1:DBB3 0A               ld   a,[bc]
WRA1:DBB4 05               dec  b
WRA1:DBB5 8C               adc  h
WRA1:DBB6 F7               rst  $30
WRA1:DBB7 28 F8            jr   z,$DBB1
WRA1:DBB9 50               ld   d,b
WRA1:DBBA F8 F5            ld   hl,sp-$0B
WRA1:DBBC 35               dec  [hl]
WRA1:DBBD 70               ld   [hl],b
WRA1:DBBE 5A               ld   e,d
WRA1:DBBF 60               ld   h,b
WRA1:DBC0 93               sub  e
WRA1:DBC1 23               inc  hl
WRA1:DBC2 0E AF            ld   c,$AF
WRA1:DBC4 0D               dec  c
WRA1:DBC5 57               ld   d,a
WRA1:DBC6 52               ld   d,d
WRA1:DBC7 4F               ld   c,a
WRA1:DBC8 36 F6            ld   [hl],$F6
WRA1:DBCA A4               and  h
WRA1:DBCB C4 F0 7A         call nz,$7AF0
WRA1:DBCE FC               db   $FC ; undefined opcode
WRA1:DBCF C5               push bc
WRA1:DBD0 75               ld   [hl],l
WRA1:DBD1 FB               ei   
WRA1:DBD2 DF               rst  $18
WRA1:DBD3 3D               dec  a
WRA1:DBD4 5F               ld   e,a
WRA1:DBD5 1F               rra  
WRA1:DBD6 DB               db   $DB ; undefined opcode
WRA1:DBD7 85               add  l
WRA1:DBD8 F5               push af
WRA1:DBD9 F1               pop  af
WRA1:DBDA F0 D0            ldh  a,[$FFD0]
WRA1:DBDC D0               ret  nc
WRA1:DBDD 76               halt 
WRA1:DBDE 70               ld   [hl],b
WRA1:DBDF E6 4D            and  a,$4D
WRA1:DBE1 83               add  e
WRA1:DBE2 CF               rst  $08
WRA1:DBE3 07               rlca 
WRA1:DBE4 8F               adc  a
WRA1:DBE5 47               ld   b,a
WRA1:DBE6 54               ld   d,h
WRA1:DBE7 0E FC            ld   c,$FC
WRA1:DBE9 BD               cp   l
WRA1:DBEA F9               ld   sp,hl
WRA1:DBEB 55               ld   d,l
WRA1:DBEC 72               ld   [hl],d
WRA1:DBED A0               and  b
WRA1:DBEE E8 F0            add  sp,-$10
WRA1:DBF0 2E 2F            ld   l,$2F
WRA1:DBF2 23               inc  hl
WRA1:DBF3 43               ld   b,e
WRA1:DBF4 0D               dec  c
WRA1:DBF5 BF               cp   a
WRA1:DBF6 0C               inc  c
WRA1:DBF7 3B               dec  sp
WRA1:DBF8 50               ld   d,b
WRA1:DBF9 D9               reti 
WRA1:DBFA E3               db   $E3 ; undefined opcode
WRA1:DBFB 99               sbc  c
WRA1:DBFC F2               ld   a,[$ff00+c]
WRA1:DBFD B0               or   b
WRA1:DBFE 7F               ld   a,a
WRA1:DBFF F4               db   $F4 ; undefined opcode
WRA1:DC00 42               ld   b,d
WRA1:DC01 97               sub  a
WRA1:DC02 6E               ld   l,[hl]
WRA1:DC03 9F               sbc  a
WRA1:DC04 02               ld   [bc],a
WRA1:DC05 99               sbc  c
WRA1:DC06 6E               ld   l,[hl]
WRA1:DC07 58               ld   e,b
WRA1:DC08 10 66            <corrupted stop>
WRA1:DC0A EC               db   $EC ; undefined opcode
WRA1:DC0B 91               sub  c
WRA1:DC0C F8 91            ld   hl,sp-$6F
WRA1:DC0E D2 CD 8F         jp   nc,$8FCD
WRA1:DC11 0F               rrca 
WRA1:DC12 63               ld   h,e
WRA1:DC13 05               dec  b
WRA1:DC14 6F               ld   l,a
WRA1:DC15 1E EF            ld   e,$EF
WRA1:DC17 94               sub  h
WRA1:DC18 55               ld   d,l
WRA1:DC19 96               sub  [hl]
WRA1:DC1A E5               push hl
WRA1:DC1B 38 EC            jr   c,$DC09
WRA1:DC1D F5               push af
WRA1:DC1E F0 30            ldh  a,[$FF30]
WRA1:DC20 95               sub  l
WRA1:DC21 0B               dec  bc
WRA1:DC22 CB 9B            res  3,e
WRA1:DC24 21 2F 44         ld   hl,$442F
WRA1:DC27 2D               dec  l
WRA1:DC28 BA               cp   d
WRA1:DC29 70               ld   [hl],b
WRA1:DC2A F2               ld   a,[$ff00+c]
WRA1:DC2B B1               or   c
WRA1:DC2C FC               db   $FC ; undefined opcode
WRA1:DC2D 70               ld   [hl],b
WRA1:DC2E A9               xor  c
WRA1:DC2F D8               ret  c
WRA1:DC30 47               ld   b,a
WRA1:DC31 AB               xor  e
WRA1:DC32 37               scf  
WRA1:DC33 1F               rra  
WRA1:DC34 5A               ld   e,d
WRA1:DC35 57               ld   d,a
WRA1:DC36 34               inc  [hl]
WRA1:DC37 AE               xor  [hl]
WRA1:DC38 E0 F0            ldh  [$FFF0],a
WRA1:DC3A F8 92            ld   hl,sp-$6E
WRA1:DC3C 30 A1            jr   nc,$DBDF
WRA1:DC3E FA F0 01         ld   a,[$01F0]
WRA1:DC41 AE               xor  [hl]
WRA1:DC42 2D               dec  l
WRA1:DC43 C6 72            add  a,$72
WRA1:DC45 CF               rst  $08
WRA1:DC46 3E 43            ld   a,$43
WRA1:DC48 F8 A5            ld   hl,sp-$5B
WRA1:DC4A 79               ld   a,c
WRA1:DC4B FA D1 A8         ld   a,[$A8D1]
WRA1:DC4E FC               db   $FC ; undefined opcode
WRA1:DC4F 71               ld   [hl],c
WRA1:DC50 DB               db   $DB ; undefined opcode
WRA1:DC51 37               scf  
WRA1:DC52 2D               dec  l
WRA1:DC53 0F               rrca 
WRA1:DC54 80               add  b
WRA1:DC55 8E               adc  [hl]
WRA1:DC56 9B               sbc  e
WRA1:DC57 0D               dec  c
WRA1:DC58 F7               rst  $30
WRA1:DC59 56               ld   d,[hl]
WRA1:DC5A B4               or   h
WRA1:DC5B F1               pop  af
WRA1:DC5C EE E4            xor  a,$E4
WRA1:DC5E 76               halt 
WRA1:DC5F 7A               ld   a,d
WRA1:DC60 67               ld   h,a
WRA1:DC61 AF               xor  a
WRA1:DC62 89               adc  c
WRA1:DC63 0F               rrca 
WRA1:DC64 1F               rra  
WRA1:DC65 9F               sbc  a
WRA1:DC66 10 9E            <corrupted stop>
WRA1:DC68 A2               and  d
WRA1:DC69 B6               or   [hl]
WRA1:DC6A AA               xor  d
WRA1:DC6B DC 7C D5         call c,$D57C
WRA1:DC6E A0               and  b
WRA1:DC6F E8 1E            add  sp,$1E
WRA1:DC71 0F               rrca 
WRA1:DC72 EB               db   $EB ; undefined opcode
WRA1:DC73 0E 05            ld   c,$05
WRA1:DC75 CF               rst  $08
WRA1:DC76 0E 05            ld   c,$05
WRA1:DC78 E4               db   $E4 ; undefined opcode
WRA1:DC79 DB               db   $DB ; undefined opcode
WRA1:DC7A 30 F6            jr   nc,$DC72
WRA1:DC7C 90               sub  b
WRA1:DC7D DA F4 B0         jp   c,$B0F4
WRA1:DC80 5A               ld   e,d
WRA1:DC81 16 1B            ld   d,$1B
WRA1:DC83 8D               adc  l
WRA1:DC84 25               dec  h
WRA1:DC85 07               rlca 
WRA1:DC86 69               ld   l,c
WRA1:DC87 0F               rrca 
WRA1:DC88 40               ld   b,b
WRA1:DC89 EC               db   $EC ; undefined opcode
WRA1:DC8A DA FA 32         jp   c,$32FA
WRA1:DC8D 50               ld   d,b
WRA1:DC8E F3               di   
WRA1:DC8F 31 2F 2C         ld   sp,$2C2F
WRA1:DC92 17               rla  
WRA1:DC93 08 7B 09         ld   [$097B],sp
WRA1:DC96 8B               adc  e
WRA1:DC97 8F               adc  a
WRA1:DC98 31 73 76         ld   sp,$7673
WRA1:DC9B 7D               ld   a,l
WRA1:DC9C B3               or   e
WRA1:DC9D 70               ld   [hl],b
WRA1:DC9E 33               inc  sp
WRA1:DC9F F2               ld   a,[$ff00+c]
WRA1:DCA0 09               add  hl,bc
WRA1:DCA1 4F               ld   c,a
WRA1:DCA2 5C               ld   e,h
WRA1:DCA3 5A               ld   e,d
WRA1:DCA4 4C               ld   c,h
WRA1:DCA5 FA 0B 4D         ld   a,[$4D0B]
WRA1:DCA8 6A               ld   l,d
WRA1:DCA9 B5               or   l
WRA1:DCAA 96               sub  [hl]
WRA1:DCAB F8 8B            ld   hl,sp-$75
WRA1:DCAD EA A0 C0         ld   [$C0A0],a
WRA1:DCB0 87               add  a
WRA1:DCB1 6C               ld   l,h
WRA1:DCB2 8C               adc  h
WRA1:DCB3 95               sub  l
WRA1:DCB4 43               ld   b,e
WRA1:DCB5 0B               dec  bc
WRA1:DCB6 CF               rst  $08
WRA1:DCB7 4A               ld   c,d
WRA1:DCB8 A8               xor  b
WRA1:DCB9 70               ld   [hl],b
WRA1:DCBA 75               ld   [hl],l
WRA1:DCBB D2 F5 70         jp   nc,$70F5
WRA1:DCBE FE 14            cp   a,$14
WRA1:DCC0 8B               adc  e
WRA1:DCC1 8A               adc  d
WRA1:DCC2 0F               rrca 
WRA1:DCC3 4D               ld   c,l
WRA1:DCC4 4D               ld   c,l
WRA1:DCC5 C4 3D 17         call nz,$173D
WRA1:DCC8 E8 40            add  sp,$40
WRA1:DCCA C9               ret  
WRA1:DCCB 74               ld   [hl],h
WRA1:DCCC A0               and  b
WRA1:DCCD B1               or   c
WRA1:DCCE 78               ld   a,b
WRA1:DCCF F3               di   
WRA1:DCD0 C9               ret  
WRA1:DCD1 52               ld   d,d
WRA1:DCD2 1E 81            ld   e,$81
WRA1:DCD4 4F               ld   c,a
WRA1:DCD5 4F               ld   c,a
WRA1:DCD6 1F               rra  
WRA1:DCD7 77               ld   [hl],a
WRA1:DCD8 75               ld   [hl],l
WRA1:DCD9 B4               or   h
WRA1:DCDA 79               ld   a,c
WRA1:DCDB F8 73            ld   hl,sp+$73
WRA1:DCDD D5               push de
WRA1:DCDE BA               cp   d
WRA1:DCDF 84               add  h
WRA1:DCE0 55               ld   d,l
WRA1:DCE1 1D               dec  e
WRA1:DCE2 86               add  [hl]
WRA1:DCE3 07               rlca 
WRA1:DCE4 79               ld   a,c
WRA1:DCE5 2E 01            ld   l,$01
WRA1:DCE7 C2 E8 90         jp   nz,$90E8
WRA1:DCEA 78               ld   a,b
WRA1:DCEB CA A9 94         jp   z,$94A9
WRA1:DCEE 21 70 4E         ld   hl,$4E70
WRA1:DCF1 1A               ld   a,[de]
WRA1:DCF2 84               add  h
WRA1:DCF3 CD 9B 8E         call $8E9B
WRA1:DCF6 05               dec  b
WRA1:DCF7 13               inc  de
WRA1:DCF8 78               ld   a,b
WRA1:DCF9 5E               ld   e,[hl]
WRA1:DCFA C4 31 E0         call nz,$E031
WRA1:DCFD C1               pop  bc
WRA1:DCFE 38 86            jr   c,$DC86
WRA1:DD00 D7               rst  $10
WRA1:DD01 FB               ei   
WRA1:DD02 B8               cp   b
WRA1:DD03 B5               or   l
WRA1:DD04 E9               jp   hl
WRA1:DD05 63               ld   h,e
WRA1:DD06 9A               sbc  d
WRA1:DD07 5C               ld   e,h
WRA1:DD08 1E 25            ld   e,$25
WRA1:DD0A 13               inc  de
WRA1:DD0B 0F               rrca 
WRA1:DD0C 5B               ld   e,e
WRA1:DD0D 11 2B 7C         ld   de,$7C2B
WRA1:DD10 44               ld   b,h
WRA1:DD11 71               ld   [hl],c
WRA1:DD12 FB               ei   
WRA1:DD13 C4 79 B2         call nz,$B279
WRA1:DD16 5A               ld   e,d
WRA1:DD17 F0 86            ldh  a,[$FF86]
WRA1:DD19 82               add  d
WRA1:DD1A 7D               ld   a,l
WRA1:DD1B 87               add  a
WRA1:DD1C 2F               cpl  
WRA1:DD1D D3               db   $D3 ; undefined opcode
WRA1:DD1E 43               ld   b,e
WRA1:DD1F B9               cp   c
WRA1:DD20 D2 F0 B0         jp   nc,$B0F0
WRA1:DD23 66               ld   h,[hl]
WRA1:DD24 72               ld   [hl],d
WRA1:DD25 B6               or   [hl]
WRA1:DD26 F8 EE            ld   hl,sp-$12
WRA1:DD28 8A               adc  d
WRA1:DD29 4E               ld   c,[hl]
WRA1:DD2A 0E 3E            ld   c,$3E
WRA1:DD2C 1F               rra  
WRA1:DD2D A4               and  h
WRA1:DD2E 7B               ld   a,e
WRA1:DD2F 0B               dec  bc
WRA1:DD30 74               ld   [hl],h
WRA1:DD31 9B               sbc  e
WRA1:DD32 87               add  a
WRA1:DD33 60               ld   h,b
WRA1:DD34 D5               push de
WRA1:DD35 A1               and  c
WRA1:DD36 D2 13 C7         jp   nc,$C713
WRA1:DD39 3F               ccf  
WRA1:DD3A 57               ld   d,a
WRA1:DD3B 0E 9D            ld   c,$9D
WRA1:DD3D 81               add  c
WRA1:DD3E CE 2B            adc  a,$2B
WRA1:DD40 7A               ld   a,d
WRA1:DD41 F2               ld   a,[$ff00+c]
WRA1:DD42 94               sub  h
WRA1:DD43 E4               db   $E4 ; undefined opcode
WRA1:DD44 F2               ld   a,[$ff00+c]
WRA1:DD45 E2               ld   [$ff00+c],a
WRA1:DD46 E0 D4            ldh  [$FFD4],a
WRA1:DD48 66               ld   h,[hl]
WRA1:DD49 85               add  l
WRA1:DD4A C3 6E AA         jp   $AA6E
WRA1:DD4D 2F               cpl  
WRA1:DD4E C1               pop  bc
WRA1:DD4F DB               db   $DB ; undefined opcode
WRA1:DD50 32               ldd  [hl],a
WRA1:DD51 3D               dec  a
WRA1:DD52 D6 F7            sub  a,$F7
WRA1:DD54 A1               and  c
WRA1:DD55 64               ld   h,h
WRA1:DD56 61               ld   h,c
WRA1:DD57 73               ld   [hl],e
WRA1:DD58 1A               ld   a,[de]
WRA1:DD59 57               ld   d,a
WRA1:DD5A 0D               dec  c
WRA1:DD5B 4F               ld   c,a
WRA1:DD5C 0F               rrca 
WRA1:DD5D AB               xor  e
WRA1:DD5E 08 4D C3         ld   [$C34D],sp
WRA1:DD61 20 22            jr   nz,$DD85
WRA1:DD63 71               ld   [hl],c
WRA1:DD64 F3               di   
WRA1:DD65 F4               db   $F4 ; undefined opcode
WRA1:DD66 30 7B            jr   nc,$DDE3
WRA1:DD68 26 0F            ld   h,$0F
WRA1:DD6A 7F               ld   a,a
WRA1:DD6B 56               ld   d,[hl]
WRA1:DD6C 0D               dec  c
WRA1:DD6D FB               ei   
WRA1:DD6E 1E 4D            ld   e,$4D
WRA1:DD70 D3               db   $D3 ; undefined opcode
WRA1:DD71 48               ld   c,b
WRA1:DD72 D0               ret  nc
WRA1:DD73 95               sub  l
WRA1:DD74 F8 EE            ld   hl,sp-$12
WRA1:DD76 F0 B0            ldh  a,[$FFB0]
WRA1:DD78 0D               dec  c
WRA1:DD79 5D               ld   e,l
WRA1:DD7A 88               adc  b
WRA1:DD7B 7B               ld   a,e
WRA1:DD7C 13               inc  de
WRA1:DD7D 4F               ld   c,a
WRA1:DD7E 2F               cpl  
WRA1:DD7F CD 51 36         call $3651
WRA1:DD82 C9               ret  
WRA1:DD83 FC               db   $FC ; undefined opcode
WRA1:DD84 F0 70            ldh  a,[$FF70]
WRA1:DD86 B6               or   [hl]
WRA1:DD87 E0 26            ldh  [$FF26],a
WRA1:DD89 C4 A8 4F         call nz,$4FA8
WRA1:DD8C 0E 2C            ld   c,$2C
WRA1:DD8E 8B               adc  e
WRA1:DD8F 03               inc  bc
WRA1:DD90 F5               push af
WRA1:DD91 68               ld   l,b
WRA1:DD92 40               ld   b,b
WRA1:DD93 C2 52 E3         jp   nz,$E352
WRA1:DD96 F1               pop  af
WRA1:DD97 E4               db   $E4 ; undefined opcode
WRA1:DD98 98               sbc  b
WRA1:DD99 1D               dec  e
WRA1:DD9A 28 3A            jr   z,$DDD6
WRA1:DD9C A7               and  a
WRA1:DD9D CE EF            adc  a,$EF
WRA1:DD9F 4A               ld   c,d
WRA1:DDA0 D4 7D E8         call nc,$E87D
WRA1:DDA3 D4 6D 90         call nc,$906D
WRA1:DDA6 74               ld   [hl],h
WRA1:DDA7 74               ld   [hl],h
WRA1:DDA8 8E               adc  [hl]
WRA1:DDA9 9F               sbc  a
WRA1:DDAA 4B               ld   c,e
WRA1:DDAB 5D               ld   e,l
WRA1:DDAC 07               rlca 
WRA1:DDAD 4F               ld   c,a
WRA1:DDAE 5B               ld   e,e
WRA1:DDAF 5D               ld   e,l
WRA1:DDB0 06 32            ld   b,$32
WRA1:DDB2 B2               or   d
WRA1:DDB3 50               ld   d,b
WRA1:DDB4 F0 F8            ldh  a,[$FFF8]
WRA1:DDB6 70               ld   [hl],b
WRA1:DDB7 21 C3 16         ld   hl,$16C3
WRA1:DDBA 6B               ld   l,e
WRA1:DDBB 9B               sbc  e
WRA1:DDBC 8E               adc  [hl]
WRA1:DDBD 32               ldd  [hl],a
WRA1:DDBE C9               ret  
WRA1:DDBF 6E               ld   l,[hl]
WRA1:DDC0 A0               and  b
WRA1:DDC1 E8 F1            add  sp,-$0F
WRA1:DDC3 ED               db   $ED ; undefined opcode
WRA1:DDC4 88               adc  b
WRA1:DDC5 B0               or   b
WRA1:DDC6 A4               and  h
WRA1:DDC7 73               ld   [hl],e
WRA1:DDC8 8A               adc  d
WRA1:DDC9 0F               rrca 
WRA1:DDCA 07               rlca 
WRA1:DDCB 0D               dec  c
WRA1:DDCC 03               inc  bc
WRA1:DDCD 97               sub  a
WRA1:DDCE 20 4F            jr   nz,$DE1F
WRA1:DDD0 84               add  h
WRA1:DDD1 F2               ld   a,[$ff00+c]
WRA1:DDD2 F0 FA            ldh  a,[$FFFA]
WRA1:DDD4 00               nop  
WRA1:DDD5 F1               pop  af
WRA1:DDD6 C9               ret  
WRA1:DDD7 F3               di   
WRA1:DDD8 D2 5F 01         jp   nc,$015F
WRA1:DDDB 1C               inc  e
WRA1:DDDC 1C               inc  e
WRA1:DDDD 3F               ccf  
WRA1:DDDE E6 0C            and  a,$0C
WRA1:DDE0 97               sub  a
WRA1:DDE1 7D               ld   a,l
WRA1:DDE2 D0               ret  nc
WRA1:DDE3 12               ld   [de],a
WRA1:DDE4 D2 42 D2         jp   nc,$D242
WRA1:DDE7 E2               ld   [$ff00+c],a
WRA1:DDE8 0E 1F            ld   c,$1F
WRA1:DDEA A6               and  [hl]
WRA1:DDEB 5F               ld   e,a
WRA1:DDEC 26 06            ld   h,$06
WRA1:DDEE DF               rst  $18
WRA1:DDEF 55               ld   d,l
WRA1:DDF0 F3               di   
WRA1:DDF1 F4               db   $F4 ; undefined opcode
WRA1:DDF2 BC               cp   h
WRA1:DDF3 72               ld   [hl],d
WRA1:DDF4 92               sub  d
WRA1:DDF5 72               ld   [hl],d
WRA1:DDF6 72               ld   [hl],d
WRA1:DDF7 F8 01            ld   hl,sp+$01
WRA1:DDF9 BF               cp   a
WRA1:DDFA 17               rla  
WRA1:DDFB 93               sub  e
WRA1:DDFC 01 25 0E         ld   bc,$0E25
WRA1:DDFF 8E               adc  [hl]
WRA1:DE00 6E               ld   l,[hl]
WRA1:DE01 A7               and  a
WRA1:DE02 4B               ld   c,e
WRA1:DE03 0E 2A            ld   c,$2A
WRA1:DE05 0F               rrca 
WRA1:DE06 2F               cpl  
WRA1:DE07 07               rlca 
WRA1:DE08 71               ld   [hl],c
WRA1:DE09 F7               rst  $30
WRA1:DE0A CA F6 D2         jp   z,$D2F6
WRA1:DE0D DC 1C 98         call c,$981C
WRA1:DE10 66               ld   h,[hl]
WRA1:DE11 1F               rra  
WRA1:DE12 09               add  hl,bc
WRA1:DE13 36 0E            ld   [hl],$0E
WRA1:DE15 03               inc  bc
WRA1:DE16 EB               db   $EB ; undefined opcode
WRA1:DE17 A7               and  a
WRA1:DE18 F7               rst  $30
WRA1:DE19 AC               xor  h
WRA1:DE1A C8               ret  z
WRA1:DE1B E0 4A            ldh  [$FF4A],a
WRA1:DE1D B8               cp   b
WRA1:DE1E 38 A3            jr   c,$DDC3
WRA1:DE20 FF               rst  $38
WRA1:DE21 0E 26            ld   c,$26
WRA1:DE23 23               inc  hl
WRA1:DE24 CD 0E 0E         call $0E0E
WRA1:DE27 AD               xor  l
WRA1:DE28 55               ld   d,l
WRA1:DE29 26 B0            ld   h,$B0
WRA1:DE2B E0 F4            ldh  [$FFF4],a
WRA1:DE2D F6 4B            or   a,$4B
WRA1:DE2F F8 0F            ld   hl,sp+$0F
WRA1:DE31 2B               dec  hl
WRA1:DE32 1B               dec  de
WRA1:DE33 8A               adc  d
WRA1:DE34 DA 0F 0D         jp   c,$0D0F
WRA1:DE37 0F               rrca 
WRA1:DE38 70               ld   [hl],b
WRA1:DE39 E4               db   $E4 ; undefined opcode
WRA1:DE3A A9               xor  c
WRA1:DE3B E9               jp   hl
WRA1:DE3C F8 78            ld   hl,sp+$78
WRA1:DE3E 96               sub  [hl]
WRA1:DE3F 6D               ld   l,l
WRA1:DE40 0B               dec  bc
WRA1:DE41 5F               ld   e,a
WRA1:DE42 CD 99 D7         call $D799
WRA1:DE45 CC 1A 16         call z,$161A
WRA1:DE48 7B               ld   a,e
WRA1:DE49 F8 B9            ld   hl,sp-$47
WRA1:DE4B F3               di   
WRA1:DE4C D8               ret  c
WRA1:DE4D F1               pop  af
WRA1:DE4E 30 E4            jr   nc,$DE34
WRA1:DE50 19               add  hl,de
WRA1:DE51 C3 6F 2A         jp   $2A6F
WRA1:DE54 0F               rrca 
WRA1:DE55 8F               adc  a
WRA1:DE56 3B               dec  sp
WRA1:DE57 40               ld   b,b
WRA1:DE58 9B               sbc  e
WRA1:DE59 D3               db   $D3 ; undefined opcode
WRA1:DE5A 36 26            ld   [hl],$26
WRA1:DE5C E8 FD            add  sp,-$03
WRA1:DE5E 58               ld   e,b
WRA1:DE5F E5               push hl
WRA1:DE60 0E C4            ld   c,$C4
WRA1:DE62 10 1E            <corrupted stop>
WRA1:DE64 1C               inc  e
WRA1:DE65 22               ldi  [hl],a
WRA1:DE66 AC               xor  h
WRA1:DE67 2F               cpl  
WRA1:DE68 B7               or   a
WRA1:DE69 25               dec  h
WRA1:DE6A 0A               ld   a,[bc]
WRA1:DE6B F1               pop  af
WRA1:DE6C F6 C6            or   a,$C6
WRA1:DE6E 40               ld   b,b
WRA1:DE6F 5D               ld   e,l
WRA1:DE70 FB               ei   
WRA1:DE71 47               ld   b,a
WRA1:DE72 26 D7            ld   h,$D7
WRA1:DE74 67               ld   h,a
WRA1:DE75 8C               adc  h
WRA1:DE76 6E               ld   l,[hl]
WRA1:DE77 1D               dec  e
WRA1:DE78 CC 94 F0         call z,$F094
WRA1:DE7B 25               dec  h
WRA1:DE7C 70               ld   [hl],b
WRA1:DE7D C9               ret  
WRA1:DE7E F9               ld   sp,hl
WRA1:DE7F F5               push af
WRA1:DE80 BB               cp   e
WRA1:DE81 29               add  hl,hl
WRA1:DE82 1F               rra  
WRA1:DE83 0D               dec  c
WRA1:DE84 0F               rrca 
WRA1:DE85 1E 26            ld   e,$26
WRA1:DE87 1F               rra  
WRA1:DE88 F5               push af
WRA1:DE89 78               ld   a,b
WRA1:DE8A 38 FD            jr   c,$DE89
WRA1:DE8C CD 92 B0         call $B092
WRA1:DE8F E0 0A            ldh  [$FF0A],a
WRA1:DE91 3F               ccf  
WRA1:DE92 5E               ld   e,[hl]
WRA1:DE93 0F               rrca 
WRA1:DE94 1F               rra  
WRA1:DE95 3F               ccf  
WRA1:DE96 23               inc  hl
WRA1:DE97 7D               ld   a,l
WRA1:DE98 F3               di   
WRA1:DE99 5C               ld   e,h
WRA1:DE9A F6 E0            or   a,$E0
WRA1:DE9C FC               db   $FC ; undefined opcode
WRA1:DE9D 2E 7B            ld   l,$7B
WRA1:DE9F F1               pop  af
WRA1:DEA0 8F               adc  a
WRA1:DEA1 9D               sbc  l
WRA1:DEA2 3E AB            ld   a,$AB
WRA1:DEA4 8D               adc  l
WRA1:DEA5 0F               rrca 
WRA1:DEA6 CE 0B            adc  a,$0B
WRA1:DEA8 05               dec  b
WRA1:DEA9 80               add  b
WRA1:DEAA F1               pop  af
WRA1:DEAB 70               ld   [hl],b
WRA1:DEAC 40               ld   b,b
WRA1:DEAD F5               push af
WRA1:DEAE 09               add  hl,bc
WRA1:DEAF F1               pop  af
WRA1:DEB0 0B               dec  bc
WRA1:DEB1 3B               dec  sp
WRA1:DEB2 06 29            ld   b,$29
WRA1:DEB4 CD 14 2C         call $2C14
WRA1:DEB7 67               ld   h,a
WRA1:DEB8 64               ld   h,h
WRA1:DEB9 FC               db   $FC ; undefined opcode
WRA1:DEBA F2               ld   a,[$ff00+c]
WRA1:DEBB 4C               ld   c,h
WRA1:DEBC 73               ld   [hl],e
WRA1:DEBD F0 98            ldh  a,[$FF98]
WRA1:DEBF F5               push af
WRA1:DEC0 2F               cpl  
WRA1:DEC1 07               rlca 
WRA1:DEC2 0F               rrca 
WRA1:DEC3 EE 2A            xor  a,$2A
WRA1:DEC5 97               sub  a
WRA1:DEC6 9C               sbc  h
WRA1:DEC7 0C               inc  c
WRA1:DEC8 65               ld   h,l
WRA1:DEC9 F1               pop  af
WRA1:DECA 9A               sbc  d
WRA1:DECB F6 C2            or   a,$C2
WRA1:DECD C2 B2 F0         jp   nz,$F0B2
WRA1:DED0 07               rlca 
WRA1:DED1 63               ld   h,e
WRA1:DED2 48               ld   c,b
WRA1:DED3 CF               rst  $08
WRA1:DED4 2B               dec  hl
WRA1:DED5 9F               sbc  a
WRA1:DED6 3D               dec  a
WRA1:DED7 A6               and  [hl]
WRA1:DED8 F5               push af
WRA1:DED9 71               ld   [hl],c
WRA1:DEDA D3               db   $D3 ; undefined opcode
WRA1:DEDB 09               add  hl,bc
WRA1:DEDC 59               ld   e,c
WRA1:DEDD 76               halt 
WRA1:DEDE D0               ret  nc
WRA1:DEDF FD               db   $FD ; undefined opcode
WRA1:DEE0 1E AB            ld   e,$AB
WRA1:DEE2 4D               ld   c,l
WRA1:DEE3 5F               ld   e,a
WRA1:DEE4 4B               ld   c,e
WRA1:DEE5 A7               and  a
WRA1:DEE6 2F               cpl  
WRA1:DEE7 9B               sbc  e
WRA1:DEE8 E1               pop  hl
WRA1:DEE9 D3               db   $D3 ; undefined opcode
WRA1:DEEA FC               db   $FC ; undefined opcode
WRA1:DEEB F6 E3            or   a,$E3
WRA1:DEED FC               db   $FC ; undefined opcode
WRA1:DEEE C4 03 7D         call nz,$7D03
WRA1:DEF1 C3 31 16         jp   $1631
WRA1:DEF4 F6 3B            or   a,$3B
WRA1:DEF6 4A               ld   c,d
WRA1:DEF7 66               ld   h,[hl]
WRA1:DEF8 F0 FD            ldh  a,[$FFFD]
WRA1:DEFA E1               pop  hl
WRA1:DEFB B0               or   b
WRA1:DEFC 89               adc  c
WRA1:DEFD 9C               sbc  h
WRA1:DEFE 3A               ldd  a,[hl]
WRA1:DEFF 51               ld   d,c
WRA1:DF00 28 71            jr   z,$DF73
WRA1:DF02 B7               or   a
WRA1:DF03 B0               or   b
WRA1:DF04 E3               db   $E3 ; undefined opcode
WRA1:DF05 D0               ret  nc
WRA1:DF06 54               ld   d,h
WRA1:DF07 B6               or   [hl]
WRA1:DF08 3C               inc  a
WRA1:DF09 0B               dec  bc
WRA1:DF0A FE 65            cp   a,$65
WRA1:DF0C 3D               dec  a
WRA1:DF0D CA E6 21         jp   z,$21E6
WRA1:DF10 69               ld   l,c
WRA1:DF11 FA 72 B3         ld   a,[$B372]
WRA1:DF14 D3               db   $D3 ; undefined opcode
WRA1:DF15 99               sbc  c
WRA1:DF16 56               ld   d,[hl]
WRA1:DF17 D2 2A 0D         jp   nc,$0D2A
WRA1:DF1A 19               add  hl,de
WRA1:DF1B 07               rlca 
WRA1:DF1C 89               adc  c
WRA1:DF1D 06 0E            ld   b,$0E
WRA1:DF1F 06 98            ld   b,$98
WRA1:DF21 20 D0            jr   nz,$DEF3
WRA1:DF23 7D               ld   a,l
WRA1:DF24 D2 CA F6         jp   nc,$F6CA
WRA1:DF27 37               scf  
WRA1:DF28 1E 2F            ld   e,$2F
WRA1:DF2A 0B               dec  bc
WRA1:DF2B 6B               ld   l,e
WRA1:DF2C A6               and  [hl]
WRA1:DF2D 1B               dec  de
WRA1:DF2E 9F               sbc  a
WRA1:DF2F DA F6 60         jp   c,$60F6
WRA1:DF32 64               ld   h,h
WRA1:DF33 D1               pop  de
WRA1:DF34 D2 F0 F4         jp   nc,$F4F0
WRA1:DF37 A0               and  b
WRA1:DF38 07               rlca 
WRA1:DF39 CF               rst  $08
WRA1:DF3A BF               cp   a
WRA1:DF3B 03               inc  bc
WRA1:DF3C 1F               rra  
WRA1:DF3D E4               db   $E4 ; undefined opcode
WRA1:DF3E 2A               ldi  a,[hl]
WRA1:DF3F 8E               adc  [hl]
WRA1:DF40 F8 F7            ld   hl,sp-$09
WRA1:DF42 B1               or   c
WRA1:DF43 F8 BC            ld   hl,sp-$44
WRA1:DF45 F8 EC            ld   hl,sp-$14
WRA1:DF47 C1               pop  bc
WRA1:DF48 0A               ld   a,[bc]
WRA1:DF49 0E C9            ld   c,$C9
WRA1:DF4B 5F               ld   e,a
WRA1:DF4C AF               xor  a
WRA1:DF4D 89               adc  c
WRA1:DF4E 2F               cpl  
WRA1:DF4F 2D               dec  l
WRA1:DF50 58               ld   e,b
WRA1:DF51 68               ld   l,b
WRA1:DF52 D0               ret  nc
WRA1:DF53 6E               ld   l,[hl]
WRA1:DF54 E0 75            ldh  [$FF75],a
WRA1:DF56 66               ld   h,[hl]
WRA1:DF57 EF               rst  $28
WRA1:DF58 57               ld   d,a
WRA1:DF59 0F               rrca 
WRA1:DF5A 07               rlca 
WRA1:DF5B 47               ld   b,a
WRA1:DF5C 0D               dec  c
WRA1:DF5D 1B               dec  de
WRA1:DF5E 07               rlca 
WRA1:DF5F 5A               ld   e,d
WRA1:DF60 A3               and  e
WRA1:DF61 D0               ret  nc
WRA1:DF62 E4               db   $E4 ; undefined opcode
WRA1:DF63 E4               db   $E4 ; undefined opcode
WRA1:DF64 91               sub  c
WRA1:DF65 64               ld   h,h
WRA1:DF66 78               ld   a,b
WRA1:DF67 F0 4A            ldh  a,[$FF4A]
WRA1:DF69 CF               rst  $08
WRA1:DF6A 72               ld   [hl],d
WRA1:DF6B 27               daa  
WRA1:DF6C 8F               adc  a
WRA1:DF6D 0E 16            ld   c,$16
WRA1:DF6F 80               add  b
WRA1:DF70 B4               or   h
WRA1:DF71 7B               ld   a,e
WRA1:DF72 7C               ld   a,h
WRA1:DF73 80               add  b
WRA1:DF74 74               ld   [hl],h
WRA1:DF75 D0               ret  nc
WRA1:DF76 B8               cp   b
WRA1:DF77 75               ld   [hl],l
WRA1:DF78 0F               rrca 
WRA1:DF79 8E               adc  [hl]
WRA1:DF7A 6F               ld   l,a
WRA1:DF7B 08 8B 17         ld   [$178B],sp
WRA1:DF7E ED               db   $ED ; undefined opcode
WRA1:DF7F BA               cp   d
WRA1:DF80 FA C1 EB         ld   a,[$EBC1]
WRA1:DF83 E9               jp   hl
WRA1:DF84 F8 D2            ld   hl,sp-$2E
WRA1:DF86 B4               or   h
WRA1:DF87 92               sub  d
WRA1:DF88 0A               ld   a,[bc]
WRA1:DF89 3D               dec  a
WRA1:DF8A 03               inc  bc
WRA1:DF8B 54               ld   d,h
WRA1:DF8C 4C               ld   c,h
WRA1:DF8D 31 0F 9F         ld   sp,$9F0F
WRA1:DF90 C1               pop  bc
WRA1:DF91 F1               pop  af
WRA1:DF92 64               ld   h,h
WRA1:DF93 DC F8 F8         call c,$F8F8
WRA1:DF96 F4               db   $F4 ; undefined opcode
WRA1:DF97 FE BD            cp   a,$BD
WRA1:DF99 C2 44 A7         jp   nz,$A744
WRA1:DF9C 07               rlca 
WRA1:DF9D 0B               dec  bc
WRA1:DF9E 67               ld   h,a
WRA1:DF9F B5               or   l
WRA1:DFA0 F0 F0            ldh  a,[$FFF0]
WRA1:DFA2 B6               or   [hl]
WRA1:DFA3 72               ld   [hl],d
WRA1:DFA4 60               ld   h,b
WRA1:DFA5 31 16 E1         ld   sp,$E116
WRA1:DFA8 24               inc  h
WRA1:DFA9 04               inc  b
WRA1:DFAA 3F               ccf  
WRA1:DFAB 0E 09            ld   c,$09
WRA1:DFAD 0F               rrca 
WRA1:DFAE 5D               ld   e,l
WRA1:DFAF 22               ldi  [hl],a
WRA1:DFB0 C0               ret  nz
WRA1:DFB1 35               dec  [hl]
WRA1:DFB2 54               ld   d,h
WRA1:DFB3 78               ld   a,b
WRA1:DFB4 E4               db   $E4 ; undefined opcode
WRA1:DFB5 D0               ret  nc
WRA1:DFB6 F8 36            ld   hl,sp+$36
WRA1:DFB8 47               ld   b,a
WRA1:DFB9 0D               dec  c
WRA1:DFBA 26 CD            ld   h,$CD
WRA1:DFBC 0F               rrca 
WRA1:DFBD 43               ld   b,e
WRA1:DFBE 06 17            ld   b,$17
WRA1:DFC0 2E F1            ld   l,$F1
WRA1:DFC2 D4 F8 81         call nc,$81F8
WRA1:DFC5 E9               jp   hl
WRA1:DFC6 A4               and  h
WRA1:DFC7 F2               ld   a,[$ff00+c]
WRA1:DFC8 E8 39            add  sp,$39
WRA1:DFCA 02               ld   [bc],a
WRA1:DFCB 58               ld   e,b
WRA1:DFCC 45               ld   b,l
WRA1:DFCD 0E 0F            ld   c,$0F
WRA1:DFCF 37               scf  
WRA1:DFD0 B0               or   b
WRA1:DFD1 27               daa  
WRA1:DFD2 F0 E1            ldh  a,[$FFE1]
WRA1:DFD4 D1               pop  de
WRA1:DFD5 5C               ld   e,h
WRA1:DFD6 E1               pop  hl
WRA1:DFD7 FC               db   $FC ; undefined opcode
WRA1:DFD8 95               sub  l
WRA1:DFD9 C9               ret  
WRA1:DFDA 8F               adc  a
WRA1:DFDB C7               rst  $00
WRA1:DFDC 16 02            ld   d,$02
WRA1:DFDE 08 ED F5         ld   [$F5ED],sp
WRA1:DFE1 F8 55            ld   hl,sp+$55
WRA1:DFE3 D0               ret  nc
WRA1:DFE4 F0 31            ldh  a,[$FF31]
WRA1:DFE6 F0 18            ldh  a,[$FF18]
WRA1:DFE8 C0               ret  nz
WRA1:DFE9 20 CB            jr   nz,$DFB6
WRA1:DFEB 0C               inc  c
WRA1:DFEC CB C4            set  0,h
WRA1:DFEE C7               rst  $00
WRA1:DFEF C0               ret  nz
WRA1:DFF0 0A               ld   a,[bc]
WRA1:DFF1 B0               or   b
WRA1:DFF2 C0               ret  nz
WRA1:DFF3 18 C0            jr   $DFB5
WRA1:DFF5 50               ld   d,b
WRA1:DFF6 DB               db   $DB ; undefined opcode
WRA1:DFF7 25               dec  h
WRA1:DFF8 C0               ret  nz
WRA1:DFF9 D0               ret  nc
WRA1:DFFA 03               inc  bc
WRA1:DFFB 58               ld   e,b
WRA1:DFFC C2 D0 FF         jp   nz,$FFD0
WRA1:DFFF 0F               rrca 
ECH0:E000 C3 20 C2         jp   $C220
ECH0:E003 D6 05            sub  a,$05
ECH0:E005 30 FC            jr   nc,$E003
ECH0:E007 1F               rra  
ECH0:E008 30 00            jr   nc,$E00A
ECH0:E00A CE 01            adc  a,$01
ECH0:E00C D0               ret  nc
ECH0:E00D C8               ret  z
ECH0:E00E 00               nop  
ECH0:E00F C9               ret  
ECH0:E010 B7               or   a
ECH0:E011 C8               ret  z
ECH0:E012 F5               push af
ECH0:E013 3E DF            ld   a,$DF
ECH0:E015 CD 03 C0         call $C003
ECH0:E018 F1               pop  af
ECH0:E019 3D               dec  a
ECH0:E01A 20 F6            jr   nz,$E012
ECH0:E01C C9               ret  
ECH0:E01D B7               or   a
ECH0:E01E C8               ret  z
ECH0:E01F F5               push af
ECH0:E020 3E FF            ld   a,$FF
ECH0:E022 CD 12 C0         call $C012
ECH0:E025 3E D4            ld   a,$D4
ECH0:E027 CD 03 C0         call $C003
ECH0:E02A F1               pop  af
ECH0:E02B 3D               dec  a
ECH0:E02C 20 F1            jr   nz,$E01F
ECH0:E02E C9               ret  
ECH0:E02F F5               push af
ECH0:E030 7C               ld   a,h
ECH0:E031 CD 10 C0         call $C010
ECH0:E034 7D               ld   a,l
ECH0:E035 CD 03 C0         call $C003
ECH0:E038 F1               pop  af
ECH0:E039 C9               ret  
ECH0:E03A 00               nop  
ECH0:E03B 00               nop  
ECH0:E03C 00               nop  
ECH0:E03D 00               nop  
ECH0:E03E 00               nop  
ECH0:E03F 00               nop  
ECH0:E040 00               nop  
ECH0:E041 00               nop  
ECH0:E042 00               nop  
ECH0:E043 00               nop  
ECH0:E044 00               nop  
ECH0:E045 00               nop  
ECH0:E046 00               nop  
ECH0:E047 00               nop  
ECH0:E048 00               nop  
ECH0:E049 00               nop  
ECH0:E04A 00               nop  
ECH0:E04B 00               nop  
ECH0:E04C C9               ret  
ECH0:E04D 18 00            jr   $E04F
ECH0:E04F 3E FF            ld   a,$FF
ECH0:E051 E0 80            ldh  [$FF80],a
ECH0:E053 E0 81            ldh  [$FF81],a
ECH0:E055 E0 82            ldh  [$FF82],a
ECH0:E057 E0 83            ldh  [$FF83],a
ECH0:E059 C9               ret  
ECH0:E05A F5               push af
ECH0:E05B C5               push bc
ECH0:E05C D5               push de
ECH0:E05D E5               push hl
ECH0:E05E 21 83 FF         ld   hl,$FF83
ECH0:E061 46               ld   b,[hl]
ECH0:E062 2D               dec  l
ECH0:E063 4E               ld   c,[hl]
ECH0:E064 2D               dec  l
ECH0:E065 56               ld   d,[hl]
ECH0:E066 2D               dec  l
ECH0:E067 AE               xor  [hl]
ECH0:E068 26 08            ld   h,$08
ECH0:E06A CB 38            srl  b
ECH0:E06C CB 19            rr   c
ECH0:E06E CB 1A            rr   d
ECH0:E070 1F               rra  
ECH0:E071 30 10            jr   nc,$E083
ECH0:E073 5F               ld   e,a
ECH0:E074 78               ld   a,b
ECH0:E075 EE ED            xor  a,$ED
ECH0:E077 47               ld   b,a
ECH0:E078 79               ld   a,c
ECH0:E079 EE B8            xor  a,$B8
ECH0:E07B 4F               ld   c,a
ECH0:E07C 7A               ld   a,d
ECH0:E07D EE 83            xor  a,$83
ECH0:E07F 57               ld   d,a
ECH0:E080 7B               ld   a,e
ECH0:E081 EE 20            xor  a,$20
ECH0:E083 25               dec  h
ECH0:E084 20 E4            jr   nz,$E06A
ECH0:E086 26 FF            ld   h,$FF
ECH0:E088 22               ldi  [hl],a
ECH0:E089 72               ld   [hl],d
ECH0:E08A 2C               inc  l
ECH0:E08B 71               ld   [hl],c
ECH0:E08C 2C               inc  l
ECH0:E08D 70               ld   [hl],b
ECH0:E08E E1               pop  hl
ECH0:E08F D1               pop  de
ECH0:E090 C1               pop  bc
ECH0:E091 F1               pop  af
ECH0:E092 C9               ret  
ECH0:E093 7D               ld   a,l
ECH0:E094 EA 02 D8         ld   [$D802],a
ECH0:E097 7C               ld   a,h
ECH0:E098 EA 03 D8         ld   [$D803],a
ECH0:E09B 18 04            jr   $E0A1
ECH0:E09D 3E C9            ld   a,$C9
ECH0:E09F 18 02            jr   $E0A3
ECH0:E0A1 3E C3            ld   a,$C3
ECH0:E0A3 EA 01 D8         ld   [$D801],a
ECH0:E0A6 C9               ret  
ECH0:E0A7 F5               push af
ECH0:E0A8 FE 0A            cp   a,$0A
ECH0:E0AA C4 5A C0         call nz,$C05A
ECH0:E0AD CD 01 D8         call $D801
ECH0:E0B0 F1               pop  af
ECH0:E0B1 C9               ret  
ECH0:E0B2 F5               push af
ECH0:E0B3 3E 20            ld   a,$20
ECH0:E0B5 CD 01 D8         call $D801
ECH0:E0B8 F1               pop  af
ECH0:E0B9 C9               ret  
ECH0:E0BA F5               push af
ECH0:E0BB 3E 0A            ld   a,$0A
ECH0:E0BD CD 01 D8         call $D801
ECH0:E0C0 F1               pop  af
ECH0:E0C1 C9               ret  
ECH0:E0C2 E1               pop  hl
ECH0:E0C3 CD C7 C0         call $C0C7
ECH0:E0C6 E9               jp   hl
ECH0:E0C7 F5               push af
ECH0:E0C8 18 03            jr   $E0CD
ECH0:E0CA CD A7 C0         call $C0A7
ECH0:E0CD 2A               ldi  a,[hl]
ECH0:E0CE B7               or   a
ECH0:E0CF 20 F9            jr   nz,$E0CA
ECH0:E0D1 F1               pop  af
ECH0:E0D2 C9               ret  
ECH0:E0D3 CD EE C0         call $C0EE
ECH0:E0D6 CD 13 C1         call $C113
ECH0:E0D9 CD 1D C1         call $C11D
ECH0:E0DC CD 23 C1         call $C123
ECH0:E0DF CD BA C0         call $C0BA
ECH0:E0E2 C9               ret  
ECH0:E0E3 F5               push af
ECH0:E0E4 CD 29 C1         call $C129
ECH0:E0E7 3E 20            ld   a,$20
ECH0:E0E9 CD 01 D8         call $D801
ECH0:E0EC F1               pop  af
ECH0:E0ED C9               ret  
ECH0:E0EE F5               push af
ECH0:E0EF CD 29 C1         call $C129
ECH0:E0F2 F1               pop  af
ECH0:E0F3 C5               push bc
ECH0:E0F4 F5               push af
ECH0:E0F5 C1               pop  bc
ECH0:E0F6 CD FF C0         call $C0FF
ECH0:E0F9 C1               pop  bc
ECH0:E0FA C9               ret  
ECH0:E0FB F5               push af
ECH0:E0FC 78               ld   a,b
ECH0:E0FD 18 E5            jr   $E0E4
ECH0:E0FF F5               push af
ECH0:E100 79               ld   a,c
ECH0:E101 18 E1            jr   $E0E4
ECH0:E103 F5               push af
ECH0:E104 7A               ld   a,d
ECH0:E105 18 DD            jr   $E0E4
ECH0:E107 F5               push af
ECH0:E108 7B               ld   a,e
ECH0:E109 18 D9            jr   $E0E4
ECH0:E10B F5               push af
ECH0:E10C 7C               ld   a,h
ECH0:E10D 18 D5            jr   $E0E4
ECH0:E10F F5               push af
ECH0:E110 7D               ld   a,l
ECH0:E111 18 D1            jr   $E0E4
ECH0:E113 F5               push af
ECH0:E114 C5               push bc
ECH0:E115 78               ld   a,b
ECH0:E116 CD 29 C1         call $C129
ECH0:E119 79               ld   a,c
ECH0:E11A C1               pop  bc
ECH0:E11B 18 C7            jr   $E0E4
ECH0:E11D F5               push af
ECH0:E11E C5               push bc
ECH0:E11F 42               ld   b,d
ECH0:E120 4B               ld   c,e
ECH0:E121 18 F2            jr   $E115
ECH0:E123 F5               push af
ECH0:E124 C5               push bc
ECH0:E125 44               ld   b,h
ECH0:E126 4D               ld   c,l
ECH0:E127 18 EC            jr   $E115
ECH0:E129 CD 5A C0         call $C05A
ECH0:E12C F5               push af
ECH0:E12D CB 37            swap a
ECH0:E12F CD 33 C1         call $C133
ECH0:E132 F1               pop  af
ECH0:E133 E6 0F            and  a,$0F
ECH0:E135 FE 0A            cp   a,$0A
ECH0:E137 38 02            jr   c,$E13B
ECH0:E139 C6 07            add  a,$07
ECH0:E13B C6 30            add  a,$30
ECH0:E13D C3 01 D8         jp   $D801
ECH0:E140 F5               push af
ECH0:E141 C5               push bc
ECH0:E142 18 0C            jr   $E150
ECH0:E144 F5               push af
ECH0:E145 C5               push bc
ECH0:E146 FE 0A            cp   a,$0A
ECH0:E148 38 0B            jr   c,$E155
ECH0:E14A 0E 64            ld   c,$64
ECH0:E14C B9               cp   c
ECH0:E14D D4 5D C1         call nc,$C15D
ECH0:E150 0E 0A            ld   c,$0A
ECH0:E152 CD 5D C1         call $C15D
ECH0:E155 C6 30            add  a,$30
ECH0:E157 CD A7 C0         call $C0A7
ECH0:E15A C1               pop  bc
ECH0:E15B F1               pop  af
ECH0:E15C C9               ret  
ECH0:E15D 06 2F            ld   b,$2F
ECH0:E15F 04               inc  b
ECH0:E160 91               sub  c
ECH0:E161 30 FC            jr   nc,$E15F
ECH0:E163 81               add  c
ECH0:E164 4F               ld   c,a
ECH0:E165 78               ld   a,b
ECH0:E166 CD A7 C0         call $C0A7
ECH0:E169 79               ld   a,c
ECH0:E16A C9               ret  
ECH0:E16B E1               pop  hl
ECH0:E16C E5               push hl
ECH0:E16D F5               push af
ECH0:E16E 23               inc  hl
ECH0:E16F 23               inc  hl
ECH0:E170 2A               ldi  a,[hl]
ECH0:E171 EA 04 D8         ld   [$D804],a
ECH0:E174 7D               ld   a,l
ECH0:E175 EA 05 D8         ld   [$D805],a
ECH0:E178 7C               ld   a,h
ECH0:E179 EA 06 D8         ld   [$D806],a
ECH0:E17C F1               pop  af
ECH0:E17D C9               ret  
ECH0:E17E E5               push hl
ECH0:E17F CD 6B C1         call $C16B
ECH0:E182 18 02            jr   $E186
ECH0:E184 FF               rst  $38
ECH0:E185 00               nop  
ECH0:E186 E1               pop  hl
ECH0:E187 CD 4D C0         call $C04D
ECH0:E18A C9               ret  
ECH0:E18B CD BA C0         call $C0BA
ECH0:E18E E5               push hl
ECH0:E18F CD C2 C0         call $C0C2
ECH0:E192 50               ld   d,b
ECH0:E193 61               ld   h,c
ECH0:E194 73               ld   [hl],e
ECH0:E195 73               ld   [hl],e
ECH0:E196 65               ld   h,l
ECH0:E197 64               ld   h,h
ECH0:E198 00               nop  
ECH0:E199 E1               pop  hl
ECH0:E19A 3E 00            ld   a,$00
ECH0:E19C C3 6B C2         jp   $C26B
ECH0:E19F FA 04 D8         ld   a,[$D804]
ECH0:E1A2 3C               inc  a
ECH0:E1A3 28 05            jr   z,$E1AA
ECH0:E1A5 3D               dec  a
ECH0:E1A6 28 E3            jr   z,$E18B
ECH0:E1A8 18 0F            jr   $E1B9
ECH0:E1AA E5               push hl
ECH0:E1AB CD C2 C0         call $C0C2
ECH0:E1AE 44               ld   b,h
ECH0:E1AF 6F               ld   l,a
ECH0:E1B0 6E               ld   l,[hl]
ECH0:E1B1 65               ld   h,l
ECH0:E1B2 00               nop  
ECH0:E1B3 E1               pop  hl
ECH0:E1B4 3E 00            ld   a,$00
ECH0:E1B6 C3 6B C2         jp   $C26B
ECH0:E1B9 FA 05 D8         ld   a,[$D805]
ECH0:E1BC 6F               ld   l,a
ECH0:E1BD FA 06 D8         ld   a,[$D806]
ECH0:E1C0 67               ld   h,a
ECH0:E1C1 7E               ld   a,[hl]
ECH0:E1C2 B7               or   a
ECH0:E1C3 28 09            jr   z,$E1CE
ECH0:E1C5 CD BA C0         call $C0BA
ECH0:E1C8 CD C7 C0         call $C0C7
ECH0:E1CB CD BA C0         call $C0BA
ECH0:E1CE FA 04 D8         ld   a,[$D804]
ECH0:E1D1 FE 01            cp   a,$01
ECH0:E1D3 CE 00            adc  a,$00
ECH0:E1D5 C3 6B C2         jp   $C26B
ECH0:E1D8 F5               push af
ECH0:E1D9 F0 80            ldh  a,[$FF80]
ECH0:E1DB 2F               cpl  
ECH0:E1DC F5               push af
ECH0:E1DD F0 81            ldh  a,[$FF81]
ECH0:E1DF 2F               cpl  
ECH0:E1E0 F5               push af
ECH0:E1E1 F0 82            ldh  a,[$FF82]
ECH0:E1E3 2F               cpl  
ECH0:E1E4 F5               push af
ECH0:E1E5 F0 83            ldh  a,[$FF83]
ECH0:E1E7 2F               cpl  
ECH0:E1E8 CD 29 C1         call $C129
ECH0:E1EB F1               pop  af
ECH0:E1EC CD 29 C1         call $C129
ECH0:E1EF F1               pop  af
ECH0:E1F0 CD 29 C1         call $C129
ECH0:E1F3 F1               pop  af
ECH0:E1F4 CD E3 C0         call $C0E3
ECH0:E1F7 F1               pop  af
ECH0:E1F8 C9               ret  
ECH0:E1F9 F0 80            ldh  a,[$FF80]
ECH0:E1FB BB               cp   e
ECH0:E1FC 20 12            jr   nz,$E210
ECH0:E1FE F0 81            ldh  a,[$FF81]
ECH0:E200 BA               cp   d
ECH0:E201 20 0D            jr   nz,$E210
ECH0:E203 F0 82            ldh  a,[$FF82]
ECH0:E205 B9               cp   c
ECH0:E206 20 08            jr   nz,$E210
ECH0:E208 F0 83            ldh  a,[$FF83]
ECH0:E20A B8               cp   b
ECH0:E20B 20 03            jr   nz,$E210
ECH0:E20D C3 4F C0         jp   $C04F
ECH0:E210 CD D8 C1         call $C1D8
ECH0:E213 C3 B9 C1         jp   $C1B9
ECH0:E216 2A               ldi  a,[hl]
ECH0:E217 CD 5A C0         call $C05A
ECH0:E21A 0B               dec  bc
ECH0:E21B 78               ld   a,b
ECH0:E21C B1               or   c
ECH0:E21D 20 F7            jr   nz,$E216
ECH0:E21F C9               ret  
ECH0:E220 F3               di   
ECH0:E221 31 FF DF         ld   sp,$DFFF
ECH0:E224 EA 00 D8         ld   [$D800],a
ECH0:E227 3E 00            ld   a,$00
ECH0:E229 E0 07            ldh  [$FF07],a
ECH0:E22B 3E 00            ld   a,$00
ECH0:E22D E0 0F            ldh  [$FF0F],a
ECH0:E22F 3E 00            ld   a,$00
ECH0:E231 E0 FF            ldh  [$FFFF],a
ECH0:E233 3E 00            ld   a,$00
ECH0:E235 E0 26            ldh  [$FF26],a
ECH0:E237 3E 80            ld   a,$80
ECH0:E239 E0 26            ldh  [$FF26],a
ECH0:E23B 3E FF            ld   a,$FF
ECH0:E23D E0 25            ldh  [$FF25],a
ECH0:E23F 3E 77            ld   a,$77
ECH0:E241 E0 24            ldh  [$FF24],a
ECH0:E243 21 23 CB         ld   hl,$CB23
ECH0:E246 CD 93 C0         call $C093
ECH0:E249 CD 7E C1         call $C17E
ECH0:E24C CD 0C CB         call $CB0C
ECH0:E24F CD 4F C0         call $C04F
ECH0:E252 F5               push af
ECH0:E253 3E 03            ld   a,$03
ECH0:E255 CD 1F C0         call $C01F
ECH0:E258 3E FF            ld   a,$FF
ECH0:E25A CD 12 C0         call $C012
ECH0:E25D 3E CD            ld   a,$CD
ECH0:E25F CD 03 C0         call $C003
ECH0:E262 F1               pop  af
ECH0:E263 CD AC C4         call $C4AC
ECH0:E266 3E 00            ld   a,$00
ECH0:E268 C3 6B C2         jp   $C26B
ECH0:E26B 31 FF DF         ld   sp,$DFFF
ECH0:E26E F5               push af
ECH0:E26F CD 76 C2         call $C276
ECH0:E272 F1               pop  af
ECH0:E273 C3 3A CB         jp   $CB3A
ECH0:E276 F5               push af
ECH0:E277 CD BA C0         call $C0BA
ECH0:E27A CD A1 C0         call $C0A1
ECH0:E27D F1               pop  af
ECH0:E27E FE 01            cp   a,$01
ECH0:E280 D8               ret  c
ECH0:E281 20 0E            jr   nz,$E291
ECH0:E283 E5               push hl
ECH0:E284 CD C2 C0         call $C0C2
ECH0:E287 46               ld   b,[hl]
ECH0:E288 61               ld   h,c
ECH0:E289 69               ld   l,c
ECH0:E28A 6C               ld   l,h
ECH0:E28B 65               ld   h,l
ECH0:E28C 64               ld   h,h
ECH0:E28D 0A               ld   a,[bc]
ECH0:E28E 00               nop  
ECH0:E28F E1               pop  hl
ECH0:E290 C9               ret  
ECH0:E291 E5               push hl
ECH0:E292 CD C2 C0         call $C0C2
ECH0:E295 46               ld   b,[hl]
ECH0:E296 61               ld   h,c
ECH0:E297 69               ld   l,c
ECH0:E298 6C               ld   l,h
ECH0:E299 65               ld   h,l
ECH0:E29A 64               ld   h,h
ECH0:E29B 20 23            jr   nz,$E2C0
ECH0:E29D 00               nop  
ECH0:E29E E1               pop  hl
ECH0:E29F CD 44 C1         call $C144
ECH0:E2A2 CD BA C0         call $C0BA
ECH0:E2A5 C9               ret  
ECH0:E2A6 3E AD            ld   a,$AD
ECH0:E2A8 EA 1E D8         ld   [$D81E],a
ECH0:E2AB 3E C6            ld   a,$C6
ECH0:E2AD EA 1F D8         ld   [$D81F],a
ECH0:E2B0 C9               ret  
ECH0:E2B1 C5               push bc
ECH0:E2B2 D5               push de
ECH0:E2B3 E5               push hl
ECH0:E2B4 FA 1E D8         ld   a,[$D81E]
ECH0:E2B7 6F               ld   l,a
ECH0:E2B8 FA 1F D8         ld   a,[$D81F]
ECH0:E2BB 67               ld   h,a
ECH0:E2BC 11 80 FF         ld   de,$FF80
ECH0:E2BF 06 00            ld   b,$00
ECH0:E2C1 1A               ld   a,[de]
ECH0:E2C2 AE               xor  [hl]
ECH0:E2C3 B0               or   b
ECH0:E2C4 47               ld   b,a
ECH0:E2C5 23               inc  hl
ECH0:E2C6 1C               inc  e
ECH0:E2C7 7B               ld   a,e
ECH0:E2C8 FE 84            cp   a,$84
ECH0:E2CA 20 F5            jr   nz,$E2C1
ECH0:E2CC 7D               ld   a,l
ECH0:E2CD EA 1E D8         ld   [$D81E],a
ECH0:E2D0 7C               ld   a,h
ECH0:E2D1 EA 1F D8         ld   [$D81F],a
ECH0:E2D4 78               ld   a,b
ECH0:E2D5 FE 00            cp   a,$00
ECH0:E2D7 E1               pop  hl
ECH0:E2D8 D1               pop  de
ECH0:E2D9 C1               pop  bc
ECH0:E2DA C9               ret  
ECH0:E2DB FA 00 D8         ld   a,[$D800]
ECH0:E2DE E6 10            and  a,$10
ECH0:E2E0 C8               ret  z
ECH0:E2E1 F0 4D            ldh  a,[$FF4D]
ECH0:E2E3 07               rlca 
ECH0:E2E4 D0               ret  nc
ECH0:E2E5 18 0A            jr   $E2F1
ECH0:E2E7 FA 00 D8         ld   a,[$D800]
ECH0:E2EA E6 10            and  a,$10
ECH0:E2EC C8               ret  z
ECH0:E2ED F0 4D            ldh  a,[$FF4D]
ECH0:E2EF 07               rlca 
ECH0:E2F0 D8               ret  c
ECH0:E2F1 F3               di   
ECH0:E2F2 F0 FF            ldh  a,[$FFFF]
ECH0:E2F4 F5               push af
ECH0:E2F5 AF               xor  a
ECH0:E2F6 E0 FF            ldh  [$FFFF],a
ECH0:E2F8 E0 0F            ldh  [$FF0F],a
ECH0:E2FA 3E 30            ld   a,$30
ECH0:E2FC E0 00            ldh  [$FF00],a
ECH0:E2FE 3E 01            ld   a,$01
ECH0:E300 E0 4D            ldh  [$FF4D],a
ECH0:E302 10 00            stop
ECH0:E304 F1               pop  af
ECH0:E305 E0 FF            ldh  [$FFFF],a
ECH0:E307 C9               ret  
ECH0:E308 C5               push bc
ECH0:E309 CD 41 C3         call $C341
ECH0:E30C 3E C0            ld   a,$C0
ECH0:E30E E0 14            ldh  [$FF14],a
ECH0:E310 3E FF            ld   a,$FF
ECH0:E312 E0 11            ldh  [$FF11],a
ECH0:E314 3E 08            ld   a,$08
ECH0:E316 E0 12            ldh  [$FF12],a
ECH0:E318 3E C0            ld   a,$C0
ECH0:E31A E0 14            ldh  [$FF14],a
ECH0:E31C 01 9E FD         ld   bc,$FD9E
ECH0:E31F 03               inc  bc
ECH0:E320 F0 26            ldh  a,[$FF26]
ECH0:E322 E6 01            and  a,$01
ECH0:E324 20 F9            jr   nz,$E31F
ECH0:E326 3E 00            ld   a,$00
ECH0:E328 CB 78            bit  7,b
ECH0:E32A 20 01            jr   nz,$E32D
ECH0:E32C 3C               inc  a
ECH0:E32D C1               pop  bc
ECH0:E32E C9               ret  
ECH0:E32F 3E 00            ld   a,$00
ECH0:E331 E0 26            ldh  [$FF26],a
ECH0:E333 C9               ret  
ECH0:E334 3E 80            ld   a,$80
ECH0:E336 E0 26            ldh  [$FF26],a
ECH0:E338 3E FF            ld   a,$FF
ECH0:E33A E0 25            ldh  [$FF25],a
ECH0:E33C 3E 77            ld   a,$77
ECH0:E33E E0 24            ldh  [$FF24],a
ECH0:E340 C9               ret  
ECH0:E341 3E 00            ld   a,$00
ECH0:E343 E0 19            ldh  [$FF19],a
ECH0:E345 3E 3E            ld   a,$3E
ECH0:E347 E0 16            ldh  [$FF16],a
ECH0:E349 3E 08            ld   a,$08
ECH0:E34B E0 17            ldh  [$FF17],a
ECH0:E34D 3E C0            ld   a,$C0
ECH0:E34F E0 19            ldh  [$FF19],a
ECH0:E351 F0 26            ldh  a,[$FF26]
ECH0:E353 E6 02            and  a,$02
ECH0:E355 20 FA            jr   nz,$E351
ECH0:E357 C9               ret  
ECH0:E358 3E 11            ld   a,$11
ECH0:E35A E0 10            ldh  [$FF10],a
ECH0:E35C 3E 08            ld   a,$08
ECH0:E35E E0 12            ldh  [$FF12],a
ECH0:E360 3E FF            ld   a,$FF
ECH0:E362 E0 13            ldh  [$FF13],a
ECH0:E364 3E 83            ld   a,$83
ECH0:E366 E0 14            ldh  [$FF14],a
ECH0:E368 F0 26            ldh  a,[$FF26]
ECH0:E36A E6 01            and  a,$01
ECH0:E36C 20 FA            jr   nz,$E368
ECH0:E36E C9               ret  
ECH0:E36F C5               push bc
ECH0:E370 3E 00            ld   a,$00
ECH0:E372 E0 1A            ldh  [$FF1A],a
ECH0:E374 0E 30            ld   c,$30
ECH0:E376 2A               ldi  a,[hl]
ECH0:E377 E2               ld   [$ff00+c],a
ECH0:E378 0C               inc  c
ECH0:E379 CB 71            bit  6,c
ECH0:E37B 28 F9            jr   z,$E376
ECH0:E37D C1               pop  bc
ECH0:E37E C9               ret  
ECH0:E37F AF               xor  a
ECH0:E380 E0 26            ldh  [$FF26],a
ECH0:E382 3D               dec  a
ECH0:E383 E0 26            ldh  [$FF26],a
ECH0:E385 E0 25            ldh  [$FF25],a
ECH0:E387 E0 24            ldh  [$FF24],a
ECH0:E389 3E F1            ld   a,$F1
ECH0:E38B E0 12            ldh  [$FF12],a
ECH0:E38D 3E 86            ld   a,$86
ECH0:E38F E0 14            ldh  [$FF14],a
ECH0:E391 F5               push af
ECH0:E392 3E 03            ld   a,$03
ECH0:E394 CD 1F C0         call $C01F
ECH0:E397 3E FF            ld   a,$FF
ECH0:E399 CD 12 C0         call $C012
ECH0:E39C 3E CD            ld   a,$CD
ECH0:E39E CD 03 C0         call $C003
ECH0:E3A1 F1               pop  af
ECH0:E3A2 C9               ret  
ECH0:E3A3 C5               push bc
ECH0:E3A4 4F               ld   c,a
ECH0:E3A5 06 08            ld   b,$08
ECH0:E3A7 3E 00            ld   a,$00
ECH0:E3A9 E0 10            ldh  [$FF10],a
ECH0:E3AB 3E 80            ld   a,$80
ECH0:E3AD E0 11            ldh  [$FF11],a
ECH0:E3AF 3E F8            ld   a,$F8
ECH0:E3B1 E0 13            ldh  [$FF13],a
ECH0:E3B3 3E 60            ld   a,$60
ECH0:E3B5 CB 11            rl   c
ECH0:E3B7 30 02            jr   nc,$E3BB
ECH0:E3B9 3E A0            ld   a,$A0
ECH0:E3BB E0 12            ldh  [$FF12],a
ECH0:E3BD 3E 87            ld   a,$87
ECH0:E3BF E0 14            ldh  [$FF14],a
ECH0:E3C1 F5               push af
ECH0:E3C2 3E 01            ld   a,$01
ECH0:E3C4 CD 12 C0         call $C012
ECH0:E3C7 3E 13            ld   a,$13
ECH0:E3C9 CD 03 C0         call $C003
ECH0:E3CC F1               pop  af
ECH0:E3CD 3E 00            ld   a,$00
ECH0:E3CF E0 12            ldh  [$FF12],a
ECH0:E3D1 F5               push af
ECH0:E3D2 3E 4C            ld   a,$4C
ECH0:E3D4 CD 03 C0         call $C003
ECH0:E3D7 F1               pop  af
ECH0:E3D8 05               dec  b
ECH0:E3D9 20 D8            jr   nz,$E3B3
ECH0:E3DB C1               pop  bc
ECH0:E3DC C9               ret  
ECH0:E3DD C5               push bc
ECH0:E3DE 0E 30            ld   c,$30
ECH0:E3E0 E2               ld   [$ff00+c],a
ECH0:E3E1 0C               inc  c
ECH0:E3E2 CB 71            bit  6,c
ECH0:E3E4 28 FA            jr   z,$E3E0
ECH0:E3E6 C1               pop  bc
ECH0:E3E7 C9               ret  
ECH0:E3E8 C5               push bc
ECH0:E3E9 4F               ld   c,a
ECH0:E3EA 06 00            ld   b,$00
ECH0:E3EC F0 26            ldh  a,[$FF26]
ECH0:E3EE A1               and  c
ECH0:E3EF 28 0F            jr   z,$E400
ECH0:E3F1 F5               push af
ECH0:E3F2 3E 0F            ld   a,$0F
ECH0:E3F4 CD 12 C0         call $C012
ECH0:E3F7 3E CE            ld   a,$CE
ECH0:E3F9 CD 03 C0         call $C003
ECH0:E3FC F1               pop  af
ECH0:E3FD 04               inc  b
ECH0:E3FE 20 EC            jr   nz,$E3EC
ECH0:E400 78               ld   a,b
ECH0:E401 C1               pop  bc
ECH0:E402 C9               ret  
ECH0:E403 F5               push af
ECH0:E404 E5               push hl
ECH0:E405 21 26 FF         ld   hl,$FF26
ECH0:E408 3E 08            ld   a,$08
ECH0:E40A E0 17            ldh  [$FF17],a
ECH0:E40C 3E 40            ld   a,$40
ECH0:E40E E0 19            ldh  [$FF19],a
ECH0:E410 3E FE            ld   a,$FE
ECH0:E412 E0 16            ldh  [$FF16],a
ECH0:E414 3E C0            ld   a,$C0
ECH0:E416 E0 19            ldh  [$FF19],a
ECH0:E418 3E 02            ld   a,$02
ECH0:E41A A6               and  [hl]
ECH0:E41B 20 FD            jr   nz,$E41A
ECH0:E41D F5               push af
ECH0:E41E 3E 0F            ld   a,$0F
ECH0:E420 CD 12 C0         call $C012
ECH0:E423 3E C5            ld   a,$C5
ECH0:E425 CD 03 C0         call $C003
ECH0:E428 F1               pop  af
ECH0:E429 3E FF            ld   a,$FF
ECH0:E42B E0 16            ldh  [$FF16],a
ECH0:E42D 3E C0            ld   a,$C0
ECH0:E42F E0 19            ldh  [$FF19],a
ECH0:E431 F0 26            ldh  a,[$FF26]
ECH0:E433 00               nop  
ECH0:E434 00               nop  
ECH0:E435 E6 02            and  a,$02
ECH0:E437 20 E4            jr   nz,$E41D
ECH0:E439 E1               pop  hl
ECH0:E43A F1               pop  af
ECH0:E43B C9               ret  
ECH0:E43C B7               or   a
ECH0:E43D 20 06            jr   nz,$E445
ECH0:E43F C9               ret  
ECH0:E440 F5               push af
ECH0:E441 3E D3            ld   a,$D3
ECH0:E443 18 03            jr   $E448
ECH0:E445 F5               push af
ECH0:E446 3E DF            ld   a,$DF
ECH0:E448 CD 03 C0         call $C003
ECH0:E44B F5               push af
ECH0:E44C 3E 0E            ld   a,$0E
ECH0:E44E CD 12 C0         call $C012
ECH0:E451 3E D8            ld   a,$D8
ECH0:E453 CD 03 C0         call $C003
ECH0:E456 F1               pop  af
ECH0:E457 F1               pop  af
ECH0:E458 3D               dec  a
ECH0:E459 20 EA            jr   nz,$E445
ECH0:E45B C9               ret  
ECH0:E45C 2E 00            ld   l,$00
ECH0:E45E AF               xor  a
ECH0:E45F 4F               ld   c,a
ECH0:E460 57               ld   d,a
ECH0:E461 5D               ld   e,l
ECH0:E462 26 08            ld   h,$08
ECH0:E464 1F               rra  
ECH0:E465 CB 19            rr   c
ECH0:E467 CB 1A            rr   d
ECH0:E469 CB 1B            rr   e
ECH0:E46B 30 10            jr   nc,$E47D
ECH0:E46D EE ED            xor  a,$ED
ECH0:E46F 47               ld   b,a
ECH0:E470 79               ld   a,c
ECH0:E471 EE B8            xor  a,$B8
ECH0:E473 4F               ld   c,a
ECH0:E474 7A               ld   a,d
ECH0:E475 EE 83            xor  a,$83
ECH0:E477 57               ld   d,a
ECH0:E478 7B               ld   a,e
ECH0:E479 EE 20            xor  a,$20
ECH0:E47B 5F               ld   e,a
ECH0:E47C 78               ld   a,b
ECH0:E47D 25               dec  h
ECH0:E47E 20 E4            jr   nz,$E464
ECH0:E480 26 D9            ld   h,$D9
ECH0:E482 73               ld   [hl],e
ECH0:E483 24               inc  h
ECH0:E484 72               ld   [hl],d
ECH0:E485 24               inc  h
ECH0:E486 71               ld   [hl],c
ECH0:E487 24               inc  h
ECH0:E488 77               ld   [hl],a
ECH0:E489 2C               inc  l
ECH0:E48A 20 D2            jr   nz,$E45E
ECH0:E48C C3 4D C0         jp   $C04D
ECH0:E48F 6F               ld   l,a
ECH0:E490 F0 80            ldh  a,[$FF80]
ECH0:E492 AD               xor  l
ECH0:E493 6F               ld   l,a
ECH0:E494 26 D9            ld   h,$D9
ECH0:E496 F0 81            ldh  a,[$FF81]
ECH0:E498 AE               xor  [hl]
ECH0:E499 24               inc  h
ECH0:E49A E0 80            ldh  [$FF80],a
ECH0:E49C F0 82            ldh  a,[$FF82]
ECH0:E49E AE               xor  [hl]
ECH0:E49F 24               inc  h
ECH0:E4A0 E0 81            ldh  [$FF81],a
ECH0:E4A2 F0 83            ldh  a,[$FF83]
ECH0:E4A4 AE               xor  [hl]
ECH0:E4A5 24               inc  h
ECH0:E4A6 E0 82            ldh  [$FF82],a
ECH0:E4A8 7E               ld   a,[hl]
ECH0:E4A9 E0 83            ldh  [$FF83],a
ECH0:E4AB C9               ret  
ECH0:E4AC CD E7 C2         call $C2E7
ECH0:E4AF CD 5C C4         call $C45C
ECH0:E4B2 CD A6 C2         call $C2A6
ECH0:E4B5 E5               push hl
ECH0:E4B6 CD 6B C1         call $C16B
ECH0:E4B9 18 02            jr   $E4BD
ECH0:E4BB 00               nop  
ECH0:E4BC 00               nop  
ECH0:E4BD E1               pop  hl
ECH0:E4BE 21 FB C5         ld   hl,$C5FB
ECH0:E4C1 2A               ldi  a,[hl]
ECH0:E4C2 EA F8 DE         ld   [$DEF8],a
ECH0:E4C5 2A               ldi  a,[hl]
ECH0:E4C6 EA F9 DE         ld   [$DEF9],a
ECH0:E4C9 2A               ldi  a,[hl]
ECH0:E4CA EA FA DE         ld   [$DEFA],a
ECH0:E4CD E5               push hl
ECH0:E4CE 3E C3            ld   a,$C3
ECH0:E4D0 EA FB DE         ld   [$DEFB],a
ECH0:E4D3 3E 42            ld   a,$42
ECH0:E4D5 EA FC DE         ld   [$DEFC],a
ECH0:E4D8 3E C6            ld   a,$C6
ECH0:E4DA EA FD DE         ld   [$DEFD],a
ECH0:E4DD CD 4F C0         call $C04F
ECH0:E4E0 CD 13 C6         call $C613
ECH0:E4E3 CD B1 C2         call $C2B1
ECH0:E4E6 28 19            jr   z,$E501
ECH0:E4E8 E5               push hl
ECH0:E4E9 CD 6B C1         call $C16B
ECH0:E4EC 18 02            jr   $E4F0
ECH0:E4EE 01 00 E1         ld   bc,$E100
ECH0:E4F1 FA F8 DE         ld   a,[$DEF8]
ECH0:E4F4 CD E3 C0         call $C0E3
ECH0:E4F7 FE CB            cp   a,$CB
ECH0:E4F9 20 06            jr   nz,$E501
ECH0:E4FB FA F9 DE         ld   a,[$DEF9]
ECH0:E4FE CD E3 C0         call $C0E3
ECH0:E501 E1               pop  hl
ECH0:E502 7D               ld   a,l
ECH0:E503 FE 13            cp   a,$13
ECH0:E505 20 BA            jr   nz,$E4C1
ECH0:E507 7C               ld   a,h
ECH0:E508 FE C6            cp   a,$C6
ECH0:E50A 20 B5            jr   nz,$E4C1
ECH0:E50C C3 9F C1         jp   $C19F
ECH0:E50F E5               push hl
ECH0:E510 F5               push af
ECH0:E511 6F               ld   l,a
ECH0:E512 F0 80            ldh  a,[$FF80]
ECH0:E514 AD               xor  l
ECH0:E515 6F               ld   l,a
ECH0:E516 26 D9            ld   h,$D9
ECH0:E518 F0 81            ldh  a,[$FF81]
ECH0:E51A AE               xor  [hl]
ECH0:E51B 24               inc  h
ECH0:E51C E0 80            ldh  [$FF80],a
ECH0:E51E F0 82            ldh  a,[$FF82]
ECH0:E520 AE               xor  [hl]
ECH0:E521 24               inc  h
ECH0:E522 E0 81            ldh  [$FF81],a
ECH0:E524 F0 83            ldh  a,[$FF83]
ECH0:E526 AE               xor  [hl]
ECH0:E527 24               inc  h
ECH0:E528 E0 82            ldh  [$FF82],a
ECH0:E52A 7E               ld   a,[hl]
ECH0:E52B E0 83            ldh  [$FF83],a
ECH0:E52D E1               pop  hl
ECH0:E52E 7D               ld   a,l
ECH0:E52F 6F               ld   l,a
ECH0:E530 F0 80            ldh  a,[$FF80]
ECH0:E532 AD               xor  l
ECH0:E533 6F               ld   l,a
ECH0:E534 26 D9            ld   h,$D9
ECH0:E536 F0 81            ldh  a,[$FF81]
ECH0:E538 AE               xor  [hl]
ECH0:E539 24               inc  h
ECH0:E53A E0 80            ldh  [$FF80],a
ECH0:E53C F0 82            ldh  a,[$FF82]
ECH0:E53E AE               xor  [hl]
ECH0:E53F 24               inc  h
ECH0:E540 E0 81            ldh  [$FF81],a
ECH0:E542 F0 83            ldh  a,[$FF83]
ECH0:E544 AE               xor  [hl]
ECH0:E545 24               inc  h
ECH0:E546 E0 82            ldh  [$FF82],a
ECH0:E548 7E               ld   a,[hl]
ECH0:E549 E0 83            ldh  [$FF83],a
ECH0:E54B 78               ld   a,b
ECH0:E54C 6F               ld   l,a
ECH0:E54D F0 80            ldh  a,[$FF80]
ECH0:E54F AD               xor  l
ECH0:E550 6F               ld   l,a
ECH0:E551 26 D9            ld   h,$D9
ECH0:E553 F0 81            ldh  a,[$FF81]
ECH0:E555 AE               xor  [hl]
ECH0:E556 24               inc  h
ECH0:E557 E0 80            ldh  [$FF80],a
ECH0:E559 F0 82            ldh  a,[$FF82]
ECH0:E55B AE               xor  [hl]
ECH0:E55C 24               inc  h
ECH0:E55D E0 81            ldh  [$FF81],a
ECH0:E55F F0 83            ldh  a,[$FF83]
ECH0:E561 AE               xor  [hl]
ECH0:E562 24               inc  h
ECH0:E563 E0 82            ldh  [$FF82],a
ECH0:E565 7E               ld   a,[hl]
ECH0:E566 E0 83            ldh  [$FF83],a
ECH0:E568 79               ld   a,c
ECH0:E569 6F               ld   l,a
ECH0:E56A F0 80            ldh  a,[$FF80]
ECH0:E56C AD               xor  l
ECH0:E56D 6F               ld   l,a
ECH0:E56E 26 D9            ld   h,$D9
ECH0:E570 F0 81            ldh  a,[$FF81]
ECH0:E572 AE               xor  [hl]
ECH0:E573 24               inc  h
ECH0:E574 E0 80            ldh  [$FF80],a
ECH0:E576 F0 82            ldh  a,[$FF82]
ECH0:E578 AE               xor  [hl]
ECH0:E579 24               inc  h
ECH0:E57A E0 81            ldh  [$FF81],a
ECH0:E57C F0 83            ldh  a,[$FF83]
ECH0:E57E AE               xor  [hl]
ECH0:E57F 24               inc  h
ECH0:E580 E0 82            ldh  [$FF82],a
ECH0:E582 7E               ld   a,[hl]
ECH0:E583 E0 83            ldh  [$FF83],a
ECH0:E585 7A               ld   a,d
ECH0:E586 6F               ld   l,a
ECH0:E587 F0 80            ldh  a,[$FF80]
ECH0:E589 AD               xor  l
ECH0:E58A 6F               ld   l,a
ECH0:E58B 26 D9            ld   h,$D9
ECH0:E58D F0 81            ldh  a,[$FF81]
ECH0:E58F AE               xor  [hl]
ECH0:E590 24               inc  h
ECH0:E591 E0 80            ldh  [$FF80],a
ECH0:E593 F0 82            ldh  a,[$FF82]
ECH0:E595 AE               xor  [hl]
ECH0:E596 24               inc  h
ECH0:E597 E0 81            ldh  [$FF81],a
ECH0:E599 F0 83            ldh  a,[$FF83]
ECH0:E59B AE               xor  [hl]
ECH0:E59C 24               inc  h
ECH0:E59D E0 82            ldh  [$FF82],a
ECH0:E59F 7E               ld   a,[hl]
ECH0:E5A0 E0 83            ldh  [$FF83],a
ECH0:E5A2 7B               ld   a,e
ECH0:E5A3 6F               ld   l,a
ECH0:E5A4 F0 80            ldh  a,[$FF80]
ECH0:E5A6 AD               xor  l
ECH0:E5A7 6F               ld   l,a
ECH0:E5A8 26 D9            ld   h,$D9
ECH0:E5AA F0 81            ldh  a,[$FF81]
ECH0:E5AC AE               xor  [hl]
ECH0:E5AD 24               inc  h
ECH0:E5AE E0 80            ldh  [$FF80],a
ECH0:E5B0 F0 82            ldh  a,[$FF82]
ECH0:E5B2 AE               xor  [hl]
ECH0:E5B3 24               inc  h
ECH0:E5B4 E0 81            ldh  [$FF81],a
ECH0:E5B6 F0 83            ldh  a,[$FF83]
ECH0:E5B8 AE               xor  [hl]
ECH0:E5B9 24               inc  h
ECH0:E5BA E0 82            ldh  [$FF82],a
ECH0:E5BC 7E               ld   a,[hl]
ECH0:E5BD E0 83            ldh  [$FF83],a
ECH0:E5BF D1               pop  de
ECH0:E5C0 7A               ld   a,d
ECH0:E5C1 6F               ld   l,a
ECH0:E5C2 F0 80            ldh  a,[$FF80]
ECH0:E5C4 AD               xor  l
ECH0:E5C5 6F               ld   l,a
ECH0:E5C6 26 D9            ld   h,$D9
ECH0:E5C8 F0 81            ldh  a,[$FF81]
ECH0:E5CA AE               xor  [hl]
ECH0:E5CB 24               inc  h
ECH0:E5CC E0 80            ldh  [$FF80],a
ECH0:E5CE F0 82            ldh  a,[$FF82]
ECH0:E5D0 AE               xor  [hl]
ECH0:E5D1 24               inc  h
ECH0:E5D2 E0 81            ldh  [$FF81],a
ECH0:E5D4 F0 83            ldh  a,[$FF83]
ECH0:E5D6 AE               xor  [hl]
ECH0:E5D7 24               inc  h
ECH0:E5D8 E0 82            ldh  [$FF82],a
ECH0:E5DA 7E               ld   a,[hl]
ECH0:E5DB E0 83            ldh  [$FF83],a
ECH0:E5DD 7B               ld   a,e
ECH0:E5DE 6F               ld   l,a
ECH0:E5DF F0 80            ldh  a,[$FF80]
ECH0:E5E1 AD               xor  l
ECH0:E5E2 6F               ld   l,a
ECH0:E5E3 26 D9            ld   h,$D9
ECH0:E5E5 F0 81            ldh  a,[$FF81]
ECH0:E5E7 AE               xor  [hl]
ECH0:E5E8 24               inc  h
ECH0:E5E9 E0 80            ldh  [$FF80],a
ECH0:E5EB F0 82            ldh  a,[$FF82]
ECH0:E5ED AE               xor  [hl]
ECH0:E5EE 24               inc  h
ECH0:E5EF E0 81            ldh  [$FF81],a
ECH0:E5F1 F0 83            ldh  a,[$FF83]
ECH0:E5F3 AE               xor  [hl]
ECH0:E5F4 24               inc  h
ECH0:E5F5 E0 82            ldh  [$FF82],a
ECH0:E5F7 7E               ld   a,[hl]
ECH0:E5F8 E0 83            ldh  [$FF83],a
ECH0:E5FA C9               ret  
ECH0:E5FB 33               inc  sp
ECH0:E5FC 00               nop  
ECH0:E5FD 00               nop  
ECH0:E5FE 3B               dec  sp
ECH0:E5FF 00               nop  
ECH0:E600 00               nop  
ECH0:E601 39               add  hl,sp
ECH0:E602 00               nop  
ECH0:E603 00               nop  
ECH0:E604 F9               ld   sp,hl
ECH0:E605 00               nop  
ECH0:E606 00               nop  
ECH0:E607 E8 01            add  sp,$01
ECH0:E609 00               nop  
ECH0:E60A E8 FF            add  sp,-$01
ECH0:E60C 00               nop  
ECH0:E60D F8 01            ld   hl,sp+$01
ECH0:E60F 00               nop  
ECH0:E610 F8 FF            ld   hl,sp-$01
ECH0:E612 00               nop  
ECH0:E613 0E 00            ld   c,$00
ECH0:E615 CD 1E C6         call $C61E
ECH0:E618 0E F0            ld   c,$F0
ECH0:E61A CD 1E C6         call $C61E
ECH0:E61D C9               ret  
ECH0:E61E 21 71 C6         ld   hl,$C671
ECH0:E621 5E               ld   e,[hl]
ECH0:E622 23               inc  hl
ECH0:E623 56               ld   d,[hl]
ECH0:E624 23               inc  hl
ECH0:E625 E5               push hl
ECH0:E626 21 71 C6         ld   hl,$C671
ECH0:E629 C5               push bc
ECH0:E62A D5               push de
ECH0:E62B E5               push hl
ECH0:E62C C5               push bc
ECH0:E62D F1               pop  af
ECH0:E62E 08 00 DD         ld   [$DD00],sp
ECH0:E631 2A               ldi  a,[hl]
ECH0:E632 66               ld   h,[hl]
ECH0:E633 6F               ld   l,a
ECH0:E634 F9               ld   sp,hl
ECH0:E635 62               ld   h,d
ECH0:E636 6B               ld   l,e
ECH0:E637 3E 12            ld   a,$12
ECH0:E639 01 91 56         ld   bc,$5691
ECH0:E63C 11 BC 9A         ld   de,$9ABC
ECH0:E63F C3 F8 DE         jp   $DEF8
ECH0:E642 08 02 DD         ld   [$DD02],sp
ECH0:E645 31 70 DF         ld   sp,$DF70
ECH0:E648 CD 0F C5         call $C50F
ECH0:E64B FA 02 DD         ld   a,[$DD02]
ECH0:E64E CD 8F C4         call $C48F
ECH0:E651 FA 03 DD         ld   a,[$DD03]
ECH0:E654 CD 8F C4         call $C48F
ECH0:E657 FA 00 DD         ld   a,[$DD00]
ECH0:E65A 6F               ld   l,a
ECH0:E65B FA 01 DD         ld   a,[$DD01]
ECH0:E65E 67               ld   h,a
ECH0:E65F F9               ld   sp,hl
ECH0:E660 E1               pop  hl
ECH0:E661 D1               pop  de
ECH0:E662 C1               pop  bc
ECH0:E663 23               inc  hl
ECH0:E664 23               inc  hl
ECH0:E665 7D               ld   a,l
ECH0:E666 FE 8F            cp   a,$8F
ECH0:E668 20 BF            jr   nz,$E629
ECH0:E66A E1               pop  hl
ECH0:E66B 7D               ld   a,l
ECH0:E66C FE 8F            cp   a,$8F
ECH0:E66E 20 B1            jr   nz,$E621
ECH0:E670 C9               ret  
ECH0:E671 00               nop  
ECH0:E672 00               nop  
ECH0:E673 01 00 0F         ld   bc,$0F00
ECH0:E676 00               nop  
ECH0:E677 10 00            stop
ECH0:E679 1F               rra  
ECH0:E67A 00               nop  
ECH0:E67B 7F               ld   a,a
ECH0:E67C 00               nop  
ECH0:E67D 80               add  b
ECH0:E67E 00               nop  
ECH0:E67F FF               rst  $38
ECH0:E680 00               nop  
ECH0:E681 00               nop  
ECH0:E682 01 00 0F         ld   bc,$0F00
ECH0:E685 00               nop  
ECH0:E686 1F               rra  
ECH0:E687 00               nop  
ECH0:E688 10 FF            <corrupted stop>
ECH0:E68A 7F               ld   a,a
ECH0:E68B 00               nop  
ECH0:E68C 80               add  b
ECH0:E68D FF               rst  $38
ECH0:E68E FF               rst  $38
ECH0:E68F 00               nop  
ECH0:E690 00               nop  
ECH0:E691 01 00 0F         ld   bc,$0F00
ECH0:E694 00               nop  
ECH0:E695 10 00            stop
ECH0:E697 1F               rra  
ECH0:E698 00               nop  
ECH0:E699 7F               ld   a,a
ECH0:E69A 00               nop  
ECH0:E69B 80               add  b
ECH0:E69C 00               nop  
ECH0:E69D FF               rst  $38
ECH0:E69E 00               nop  
ECH0:E69F 00               nop  
ECH0:E6A0 01 00 0F         ld   bc,$0F00
ECH0:E6A3 00               nop  
ECH0:E6A4 1F               rra  
ECH0:E6A5 00               nop  
ECH0:E6A6 10 FF            <corrupted stop>
ECH0:E6A8 7F               ld   a,a
ECH0:E6A9 00               nop  
ECH0:E6AA 80               add  b
ECH0:E6AB FF               rst  $38
ECH0:E6AC FF               rst  $38
ECH0:E6AD BC               cp   h
ECH0:E6AE F4               db   $F4 ; undefined opcode
ECH0:E6AF CD 8C C7         call $C78C
ECH0:E6B2 5E               ld   e,[hl]
ECH0:E6B3 89               adc  c
ECH0:E6B4 E5               push hl
ECH0:E6B5 36 65            ld   [hl],$65
ECH0:E6B7 21 55 D6         ld   hl,$D655
ECH0:E6BA 6A               ld   l,d
ECH0:E6BB 2A               ldi  a,[hl]
ECH0:E6BC FF               rst  $38
ECH0:E6BD EB               db   $EB ; undefined opcode
ECH0:E6BE 34               inc  [hl]
ECH0:E6BF 37               scf  
ECH0:E6C0 B9               cp   c
ECH0:E6C1 08 5F 22         ld   [$225F],sp
ECH0:E6C4 13               inc  de
ECH0:E6C5 B6               or   [hl]
ECH0:E6C6 2A               ldi  a,[hl]
ECH0:E6C7 37               scf  
ECH0:E6C8 C3 72 43         jp   $4372
ECH0:E6CB 5C               ld   e,h
ECH0:E6CC 4D               ld   c,l
ECH0:E6CD C5               push bc
ECH0:E6CE 01 1E FB         ld   bc,$FB1E
ECH0:E6D1 03               inc  bc
ECH0:E6D2 78               ld   a,b
ECH0:E6D3 B1               or   c
ECH0:E6D4 28 06            jr   z,$E6DC
ECH0:E6D6 F0 44            ldh  a,[$FF44]
ECH0:E6D8 FE 90            cp   a,$90
ECH0:E6DA 20 F5            jr   nz,$E6D1
ECH0:E6DC C1               pop  bc
ECH0:E6DD C9               ret  
ECH0:E6DE CD 81 C7         call $C781
ECH0:E6E1 FA 00 D8         ld   a,[$D800]
ECH0:E6E4 E6 10            and  a,$10
ECH0:E6E6 C4 20 C7         call nz,$C720
ECH0:E6E9 3E 20            ld   a,$20
ECH0:E6EB CD 12 C7         call $C712
ECH0:E6EE 21 00 82         ld   hl,$8200
ECH0:E6F1 0E 00            ld   c,$00
ECH0:E6F3 CD 59 C7         call $C759
ECH0:E6F6 21 00 8A         ld   hl,$8A00
ECH0:E6F9 0E FF            ld   c,$FF
ECH0:E6FB CD 59 C7         call $C759
ECH0:E6FE 3E 14            ld   a,$14
ECH0:E700 EA 1B D8         ld   [$D81B],a
ECH0:E703 3E 00            ld   a,$00
ECH0:E705 EA 1C D8         ld   [$D81C],a
ECH0:E708 3E F8            ld   a,$F8
ECH0:E70A EA 1D D8         ld   [$D81D],a
ECH0:E70D CD C7 C7         call $C7C7
ECH0:E710 18 5C            jr   $E76E
ECH0:E712 21 00 98         ld   hl,$9800
ECH0:E715 06 04            ld   b,$04
ECH0:E717 77               ld   [hl],a
ECH0:E718 2C               inc  l
ECH0:E719 20 FC            jr   nz,$E717
ECH0:E71B 24               inc  h
ECH0:E71C 05               dec  b
ECH0:E71D 20 F8            jr   nz,$E717
ECH0:E71F C9               ret  
ECH0:E720 3E 80            ld   a,$80
ECH0:E722 E0 68            ldh  [$FF68],a
ECH0:E724 06 10            ld   b,$10
ECH0:E726 3E FF            ld   a,$FF
ECH0:E728 E0 69            ldh  [$FF69],a
ECH0:E72A 3E 7F            ld   a,$7F
ECH0:E72C E0 69            ldh  [$FF69],a
ECH0:E72E 3E 00            ld   a,$00
ECH0:E730 E0 69            ldh  [$FF69],a
ECH0:E732 3E 00            ld   a,$00
ECH0:E734 E0 69            ldh  [$FF69],a
ECH0:E736 3E 00            ld   a,$00
ECH0:E738 E0 69            ldh  [$FF69],a
ECH0:E73A 3E 00            ld   a,$00
ECH0:E73C E0 69            ldh  [$FF69],a
ECH0:E73E 3E 00            ld   a,$00
ECH0:E740 E0 69            ldh  [$FF69],a
ECH0:E742 3E 00            ld   a,$00
ECH0:E744 E0 69            ldh  [$FF69],a
ECH0:E746 05               dec  b
ECH0:E747 20 DD            jr   nz,$E726
ECH0:E749 3E 01            ld   a,$01
ECH0:E74B EA 4F FF         ld   [$FF4F],a
ECH0:E74E 3E 00            ld   a,$00
ECH0:E750 CD 12 C7         call $C712
ECH0:E753 3E 00            ld   a,$00
ECH0:E755 EA 4F FF         ld   [$FF4F],a
ECH0:E758 C9               ret  
ECH0:E759 11 0C C8         ld   de,$C80C
ECH0:E75C 06 60            ld   b,$60
ECH0:E75E C5               push bc
ECH0:E75F 06 08            ld   b,$08
ECH0:E761 1A               ld   a,[de]
ECH0:E762 13               inc  de
ECH0:E763 A9               xor  c
ECH0:E764 22               ldi  [hl],a
ECH0:E765 22               ldi  [hl],a
ECH0:E766 05               dec  b
ECH0:E767 20 F8            jr   nz,$E761
ECH0:E769 C1               pop  bc
ECH0:E76A 05               dec  b
ECH0:E76B 20 F1            jr   nz,$E75E
ECH0:E76D C9               ret  
ECH0:E76E F5               push af
ECH0:E76F CD CD C6         call $C6CD
ECH0:E772 3E 91            ld   a,$91
ECH0:E774 E0 40            ldh  [$FF40],a
ECH0:E776 3E 00            ld   a,$00
ECH0:E778 E0 43            ldh  [$FF43],a
ECH0:E77A 3E E4            ld   a,$E4
ECH0:E77C E0 47            ldh  [$FF47],a
ECH0:E77E C3 EB C7         jp   $C7EB
ECH0:E781 F5               push af
ECH0:E782 CD CD C6         call $C6CD
ECH0:E785 3E 11            ld   a,$11
ECH0:E787 E0 40            ldh  [$FF40],a
ECH0:E789 F1               pop  af
ECH0:E78A C9               ret  
ECH0:E78B AF               xor  a
ECH0:E78C 18 02            jr   $E790
ECH0:E78E 3E 80            ld   a,$80
ECH0:E790 E6 80            and  a,$80
ECH0:E792 EA 1C D8         ld   [$D81C],a
ECH0:E795 C9               ret  
ECH0:E796 F5               push af
ECH0:E797 FE 0A            cp   a,$0A
ECH0:E799 28 1D            jr   z,$E7B8
ECH0:E79B E5               push hl
ECH0:E79C F5               push af
ECH0:E79D 21 1B D8         ld   hl,$D81B
ECH0:E7A0 2A               ldi  a,[hl]
ECH0:E7A1 FE 07            cp   a,$07
ECH0:E7A3 20 09            jr   nz,$E7AE
ECH0:E7A5 F1               pop  af
ECH0:E7A6 FE 20            cp   a,$20
ECH0:E7A8 28 0A            jr   z,$E7B4
ECH0:E7AA CD B7 C7         call $C7B7
ECH0:E7AD F5               push af
ECH0:E7AE F1               pop  af
ECH0:E7AF B6               or   [hl]
ECH0:E7B0 2D               dec  l
ECH0:E7B1 35               dec  [hl]
ECH0:E7B2 6E               ld   l,[hl]
ECH0:E7B3 77               ld   [hl],a
ECH0:E7B4 E1               pop  hl
ECH0:E7B5 F1               pop  af
ECH0:E7B6 C9               ret  
ECH0:E7B7 F5               push af
ECH0:E7B8 CD CD C6         call $C6CD
ECH0:E7BB CD F4 C7         call $C7F4
ECH0:E7BE CD C7 C7         call $C7C7
ECH0:E7C1 CD F4 C7         call $C7F4
ECH0:E7C4 C3 EB C7         jp   $C7EB
ECH0:E7C7 C5               push bc
ECH0:E7C8 E5               push hl
ECH0:E7C9 FA 1D D8         ld   a,[$D81D]
ECH0:E7CC C6 08            add  a,$08
ECH0:E7CE EA 1D D8         ld   [$D81D],a
ECH0:E7D1 3E 20            ld   a,$20
ECH0:E7D3 21 1A D8         ld   hl,$D81A
ECH0:E7D6 06 14            ld   b,$14
ECH0:E7D8 32               ldd  [hl],a
ECH0:E7D9 05               dec  b
ECH0:E7DA 20 FC            jr   nz,$E7D8
ECH0:E7DC 3E 1B            ld   a,$1B
ECH0:E7DE EA 1B D8         ld   [$D81B],a
ECH0:E7E1 E1               pop  hl
ECH0:E7E2 C1               pop  bc
ECH0:E7E3 C9               ret  
ECH0:E7E4 F5               push af
ECH0:E7E5 CD CD C6         call $C6CD
ECH0:E7E8 CD F4 C7         call $C7F4
ECH0:E7EB FA 1D D8         ld   a,[$D81D]
ECH0:E7EE D6 88            sub  a,$88
ECH0:E7F0 E0 42            ldh  [$FF42],a
ECH0:E7F2 F1               pop  af
ECH0:E7F3 C9               ret  
ECH0:E7F4 D5               push de
ECH0:E7F5 E5               push hl
ECH0:E7F6 FA 1D D8         ld   a,[$D81D]
ECH0:E7F9 6F               ld   l,a
ECH0:E7FA 26 26            ld   h,$26
ECH0:E7FC 29               add  hl,hl
ECH0:E7FD 29               add  hl,hl
ECH0:E7FE 11 1B D8         ld   de,$D81B
ECH0:E801 1D               dec  e
ECH0:E802 1A               ld   a,[de]
ECH0:E803 22               ldi  [hl],a
ECH0:E804 7B               ld   a,e
ECH0:E805 FE 07            cp   a,$07
ECH0:E807 20 F8            jr   nz,$E801
ECH0:E809 E1               pop  hl
ECH0:E80A D1               pop  de
ECH0:E80B C9               ret  
ECH0:E80C 00               nop  
ECH0:E80D 00               nop  
ECH0:E80E 00               nop  
ECH0:E80F 00               nop  
ECH0:E810 00               nop  
ECH0:E811 00               nop  
ECH0:E812 00               nop  
ECH0:E813 00               nop  
ECH0:E814 18 18            jr   $E82E
ECH0:E816 18 18            jr   $E830
ECH0:E818 18 00            jr   $E81A
ECH0:E81A 18 00            jr   $E81C
ECH0:E81C 6C               ld   l,h
ECH0:E81D 6C               ld   l,h
ECH0:E81E 6C               ld   l,h
ECH0:E81F 00               nop  
ECH0:E820 00               nop  
ECH0:E821 00               nop  
ECH0:E822 00               nop  
ECH0:E823 00               nop  
ECH0:E824 6C               ld   l,h
ECH0:E825 FE 6C            cp   a,$6C
ECH0:E827 6C               ld   l,h
ECH0:E828 FE 6C            cp   a,$6C
ECH0:E82A 00               nop  
ECH0:E82B 00               nop  
ECH0:E82C 18 3E            jr   $E86C
ECH0:E82E 60               ld   h,b
ECH0:E82F 3C               inc  a
ECH0:E830 06 7C            ld   b,$7C
ECH0:E832 18 00            jr   $E834
ECH0:E834 66               ld   h,[hl]
ECH0:E835 6C               ld   l,h
ECH0:E836 18 30            jr   $E868
ECH0:E838 60               ld   h,b
ECH0:E839 C6 86            add  a,$86
ECH0:E83B 00               nop  
ECH0:E83C 1C               inc  e
ECH0:E83D 36 1C            ld   [hl],$1C
ECH0:E83F 38 6F            jr   c,$E8B0
ECH0:E841 66               ld   h,[hl]
ECH0:E842 3B               dec  sp
ECH0:E843 00               nop  
ECH0:E844 0C               inc  c
ECH0:E845 0C               inc  c
ECH0:E846 0C               inc  c
ECH0:E847 00               nop  
ECH0:E848 00               nop  
ECH0:E849 00               nop  
ECH0:E84A 00               nop  
ECH0:E84B 00               nop  
ECH0:E84C 0E 1C            ld   c,$1C
ECH0:E84E 18 18            jr   $E868
ECH0:E850 18 1C            jr   $E86E
ECH0:E852 0E 00            ld   c,$00
ECH0:E854 70               ld   [hl],b
ECH0:E855 38 18            jr   c,$E86F
ECH0:E857 18 18            jr   $E871
ECH0:E859 38 70            jr   c,$E8CB
ECH0:E85B 00               nop  
ECH0:E85C 00               nop  
ECH0:E85D 66               ld   h,[hl]
ECH0:E85E 3C               inc  a
ECH0:E85F FF               rst  $38
ECH0:E860 3C               inc  a
ECH0:E861 66               ld   h,[hl]
ECH0:E862 00               nop  
ECH0:E863 00               nop  
ECH0:E864 00               nop  
ECH0:E865 18 18            jr   $E87F
ECH0:E867 7E               ld   a,[hl]
ECH0:E868 18 18            jr   $E882
ECH0:E86A 00               nop  
ECH0:E86B 00               nop  
ECH0:E86C 00               nop  
ECH0:E86D 00               nop  
ECH0:E86E 00               nop  
ECH0:E86F 00               nop  
ECH0:E870 00               nop  
ECH0:E871 30 30            jr   nc,$E8A3
ECH0:E873 60               ld   h,b
ECH0:E874 00               nop  
ECH0:E875 00               nop  
ECH0:E876 00               nop  
ECH0:E877 7E               ld   a,[hl]
ECH0:E878 00               nop  
ECH0:E879 00               nop  
ECH0:E87A 00               nop  
ECH0:E87B 00               nop  
ECH0:E87C 00               nop  
ECH0:E87D 00               nop  
ECH0:E87E 00               nop  
ECH0:E87F 00               nop  
ECH0:E880 00               nop  
ECH0:E881 60               ld   h,b
ECH0:E882 60               ld   h,b
ECH0:E883 00               nop  
ECH0:E884 02               ld   [bc],a
ECH0:E885 06 0C            ld   b,$0C
ECH0:E887 18 30            jr   $E8B9
ECH0:E889 60               ld   h,b
ECH0:E88A 40               ld   b,b
ECH0:E88B 00               nop  
ECH0:E88C 3C               inc  a
ECH0:E88D 66               ld   h,[hl]
ECH0:E88E 6E               ld   l,[hl]
ECH0:E88F 76               halt 
ECH0:E890 66               ld   h,[hl]
ECH0:E891 66               ld   h,[hl]
ECH0:E892 3C               inc  a
ECH0:E893 00               nop  
ECH0:E894 18 38            jr   $E8CE
ECH0:E896 18 18            jr   $E8B0
ECH0:E898 18 18            jr   $E8B2
ECH0:E89A 7E               ld   a,[hl]
ECH0:E89B 00               nop  
ECH0:E89C 3C               inc  a
ECH0:E89D 66               ld   h,[hl]
ECH0:E89E 06 0C            ld   b,$0C
ECH0:E8A0 18 30            jr   $E8D2
ECH0:E8A2 7E               ld   a,[hl]
ECH0:E8A3 00               nop  
ECH0:E8A4 7E               ld   a,[hl]
ECH0:E8A5 0C               inc  c
ECH0:E8A6 18 0C            jr   $E8B4
ECH0:E8A8 06 66            ld   b,$66
ECH0:E8AA 3C               inc  a
ECH0:E8AB 00               nop  
ECH0:E8AC 0C               inc  c
ECH0:E8AD 1C               inc  e
ECH0:E8AE 3C               inc  a
ECH0:E8AF 6C               ld   l,h
ECH0:E8B0 7E               ld   a,[hl]
ECH0:E8B1 0C               inc  c
ECH0:E8B2 0C               inc  c
ECH0:E8B3 00               nop  
ECH0:E8B4 7E               ld   a,[hl]
ECH0:E8B5 60               ld   h,b
ECH0:E8B6 7C               ld   a,h
ECH0:E8B7 06 06            ld   b,$06
ECH0:E8B9 66               ld   h,[hl]
ECH0:E8BA 3C               inc  a
ECH0:E8BB 00               nop  
ECH0:E8BC 3C               inc  a
ECH0:E8BD 60               ld   h,b
ECH0:E8BE 60               ld   h,b
ECH0:E8BF 7C               ld   a,h
ECH0:E8C0 66               ld   h,[hl]
ECH0:E8C1 66               ld   h,[hl]
ECH0:E8C2 3C               inc  a
ECH0:E8C3 00               nop  
ECH0:E8C4 7E               ld   a,[hl]
ECH0:E8C5 06 0C            ld   b,$0C
ECH0:E8C7 18 30            jr   $E8F9
ECH0:E8C9 30 30            jr   nc,$E8FB
ECH0:E8CB 00               nop  
ECH0:E8CC 3C               inc  a
ECH0:E8CD 66               ld   h,[hl]
ECH0:E8CE 66               ld   h,[hl]
ECH0:E8CF 3C               inc  a
ECH0:E8D0 66               ld   h,[hl]
ECH0:E8D1 66               ld   h,[hl]
ECH0:E8D2 3C               inc  a
ECH0:E8D3 00               nop  
ECH0:E8D4 3C               inc  a
ECH0:E8D5 66               ld   h,[hl]
ECH0:E8D6 66               ld   h,[hl]
ECH0:E8D7 3E 06            ld   a,$06
ECH0:E8D9 0C               inc  c
ECH0:E8DA 38 00            jr   c,$E8DC
ECH0:E8DC 00               nop  
ECH0:E8DD 18 18            jr   $E8F7
ECH0:E8DF 00               nop  
ECH0:E8E0 18 18            jr   $E8FA
ECH0:E8E2 00               nop  
ECH0:E8E3 00               nop  
ECH0:E8E4 00               nop  
ECH0:E8E5 18 18            jr   $E8FF
ECH0:E8E7 00               nop  
ECH0:E8E8 18 18            jr   $E902
ECH0:E8EA 30 00            jr   nc,$E8EC
ECH0:E8EC 0C               inc  c
ECH0:E8ED 18 30            jr   $E91F
ECH0:E8EF 60               ld   h,b
ECH0:E8F0 30 18            jr   nc,$E90A
ECH0:E8F2 0C               inc  c
ECH0:E8F3 00               nop  
ECH0:E8F4 00               nop  
ECH0:E8F5 00               nop  
ECH0:E8F6 7E               ld   a,[hl]
ECH0:E8F7 00               nop  
ECH0:E8F8 00               nop  
ECH0:E8F9 7E               ld   a,[hl]
ECH0:E8FA 00               nop  
ECH0:E8FB 00               nop  
ECH0:E8FC 30 18            jr   nc,$E916
ECH0:E8FE 0C               inc  c
ECH0:E8FF 06 0C            ld   b,$0C
ECH0:E901 18 30            jr   $E933
ECH0:E903 00               nop  
ECH0:E904 3C               inc  a
ECH0:E905 66               ld   h,[hl]
ECH0:E906 06 0C            ld   b,$0C
ECH0:E908 18 00            jr   $E90A
ECH0:E90A 18 00            jr   $E90C
ECH0:E90C 3C               inc  a
ECH0:E90D 66               ld   h,[hl]
ECH0:E90E 6E               ld   l,[hl]
ECH0:E90F 6A               ld   l,d
ECH0:E910 6E               ld   l,[hl]
ECH0:E911 60               ld   h,b
ECH0:E912 3E 00            ld   a,$00
ECH0:E914 18 3C            jr   $E952
ECH0:E916 66               ld   h,[hl]
ECH0:E917 66               ld   h,[hl]
ECH0:E918 7E               ld   a,[hl]
ECH0:E919 66               ld   h,[hl]
ECH0:E91A 66               ld   h,[hl]
ECH0:E91B 00               nop  
ECH0:E91C 7C               ld   a,h
ECH0:E91D 66               ld   h,[hl]
ECH0:E91E 66               ld   h,[hl]
ECH0:E91F 7C               ld   a,h
ECH0:E920 66               ld   h,[hl]
ECH0:E921 66               ld   h,[hl]
ECH0:E922 7C               ld   a,h
ECH0:E923 00               nop  
ECH0:E924 3C               inc  a
ECH0:E925 66               ld   h,[hl]
ECH0:E926 60               ld   h,b
ECH0:E927 60               ld   h,b
ECH0:E928 60               ld   h,b
ECH0:E929 66               ld   h,[hl]
ECH0:E92A 3C               inc  a
ECH0:E92B 00               nop  
ECH0:E92C 78               ld   a,b
ECH0:E92D 6C               ld   l,h
ECH0:E92E 66               ld   h,[hl]
ECH0:E92F 66               ld   h,[hl]
ECH0:E930 66               ld   h,[hl]
ECH0:E931 6C               ld   l,h
ECH0:E932 78               ld   a,b
ECH0:E933 00               nop  
ECH0:E934 7E               ld   a,[hl]
ECH0:E935 60               ld   h,b
ECH0:E936 60               ld   h,b
ECH0:E937 7C               ld   a,h
ECH0:E938 60               ld   h,b
ECH0:E939 60               ld   h,b
ECH0:E93A 7E               ld   a,[hl]
ECH0:E93B 00               nop  
ECH0:E93C 7E               ld   a,[hl]
ECH0:E93D 60               ld   h,b
ECH0:E93E 60               ld   h,b
ECH0:E93F 7C               ld   a,h
ECH0:E940 60               ld   h,b
ECH0:E941 60               ld   h,b
ECH0:E942 60               ld   h,b
ECH0:E943 00               nop  
ECH0:E944 3E 60            ld   a,$60
ECH0:E946 60               ld   h,b
ECH0:E947 6E               ld   l,[hl]
ECH0:E948 66               ld   h,[hl]
ECH0:E949 66               ld   h,[hl]
ECH0:E94A 3E 00            ld   a,$00
ECH0:E94C 66               ld   h,[hl]
ECH0:E94D 66               ld   h,[hl]
ECH0:E94E 66               ld   h,[hl]
ECH0:E94F 7E               ld   a,[hl]
ECH0:E950 66               ld   h,[hl]
ECH0:E951 66               ld   h,[hl]
ECH0:E952 66               ld   h,[hl]
ECH0:E953 00               nop  
ECH0:E954 3C               inc  a
ECH0:E955 18 18            jr   $E96F
ECH0:E957 18 18            jr   $E971
ECH0:E959 18 3C            jr   $E997
ECH0:E95B 00               nop  
ECH0:E95C 06 06            ld   b,$06
ECH0:E95E 06 06            ld   b,$06
ECH0:E960 06 66            ld   b,$66
ECH0:E962 3C               inc  a
ECH0:E963 00               nop  
ECH0:E964 66               ld   h,[hl]
ECH0:E965 6C               ld   l,h
ECH0:E966 78               ld   a,b
ECH0:E967 70               ld   [hl],b
ECH0:E968 78               ld   a,b
ECH0:E969 6C               ld   l,h
ECH0:E96A 66               ld   h,[hl]
ECH0:E96B 00               nop  
ECH0:E96C 60               ld   h,b
ECH0:E96D 60               ld   h,b
ECH0:E96E 60               ld   h,b
ECH0:E96F 60               ld   h,b
ECH0:E970 60               ld   h,b
ECH0:E971 60               ld   h,b
ECH0:E972 7E               ld   a,[hl]
ECH0:E973 00               nop  
ECH0:E974 C6 EE            add  a,$EE
ECH0:E976 FE D6            cp   a,$D6
ECH0:E978 C6 C6            add  a,$C6
ECH0:E97A C6 00            add  a,$00
ECH0:E97C 66               ld   h,[hl]
ECH0:E97D 76               halt 
ECH0:E97E 7E               ld   a,[hl]
ECH0:E97F 7E               ld   a,[hl]
ECH0:E980 6E               ld   l,[hl]
ECH0:E981 66               ld   h,[hl]
ECH0:E982 66               ld   h,[hl]
ECH0:E983 00               nop  
ECH0:E984 3C               inc  a
ECH0:E985 66               ld   h,[hl]
ECH0:E986 66               ld   h,[hl]
ECH0:E987 66               ld   h,[hl]
ECH0:E988 66               ld   h,[hl]
ECH0:E989 66               ld   h,[hl]
ECH0:E98A 3C               inc  a
ECH0:E98B 00               nop  
ECH0:E98C 7C               ld   a,h
ECH0:E98D 66               ld   h,[hl]
ECH0:E98E 66               ld   h,[hl]
ECH0:E98F 7C               ld   a,h
ECH0:E990 60               ld   h,b
ECH0:E991 60               ld   h,b
ECH0:E992 60               ld   h,b
ECH0:E993 00               nop  
ECH0:E994 3C               inc  a
ECH0:E995 66               ld   h,[hl]
ECH0:E996 66               ld   h,[hl]
ECH0:E997 66               ld   h,[hl]
ECH0:E998 76               halt 
ECH0:E999 6C               ld   l,h
ECH0:E99A 36 00            ld   [hl],$00
ECH0:E99C 7C               ld   a,h
ECH0:E99D 66               ld   h,[hl]
ECH0:E99E 66               ld   h,[hl]
ECH0:E99F 7C               ld   a,h
ECH0:E9A0 6C               ld   l,h
ECH0:E9A1 66               ld   h,[hl]
ECH0:E9A2 66               ld   h,[hl]
ECH0:E9A3 00               nop  
ECH0:E9A4 3C               inc  a
ECH0:E9A5 66               ld   h,[hl]
ECH0:E9A6 60               ld   h,b
ECH0:E9A7 3C               inc  a
ECH0:E9A8 06 66            ld   b,$66
ECH0:E9AA 3C               inc  a
ECH0:E9AB 00               nop  
ECH0:E9AC 7E               ld   a,[hl]
ECH0:E9AD 18 18            jr   $E9C7
ECH0:E9AF 18 18            jr   $E9C9
ECH0:E9B1 18 18            jr   $E9CB
ECH0:E9B3 00               nop  
ECH0:E9B4 66               ld   h,[hl]
ECH0:E9B5 66               ld   h,[hl]
ECH0:E9B6 66               ld   h,[hl]
ECH0:E9B7 66               ld   h,[hl]
ECH0:E9B8 66               ld   h,[hl]
ECH0:E9B9 66               ld   h,[hl]
ECH0:E9BA 3E 00            ld   a,$00
ECH0:E9BC 66               ld   h,[hl]
ECH0:E9BD 66               ld   h,[hl]
ECH0:E9BE 66               ld   h,[hl]
ECH0:E9BF 66               ld   h,[hl]
ECH0:E9C0 3C               inc  a
ECH0:E9C1 3C               inc  a
ECH0:E9C2 18 00            jr   $E9C4
ECH0:E9C4 C6 C6            add  a,$C6
ECH0:E9C6 C6 D6            add  a,$D6
ECH0:E9C8 FE EE            cp   a,$EE
ECH0:E9CA C6 00            add  a,$00
ECH0:E9CC 66               ld   h,[hl]
ECH0:E9CD 66               ld   h,[hl]
ECH0:E9CE 3C               inc  a
ECH0:E9CF 18 3C            jr   $EA0D
ECH0:E9D1 66               ld   h,[hl]
ECH0:E9D2 66               ld   h,[hl]
ECH0:E9D3 00               nop  
ECH0:E9D4 66               ld   h,[hl]
ECH0:E9D5 66               ld   h,[hl]
ECH0:E9D6 66               ld   h,[hl]
ECH0:E9D7 3C               inc  a
ECH0:E9D8 18 18            jr   $E9F2
ECH0:E9DA 18 00            jr   $E9DC
ECH0:E9DC 7E               ld   a,[hl]
ECH0:E9DD 06 0C            ld   b,$0C
ECH0:E9DF 18 30            jr   $EA11
ECH0:E9E1 60               ld   h,b
ECH0:E9E2 7E               ld   a,[hl]
ECH0:E9E3 00               nop  
ECH0:E9E4 1E 18            ld   e,$18
ECH0:E9E6 18 18            jr   $EA00
ECH0:E9E8 18 18            jr   $EA02
ECH0:E9EA 1E 00            ld   e,$00
ECH0:E9EC 40               ld   b,b
ECH0:E9ED 60               ld   h,b
ECH0:E9EE 30 18            jr   nc,$EA08
ECH0:E9F0 0C               inc  c
ECH0:E9F1 06 02            ld   b,$02
ECH0:E9F3 00               nop  
ECH0:E9F4 78               ld   a,b
ECH0:E9F5 18 18            jr   $EA0F
ECH0:E9F7 18 18            jr   $EA11
ECH0:E9F9 18 78            jr   $EA73
ECH0:E9FB 00               nop  
ECH0:E9FC 10 38            <corrupted stop>
ECH0:E9FE 6C               ld   l,h
ECH0:E9FF C6 00            add  a,$00
ECH0:EA01 00               nop  
ECH0:EA02 00               nop  
ECH0:EA03 00               nop  
ECH0:EA04 00               nop  
ECH0:EA05 00               nop  
ECH0:EA06 00               nop  
ECH0:EA07 00               nop  
ECH0:EA08 00               nop  
ECH0:EA09 00               nop  
ECH0:EA0A 00               nop  
ECH0:EA0B FE C0            cp   a,$C0
ECH0:EA0D 60               ld   h,b
ECH0:EA0E 30 00            jr   nc,$EA10
ECH0:EA10 00               nop  
ECH0:EA11 00               nop  
ECH0:EA12 00               nop  
ECH0:EA13 00               nop  
ECH0:EA14 00               nop  
ECH0:EA15 00               nop  
ECH0:EA16 3C               inc  a
ECH0:EA17 06 3E            ld   b,$3E
ECH0:EA19 66               ld   h,[hl]
ECH0:EA1A 3E 00            ld   a,$00
ECH0:EA1C 60               ld   h,b
ECH0:EA1D 60               ld   h,b
ECH0:EA1E 7C               ld   a,h
ECH0:EA1F 66               ld   h,[hl]
ECH0:EA20 66               ld   h,[hl]
ECH0:EA21 66               ld   h,[hl]
ECH0:EA22 7C               ld   a,h
ECH0:EA23 00               nop  
ECH0:EA24 00               nop  
ECH0:EA25 00               nop  
ECH0:EA26 3C               inc  a
ECH0:EA27 60               ld   h,b
ECH0:EA28 60               ld   h,b
ECH0:EA29 60               ld   h,b
ECH0:EA2A 3C               inc  a
ECH0:EA2B 00               nop  
ECH0:EA2C 06 06            ld   b,$06
ECH0:EA2E 3E 66            ld   a,$66
ECH0:EA30 66               ld   h,[hl]
ECH0:EA31 66               ld   h,[hl]
ECH0:EA32 3E 00            ld   a,$00
ECH0:EA34 00               nop  
ECH0:EA35 00               nop  
ECH0:EA36 3C               inc  a
ECH0:EA37 66               ld   h,[hl]
ECH0:EA38 7E               ld   a,[hl]
ECH0:EA39 60               ld   h,b
ECH0:EA3A 3C               inc  a
ECH0:EA3B 00               nop  
ECH0:EA3C 1C               inc  e
ECH0:EA3D 30 7C            jr   nc,$EABB
ECH0:EA3F 30 30            jr   nc,$EA71
ECH0:EA41 30 30            jr   nc,$EA73
ECH0:EA43 00               nop  
ECH0:EA44 00               nop  
ECH0:EA45 00               nop  
ECH0:EA46 3E 66            ld   a,$66
ECH0:EA48 66               ld   h,[hl]
ECH0:EA49 3E 06            ld   a,$06
ECH0:EA4B 7C               ld   a,h
ECH0:EA4C 60               ld   h,b
ECH0:EA4D 60               ld   h,b
ECH0:EA4E 7C               ld   a,h
ECH0:EA4F 66               ld   h,[hl]
ECH0:EA50 66               ld   h,[hl]
ECH0:EA51 66               ld   h,[hl]
ECH0:EA52 66               ld   h,[hl]
ECH0:EA53 00               nop  
ECH0:EA54 18 00            jr   $EA56
ECH0:EA56 38 18            jr   c,$EA70
ECH0:EA58 18 18            jr   $EA72
ECH0:EA5A 3C               inc  a
ECH0:EA5B 00               nop  
ECH0:EA5C 18 00            jr   $EA5E
ECH0:EA5E 18 18            jr   $EA78
ECH0:EA60 18 18            jr   $EA7A
ECH0:EA62 18 70            jr   $EAD4
ECH0:EA64 60               ld   h,b
ECH0:EA65 60               ld   h,b
ECH0:EA66 66               ld   h,[hl]
ECH0:EA67 6C               ld   l,h
ECH0:EA68 78               ld   a,b
ECH0:EA69 6C               ld   l,h
ECH0:EA6A 66               ld   h,[hl]
ECH0:EA6B 00               nop  
ECH0:EA6C 38 18            jr   c,$EA86
ECH0:EA6E 18 18            jr   $EA88
ECH0:EA70 18 18            jr   $EA8A
ECH0:EA72 3C               inc  a
ECH0:EA73 00               nop  
ECH0:EA74 00               nop  
ECH0:EA75 00               nop  
ECH0:EA76 EC               db   $EC ; undefined opcode
ECH0:EA77 FE D6            cp   a,$D6
ECH0:EA79 C6 C6            add  a,$C6
ECH0:EA7B 00               nop  
ECH0:EA7C 00               nop  
ECH0:EA7D 00               nop  
ECH0:EA7E 7C               ld   a,h
ECH0:EA7F 66               ld   h,[hl]
ECH0:EA80 66               ld   h,[hl]
ECH0:EA81 66               ld   h,[hl]
ECH0:EA82 66               ld   h,[hl]
ECH0:EA83 00               nop  
ECH0:EA84 00               nop  
ECH0:EA85 00               nop  
ECH0:EA86 3C               inc  a
ECH0:EA87 66               ld   h,[hl]
ECH0:EA88 66               ld   h,[hl]
ECH0:EA89 66               ld   h,[hl]
ECH0:EA8A 3C               inc  a
ECH0:EA8B 00               nop  
ECH0:EA8C 00               nop  
ECH0:EA8D 00               nop  
ECH0:EA8E 7C               ld   a,h
ECH0:EA8F 66               ld   h,[hl]
ECH0:EA90 66               ld   h,[hl]
ECH0:EA91 66               ld   h,[hl]
ECH0:EA92 7C               ld   a,h
ECH0:EA93 60               ld   h,b
ECH0:EA94 00               nop  
ECH0:EA95 00               nop  
ECH0:EA96 3E 66            ld   a,$66
ECH0:EA98 66               ld   h,[hl]
ECH0:EA99 66               ld   h,[hl]
ECH0:EA9A 3E 06            ld   a,$06
ECH0:EA9C 00               nop  
ECH0:EA9D 00               nop  
ECH0:EA9E 7C               ld   a,h
ECH0:EA9F 66               ld   h,[hl]
ECH0:EAA0 60               ld   h,b
ECH0:EAA1 60               ld   h,b
ECH0:EAA2 60               ld   h,b
ECH0:EAA3 00               nop  
ECH0:EAA4 00               nop  
ECH0:EAA5 00               nop  
ECH0:EAA6 3E 60            ld   a,$60
ECH0:EAA8 3C               inc  a
ECH0:EAA9 06 7C            ld   b,$7C
ECH0:EAAB 00               nop  
ECH0:EAAC 00               nop  
ECH0:EAAD 18 7E            jr   $EB2D
ECH0:EAAF 18 18            jr   $EAC9
ECH0:EAB1 18 0E            jr   $EAC1
ECH0:EAB3 00               nop  
ECH0:EAB4 00               nop  
ECH0:EAB5 00               nop  
ECH0:EAB6 66               ld   h,[hl]
ECH0:EAB7 66               ld   h,[hl]
ECH0:EAB8 66               ld   h,[hl]
ECH0:EAB9 66               ld   h,[hl]
ECH0:EABA 3E 00            ld   a,$00
ECH0:EABC 00               nop  
ECH0:EABD 00               nop  
ECH0:EABE 66               ld   h,[hl]
ECH0:EABF 66               ld   h,[hl]
ECH0:EAC0 66               ld   h,[hl]
ECH0:EAC1 3C               inc  a
ECH0:EAC2 18 00            jr   $EAC4
ECH0:EAC4 00               nop  
ECH0:EAC5 00               nop  
ECH0:EAC6 C6 C6            add  a,$C6
ECH0:EAC8 D6 7C            sub  a,$7C
ECH0:EACA 6C               ld   l,h
ECH0:EACB 00               nop  
ECH0:EACC 00               nop  
ECH0:EACD 00               nop  
ECH0:EACE 66               ld   h,[hl]
ECH0:EACF 3C               inc  a
ECH0:EAD0 18 3C            jr   $EB0E
ECH0:EAD2 66               ld   h,[hl]
ECH0:EAD3 00               nop  
ECH0:EAD4 00               nop  
ECH0:EAD5 00               nop  
ECH0:EAD6 66               ld   h,[hl]
ECH0:EAD7 66               ld   h,[hl]
ECH0:EAD8 66               ld   h,[hl]
ECH0:EAD9 3E 06            ld   a,$06
ECH0:EADB 7C               ld   a,h
ECH0:EADC 00               nop  
ECH0:EADD 00               nop  
ECH0:EADE 7E               ld   a,[hl]
ECH0:EADF 0C               inc  c
ECH0:EAE0 18 30            jr   $EB12
ECH0:EAE2 7E               ld   a,[hl]
ECH0:EAE3 00               nop  
ECH0:EAE4 0E 18            ld   c,$18
ECH0:EAE6 18 30            jr   $EB18
ECH0:EAE8 18 18            jr   $EB02
ECH0:EAEA 0E 00            ld   c,$00
ECH0:EAEC 18 18            jr   $EB06
ECH0:EAEE 18 18            jr   $EB08
ECH0:EAF0 18 18            jr   $EB0A
ECH0:EAF2 18 00            jr   $EAF4
ECH0:EAF4 70               ld   [hl],b
ECH0:EAF5 18 18            jr   $EB0F
ECH0:EAF7 0C               inc  c
ECH0:EAF8 18 18            jr   $EB12
ECH0:EAFA 70               ld   [hl],b
ECH0:EAFB 00               nop  
ECH0:EAFC 00               nop  
ECH0:EAFD 00               nop  
ECH0:EAFE 60               ld   h,b
ECH0:EAFF F2               ld   a,[$ff00+c]
ECH0:EB00 9E               sbc  [hl]
ECH0:EB01 0C               inc  c
ECH0:EB02 00               nop  
ECH0:EB03 00               nop  
ECH0:EB04 00               nop  
ECH0:EB05 00               nop  
ECH0:EB06 00               nop  
ECH0:EB07 00               nop  
ECH0:EB08 00               nop  
ECH0:EB09 00               nop  
ECH0:EB0A 00               nop  
ECH0:EB0B 00               nop  
ECH0:EB0C CD DE C6         call $C6DE
ECH0:EB0F E5               push hl
ECH0:EB10 CD C2 C0         call $C0C2
ECH0:EB13 30 33            jr   nc,$EB48
ECH0:EB15 2D               dec  l
ECH0:EB16 6F               ld   l,a
ECH0:EB17 70               ld   [hl],b
ECH0:EB18 20 73            jr   nz,$EB8D
ECH0:EB1A 70               ld   [hl],b
ECH0:EB1B 2C               inc  l
ECH0:EB1C 68               ld   l,b
ECH0:EB1D 6C               ld   l,h
ECH0:EB1E 0A               ld   a,[bc]
ECH0:EB1F 0A               ld   a,[bc]
ECH0:EB20 00               nop  
ECH0:EB21 E1               pop  hl
ECH0:EB22 C9               ret  
ECH0:EB23 F5               push af
ECH0:EB24 E0 01            ldh  [$FF01],a
ECH0:EB26 3E 81            ld   a,$81
ECH0:EB28 E0 02            ldh  [$FF02],a
ECH0:EB2A F5               push af
ECH0:EB2B 3E 08            ld   a,$08
ECH0:EB2D CD 12 C0         call $C012
ECH0:EB30 3E D8            ld   a,$D8
ECH0:EB32 CD 03 C0         call $C003
ECH0:EB35 F1               pop  af
ECH0:EB36 F1               pop  af
ECH0:EB37 C3 96 C7         jp   $C796
ECH0:EB3A CD 6E C7         call $C76E
ECH0:EB3D CD 46 CB         call $CB46
ECH0:EB40 3E 00            ld   a,$00
ECH0:EB42 E0 26            ldh  [$FF26],a
ECH0:EB44 18 FE            jr   $EB44
ECH0:EB46 C9               ret  
ECH0:EB47 00               nop  
ECH0:EB48 00               nop  
ECH0:EB49 00               nop  
ECH0:EB4A 00               nop  
ECH0:EB4B 00               nop  
ECH0:EB4C 00               nop  
ECH0:EB4D 00               nop  
ECH0:EB4E 00               nop  
ECH0:EB4F 00               nop  
ECH0:EB50 00               nop  
ECH0:EB51 00               nop  
ECH0:EB52 00               nop  
ECH0:EB53 00               nop  
ECH0:EB54 00               nop  
ECH0:EB55 00               nop  
ECH0:EB56 00               nop  
ECH0:EB57 00               nop  
ECH0:EB58 00               nop  
ECH0:EB59 00               nop  
ECH0:EB5A 00               nop  
ECH0:EB5B 00               nop  
ECH0:EB5C 00               nop  
ECH0:EB5D 00               nop  
ECH0:EB5E 00               nop  
ECH0:EB5F 00               nop  
ECH0:EB60 00               nop  
ECH0:EB61 00               nop  
ECH0:EB62 00               nop  
ECH0:EB63 00               nop  
ECH0:EB64 00               nop  
ECH0:EB65 00               nop  
ECH0:EB66 00               nop  
ECH0:EB67 00               nop  
ECH0:EB68 00               nop  
ECH0:EB69 00               nop  
ECH0:EB6A 00               nop  
ECH0:EB6B 00               nop  
ECH0:EB6C 00               nop  
ECH0:EB6D 00               nop  
ECH0:EB6E 00               nop  
ECH0:EB6F 00               nop  
ECH0:EB70 00               nop  
ECH0:EB71 00               nop  
ECH0:EB72 00               nop  
ECH0:EB73 00               nop  
ECH0:EB74 00               nop  
ECH0:EB75 00               nop  
ECH0:EB76 00               nop  
ECH0:EB77 00               nop  
ECH0:EB78 00               nop  
ECH0:EB79 00               nop  
ECH0:EB7A 00               nop  
ECH0:EB7B 00               nop  
ECH0:EB7C 00               nop  
ECH0:EB7D 00               nop  
ECH0:EB7E 00               nop  
ECH0:EB7F 00               nop  
ECH0:EB80 00               nop  
ECH0:EB81 00               nop  
ECH0:EB82 00               nop  
ECH0:EB83 00               nop  
ECH0:EB84 00               nop  
ECH0:EB85 00               nop  
ECH0:EB86 00               nop  
ECH0:EB87 00               nop  
ECH0:EB88 00               nop  
ECH0:EB89 00               nop  
ECH0:EB8A 00               nop  
ECH0:EB8B 00               nop  
ECH0:EB8C 00               nop  
ECH0:EB8D 00               nop  
ECH0:EB8E 00               nop  
ECH0:EB8F 00               nop  
ECH0:EB90 00               nop  
ECH0:EB91 00               nop  
ECH0:EB92 00               nop  
ECH0:EB93 00               nop  
ECH0:EB94 00               nop  
ECH0:EB95 00               nop  
ECH0:EB96 00               nop  
ECH0:EB97 00               nop  
ECH0:EB98 00               nop  
ECH0:EB99 00               nop  
ECH0:EB9A 00               nop  
ECH0:EB9B 00               nop  
ECH0:EB9C 00               nop  
ECH0:EB9D 00               nop  
ECH0:EB9E 00               nop  
ECH0:EB9F 00               nop  
ECH0:EBA0 00               nop  
ECH0:EBA1 00               nop  
ECH0:EBA2 00               nop  
ECH0:EBA3 00               nop  
ECH0:EBA4 00               nop  
ECH0:EBA5 00               nop  
ECH0:EBA6 00               nop  
ECH0:EBA7 00               nop  
ECH0:EBA8 00               nop  
ECH0:EBA9 00               nop  
ECH0:EBAA 00               nop  
ECH0:EBAB 00               nop  
ECH0:EBAC 00               nop  
ECH0:EBAD 00               nop  
ECH0:EBAE 00               nop  
ECH0:EBAF 00               nop  
ECH0:EBB0 00               nop  
ECH0:EBB1 00               nop  
ECH0:EBB2 00               nop  
ECH0:EBB3 00               nop  
ECH0:EBB4 00               nop  
ECH0:EBB5 00               nop  
ECH0:EBB6 00               nop  
ECH0:EBB7 00               nop  
ECH0:EBB8 00               nop  
ECH0:EBB9 00               nop  
ECH0:EBBA 00               nop  
ECH0:EBBB 00               nop  
ECH0:EBBC 00               nop  
ECH0:EBBD 00               nop  
ECH0:EBBE 00               nop  
ECH0:EBBF 00               nop  
ECH0:EBC0 00               nop  
ECH0:EBC1 00               nop  
ECH0:EBC2 00               nop  
ECH0:EBC3 00               nop  
ECH0:EBC4 00               nop  
ECH0:EBC5 00               nop  
ECH0:EBC6 00               nop  
ECH0:EBC7 00               nop  
ECH0:EBC8 00               nop  
ECH0:EBC9 00               nop  
ECH0:EBCA 00               nop  
ECH0:EBCB 00               nop  
ECH0:EBCC 00               nop  
ECH0:EBCD 00               nop  
ECH0:EBCE 00               nop  
ECH0:EBCF 00               nop  
ECH0:EBD0 00               nop  
ECH0:EBD1 00               nop  
ECH0:EBD2 00               nop  
ECH0:EBD3 00               nop  
ECH0:EBD4 00               nop  
ECH0:EBD5 00               nop  
ECH0:EBD6 00               nop  
ECH0:EBD7 00               nop  
ECH0:EBD8 00               nop  
ECH0:EBD9 00               nop  
ECH0:EBDA 00               nop  
ECH0:EBDB 00               nop  
ECH0:EBDC 00               nop  
ECH0:EBDD 00               nop  
ECH0:EBDE 00               nop  
ECH0:EBDF 00               nop  
ECH0:EBE0 00               nop  
ECH0:EBE1 00               nop  
ECH0:EBE2 00               nop  
ECH0:EBE3 00               nop  
ECH0:EBE4 00               nop  
ECH0:EBE5 00               nop  
ECH0:EBE6 00               nop  
ECH0:EBE7 00               nop  
ECH0:EBE8 00               nop  
ECH0:EBE9 00               nop  
ECH0:EBEA 00               nop  
ECH0:EBEB 00               nop  
ECH0:EBEC 00               nop  
ECH0:EBED 00               nop  
ECH0:EBEE 00               nop  
ECH0:EBEF 00               nop  
ECH0:EBF0 00               nop  
ECH0:EBF1 00               nop  
ECH0:EBF2 00               nop  
ECH0:EBF3 00               nop  
ECH0:EBF4 00               nop  
ECH0:EBF5 00               nop  
ECH0:EBF6 00               nop  
ECH0:EBF7 00               nop  
ECH0:EBF8 00               nop  
ECH0:EBF9 00               nop  
ECH0:EBFA 00               nop  
ECH0:EBFB 00               nop  
ECH0:EBFC 00               nop  
ECH0:EBFD 00               nop  
ECH0:EBFE 00               nop  
ECH0:EBFF 00               nop  
ECH0:EC00 00               nop  
ECH0:EC01 00               nop  
ECH0:EC02 00               nop  
ECH0:EC03 00               nop  
ECH0:EC04 00               nop  
ECH0:EC05 00               nop  
ECH0:EC06 00               nop  
ECH0:EC07 00               nop  
ECH0:EC08 00               nop  
ECH0:EC09 00               nop  
ECH0:EC0A 00               nop  
ECH0:EC0B 00               nop  
ECH0:EC0C 00               nop  
ECH0:EC0D 00               nop  
ECH0:EC0E 00               nop  
ECH0:EC0F 00               nop  
ECH0:EC10 00               nop  
ECH0:EC11 00               nop  
ECH0:EC12 00               nop  
ECH0:EC13 00               nop  
ECH0:EC14 00               nop  
ECH0:EC15 00               nop  
ECH0:EC16 00               nop  
ECH0:EC17 00               nop  
ECH0:EC18 00               nop  
ECH0:EC19 00               nop  
ECH0:EC1A 00               nop  
ECH0:EC1B 00               nop  
ECH0:EC1C 00               nop  
ECH0:EC1D 00               nop  
ECH0:EC1E 00               nop  
ECH0:EC1F 00               nop  
ECH0:EC20 00               nop  
ECH0:EC21 00               nop  
ECH0:EC22 00               nop  
ECH0:EC23 00               nop  
ECH0:EC24 00               nop  
ECH0:EC25 00               nop  
ECH0:EC26 00               nop  
ECH0:EC27 00               nop  
ECH0:EC28 00               nop  
ECH0:EC29 00               nop  
ECH0:EC2A 00               nop  
ECH0:EC2B 00               nop  
ECH0:EC2C 00               nop  
ECH0:EC2D 00               nop  
ECH0:EC2E 00               nop  
ECH0:EC2F 00               nop  
ECH0:EC30 00               nop  
ECH0:EC31 00               nop  
ECH0:EC32 00               nop  
ECH0:EC33 00               nop  
ECH0:EC34 00               nop  
ECH0:EC35 00               nop  
ECH0:EC36 00               nop  
ECH0:EC37 00               nop  
ECH0:EC38 00               nop  
ECH0:EC39 00               nop  
ECH0:EC3A 00               nop  
ECH0:EC3B 00               nop  
ECH0:EC3C 00               nop  
ECH0:EC3D 00               nop  
ECH0:EC3E 00               nop  
ECH0:EC3F 00               nop  
ECH0:EC40 00               nop  
ECH0:EC41 00               nop  
ECH0:EC42 00               nop  
ECH0:EC43 00               nop  
ECH0:EC44 00               nop  
ECH0:EC45 00               nop  
ECH0:EC46 00               nop  
ECH0:EC47 00               nop  
ECH0:EC48 00               nop  
ECH0:EC49 00               nop  
ECH0:EC4A 00               nop  
ECH0:EC4B 00               nop  
ECH0:EC4C 00               nop  
ECH0:EC4D 00               nop  
ECH0:EC4E 00               nop  
ECH0:EC4F 00               nop  
ECH0:EC50 00               nop  
ECH0:EC51 00               nop  
ECH0:EC52 00               nop  
ECH0:EC53 00               nop  
ECH0:EC54 00               nop  
ECH0:EC55 00               nop  
ECH0:EC56 00               nop  
ECH0:EC57 00               nop  
ECH0:EC58 00               nop  
ECH0:EC59 00               nop  
ECH0:EC5A 00               nop  
ECH0:EC5B 00               nop  
ECH0:EC5C 00               nop  
ECH0:EC5D 00               nop  
ECH0:EC5E 00               nop  
ECH0:EC5F 00               nop  
ECH0:EC60 00               nop  
ECH0:EC61 00               nop  
ECH0:EC62 00               nop  
ECH0:EC63 00               nop  
ECH0:EC64 00               nop  
ECH0:EC65 00               nop  
ECH0:EC66 00               nop  
ECH0:EC67 00               nop  
ECH0:EC68 00               nop  
ECH0:EC69 00               nop  
ECH0:EC6A 00               nop  
ECH0:EC6B 00               nop  
ECH0:EC6C 00               nop  
ECH0:EC6D 00               nop  
ECH0:EC6E 00               nop  
ECH0:EC6F 00               nop  
ECH0:EC70 00               nop  
ECH0:EC71 00               nop  
ECH0:EC72 00               nop  
ECH0:EC73 00               nop  
ECH0:EC74 00               nop  
ECH0:EC75 00               nop  
ECH0:EC76 00               nop  
ECH0:EC77 00               nop  
ECH0:EC78 00               nop  
ECH0:EC79 00               nop  
ECH0:EC7A 00               nop  
ECH0:EC7B 00               nop  
ECH0:EC7C 00               nop  
ECH0:EC7D 00               nop  
ECH0:EC7E 00               nop  
ECH0:EC7F 00               nop  
ECH0:EC80 00               nop  
ECH0:EC81 00               nop  
ECH0:EC82 00               nop  
ECH0:EC83 00               nop  
ECH0:EC84 00               nop  
ECH0:EC85 00               nop  
ECH0:EC86 00               nop  
ECH0:EC87 00               nop  
ECH0:EC88 00               nop  
ECH0:EC89 00               nop  
ECH0:EC8A 00               nop  
ECH0:EC8B 00               nop  
ECH0:EC8C 00               nop  
ECH0:EC8D 00               nop  
ECH0:EC8E 00               nop  
ECH0:EC8F 00               nop  
ECH0:EC90 00               nop  
ECH0:EC91 00               nop  
ECH0:EC92 00               nop  
ECH0:EC93 00               nop  
ECH0:EC94 00               nop  
ECH0:EC95 00               nop  
ECH0:EC96 00               nop  
ECH0:EC97 00               nop  
ECH0:EC98 00               nop  
ECH0:EC99 00               nop  
ECH0:EC9A 00               nop  
ECH0:EC9B 00               nop  
ECH0:EC9C 00               nop  
ECH0:EC9D 00               nop  
ECH0:EC9E 00               nop  
ECH0:EC9F 00               nop  
ECH0:ECA0 00               nop  
ECH0:ECA1 00               nop  
ECH0:ECA2 00               nop  
ECH0:ECA3 00               nop  
ECH0:ECA4 00               nop  
ECH0:ECA5 00               nop  
ECH0:ECA6 00               nop  
ECH0:ECA7 00               nop  
ECH0:ECA8 00               nop  
ECH0:ECA9 00               nop  
ECH0:ECAA 00               nop  
ECH0:ECAB 00               nop  
ECH0:ECAC 00               nop  
ECH0:ECAD 00               nop  
ECH0:ECAE 00               nop  
ECH0:ECAF 00               nop  
ECH0:ECB0 00               nop  
ECH0:ECB1 00               nop  
ECH0:ECB2 00               nop  
ECH0:ECB3 00               nop  
ECH0:ECB4 00               nop  
ECH0:ECB5 00               nop  
ECH0:ECB6 00               nop  
ECH0:ECB7 00               nop  
ECH0:ECB8 00               nop  
ECH0:ECB9 00               nop  
ECH0:ECBA 00               nop  
ECH0:ECBB 00               nop  
ECH0:ECBC 00               nop  
ECH0:ECBD 00               nop  
ECH0:ECBE 00               nop  
ECH0:ECBF 00               nop  
ECH0:ECC0 00               nop  
ECH0:ECC1 00               nop  
ECH0:ECC2 00               nop  
ECH0:ECC3 00               nop  
ECH0:ECC4 00               nop  
ECH0:ECC5 00               nop  
ECH0:ECC6 00               nop  
ECH0:ECC7 00               nop  
ECH0:ECC8 00               nop  
ECH0:ECC9 00               nop  
ECH0:ECCA 00               nop  
ECH0:ECCB 00               nop  
ECH0:ECCC 00               nop  
ECH0:ECCD 00               nop  
ECH0:ECCE 00               nop  
ECH0:ECCF 00               nop  
ECH0:ECD0 00               nop  
ECH0:ECD1 00               nop  
ECH0:ECD2 00               nop  
ECH0:ECD3 00               nop  
ECH0:ECD4 00               nop  
ECH0:ECD5 00               nop  
ECH0:ECD6 00               nop  
ECH0:ECD7 00               nop  
ECH0:ECD8 00               nop  
ECH0:ECD9 00               nop  
ECH0:ECDA 00               nop  
ECH0:ECDB 00               nop  
ECH0:ECDC 00               nop  
ECH0:ECDD 00               nop  
ECH0:ECDE 00               nop  
ECH0:ECDF 00               nop  
ECH0:ECE0 00               nop  
ECH0:ECE1 00               nop  
ECH0:ECE2 00               nop  
ECH0:ECE3 00               nop  
ECH0:ECE4 00               nop  
ECH0:ECE5 00               nop  
ECH0:ECE6 00               nop  
ECH0:ECE7 00               nop  
ECH0:ECE8 00               nop  
ECH0:ECE9 00               nop  
ECH0:ECEA 00               nop  
ECH0:ECEB 00               nop  
ECH0:ECEC 00               nop  
ECH0:ECED 00               nop  
ECH0:ECEE 00               nop  
ECH0:ECEF 00               nop  
ECH0:ECF0 00               nop  
ECH0:ECF1 00               nop  
ECH0:ECF2 00               nop  
ECH0:ECF3 00               nop  
ECH0:ECF4 00               nop  
ECH0:ECF5 00               nop  
ECH0:ECF6 00               nop  
ECH0:ECF7 00               nop  
ECH0:ECF8 00               nop  
ECH0:ECF9 00               nop  
ECH0:ECFA 00               nop  
ECH0:ECFB 00               nop  
ECH0:ECFC 00               nop  
ECH0:ECFD 00               nop  
ECH0:ECFE 00               nop  
ECH0:ECFF 00               nop  
ECH0:ED00 00               nop  
ECH0:ED01 00               nop  
ECH0:ED02 00               nop  
ECH0:ED03 00               nop  
ECH0:ED04 00               nop  
ECH0:ED05 00               nop  
ECH0:ED06 00               nop  
ECH0:ED07 00               nop  
ECH0:ED08 00               nop  
ECH0:ED09 00               nop  
ECH0:ED0A 00               nop  
ECH0:ED0B 00               nop  
ECH0:ED0C 00               nop  
ECH0:ED0D 00               nop  
ECH0:ED0E 00               nop  
ECH0:ED0F 00               nop  
ECH0:ED10 00               nop  
ECH0:ED11 00               nop  
ECH0:ED12 00               nop  
ECH0:ED13 00               nop  
ECH0:ED14 00               nop  
ECH0:ED15 00               nop  
ECH0:ED16 00               nop  
ECH0:ED17 00               nop  
ECH0:ED18 00               nop  
ECH0:ED19 00               nop  
ECH0:ED1A 00               nop  
ECH0:ED1B 00               nop  
ECH0:ED1C 00               nop  
ECH0:ED1D 00               nop  
ECH0:ED1E 00               nop  
ECH0:ED1F 00               nop  
ECH0:ED20 00               nop  
ECH0:ED21 00               nop  
ECH0:ED22 00               nop  
ECH0:ED23 00               nop  
ECH0:ED24 00               nop  
ECH0:ED25 00               nop  
ECH0:ED26 00               nop  
ECH0:ED27 00               nop  
ECH0:ED28 00               nop  
ECH0:ED29 00               nop  
ECH0:ED2A 00               nop  
ECH0:ED2B 00               nop  
ECH0:ED2C 00               nop  
ECH0:ED2D 00               nop  
ECH0:ED2E 00               nop  
ECH0:ED2F 00               nop  
ECH0:ED30 00               nop  
ECH0:ED31 00               nop  
ECH0:ED32 00               nop  
ECH0:ED33 00               nop  
ECH0:ED34 00               nop  
ECH0:ED35 00               nop  
ECH0:ED36 00               nop  
ECH0:ED37 00               nop  
ECH0:ED38 00               nop  
ECH0:ED39 00               nop  
ECH0:ED3A 00               nop  
ECH0:ED3B 00               nop  
ECH0:ED3C 00               nop  
ECH0:ED3D 00               nop  
ECH0:ED3E 00               nop  
ECH0:ED3F 00               nop  
ECH0:ED40 00               nop  
ECH0:ED41 00               nop  
ECH0:ED42 00               nop  
ECH0:ED43 00               nop  
ECH0:ED44 00               nop  
ECH0:ED45 00               nop  
ECH0:ED46 00               nop  
ECH0:ED47 00               nop  
ECH0:ED48 00               nop  
ECH0:ED49 00               nop  
ECH0:ED4A 00               nop  
ECH0:ED4B 00               nop  
ECH0:ED4C 00               nop  
ECH0:ED4D 00               nop  
ECH0:ED4E 00               nop  
ECH0:ED4F 00               nop  
ECH0:ED50 00               nop  
ECH0:ED51 00               nop  
ECH0:ED52 00               nop  
ECH0:ED53 00               nop  
ECH0:ED54 00               nop  
ECH0:ED55 00               nop  
ECH0:ED56 00               nop  
ECH0:ED57 00               nop  
ECH0:ED58 00               nop  
ECH0:ED59 00               nop  
ECH0:ED5A 00               nop  
ECH0:ED5B 00               nop  
ECH0:ED5C 00               nop  
ECH0:ED5D 00               nop  
ECH0:ED5E 00               nop  
ECH0:ED5F 00               nop  
ECH0:ED60 00               nop  
ECH0:ED61 00               nop  
ECH0:ED62 00               nop  
ECH0:ED63 00               nop  
ECH0:ED64 00               nop  
ECH0:ED65 00               nop  
ECH0:ED66 00               nop  
ECH0:ED67 00               nop  
ECH0:ED68 00               nop  
ECH0:ED69 00               nop  
ECH0:ED6A 00               nop  
ECH0:ED6B 00               nop  
ECH0:ED6C 00               nop  
ECH0:ED6D 00               nop  
ECH0:ED6E 00               nop  
ECH0:ED6F 00               nop  
ECH0:ED70 00               nop  
ECH0:ED71 00               nop  
ECH0:ED72 00               nop  
ECH0:ED73 00               nop  
ECH0:ED74 00               nop  
ECH0:ED75 00               nop  
ECH0:ED76 00               nop  
ECH0:ED77 00               nop  
ECH0:ED78 00               nop  
ECH0:ED79 00               nop  
ECH0:ED7A 00               nop  
ECH0:ED7B 00               nop  
ECH0:ED7C 00               nop  
ECH0:ED7D 00               nop  
ECH0:ED7E 00               nop  
ECH0:ED7F 00               nop  
ECH0:ED80 00               nop  
ECH0:ED81 00               nop  
ECH0:ED82 00               nop  
ECH0:ED83 00               nop  
ECH0:ED84 00               nop  
ECH0:ED85 00               nop  
ECH0:ED86 00               nop  
ECH0:ED87 00               nop  
ECH0:ED88 00               nop  
ECH0:ED89 00               nop  
ECH0:ED8A 00               nop  
ECH0:ED8B 00               nop  
ECH0:ED8C 00               nop  
ECH0:ED8D 00               nop  
ECH0:ED8E 00               nop  
ECH0:ED8F 00               nop  
ECH0:ED90 00               nop  
ECH0:ED91 00               nop  
ECH0:ED92 00               nop  
ECH0:ED93 00               nop  
ECH0:ED94 00               nop  
ECH0:ED95 00               nop  
ECH0:ED96 00               nop  
ECH0:ED97 00               nop  
ECH0:ED98 00               nop  
ECH0:ED99 00               nop  
ECH0:ED9A 00               nop  
ECH0:ED9B 00               nop  
ECH0:ED9C 00               nop  
ECH0:ED9D 00               nop  
ECH0:ED9E 00               nop  
ECH0:ED9F 00               nop  
ECH0:EDA0 00               nop  
ECH0:EDA1 00               nop  
ECH0:EDA2 00               nop  
ECH0:EDA3 00               nop  
ECH0:EDA4 00               nop  
ECH0:EDA5 00               nop  
ECH0:EDA6 00               nop  
ECH0:EDA7 00               nop  
ECH0:EDA8 00               nop  
ECH0:EDA9 00               nop  
ECH0:EDAA 00               nop  
ECH0:EDAB 00               nop  
ECH0:EDAC 00               nop  
ECH0:EDAD 00               nop  
ECH0:EDAE 00               nop  
ECH0:EDAF 00               nop  
ECH0:EDB0 00               nop  
ECH0:EDB1 00               nop  
ECH0:EDB2 00               nop  
ECH0:EDB3 00               nop  
ECH0:EDB4 00               nop  
ECH0:EDB5 00               nop  
ECH0:EDB6 00               nop  
ECH0:EDB7 00               nop  
ECH0:EDB8 00               nop  
ECH0:EDB9 00               nop  
ECH0:EDBA 00               nop  
ECH0:EDBB 00               nop  
ECH0:EDBC 00               nop  
ECH0:EDBD 00               nop  
ECH0:EDBE 00               nop  
ECH0:EDBF 00               nop  
ECH0:EDC0 00               nop  
ECH0:EDC1 00               nop  
ECH0:EDC2 00               nop  
ECH0:EDC3 00               nop  
ECH0:EDC4 00               nop  
ECH0:EDC5 00               nop  
ECH0:EDC6 00               nop  
ECH0:EDC7 00               nop  
ECH0:EDC8 00               nop  
ECH0:EDC9 00               nop  
ECH0:EDCA 00               nop  
ECH0:EDCB 00               nop  
ECH0:EDCC 00               nop  
ECH0:EDCD 00               nop  
ECH0:EDCE 00               nop  
ECH0:EDCF 00               nop  
ECH0:EDD0 00               nop  
ECH0:EDD1 00               nop  
ECH0:EDD2 00               nop  
ECH0:EDD3 00               nop  
ECH0:EDD4 00               nop  
ECH0:EDD5 00               nop  
ECH0:EDD6 00               nop  
ECH0:EDD7 00               nop  
ECH0:EDD8 00               nop  
ECH0:EDD9 00               nop  
ECH0:EDDA 00               nop  
ECH0:EDDB 00               nop  
ECH0:EDDC 00               nop  
ECH0:EDDD 00               nop  
ECH0:EDDE 00               nop  
ECH0:EDDF 00               nop  
ECH0:EDE0 00               nop  
ECH0:EDE1 00               nop  
ECH0:EDE2 00               nop  
ECH0:EDE3 00               nop  
ECH0:EDE4 00               nop  
ECH0:EDE5 00               nop  
ECH0:EDE6 00               nop  
ECH0:EDE7 00               nop  
ECH0:EDE8 00               nop  
ECH0:EDE9 00               nop  
ECH0:EDEA 00               nop  
ECH0:EDEB 00               nop  
ECH0:EDEC 00               nop  
ECH0:EDED 00               nop  
ECH0:EDEE 00               nop  
ECH0:EDEF 00               nop  
ECH0:EDF0 00               nop  
ECH0:EDF1 00               nop  
ECH0:EDF2 00               nop  
ECH0:EDF3 00               nop  
ECH0:EDF4 00               nop  
ECH0:EDF5 00               nop  
ECH0:EDF6 00               nop  
ECH0:EDF7 00               nop  
ECH0:EDF8 00               nop  
ECH0:EDF9 00               nop  
ECH0:EDFA 00               nop  
ECH0:EDFB 00               nop  
ECH0:EDFC 00               nop  
ECH0:EDFD 00               nop  
ECH0:EDFE 00               nop  
ECH0:EDFF 00               nop  
ECH0:EE00 00               nop  
ECH0:EE01 00               nop  
ECH0:EE02 00               nop  
ECH0:EE03 00               nop  
ECH0:EE04 00               nop  
ECH0:EE05 00               nop  
ECH0:EE06 00               nop  
ECH0:EE07 00               nop  
ECH0:EE08 00               nop  
ECH0:EE09 00               nop  
ECH0:EE0A 00               nop  
ECH0:EE0B 00               nop  
ECH0:EE0C 00               nop  
ECH0:EE0D 00               nop  
ECH0:EE0E 00               nop  
ECH0:EE0F 00               nop  
ECH0:EE10 00               nop  
ECH0:EE11 00               nop  
ECH0:EE12 00               nop  
ECH0:EE13 00               nop  
ECH0:EE14 00               nop  
ECH0:EE15 00               nop  
ECH0:EE16 00               nop  
ECH0:EE17 00               nop  
ECH0:EE18 00               nop  
ECH0:EE19 00               nop  
ECH0:EE1A 00               nop  
ECH0:EE1B 00               nop  
ECH0:EE1C 00               nop  
ECH0:EE1D 00               nop  
ECH0:EE1E 00               nop  
ECH0:EE1F 00               nop  
ECH0:EE20 00               nop  
ECH0:EE21 00               nop  
ECH0:EE22 00               nop  
ECH0:EE23 00               nop  
ECH0:EE24 00               nop  
ECH0:EE25 00               nop  
ECH0:EE26 00               nop  
ECH0:EE27 00               nop  
ECH0:EE28 00               nop  
ECH0:EE29 00               nop  
ECH0:EE2A 00               nop  
ECH0:EE2B 00               nop  
ECH0:EE2C 00               nop  
ECH0:EE2D 00               nop  
ECH0:EE2E 00               nop  
ECH0:EE2F 00               nop  
ECH0:EE30 00               nop  
ECH0:EE31 00               nop  
ECH0:EE32 00               nop  
ECH0:EE33 00               nop  
ECH0:EE34 00               nop  
ECH0:EE35 00               nop  
ECH0:EE36 00               nop  
ECH0:EE37 00               nop  
ECH0:EE38 00               nop  
ECH0:EE39 00               nop  
ECH0:EE3A 00               nop  
ECH0:EE3B 00               nop  
ECH0:EE3C 00               nop  
ECH0:EE3D 00               nop  
ECH0:EE3E 00               nop  
ECH0:EE3F 00               nop  
ECH0:EE40 00               nop  
ECH0:EE41 00               nop  
ECH0:EE42 00               nop  
ECH0:EE43 00               nop  
ECH0:EE44 00               nop  
ECH0:EE45 00               nop  
ECH0:EE46 00               nop  
ECH0:EE47 00               nop  
ECH0:EE48 00               nop  
ECH0:EE49 00               nop  
ECH0:EE4A 00               nop  
ECH0:EE4B 00               nop  
ECH0:EE4C 00               nop  
ECH0:EE4D 00               nop  
ECH0:EE4E 00               nop  
ECH0:EE4F 00               nop  
ECH0:EE50 00               nop  
ECH0:EE51 00               nop  
ECH0:EE52 00               nop  
ECH0:EE53 00               nop  
ECH0:EE54 00               nop  
ECH0:EE55 00               nop  
ECH0:EE56 00               nop  
ECH0:EE57 00               nop  
ECH0:EE58 00               nop  
ECH0:EE59 00               nop  
ECH0:EE5A 00               nop  
ECH0:EE5B 00               nop  
ECH0:EE5C 00               nop  
ECH0:EE5D 00               nop  
ECH0:EE5E 00               nop  
ECH0:EE5F 00               nop  
ECH0:EE60 00               nop  
ECH0:EE61 00               nop  
ECH0:EE62 00               nop  
ECH0:EE63 00               nop  
ECH0:EE64 00               nop  
ECH0:EE65 00               nop  
ECH0:EE66 00               nop  
ECH0:EE67 00               nop  
ECH0:EE68 00               nop  
ECH0:EE69 00               nop  
ECH0:EE6A 00               nop  
ECH0:EE6B 00               nop  
ECH0:EE6C 00               nop  
ECH0:EE6D 00               nop  
ECH0:EE6E 00               nop  
ECH0:EE6F 00               nop  
ECH0:EE70 00               nop  
ECH0:EE71 00               nop  
ECH0:EE72 00               nop  
ECH0:EE73 00               nop  
ECH0:EE74 00               nop  
ECH0:EE75 00               nop  
ECH0:EE76 00               nop  
ECH0:EE77 00               nop  
ECH0:EE78 00               nop  
ECH0:EE79 00               nop  
ECH0:EE7A 00               nop  
ECH0:EE7B 00               nop  
ECH0:EE7C 00               nop  
ECH0:EE7D 00               nop  
ECH0:EE7E 00               nop  
ECH0:EE7F 00               nop  
ECH0:EE80 00               nop  
ECH0:EE81 00               nop  
ECH0:EE82 00               nop  
ECH0:EE83 00               nop  
ECH0:EE84 00               nop  
ECH0:EE85 00               nop  
ECH0:EE86 00               nop  
ECH0:EE87 00               nop  
ECH0:EE88 00               nop  
ECH0:EE89 00               nop  
ECH0:EE8A 00               nop  
ECH0:EE8B 00               nop  
ECH0:EE8C 00               nop  
ECH0:EE8D 00               nop  
ECH0:EE8E 00               nop  
ECH0:EE8F 00               nop  
ECH0:EE90 00               nop  
ECH0:EE91 00               nop  
ECH0:EE92 00               nop  
ECH0:EE93 00               nop  
ECH0:EE94 00               nop  
ECH0:EE95 00               nop  
ECH0:EE96 00               nop  
ECH0:EE97 00               nop  
ECH0:EE98 00               nop  
ECH0:EE99 00               nop  
ECH0:EE9A 00               nop  
ECH0:EE9B 00               nop  
ECH0:EE9C 00               nop  
ECH0:EE9D 00               nop  
ECH0:EE9E 00               nop  
ECH0:EE9F 00               nop  
ECH0:EEA0 00               nop  
ECH0:EEA1 00               nop  
ECH0:EEA2 00               nop  
ECH0:EEA3 00               nop  
ECH0:EEA4 00               nop  
ECH0:EEA5 00               nop  
ECH0:EEA6 00               nop  
ECH0:EEA7 00               nop  
ECH0:EEA8 00               nop  
ECH0:EEA9 00               nop  
ECH0:EEAA 00               nop  
ECH0:EEAB 00               nop  
ECH0:EEAC 00               nop  
ECH0:EEAD 00               nop  
ECH0:EEAE 00               nop  
ECH0:EEAF 00               nop  
ECH0:EEB0 00               nop  
ECH0:EEB1 00               nop  
ECH0:EEB2 00               nop  
ECH0:EEB3 00               nop  
ECH0:EEB4 00               nop  
ECH0:EEB5 00               nop  
ECH0:EEB6 00               nop  
ECH0:EEB7 00               nop  
ECH0:EEB8 00               nop  
ECH0:EEB9 00               nop  
ECH0:EEBA 00               nop  
ECH0:EEBB 00               nop  
ECH0:EEBC 00               nop  
ECH0:EEBD 00               nop  
ECH0:EEBE 00               nop  
ECH0:EEBF 00               nop  
ECH0:EEC0 00               nop  
ECH0:EEC1 00               nop  
ECH0:EEC2 00               nop  
ECH0:EEC3 00               nop  
ECH0:EEC4 00               nop  
ECH0:EEC5 00               nop  
ECH0:EEC6 00               nop  
ECH0:EEC7 00               nop  
ECH0:EEC8 00               nop  
ECH0:EEC9 00               nop  
ECH0:EECA 00               nop  
ECH0:EECB 00               nop  
ECH0:EECC 00               nop  
ECH0:EECD 00               nop  
ECH0:EECE 00               nop  
ECH0:EECF 00               nop  
ECH0:EED0 00               nop  
ECH0:EED1 00               nop  
ECH0:EED2 00               nop  
ECH0:EED3 00               nop  
ECH0:EED4 00               nop  
ECH0:EED5 00               nop  
ECH0:EED6 00               nop  
ECH0:EED7 00               nop  
ECH0:EED8 00               nop  
ECH0:EED9 00               nop  
ECH0:EEDA 00               nop  
ECH0:EEDB 00               nop  
ECH0:EEDC 00               nop  
ECH0:EEDD 00               nop  
ECH0:EEDE 00               nop  
ECH0:EEDF 00               nop  
ECH0:EEE0 00               nop  
ECH0:EEE1 00               nop  
ECH0:EEE2 00               nop  
ECH0:EEE3 00               nop  
ECH0:EEE4 00               nop  
ECH0:EEE5 00               nop  
ECH0:EEE6 00               nop  
ECH0:EEE7 00               nop  
ECH0:EEE8 00               nop  
ECH0:EEE9 00               nop  
ECH0:EEEA 00               nop  
ECH0:EEEB 00               nop  
ECH0:EEEC 00               nop  
ECH0:EEED 00               nop  
ECH0:EEEE 00               nop  
ECH0:EEEF 00               nop  
ECH0:EEF0 00               nop  
ECH0:EEF1 00               nop  
ECH0:EEF2 00               nop  
ECH0:EEF3 00               nop  
ECH0:EEF4 00               nop  
ECH0:EEF5 00               nop  
ECH0:EEF6 00               nop  
ECH0:EEF7 00               nop  
ECH0:EEF8 00               nop  
ECH0:EEF9 00               nop  
ECH0:EEFA 00               nop  
ECH0:EEFB 00               nop  
ECH0:EEFC 00               nop  
ECH0:EEFD 00               nop  
ECH0:EEFE 00               nop  
ECH0:EEFF 00               nop  
ECH0:EF00 00               nop  
ECH0:EF01 00               nop  
ECH0:EF02 00               nop  
ECH0:EF03 00               nop  
ECH0:EF04 00               nop  
ECH0:EF05 00               nop  
ECH0:EF06 00               nop  
ECH0:EF07 00               nop  
ECH0:EF08 00               nop  
ECH0:EF09 00               nop  
ECH0:EF0A 00               nop  
ECH0:EF0B 00               nop  
ECH0:EF0C 00               nop  
ECH0:EF0D 00               nop  
ECH0:EF0E 00               nop  
ECH0:EF0F 00               nop  
ECH0:EF10 00               nop  
ECH0:EF11 00               nop  
ECH0:EF12 00               nop  
ECH0:EF13 00               nop  
ECH0:EF14 00               nop  
ECH0:EF15 00               nop  
ECH0:EF16 00               nop  
ECH0:EF17 00               nop  
ECH0:EF18 00               nop  
ECH0:EF19 00               nop  
ECH0:EF1A 00               nop  
ECH0:EF1B 00               nop  
ECH0:EF1C 00               nop  
ECH0:EF1D 00               nop  
ECH0:EF1E 00               nop  
ECH0:EF1F 00               nop  
ECH0:EF20 00               nop  
ECH0:EF21 00               nop  
ECH0:EF22 00               nop  
ECH0:EF23 00               nop  
ECH0:EF24 00               nop  
ECH0:EF25 00               nop  
ECH0:EF26 00               nop  
ECH0:EF27 00               nop  
ECH0:EF28 00               nop  
ECH0:EF29 00               nop  
ECH0:EF2A 00               nop  
ECH0:EF2B 00               nop  
ECH0:EF2C 00               nop  
ECH0:EF2D 00               nop  
ECH0:EF2E 00               nop  
ECH0:EF2F 00               nop  
ECH0:EF30 00               nop  
ECH0:EF31 00               nop  
ECH0:EF32 00               nop  
ECH0:EF33 00               nop  
ECH0:EF34 00               nop  
ECH0:EF35 00               nop  
ECH0:EF36 00               nop  
ECH0:EF37 00               nop  
ECH0:EF38 00               nop  
ECH0:EF39 00               nop  
ECH0:EF3A 00               nop  
ECH0:EF3B 00               nop  
ECH0:EF3C 00               nop  
ECH0:EF3D 00               nop  
ECH0:EF3E 00               nop  
ECH0:EF3F 00               nop  
ECH0:EF40 00               nop  
ECH0:EF41 00               nop  
ECH0:EF42 00               nop  
ECH0:EF43 00               nop  
ECH0:EF44 00               nop  
ECH0:EF45 00               nop  
ECH0:EF46 00               nop  
ECH0:EF47 00               nop  
ECH0:EF48 00               nop  
ECH0:EF49 00               nop  
ECH0:EF4A 00               nop  
ECH0:EF4B 00               nop  
ECH0:EF4C 00               nop  
ECH0:EF4D 00               nop  
ECH0:EF4E 00               nop  
ECH0:EF4F 00               nop  
ECH0:EF50 00               nop  
ECH0:EF51 00               nop  
ECH0:EF52 00               nop  
ECH0:EF53 00               nop  
ECH0:EF54 00               nop  
ECH0:EF55 00               nop  
ECH0:EF56 00               nop  
ECH0:EF57 00               nop  
ECH0:EF58 00               nop  
ECH0:EF59 00               nop  
ECH0:EF5A 00               nop  
ECH0:EF5B 00               nop  
ECH0:EF5C 00               nop  
ECH0:EF5D 00               nop  
ECH0:EF5E 00               nop  
ECH0:EF5F 00               nop  
ECH0:EF60 00               nop  
ECH0:EF61 00               nop  
ECH0:EF62 00               nop  
ECH0:EF63 00               nop  
ECH0:EF64 00               nop  
ECH0:EF65 00               nop  
ECH0:EF66 00               nop  
ECH0:EF67 00               nop  
ECH0:EF68 00               nop  
ECH0:EF69 00               nop  
ECH0:EF6A 00               nop  
ECH0:EF6B 00               nop  
ECH0:EF6C 00               nop  
ECH0:EF6D 00               nop  
ECH0:EF6E 00               nop  
ECH0:EF6F 00               nop  
ECH0:EF70 00               nop  
ECH0:EF71 00               nop  
ECH0:EF72 00               nop  
ECH0:EF73 00               nop  
ECH0:EF74 00               nop  
ECH0:EF75 00               nop  
ECH0:EF76 00               nop  
ECH0:EF77 00               nop  
ECH0:EF78 00               nop  
ECH0:EF79 00               nop  
ECH0:EF7A 00               nop  
ECH0:EF7B 00               nop  
ECH0:EF7C 00               nop  
ECH0:EF7D 00               nop  
ECH0:EF7E 00               nop  
ECH0:EF7F 00               nop  
ECH0:EF80 00               nop  
ECH0:EF81 00               nop  
ECH0:EF82 00               nop  
ECH0:EF83 00               nop  
ECH0:EF84 00               nop  
ECH0:EF85 00               nop  
ECH0:EF86 00               nop  
ECH0:EF87 00               nop  
ECH0:EF88 00               nop  
ECH0:EF89 00               nop  
ECH0:EF8A 00               nop  
ECH0:EF8B 00               nop  
ECH0:EF8C 00               nop  
ECH0:EF8D 00               nop  
ECH0:EF8E 00               nop  
ECH0:EF8F 00               nop  
ECH0:EF90 00               nop  
ECH0:EF91 00               nop  
ECH0:EF92 00               nop  
ECH0:EF93 00               nop  
ECH0:EF94 00               nop  
ECH0:EF95 00               nop  
ECH0:EF96 00               nop  
ECH0:EF97 00               nop  
ECH0:EF98 00               nop  
ECH0:EF99 00               nop  
ECH0:EF9A 00               nop  
ECH0:EF9B 00               nop  
ECH0:EF9C 00               nop  
ECH0:EF9D 00               nop  
ECH0:EF9E 00               nop  
ECH0:EF9F 00               nop  
ECH0:EFA0 00               nop  
ECH0:EFA1 00               nop  
ECH0:EFA2 00               nop  
ECH0:EFA3 00               nop  
ECH0:EFA4 00               nop  
ECH0:EFA5 00               nop  
ECH0:EFA6 00               nop  
ECH0:EFA7 00               nop  
ECH0:EFA8 00               nop  
ECH0:EFA9 00               nop  
ECH0:EFAA 00               nop  
ECH0:EFAB 00               nop  
ECH0:EFAC 00               nop  
ECH0:EFAD 00               nop  
ECH0:EFAE 00               nop  
ECH0:EFAF 00               nop  
ECH0:EFB0 00               nop  
ECH0:EFB1 00               nop  
ECH0:EFB2 00               nop  
ECH0:EFB3 00               nop  
ECH0:EFB4 00               nop  
ECH0:EFB5 00               nop  
ECH0:EFB6 00               nop  
ECH0:EFB7 00               nop  
ECH0:EFB8 00               nop  
ECH0:EFB9 00               nop  
ECH0:EFBA 00               nop  
ECH0:EFBB 00               nop  
ECH0:EFBC 00               nop  
ECH0:EFBD 00               nop  
ECH0:EFBE 00               nop  
ECH0:EFBF 00               nop  
ECH0:EFC0 00               nop  
ECH0:EFC1 00               nop  
ECH0:EFC2 00               nop  
ECH0:EFC3 00               nop  
ECH0:EFC4 00               nop  
ECH0:EFC5 00               nop  
ECH0:EFC6 00               nop  
ECH0:EFC7 00               nop  
ECH0:EFC8 00               nop  
ECH0:EFC9 00               nop  
ECH0:EFCA 00               nop  
ECH0:EFCB 00               nop  
ECH0:EFCC 00               nop  
ECH0:EFCD 00               nop  
ECH0:EFCE 00               nop  
ECH0:EFCF 00               nop  
ECH0:EFD0 00               nop  
ECH0:EFD1 00               nop  
ECH0:EFD2 00               nop  
ECH0:EFD3 00               nop  
ECH0:EFD4 00               nop  
ECH0:EFD5 00               nop  
ECH0:EFD6 00               nop  
ECH0:EFD7 00               nop  
ECH0:EFD8 00               nop  
ECH0:EFD9 00               nop  
ECH0:EFDA 00               nop  
ECH0:EFDB 00               nop  
ECH0:EFDC 00               nop  
ECH0:EFDD 00               nop  
ECH0:EFDE 00               nop  
ECH0:EFDF 00               nop  
ECH0:EFE0 00               nop  
ECH0:EFE1 00               nop  
ECH0:EFE2 00               nop  
ECH0:EFE3 00               nop  
ECH0:EFE4 00               nop  
ECH0:EFE5 00               nop  
ECH0:EFE6 00               nop  
ECH0:EFE7 00               nop  
ECH0:EFE8 00               nop  
ECH0:EFE9 00               nop  
ECH0:EFEA 00               nop  
ECH0:EFEB 00               nop  
ECH0:EFEC 00               nop  
ECH0:EFED 00               nop  
ECH0:EFEE 00               nop  
ECH0:EFEF 00               nop  
ECH0:EFF0 00               nop  
ECH0:EFF1 00               nop  
ECH0:EFF2 00               nop  
ECH0:EFF3 00               nop  
ECH0:EFF4 00               nop  
ECH0:EFF5 00               nop  
ECH0:EFF6 00               nop  
ECH0:EFF7 00               nop  
ECH0:EFF8 00               nop  
ECH0:EFF9 00               nop  
ECH0:EFFA 00               nop  
ECH0:EFFB 00               nop  
ECH0:EFFC 00               nop  
ECH0:EFFD 00               nop  
ECH0:EFFE 00               nop  
ECH0:EFFF 00               nop  
ECH1:F000 89               adc  c
ECH1:F001 98               sbc  b
ECH1:F002 21 B3 C0         ld   hl,$C0B3
ECH1:F005 78               ld   a,b
ECH1:F006 63               ld   h,e
ECH1:F007 DA 97 0F         jp   c,$0F97
ECH1:F00A 6C               ld   l,h
ECH1:F00B 06 D6            ld   b,$D6
ECH1:F00D 86               add  [hl]
ECH1:F00E 34               inc  [hl]
ECH1:F00F 86               add  [hl]
ECH1:F010 6C               ld   l,h
ECH1:F011 20 0C            jr   nz,$F01F
ECH1:F013 06 94            ld   b,$94
ECH1:F015 DD               db   $DD ; undefined opcode
ECH1:F016 E0 D2            ldh  [$FFD2],a
ECH1:F018 CF               rst  $08
ECH1:F019 0D               dec  c
ECH1:F01A C8               ret  z
ECH1:F01B 1D               dec  e
ECH1:F01C 0F               rrca 
ECH1:F01D 07               rlca 
ECH1:F01E 1E DF            ld   e,$DF
ECH1:F020 F9               ld   sp,hl
ECH1:F021 4C               ld   c,h
ECH1:F022 B0               or   b
ECH1:F023 54               ld   d,h
ECH1:F024 44               ld   b,h
ECH1:F025 A0               and  b
ECH1:F026 B0               or   b
ECH1:F027 C0               ret  nz
ECH1:F028 3D               dec  a
ECH1:F029 1D               dec  e
ECH1:F02A 1B               dec  de
ECH1:F02B 1E AD            ld   e,$AD
ECH1:F02D 1D               dec  e
ECH1:F02E 8B               adc  e
ECH1:F02F C5               push bc
ECH1:F030 F0 26            ldh  a,[$FF26]
ECH1:F032 FA D0 B6         ld   a,[$B6D0]
ECH1:F035 FE 11            cp   a,$11
ECH1:F037 51               ld   d,c
ECH1:F038 CF               rst  $08
ECH1:F039 AF               xor  a
ECH1:F03A 0B               dec  bc
ECH1:F03B 16 DD            ld   d,$DD
ECH1:F03D 0C               inc  c
ECH1:F03E 5F               ld   e,a
ECH1:F03F 99               sbc  c
ECH1:F040 5A               ld   e,d
ECH1:F041 82               add  d
ECH1:F042 7D               ld   a,l
ECH1:F043 60               ld   h,b
ECH1:F044 F3               di   
ECH1:F045 94               sub  h
ECH1:F046 78               ld   a,b
ECH1:F047 FC               db   $FC ; undefined opcode
ECH1:F048 3F               ccf  
ECH1:F049 AE               xor  [hl]
ECH1:F04A 6B               ld   l,e
ECH1:F04B 64               ld   h,h
ECH1:F04C AE               xor  [hl]
ECH1:F04D 63               ld   h,e
ECH1:F04E 5B               ld   e,e
ECH1:F04F 3E F5            ld   a,$F5
ECH1:F051 F0 F0            ldh  a,[$FFF0]
ECH1:F053 71               ld   [hl],c
ECH1:F054 6B               ld   l,e
ECH1:F055 BE               cp   [hl]
ECH1:F056 50               ld   d,b
ECH1:F057 F0 07            ldh  a,[$FF07]
ECH1:F059 0C               inc  c
ECH1:F05A 6D               ld   l,l
ECH1:F05B 7B               ld   a,e
ECH1:F05C 8D               adc  l
ECH1:F05D 4E               ld   c,[hl]
ECH1:F05E 19               add  hl,de
ECH1:F05F 77               ld   [hl],a
ECH1:F060 8E               adc  [hl]
ECH1:F061 78               ld   a,b
ECH1:F062 F0 E3            ldh  a,[$FFE3]
ECH1:F064 32               ldd  [hl],a
ECH1:F065 73               ld   [hl],e
ECH1:F066 D6 F3            sub  a,$F3
ECH1:F068 A5               and  l
ECH1:F069 11 06 35         ld   de,$3506
ECH1:F06C E1               pop  hl
ECH1:F06D 02               ld   [bc],a
ECH1:F06E 4F               ld   c,a
ECH1:F06F 0F               rrca 
ECH1:F070 D9               reti 
ECH1:F071 30 80            jr   nc,$EFF3
ECH1:F073 E5               push hl
ECH1:F074 B9               cp   c
ECH1:F075 F2               ld   a,[$ff00+c]
ECH1:F076 B2               or   d
ECH1:F077 E0 05            ldh  [$FF05],a
ECH1:F079 A6               and  [hl]
ECH1:F07A 07               rlca 
ECH1:F07B 37               scf  
ECH1:F07C 2C               inc  l
ECH1:F07D 17               rla  
ECH1:F07E 5B               ld   e,e
ECH1:F07F 2D               dec  l
ECH1:F080 F1               pop  af
ECH1:F081 51               ld   d,c
ECH1:F082 F6 B2            or   a,$B2
ECH1:F084 F4               db   $F4 ; undefined opcode
ECH1:F085 C1               pop  bc
ECH1:F086 68               ld   l,b
ECH1:F087 C0               ret  nz
ECH1:F088 0F               rrca 
ECH1:F089 2F               cpl  
ECH1:F08A 3D               dec  a
ECH1:F08B 2D               dec  l
ECH1:F08C 8F               adc  a
ECH1:F08D 57               ld   d,a
ECH1:F08E 1E 3F            ld   e,$3F
ECH1:F090 80               add  b
ECH1:F091 DA F2 A2         jp   c,$A2F2
ECH1:F094 50               ld   d,b
ECH1:F095 52               ld   d,d
ECH1:F096 E8 64            add  sp,$64
ECH1:F098 33               inc  sp
ECH1:F099 C9               ret  
ECH1:F09A 7A               ld   a,d
ECH1:F09B 1E 6A            ld   e,$6A
ECH1:F09D 17               rla  
ECH1:F09E 1C               inc  e
ECH1:F09F CB F5            set  6,l
ECH1:F0A1 A0               and  b
ECH1:F0A2 B0               or   b
ECH1:F0A3 D0               ret  nc
ECH1:F0A4 E1               pop  hl
ECH1:F0A5 B1               or   c
ECH1:F0A6 D8               ret  c
ECH1:F0A7 70               ld   [hl],b
ECH1:F0A8 AF               xor  a
ECH1:F0A9 03               inc  bc
ECH1:F0AA 0F               rrca 
ECH1:F0AB 09               add  hl,bc
ECH1:F0AC 4E               ld   c,[hl]
ECH1:F0AD 07               rlca 
ECH1:F0AE 87               add  a
ECH1:F0AF 87               add  a
ECH1:F0B0 C0               ret  nz
ECH1:F0B1 60               ld   h,b
ECH1:F0B2 40               ld   b,b
ECH1:F0B3 10 E6            <corrupted stop>
ECH1:F0B5 61               ld   h,c
ECH1:F0B6 90               sub  b
ECH1:F0B7 B1               or   c
ECH1:F0B8 6B               ld   l,e
ECH1:F0B9 2F               cpl  
ECH1:F0BA 56               ld   d,[hl]
ECH1:F0BB 9F               sbc  a
ECH1:F0BC 0E 01            ld   c,$01
ECH1:F0BE 12               ld   [de],a
ECH1:F0BF 02               ld   [bc],a
ECH1:F0C0 E2               ld   [$ff00+c],a
ECH1:F0C1 5B               ld   e,e
ECH1:F0C2 F8 7C            ld   hl,sp+$7C
ECH1:F0C4 A4               and  h
ECH1:F0C5 E1               pop  hl
ECH1:F0C6 F4               db   $F4 ; undefined opcode
ECH1:F0C7 F5               push af
ECH1:F0C8 2B               dec  hl
ECH1:F0C9 86               add  [hl]
ECH1:F0CA 4E               ld   c,[hl]
ECH1:F0CB 05               dec  b
ECH1:F0CC AB               xor  e
ECH1:F0CD 40               ld   b,b
ECH1:F0CE 1D               dec  e
ECH1:F0CF 85               add  l
ECH1:F0D0 30 B5            jr   nc,$F087
ECH1:F0D2 F0 52            ldh  a,[$FF52]
ECH1:F0D4 78               ld   a,b
ECH1:F0D5 68               ld   l,b
ECH1:F0D6 D5               push de
ECH1:F0D7 F5               push af
ECH1:F0D8 7D               ld   a,l
ECH1:F0D9 07               rlca 
ECH1:F0DA 5D               ld   e,l
ECH1:F0DB 98               sbc  b
ECH1:F0DC F9               ld   sp,hl
ECH1:F0DD 6F               ld   l,a
ECH1:F0DE 9D               sbc  l
ECH1:F0DF CE 30            adc  a,$30
ECH1:F0E1 52               ld   d,d
ECH1:F0E2 E1               pop  hl
ECH1:F0E3 82               add  d
ECH1:F0E4 90               sub  b
ECH1:F0E5 70               ld   [hl],b
ECH1:F0E6 90               sub  b
ECH1:F0E7 C1               pop  bc
ECH1:F0E8 0F               rrca 
ECH1:F0E9 E7               rst  $20
ECH1:F0EA 3B               dec  sp
ECH1:F0EB AF               xor  a
ECH1:F0EC 0D               dec  c
ECH1:F0ED FB               ei   
ECH1:F0EE 44               ld   b,h
ECH1:F0EF DB               db   $DB ; undefined opcode
ECH1:F0F0 D3               db   $D3 ; undefined opcode
ECH1:F0F1 F5               push af
ECH1:F0F2 93               sub  e
ECH1:F0F3 E0 9A            ldh  [$FF9A],a
ECH1:F0F5 61               ld   h,c
ECH1:F0F6 F0 B8            ldh  a,[$FFB8]
ECH1:F0F8 03               inc  bc
ECH1:F0F9 02               ld   [bc],a
ECH1:F0FA 23               inc  hl
ECH1:F0FB 75               ld   [hl],l
ECH1:F0FC 09               add  hl,bc
ECH1:F0FD 4C               ld   c,h
ECH1:F0FE 55               ld   d,l
ECH1:F0FF 4A               ld   c,d
ECH1:F100 4C               ld   c,h
ECH1:F101 0E 5B            ld   c,$5B
ECH1:F103 60               ld   h,b
ECH1:F104 8D               adc  l
ECH1:F105 87               add  a
ECH1:F106 13               inc  de
ECH1:F107 C7               rst  $00
ECH1:F108 F2               ld   a,[$ff00+c]
ECH1:F109 F0 F0            ldh  a,[$FFF0]
ECH1:F10B 50               ld   d,b
ECH1:F10C F0 B2            ldh  a,[$FFB2]
ECH1:F10E 82               add  d
ECH1:F10F 72               ld   [hl],d
ECH1:F110 61               ld   h,c
ECH1:F111 46               ld   b,[hl]
ECH1:F112 1A               ld   a,[de]
ECH1:F113 2F               cpl  
ECH1:F114 17               rla  
ECH1:F115 EF               rst  $28
ECH1:F116 1C               inc  e
ECH1:F117 27               daa  
ECH1:F118 CB 91            res  2,c
ECH1:F11A F0 C0            ldh  a,[$FFC0]
ECH1:F11C AA               xor  d
ECH1:F11D F1               pop  af
ECH1:F11E E8 15            add  sp,$15
ECH1:F120 1F               rra  
ECH1:F121 5F               ld   e,a
ECH1:F122 8C               adc  h
ECH1:F123 CB 47            bit  0,a
ECH1:F125 FD               db   $FD ; undefined opcode
ECH1:F126 0F               rrca 
ECH1:F127 0F               rrca 
ECH1:F128 FA 79 23         ld   a,[$2379]
ECH1:F12B 96               sub  [hl]
ECH1:F12C DC 73 78         call c,$7873
ECH1:F12F A2               and  d
ECH1:F130 0F               rrca 
ECH1:F131 56               ld   d,[hl]
ECH1:F132 E6 CC            and  a,$CC
ECH1:F134 0C               inc  c
ECH1:F135 07               rlca 
ECH1:F136 2F               cpl  
ECH1:F137 0F               rrca 
ECH1:F138 B4               or   h
ECH1:F139 F0 30            ldh  a,[$FF30]
ECH1:F13B 77               ld   [hl],a
ECH1:F13C B0               or   b
ECH1:F13D 40               ld   b,b
ECH1:F13E 63               ld   h,e
ECH1:F13F 31 29 46         ld   sp,$4629
ECH1:F142 4B               ld   c,e
ECH1:F143 8F               adc  a
ECH1:F144 4E               ld   c,[hl]
ECH1:F145 8B               adc  e
ECH1:F146 0F               rrca 
ECH1:F147 BC               cp   h
ECH1:F148 FC               db   $FC ; undefined opcode
ECH1:F149 44               ld   b,h
ECH1:F14A 90               sub  b
ECH1:F14B FD               db   $FD ; undefined opcode
ECH1:F14C D3               db   $D3 ; undefined opcode
ECH1:F14D FE E9            cp   a,$E9
ECH1:F14F 78               ld   a,b
ECH1:F150 1F               rra  
ECH1:F151 5A               ld   e,d
ECH1:F152 86               add  [hl]
ECH1:F153 84               add  h
ECH1:F154 2E 06            ld   l,$06
ECH1:F156 0E 14            ld   c,$14
ECH1:F158 5F               ld   e,a
ECH1:F159 D4 91 70         call nc,$7091
ECH1:F15C 9C               sbc  h
ECH1:F15D 48               ld   c,b
ECH1:F15E C1               pop  bc
ECH1:F15F 61               ld   h,c
ECH1:F160 0F               rrca 
ECH1:F161 25               dec  h
ECH1:F162 0F               rrca 
ECH1:F163 D4 39 F3         call nc,$F339
ECH1:F166 0B               dec  bc
ECH1:F167 6F               ld   l,a
ECH1:F168 BC               cp   h
ECH1:F169 32               ldd  [hl],a
ECH1:F16A F4               db   $F4 ; undefined opcode
ECH1:F16B F3               di   
ECH1:F16C 4C               ld   c,h
ECH1:F16D B6               or   [hl]
ECH1:F16E 90               sub  b
ECH1:F16F 90               sub  b
ECH1:F170 0C               inc  c
ECH1:F171 84               add  h
ECH1:F172 17               rla  
ECH1:F173 19               add  hl,de
ECH1:F174 06 03            ld   b,$03
ECH1:F176 0B               dec  bc
ECH1:F177 DB               db   $DB ; undefined opcode
ECH1:F178 62               ld   h,d
ECH1:F179 70               ld   [hl],b
ECH1:F17A F3               di   
ECH1:F17B 72               ld   [hl],d
ECH1:F17C FB               ei   
ECH1:F17D DA EA A1         jp   c,$A1EA
ECH1:F180 86               add  [hl]
ECH1:F181 B7               or   a
ECH1:F182 0E 5F            ld   c,$5F
ECH1:F184 87               add  a
ECH1:F185 83               add  e
ECH1:F186 9B               sbc  e
ECH1:F187 0F               rrca 
ECH1:F188 34               inc  [hl]
ECH1:F189 C4 E5 C9         call nz,$C9E5
ECH1:F18C 60               ld   h,b
ECH1:F18D E5               push hl
ECH1:F18E A0               and  b
ECH1:F18F E0 CF            ldh  [$FFCF],a
ECH1:F191 8C               adc  h
ECH1:F192 27               daa  
ECH1:F193 69               ld   l,c
ECH1:F194 59               ld   e,c
ECH1:F195 AA               xor  d
ECH1:F196 3E 25            ld   a,$25
ECH1:F198 91               sub  c
ECH1:F199 D3               db   $D3 ; undefined opcode
ECH1:F19A A0               and  b
ECH1:F19B 18 F1            jr   $F18E
ECH1:F19D F0 54            ldh  a,[$FF54]
ECH1:F19F A1               and  c
ECH1:F1A0 5F               ld   e,a
ECH1:F1A1 CF               rst  $08
ECH1:F1A2 8D               adc  l
ECH1:F1A3 0D               dec  c
ECH1:F1A4 0E 0F            ld   c,$0F
ECH1:F1A6 87               add  a
ECH1:F1A7 57               ld   d,a
ECH1:F1A8 58               ld   e,b
ECH1:F1A9 F1               pop  af
ECH1:F1AA DC BC 61         call c,$61BC
ECH1:F1AD F6 51            or   a,$51
ECH1:F1AF D1               pop  de
ECH1:F1B0 0D               dec  c
ECH1:F1B1 66               ld   h,[hl]
ECH1:F1B2 C5               push bc
ECH1:F1B3 05               dec  b
ECH1:F1B4 8B               adc  e
ECH1:F1B5 A9               xor  c
ECH1:F1B6 09               add  hl,bc
ECH1:F1B7 89               adc  c
ECH1:F1B8 C4 F1 0C         call nz,$0CF1
ECH1:F1BB DC 89 F3         call c,$F389
ECH1:F1BE D0               ret  nc
ECH1:F1BF 7F               ld   a,a
ECH1:F1C0 2F               cpl  
ECH1:F1C1 29               add  hl,hl
ECH1:F1C2 9E               sbc  [hl]
ECH1:F1C3 0E 8D            ld   c,$8D
ECH1:F1C5 8B               adc  e
ECH1:F1C6 28 4E            jr   z,$F216
ECH1:F1C8 CC 62 F0         call z,$F062
ECH1:F1CB C2 64 30         jp   nz,$3064
ECH1:F1CE 45               ld   b,l
ECH1:F1CF E8 E3            add  sp,-$1D
ECH1:F1D1 D5               push de
ECH1:F1D2 2F               cpl  
ECH1:F1D3 35               dec  [hl]
ECH1:F1D4 CF               rst  $08
ECH1:F1D5 AB               xor  e
ECH1:F1D6 03               inc  bc
ECH1:F1D7 2C               inc  l
ECH1:F1D8 D5               push de
ECH1:F1D9 F8 20            ld   hl,sp+$20
ECH1:F1DB B3               or   e
ECH1:F1DC 3A               ldd  a,[hl]
ECH1:F1DD 5D               ld   e,l
ECH1:F1DE F4               db   $F4 ; undefined opcode
ECH1:F1DF F1               pop  af
ECH1:F1E0 4F               ld   c,a
ECH1:F1E1 2D               dec  l
ECH1:F1E2 7D               ld   a,l
ECH1:F1E3 47               ld   b,a
ECH1:F1E4 65               ld   h,l
ECH1:F1E5 89               adc  c
ECH1:F1E6 6E               ld   l,[hl]
ECH1:F1E7 AF               xor  a
ECH1:F1E8 EC               db   $EC ; undefined opcode
ECH1:F1E9 B0               or   b
ECH1:F1EA 75               ld   [hl],l
ECH1:F1EB 76               halt 
ECH1:F1EC 21 E1 78         ld   hl,$78E1
ECH1:F1EF FD               db   $FD ; undefined opcode
ECH1:F1F0 70               ld   [hl],b
ECH1:F1F1 3B               dec  sp
ECH1:F1F2 4B               ld   c,e
ECH1:F1F3 03               inc  bc
ECH1:F1F4 57               ld   d,a
ECH1:F1F5 4F               ld   c,a
ECH1:F1F6 0F               rrca 
ECH1:F1F7 4F               ld   c,a
ECH1:F1F8 E6 36            and  a,$36
ECH1:F1FA F4               db   $F4 ; undefined opcode
ECH1:F1FB D6 EC            sub  a,$EC
ECH1:F1FD A0               and  b
ECH1:F1FE F5               push af
ECH1:F1FF F3               di   
ECH1:F200 69               ld   l,c
ECH1:F201 A6               and  [hl]
ECH1:F202 C3 AA E1         jp   $E1AA
ECH1:F205 85               add  l
ECH1:F206 E9               jp   hl
ECH1:F207 60               ld   h,b
ECH1:F208 3F               ccf  
ECH1:F209 BC               cp   h
ECH1:F20A CF               rst  $08
ECH1:F20B 1F               rra  
ECH1:F20C 4F               ld   c,a
ECH1:F20D 0B               dec  bc
ECH1:F20E B1               or   c
ECH1:F20F 4F               ld   c,a
ECH1:F210 9C               sbc  h
ECH1:F211 7A               ld   a,d
ECH1:F212 64               ld   h,h
ECH1:F213 F1               pop  af
ECH1:F214 B9               cp   c
ECH1:F215 A2               and  d
ECH1:F216 60               ld   h,b
ECH1:F217 20 0E            jr   nz,$F227
ECH1:F219 67               ld   h,a
ECH1:F21A 80               add  b
ECH1:F21B 29               add  hl,hl
ECH1:F21C 0D               dec  c
ECH1:F21D 97               sub  a
ECH1:F21E 07               rlca 
ECH1:F21F 80               add  b
ECH1:F220 FA 9D 7E         ld   a,[$7E9D]
ECH1:F223 3F               ccf  
ECH1:F224 E8 31            add  sp,$31
ECH1:F226 7B               ld   a,e
ECH1:F227 71               ld   [hl],c
ECH1:F228 3F               ccf  
ECH1:F229 2B               dec  hl
ECH1:F22A 37               scf  
ECH1:F22B 0F               rrca 
ECH1:F22C 6B               ld   l,e
ECH1:F22D A7               and  a
ECH1:F22E 86               add  [hl]
ECH1:F22F 54               ld   d,h
ECH1:F230 70               ld   [hl],b
ECH1:F231 FC               db   $FC ; undefined opcode
ECH1:F232 54               ld   d,h
ECH1:F233 FF               rst  $38
ECH1:F234 F5               push af
ECH1:F235 25               dec  h
ECH1:F236 E1               pop  hl
ECH1:F237 E2               ld   [$ff00+c],a
ECH1:F238 0B               dec  bc
ECH1:F239 4A               ld   c,d
ECH1:F23A A2               and  d
ECH1:F23B 41               ld   b,c
ECH1:F23C 4B               ld   c,e
ECH1:F23D 19               add  hl,de
ECH1:F23E 8F               adc  a
ECH1:F23F 0C               inc  c
ECH1:F240 F2               ld   a,[$ff00+c]
ECH1:F241 D6 70            sub  a,$70
ECH1:F243 FC               db   $FC ; undefined opcode
ECH1:F244 F0 C9            ldh  a,[$FFC9]
ECH1:F246 31 F1 3E         ld   sp,$3EF1
ECH1:F249 B5               or   l
ECH1:F24A E6 DD            and  a,$DD
ECH1:F24C A6               and  [hl]
ECH1:F24D 5C               ld   e,h
ECH1:F24E DD               db   $DD ; undefined opcode
ECH1:F24F CF               rst  $08
ECH1:F250 70               ld   [hl],b
ECH1:F251 F4               db   $F4 ; undefined opcode
ECH1:F252 B0               or   b
ECH1:F253 6C               ld   l,h
ECH1:F254 E1               pop  hl
ECH1:F255 22               ldi  [hl],a
ECH1:F256 78               ld   a,b
ECH1:F257 FF               rst  $38
ECH1:F258 4A               ld   c,d
ECH1:F259 49               ld   c,c
ECH1:F25A 2F               cpl  
ECH1:F25B 4D               ld   c,l
ECH1:F25C 2F               cpl  
ECH1:F25D 0F               rrca 
ECH1:F25E 0F               rrca 
ECH1:F25F 02               ld   [bc],a
ECH1:F260 A4               and  h
ECH1:F261 EF               rst  $28
ECH1:F262 71               ld   [hl],c
ECH1:F263 30 B0            jr   nc,$F215
ECH1:F265 F1               pop  af
ECH1:F266 E1               pop  hl
ECH1:F267 64               ld   h,h
ECH1:F268 1A               ld   a,[de]
ECH1:F269 08 0F 0C         ld   [$0C0F],sp
ECH1:F26C 8F               adc  a
ECH1:F26D 23               inc  hl
ECH1:F26E 07               rlca 
ECH1:F26F 98               sbc  b
ECH1:F270 31 08 E4         ld   sp,$E408
ECH1:F273 7A               ld   a,d
ECH1:F274 F4               db   $F4 ; undefined opcode
ECH1:F275 A1               and  c
ECH1:F276 B9               cp   c
ECH1:F277 F5               push af
ECH1:F278 2B               dec  hl
ECH1:F279 93               sub  e
ECH1:F27A 83               add  e
ECH1:F27B CE 09            adc  a,$09
ECH1:F27D 0C               inc  c
ECH1:F27E 67               ld   h,a
ECH1:F27F 0E 57            ld   c,$57
ECH1:F281 90               sub  b
ECH1:F282 38 A7            jr   c,$F22B
ECH1:F284 50               ld   d,b
ECH1:F285 70               ld   [hl],b
ECH1:F286 A7               and  a
ECH1:F287 FE 2A            cp   a,$2A
ECH1:F289 4A               ld   c,d
ECH1:F28A 57               ld   d,a
ECH1:F28B 3E 2F            ld   a,$2F
ECH1:F28D 67               ld   h,a
ECH1:F28E 9C               sbc  h
ECH1:F28F 6F               ld   l,a
ECH1:F290 A0               and  b
ECH1:F291 D0               ret  nc
ECH1:F292 51               ld   d,c
ECH1:F293 F0 FC            ldh  a,[$FFFC]
ECH1:F295 38 E0            jr   c,$F277
ECH1:F297 7E               ld   a,[hl]
ECH1:F298 3E 1F            ld   a,$1F
ECH1:F29A 5B               ld   e,e
ECH1:F29B C3 5E C9         jp   $C95E
ECH1:F29E 0C               inc  c
ECH1:F29F B8               cp   b
ECH1:F2A0 FE F1            cp   a,$F1
ECH1:F2A2 91               sub  c
ECH1:F2A3 72               ld   [hl],d
ECH1:F2A4 F5               push af
ECH1:F2A5 24               inc  h
ECH1:F2A6 F0 D9            ldh  a,[$FFD9]
ECH1:F2A8 AE               xor  [hl]
ECH1:F2A9 21 86 CE         ld   hl,$CE86
ECH1:F2AC 8D               adc  l
ECH1:F2AD 1E 85            ld   e,$85
ECH1:F2AF 0C               inc  c
ECH1:F2B0 C0               ret  nz
ECH1:F2B1 B6               or   [hl]
ECH1:F2B2 51               ld   d,c
ECH1:F2B3 A0               and  b
ECH1:F2B4 A4               and  h
ECH1:F2B5 F0 A5            ldh  a,[$FFA5]
ECH1:F2B7 D6 27            sub  a,$27
ECH1:F2B9 19               add  hl,de
ECH1:F2BA 95               sub  l
ECH1:F2BB 09               add  hl,bc
ECH1:F2BC 02               ld   [bc],a
ECH1:F2BD 8F               adc  a
ECH1:F2BE CF               rst  $08
ECH1:F2BF 38 6C            jr   c,$F32D
ECH1:F2C1 F0 24            ldh  a,[$FF24]
ECH1:F2C3 D1               pop  de
ECH1:F2C4 62               ld   h,d
ECH1:F2C5 3A               ldd  a,[hl]
ECH1:F2C6 F0 74            ldh  a,[$FF74]
ECH1:F2C8 2C               inc  l
ECH1:F2C9 2D               dec  l
ECH1:F2CA 07               rlca 
ECH1:F2CB 75               ld   [hl],l
ECH1:F2CC 27               daa  
ECH1:F2CD 07               rlca 
ECH1:F2CE DF               rst  $18
ECH1:F2CF BF               cp   a
ECH1:F2D0 F6 D4            or   a,$D4
ECH1:F2D2 F9               ld   sp,hl
ECH1:F2D3 A8               xor  b
ECH1:F2D4 F4               db   $F4 ; undefined opcode
ECH1:F2D5 F0 B6            ldh  a,[$FFB6]
ECH1:F2D7 F0 1E            ldh  a,[$FF1E]
ECH1:F2D9 1E 1A            ld   e,$1A
ECH1:F2DB 2E DE            ld   l,$DE
ECH1:F2DD 1D               dec  e
ECH1:F2DE 0F               rrca 
ECH1:F2DF 97               sub  a
ECH1:F2E0 F1               pop  af
ECH1:F2E1 E8 E1            add  sp,-$1F
ECH1:F2E3 90               sub  b
ECH1:F2E4 78               ld   a,b
ECH1:F2E5 64               ld   h,h
ECH1:F2E6 C8               ret  z
ECH1:F2E7 F2               ld   a,[$ff00+c]
ECH1:F2E8 06 3E            ld   b,$3E
ECH1:F2EA E7               rst  $20
ECH1:F2EB 0F               rrca 
ECH1:F2EC 4E               ld   c,[hl]
ECH1:F2ED 23               inc  hl
ECH1:F2EE 08 4E 75         ld   [$754E],sp
ECH1:F2F1 4C               ld   c,h
ECH1:F2F2 31 7F 72         ld   sp,$727F
ECH1:F2F5 56               ld   d,[hl]
ECH1:F2F6 30 01            jr   nc,$F2F9
ECH1:F2F8 85               add  l
ECH1:F2F9 5B               ld   e,e
ECH1:F2FA 0F               rrca 
ECH1:F2FB 0D               dec  c
ECH1:F2FC 2D               dec  l
ECH1:F2FD 97               sub  a
ECH1:F2FE 8F               adc  a
ECH1:F2FF C1               pop  bc
ECH1:F300 0A               ld   a,[bc]
ECH1:F301 67               ld   h,a
ECH1:F302 15               dec  d
ECH1:F303 8D               adc  l
ECH1:F304 46               ld   b,[hl]
ECH1:F305 A3               and  e
ECH1:F306 1D               dec  e
ECH1:F307 D1               pop  de
ECH1:F308 B9               cp   c
ECH1:F309 FA D7 76         ld   a,[$76D7]
ECH1:F30C 9A               sbc  d
ECH1:F30D E7               rst  $20
ECH1:F30E 49               ld   c,c
ECH1:F30F 62               ld   h,d
ECH1:F310 08 DF 7E         ld   [$7EDF],sp
ECH1:F313 08 7A 42         ld   [$427A],sp
ECH1:F316 9D               sbc  l
ECH1:F317 5D               ld   e,l
ECH1:F318 23               inc  hl
ECH1:F319 22               ldi  [hl],a
ECH1:F31A D0               ret  nc
ECH1:F31B 51               ld   d,c
ECH1:F31C A2               and  d
ECH1:F31D 79               ld   a,c
ECH1:F31E B8               cp   b
ECH1:F31F F2               ld   a,[$ff00+c]
ECH1:F320 6F               ld   l,a
ECH1:F321 CB AF            res  5,a
ECH1:F323 36 47            ld   [hl],$47
ECH1:F325 8B               adc  e
ECH1:F326 4F               ld   c,a
ECH1:F327 2A               ldi  a,[hl]
ECH1:F328 79               ld   a,c
ECH1:F329 C6 80            add  a,$80
ECH1:F32B 10 34            <corrupted stop>
ECH1:F32D F8 72            ld   hl,sp+$72
ECH1:F32F 95               sub  l
ECH1:F330 FF               rst  $38
ECH1:F331 4D               ld   c,l
ECH1:F332 65               ld   h,l
ECH1:F333 15               dec  d
ECH1:F334 26 A7            ld   h,$A7
ECH1:F336 D7               rst  $10
ECH1:F337 0B               dec  bc
ECH1:F338 70               ld   [hl],b
ECH1:F339 80               add  b
ECH1:F33A DC 7A B2         call c,$B27A
ECH1:F33D 35               dec  [hl]
ECH1:F33E D7               rst  $10
ECH1:F33F 9C               sbc  h
ECH1:F340 5B               ld   e,e
ECH1:F341 17               rla  
ECH1:F342 06 E5            ld   b,$E5
ECH1:F344 89               adc  c
ECH1:F345 1D               dec  e
ECH1:F346 A1               and  c
ECH1:F347 2F               cpl  
ECH1:F348 FB               ei   
ECH1:F349 F7               rst  $30
ECH1:F34A DC D8 AB         call c,$ABD8
ECH1:F34D 70               ld   [hl],b
ECH1:F34E 40               ld   b,b
ECH1:F34F 5E               ld   e,[hl]
ECH1:F350 7D               ld   a,l
ECH1:F351 87               add  a
ECH1:F352 4D               ld   c,l
ECH1:F353 49               ld   c,c
ECH1:F354 29               add  hl,hl
ECH1:F355 2A               ldi  a,[hl]
ECH1:F356 44               ld   b,h
ECH1:F357 05               dec  b
ECH1:F358 D1               pop  de
ECH1:F359 48               ld   c,b
ECH1:F35A DE F0            sbc  a,$F0
ECH1:F35C D2 38 F8         jp   nc,$F838
ECH1:F35F B8               cp   b
ECH1:F360 06 0F            ld   b,$0F
ECH1:F362 0F               rrca 
ECH1:F363 0F               rrca 
ECH1:F364 5A               ld   e,d
ECH1:F365 67               ld   h,a
ECH1:F366 77               ld   [hl],a
ECH1:F367 13               inc  de
ECH1:F368 11 AC B4         ld   de,$B4AC
ECH1:F36B 52               ld   d,d
ECH1:F36C 68               ld   l,b
ECH1:F36D C3 15 29         jp   $2915
ECH1:F370 0B               dec  bc
ECH1:F371 87               add  a
ECH1:F372 1B               dec  de
ECH1:F373 47               ld   b,a
ECH1:F374 3F               ccf  
ECH1:F375 1F               rra  
ECH1:F376 81               add  c
ECH1:F377 86               add  [hl]
ECH1:F378 78               ld   a,b
ECH1:F379 E3               db   $E3 ; undefined opcode
ECH1:F37A D1               pop  de
ECH1:F37B D1               pop  de
ECH1:F37C A6               and  [hl]
ECH1:F37D 9C               sbc  h
ECH1:F37E F4               db   $F4 ; undefined opcode
ECH1:F37F F2               ld   a,[$ff00+c]
ECH1:F380 A1               and  c
ECH1:F381 86               add  [hl]
ECH1:F382 2C               inc  l
ECH1:F383 CE 35            adc  a,$35
ECH1:F385 FE 59            cp   a,$59
ECH1:F387 25               dec  h
ECH1:F388 51               ld   d,c
ECH1:F389 74               ld   [hl],h
ECH1:F38A 21 76 A3         ld   hl,$A376
ECH1:F38D 94               sub  h
ECH1:F38E A0               and  b
ECH1:F38F 7C               ld   a,h
ECH1:F390 2E 5F            ld   l,$5F
ECH1:F392 87               add  a
ECH1:F393 83               add  e
ECH1:F394 0B               dec  bc
ECH1:F395 9B               sbc  e
ECH1:F396 32               ldd  [hl],a
ECH1:F397 0F               rrca 
ECH1:F398 F1               pop  af
ECH1:F399 60               ld   h,b
ECH1:F39A 1D               dec  e
ECH1:F39B 70               ld   [hl],b
ECH1:F39C D2 E4 70         jp   nc,$70E4
ECH1:F39F 98               sbc  b
ECH1:F3A0 3D               dec  a
ECH1:F3A1 83               add  e
ECH1:F3A2 8F               adc  a
ECH1:F3A3 D7               rst  $10
ECH1:F3A4 4B               ld   c,e
ECH1:F3A5 8C               adc  h
ECH1:F3A6 AF               xor  a
ECH1:F3A7 6A               ld   l,d
ECH1:F3A8 93               sub  e
ECH1:F3A9 46               ld   b,[hl]
ECH1:F3AA FE 6B            cp   a,$6B
ECH1:F3AC 40               ld   b,b
ECH1:F3AD 14               inc  d
ECH1:F3AE DC E0 0F         call c,$0FE0
ECH1:F3B1 59               ld   e,c
ECH1:F3B2 8F               adc  a
ECH1:F3B3 50               ld   d,b
ECH1:F3B4 0B               dec  bc
ECH1:F3B5 34               inc  [hl]
ECH1:F3B6 B9               cp   c
ECH1:F3B7 5F               ld   e,a
ECH1:F3B8 08 FC C0         ld   [$C0FC],sp
ECH1:F3BB 91               sub  c
ECH1:F3BC E9               jp   hl
ECH1:F3BD 80               add  b
ECH1:F3BE 78               ld   a,b
ECH1:F3BF 92               sub  d
ECH1:F3C0 69               ld   l,c
ECH1:F3C1 1A               ld   a,[de]
ECH1:F3C2 5B               ld   e,e
ECH1:F3C3 85               add  l
ECH1:F3C4 09               add  hl,bc
ECH1:F3C5 04               inc  b
ECH1:F3C6 89               adc  c
ECH1:F3C7 95               sub  l
ECH1:F3C8 F9               ld   sp,hl
ECH1:F3C9 31 A8 57         ld   sp,$57A8
ECH1:F3CC 60               ld   h,b
ECH1:F3CD 4B               ld   c,e
ECH1:F3CE A5               and  l
ECH1:F3CF D0               ret  nc
ECH1:F3D0 1F               rra  
ECH1:F3D1 8A               adc  d
ECH1:F3D2 3D               dec  a
ECH1:F3D3 06 4F            ld   b,$4F
ECH1:F3D5 DB               db   $DB ; undefined opcode
ECH1:F3D6 4E               ld   c,[hl]
ECH1:F3D7 5F               ld   e,a
ECH1:F3D8 B5               or   l
ECH1:F3D9 D2 40 B0         jp   nc,$B040
ECH1:F3DC D5               push de
ECH1:F3DD F9               ld   sp,hl
ECH1:F3DE DB               db   $DB ; undefined opcode
ECH1:F3DF 80               add  b
ECH1:F3E0 4C               ld   c,h
ECH1:F3E1 8F               adc  a
ECH1:F3E2 7F               ld   a,a
ECH1:F3E3 00               nop  
ECH1:F3E4 4F               ld   c,a
ECH1:F3E5 8A               adc  d
ECH1:F3E6 17               rla  
ECH1:F3E7 0B               dec  bc
ECH1:F3E8 E5               push hl
ECH1:F3E9 E0 FD            ldh  [$FFFD],a
ECH1:F3EB C7               rst  $00
ECH1:F3EC D3               db   $D3 ; undefined opcode
ECH1:F3ED B0               or   b
ECH1:F3EE F0 70            ldh  a,[$FF70]
ECH1:F3F0 5F               ld   e,a
ECH1:F3F1 04               inc  b
ECH1:F3F2 2B               dec  hl
ECH1:F3F3 0A               ld   a,[bc]
ECH1:F3F4 9E               sbc  [hl]
ECH1:F3F5 0E C5            ld   c,$C5
ECH1:F3F7 5E               ld   e,[hl]
ECH1:F3F8 C4 B1 58         call nz,$58B1
ECH1:F3FB B4               or   h
ECH1:F3FC E1               pop  hl
ECH1:F3FD F7               rst  $30
ECH1:F3FE B0               or   b
ECH1:F3FF 48               ld   c,b
ECH1:F400 39               add  hl,sp
ECH1:F401 0E 87            ld   c,$87
ECH1:F403 A5               and  l
ECH1:F404 7C               ld   a,h
ECH1:F405 83               add  e
ECH1:F406 1B               dec  de
ECH1:F407 26 29            ld   h,$29
ECH1:F409 76               halt 
ECH1:F40A 70               ld   [hl],b
ECH1:F40B D0               ret  nc
ECH1:F40C D4 B0 4C         call nc,$4CB0
ECH1:F40F E8 82            add  sp,-$7E
ECH1:F411 4E               ld   c,[hl]
ECH1:F412 BF               cp   a
ECH1:F413 1F               rra  
ECH1:F414 0C               inc  c
ECH1:F415 4F               ld   c,a
ECH1:F416 D6 CE            sub  a,$CE
ECH1:F418 D9               reti 
ECH1:F419 F9               ld   sp,hl
ECH1:F41A 52               ld   d,d
ECH1:F41B 53               ld   d,e
ECH1:F41C 9E               sbc  [hl]
ECH1:F41D F6 D0            or   a,$D0
ECH1:F41F 8C               adc  h
ECH1:F420 6B               ld   l,e
ECH1:F421 B7               or   a
ECH1:F422 2E 5F            ld   l,$5F
ECH1:F424 5B               ld   e,e
ECH1:F425 B7               or   a
ECH1:F426 CF               rst  $08
ECH1:F427 1A               ld   a,[de]
ECH1:F428 ED               db   $ED ; undefined opcode
ECH1:F429 B5               or   l
ECH1:F42A 60               ld   h,b
ECH1:F42B EC               db   $EC ; undefined opcode
ECH1:F42C F9               ld   sp,hl
ECH1:F42D A1               and  c
ECH1:F42E F5               push af
ECH1:F42F 98               sbc  b
ECH1:F430 6D               ld   l,l
ECH1:F431 1A               ld   a,[de]
ECH1:F432 07               rlca 
ECH1:F433 A1               and  c
ECH1:F434 0F               rrca 
ECH1:F435 2F               cpl  
ECH1:F436 1F               rra  
ECH1:F437 43               ld   b,e
ECH1:F438 EC               db   $EC ; undefined opcode
ECH1:F439 D0               ret  nc
ECH1:F43A 15               dec  d
ECH1:F43B A4               and  h
ECH1:F43C FC               db   $FC ; undefined opcode
ECH1:F43D 76               halt 
ECH1:F43E DC 32 8F         call c,$8F32
ECH1:F441 86               add  [hl]
ECH1:F442 83               add  e
ECH1:F443 F2               ld   a,[$ff00+c]
ECH1:F444 CF               rst  $08
ECH1:F445 CD 0C 85         call $850C
ECH1:F448 C7               rst  $00
ECH1:F449 F0 D9            ldh  a,[$FFD9]
ECH1:F44B F4               db   $F4 ; undefined opcode
ECH1:F44C F4               db   $F4 ; undefined opcode
ECH1:F44D 54               ld   d,h
ECH1:F44E AD               xor  l
ECH1:F44F C8               ret  z
ECH1:F450 27               daa  
ECH1:F451 4A               ld   c,d
ECH1:F452 C6 2B            add  a,$2B
ECH1:F454 17               rla  
ECH1:F455 21 AF 05         ld   hl,$05AF
ECH1:F458 F3               di   
ECH1:F459 B0               or   b
ECH1:F45A 91               sub  c
ECH1:F45B 65               ld   h,l
ECH1:F45C BC               cp   h
ECH1:F45D C2 F4 F0         jp   nz,$F0F4
ECH1:F460 D6 E7            sub  a,$E7
ECH1:F462 08 CB 2E         ld   [$2ECB],sp
ECH1:F465 0B               dec  bc
ECH1:F466 96               sub  [hl]
ECH1:F467 0D               dec  c
ECH1:F468 E9               jp   hl
ECH1:F469 B0               or   b
ECH1:F46A 9E               sbc  [hl]
ECH1:F46B 4A               ld   c,d
ECH1:F46C B8               cp   b
ECH1:F46D D0               ret  nc
ECH1:F46E F4               db   $F4 ; undefined opcode
ECH1:F46F 7C               ld   a,h
ECH1:F470 A9               xor  c
ECH1:F471 46               ld   b,[hl]
ECH1:F472 16 0B            ld   d,$0B
ECH1:F474 8F               adc  a
ECH1:F475 EF               rst  $28
ECH1:F476 67               ld   h,a
ECH1:F477 AF               xor  a
ECH1:F478 76               halt 
ECH1:F479 F4               db   $F4 ; undefined opcode
ECH1:F47A 96               sub  [hl]
ECH1:F47B EA 9A 64         ld   [$649A],a
ECH1:F47E D1               pop  de
ECH1:F47F B0               or   b
ECH1:F480 0F               rrca 
ECH1:F481 4F               ld   c,a
ECH1:F482 09               add  hl,bc
ECH1:F483 C8               ret  z
ECH1:F484 8D               adc  l
ECH1:F485 21 1E 36         ld   hl,$361E
ECH1:F488 E3               db   $E3 ; undefined opcode
ECH1:F489 B0               or   b
ECH1:F48A C4 FC 75         call nz,$75FC
ECH1:F48D C7               rst  $00
ECH1:F48E 24               inc  h
ECH1:F48F D4 92 8E         call nc,$8E92
ECH1:F492 4E               ld   c,[hl]
ECH1:F493 36 89            ld   [hl],$89
ECH1:F495 6C               ld   l,h
ECH1:F496 1F               rra  
ECH1:F497 3E F0            ld   a,$F0
ECH1:F499 D1               pop  de
ECH1:F49A 74               ld   [hl],h
ECH1:F49B 28 A0            jr   z,$F43D
ECH1:F49D 97               sub  a
ECH1:F49E B0               or   b
ECH1:F49F 58               ld   e,b
ECH1:F4A0 4F               ld   c,a
ECH1:F4A1 1B               dec  de
ECH1:F4A2 4D               ld   c,l
ECH1:F4A3 6B               ld   l,e
ECH1:F4A4 05               dec  b
ECH1:F4A5 2D               dec  l
ECH1:F4A6 88               adc  b
ECH1:F4A7 65               ld   h,l
ECH1:F4A8 B5               or   l
ECH1:F4A9 B1               or   c
ECH1:F4AA 51               ld   d,c
ECH1:F4AB E4               db   $E4 ; undefined opcode
ECH1:F4AC F0 D0            ldh  a,[$FFD0]
ECH1:F4AE B1               or   c
ECH1:F4AF 8C               adc  h
ECH1:F4B0 A7               and  a
ECH1:F4B1 9F               sbc  a
ECH1:F4B2 02               ld   [bc],a
ECH1:F4B3 2E 1D            ld   l,$1D
ECH1:F4B5 47               ld   b,a
ECH1:F4B6 1E 73            ld   e,$73
ECH1:F4B8 D0               ret  nc
ECH1:F4B9 B7               or   a
ECH1:F4BA EA 2B F2         ld   [$F22B],a
ECH1:F4BD FD               db   $FD ; undefined opcode
ECH1:F4BE 9C               sbc  h
ECH1:F4BF FA 9F 07         ld   a,[$079F]
ECH1:F4C2 B3               or   e
ECH1:F4C3 1D               dec  e
ECH1:F4C4 1E 17            ld   e,$17
ECH1:F4C6 C2 89 B1         jp   nz,$B189
ECH1:F4C9 00               nop  
ECH1:F4CA E2               ld   [$ff00+c],a
ECH1:F4CB B3               or   e
ECH1:F4CC 30 30            jr   nc,$F4FE
ECH1:F4CE E0 F3            ldh  [$FFF3],a
ECH1:F4D0 AF               xor  a
ECH1:F4D1 1D               dec  e
ECH1:F4D2 59               ld   e,c
ECH1:F4D3 0E 64            ld   c,$64
ECH1:F4D5 16 AF            ld   d,$AF
ECH1:F4D7 0F               rrca 
ECH1:F4D8 E8 D2            add  sp,-$2E
ECH1:F4DA E6 E0            and  a,$E0
ECH1:F4DC A1               and  c
ECH1:F4DD 34               inc  [hl]
ECH1:F4DE B0               or   b
ECH1:F4DF 72               ld   [hl],d
ECH1:F4E0 3C               inc  a
ECH1:F4E1 8C               adc  h
ECH1:F4E2 9D               sbc  l
ECH1:F4E3 2A               ldi  a,[hl]
ECH1:F4E4 DB               db   $DB ; undefined opcode
ECH1:F4E5 2D               dec  l
ECH1:F4E6 1E 1B            ld   e,$1B
ECH1:F4E8 D1               pop  de
ECH1:F4E9 DE F0            sbc  a,$F0
ECH1:F4EB 41               ld   b,c
ECH1:F4EC F0 A1            ldh  a,[$FFA1]
ECH1:F4EE FA 64 6F         ld   a,[$6F64]
ECH1:F4F1 85               add  l
ECH1:F4F2 0F               rrca 
ECH1:F4F3 13               inc  de
ECH1:F4F4 6A               ld   l,d
ECH1:F4F5 11 A0 43         ld   de,$43A0
ECH1:F4F8 F0 F0            ldh  a,[$FFF0]
ECH1:F4FA E3               db   $E3 ; undefined opcode
ECH1:F4FB 65               ld   h,l
ECH1:F4FC F9               ld   sp,hl
ECH1:F4FD 30 56            jr   nc,$F555
ECH1:F4FF 74               ld   [hl],h
ECH1:F500 18 CA            jr   $F4CC
ECH1:F502 31 F2 70         ld   sp,$70F2
ECH1:F505 E9               jp   hl
ECH1:F506 F8 91            ld   hl,sp-$6F
ECH1:F508 2E BC            ld   l,$BC
ECH1:F50A 08 42 0F         ld   [$0F42],sp
ECH1:F50D 4F               ld   c,a
ECH1:F50E BE               cp   [hl]
ECH1:F50F 4C               ld   c,h
ECH1:F510 73               ld   [hl],e
ECH1:F511 72               ld   [hl],d
ECH1:F512 20 E4            jr   nz,$F4F8
ECH1:F514 E1               pop  hl
ECH1:F515 88               adc  b
ECH1:F516 36 91            ld   [hl],$91
ECH1:F518 1F               rra  
ECH1:F519 8F               adc  a
ECH1:F51A CB BF            res  7,a
ECH1:F51C 28 1D            jr   z,$F53B
ECH1:F51E 6A               ld   l,d
ECH1:F51F 17               rla  
ECH1:F520 D2 F9 F0         jp   nc,$F0F9
ECH1:F523 B0               or   b
ECH1:F524 90               sub  b
ECH1:F525 B9               cp   c
ECH1:F526 F4               db   $F4 ; undefined opcode
ECH1:F527 B0               or   b
ECH1:F528 6A               ld   l,d
ECH1:F529 0D               dec  c
ECH1:F52A 11 A3 DE         ld   de,$DEA3
ECH1:F52D A9               xor  c
ECH1:F52E A3               and  e
ECH1:F52F 2F               cpl  
ECH1:F530 82               add  d
ECH1:F531 10 F8            <corrupted stop>
ECH1:F533 72               ld   [hl],d
ECH1:F534 DE C1            sbc  a,$C1
ECH1:F536 E3               db   $E3 ; undefined opcode
ECH1:F537 F0 07            ldh  a,[$FF07]
ECH1:F539 C2 6F 9F         jp   nz,$9F6F
ECH1:F53C 0F               rrca 
ECH1:F53D 3F               ccf  
ECH1:F53E 0B               dec  bc
ECH1:F53F 13               inc  de
ECH1:F540 E4               db   $E4 ; undefined opcode
ECH1:F541 7A               ld   a,d
ECH1:F542 B9               cp   c
ECH1:F543 E1               pop  hl
ECH1:F544 F0 F9            ldh  a,[$FFF9]
ECH1:F546 3E C4            ld   a,$C4
ECH1:F548 0A               ld   a,[bc]
ECH1:F549 1F               rra  
ECH1:F54A AD               xor  l
ECH1:F54B 8F               adc  a
ECH1:F54C 15               dec  d
ECH1:F54D 56               ld   d,[hl]
ECH1:F54E 1F               rra  
ECH1:F54F 1A               ld   a,[de]
ECH1:F550 C0               ret  nz
ECH1:F551 44               ld   b,h
ECH1:F552 F0 B0            ldh  a,[$FFB0]
ECH1:F554 7A               ld   a,d
ECH1:F555 D8               ret  c
ECH1:F556 B0               or   b
ECH1:F557 18 9F            jr   $F4F8
ECH1:F559 AC               xor  h
ECH1:F55A AF               xor  a
ECH1:F55B BE               cp   [hl]
ECH1:F55C 0F               rrca 
ECH1:F55D 9C               sbc  h
ECH1:F55E 27               daa  
ECH1:F55F FB               ei   
ECH1:F560 B1               or   c
ECH1:F561 F3               di   
ECH1:F562 BE               cp   [hl]
ECH1:F563 E0 E3            ldh  [$FFE3],a
ECH1:F565 63               ld   h,e
ECH1:F566 82               add  d
ECH1:F567 F1               pop  af
ECH1:F568 88               adc  b
ECH1:F569 0E 2E            ld   c,$2E
ECH1:F56B 0F               rrca 
ECH1:F56C 1F               rra  
ECH1:F56D 05               dec  b
ECH1:F56E 42               ld   b,d
ECH1:F56F 05               dec  b
ECH1:F570 F4               db   $F4 ; undefined opcode
ECH1:F571 B4               or   h
ECH1:F572 C8               ret  z
ECH1:F573 25               dec  h
ECH1:F574 E0 D3            ldh  [$FFD3],a
ECH1:F576 F4               db   $F4 ; undefined opcode
ECH1:F577 88               adc  b
ECH1:F578 09               add  hl,bc
ECH1:F579 2B               dec  hl
ECH1:F57A 07               rlca 
ECH1:F57B 13               inc  de
ECH1:F57C 15               dec  d
ECH1:F57D 0A               ld   a,[bc]
ECH1:F57E 8D               adc  l
ECH1:F57F 57               ld   d,a
ECH1:F580 B4               or   h
ECH1:F581 EA F0 F0         ld   [$F0F0],a
ECH1:F584 6A               ld   l,d
ECH1:F585 B0               or   b
ECH1:F586 7C               ld   a,h
ECH1:F587 F1               pop  af
ECH1:F588 0C               inc  c
ECH1:F589 17               rla  
ECH1:F58A 05               dec  b
ECH1:F58B 4B               ld   c,e
ECH1:F58C 3E 69            ld   a,$69
ECH1:F58E 9A               sbc  d
ECH1:F58F 1E B5            ld   e,$B5
ECH1:F591 F0 D2            ldh  a,[$FFD2]
ECH1:F593 B1               or   c
ECH1:F594 94               sub  h
ECH1:F595 38 98            jr   c,$F52F
ECH1:F597 ED               db   $ED ; undefined opcode
ECH1:F598 01 0B 06         ld   bc,$060B
ECH1:F59B 13               inc  de
ECH1:F59C 8D               adc  l
ECH1:F59D C7               rst  $00
ECH1:F59E CD 6D E0         call $E06D
ECH1:F5A1 71               ld   [hl],c
ECH1:F5A2 C4 F1 90         call nz,$90F1
ECH1:F5A5 C6 D2            add  a,$D2
ECH1:F5A7 F0 46            ldh  a,[$FF46]
ECH1:F5A9 4B               ld   c,e
ECH1:F5AA 47               ld   b,a
ECH1:F5AB 8F               adc  a
ECH1:F5AC B5               or   l
ECH1:F5AD DC 8F 05         call c,$058F
ECH1:F5B0 F1               pop  af
ECH1:F5B1 30 50            jr   nc,$F603
ECH1:F5B3 D1               pop  de
ECH1:F5B4 70               ld   [hl],b
ECH1:F5B5 F8 E8            ld   hl,sp-$18
ECH1:F5B7 35               dec  [hl]
ECH1:F5B8 2B               dec  hl
ECH1:F5B9 2F               cpl  
ECH1:F5BA 1A               ld   a,[de]
ECH1:F5BB 2B               dec  hl
ECH1:F5BC 5F               ld   e,a
ECH1:F5BD C7               rst  $00
ECH1:F5BE 8C               adc  h
ECH1:F5BF 09               add  hl,bc
ECH1:F5C0 9B               sbc  e
ECH1:F5C1 70               ld   [hl],b
ECH1:F5C2 E0 D0            ldh  [$FFD0],a
ECH1:F5C4 F9               ld   sp,hl
ECH1:F5C5 70               ld   [hl],b
ECH1:F5C6 52               ld   d,d
ECH1:F5C7 F2               ld   a,[$ff00+c]
ECH1:F5C8 89               adc  c
ECH1:F5C9 1F               rra  
ECH1:F5CA 5A               ld   e,d
ECH1:F5CB 07               rlca 
ECH1:F5CC CA 07 27         jp   z,$2707
ECH1:F5CF CA 64 54         jp   z,$5464
ECH1:F5D2 A0               and  b
ECH1:F5D3 B0               or   b
ECH1:F5D4 C3 B0 51         jp   $51B0
ECH1:F5D7 F8 0F            ld   hl,sp+$0F
ECH1:F5D9 24               inc  h
ECH1:F5DA 3B               dec  sp
ECH1:F5DB 29               add  hl,hl
ECH1:F5DC 4B               ld   c,e
ECH1:F5DD 8D               adc  l
ECH1:F5DE 47               ld   b,a
ECH1:F5DF 07               rlca 
ECH1:F5E0 73               ld   [hl],e
ECH1:F5E1 0A               ld   a,[bc]
ECH1:F5E2 E5               push hl
ECH1:F5E3 A0               and  b
ECH1:F5E4 B6               or   [hl]
ECH1:F5E5 90               sub  b
ECH1:F5E6 E8 E1            add  sp,-$1F
ECH1:F5E8 AF               xor  a
ECH1:F5E9 4E               ld   c,[hl]
ECH1:F5EA 67               ld   h,a
ECH1:F5EB CD 0F A3         call $A30F
ECH1:F5EE 2E 31            ld   l,$31
ECH1:F5F0 60               ld   h,b
ECH1:F5F1 E2               ld   [$ff00+c],a
ECH1:F5F2 F3               di   
ECH1:F5F3 A0               and  b
ECH1:F5F4 95               sub  l
ECH1:F5F5 9C               sbc  h
ECH1:F5F6 54               ld   d,h
ECH1:F5F7 54               ld   d,h
ECH1:F5F8 9D               sbc  l
ECH1:F5F9 0D               dec  c
ECH1:F5FA 1D               dec  e
ECH1:F5FB 2E 4E            ld   l,$4E
ECH1:F5FD 17               rla  
ECH1:F5FE 27               daa  
ECH1:F5FF 2B               dec  hl
ECH1:F600 9F               sbc  a
ECH1:F601 03               inc  bc
ECH1:F602 ED               db   $ED ; undefined opcode
ECH1:F603 2C               inc  l
ECH1:F604 0F               rrca 
ECH1:F605 DF               rst  $18
ECH1:F606 0D               dec  c
ECH1:F607 45               ld   b,l
ECH1:F608 22               ldi  [hl],a
ECH1:F609 F2               ld   a,[$ff00+c]
ECH1:F60A B0               or   b
ECH1:F60B 29               add  hl,hl
ECH1:F60C F0 EB            ldh  a,[$FFEB]
ECH1:F60E 14               inc  d
ECH1:F60F B9               cp   c
ECH1:F610 86               add  [hl]
ECH1:F611 0F               rrca 
ECH1:F612 06 01            ld   b,$01
ECH1:F614 AF               xor  a
ECH1:F615 AC               xor  h
ECH1:F616 86               add  [hl]
ECH1:F617 4D               ld   c,l
ECH1:F618 FA C2 70         ld   a,[$70C2]
ECH1:F61B F2               ld   a,[$ff00+c]
ECH1:F61C D5               push de
ECH1:F61D E3               db   $E3 ; undefined opcode
ECH1:F61E D8               ret  c
ECH1:F61F 54               ld   d,h
ECH1:F620 2F               cpl  
ECH1:F621 67               ld   h,a
ECH1:F622 0A               ld   a,[bc]
ECH1:F623 0B               dec  bc
ECH1:F624 1A               ld   a,[de]
ECH1:F625 8D               adc  l
ECH1:F626 09               add  hl,bc
ECH1:F627 2F               cpl  
ECH1:F628 E2               ld   [$ff00+c],a
ECH1:F629 10 E1            <corrupted stop>
ECH1:F62B 77               ld   [hl],a
ECH1:F62C F5               push af
ECH1:F62D F0 9E            ldh  a,[$FF9E]
ECH1:F62F 68               ld   l,b
ECH1:F630 2C               inc  l
ECH1:F631 6F               ld   l,a
ECH1:F632 4A               ld   c,d
ECH1:F633 0D               dec  c
ECH1:F634 0D               dec  c
ECH1:F635 3B               dec  sp
ECH1:F636 35               dec  [hl]
ECH1:F637 DC 24 A8         call c,$A824
ECH1:F63A 72               ld   [hl],d
ECH1:F63B F4               db   $F4 ; undefined opcode
ECH1:F63C FB               ei   
ECH1:F63D DD               db   $DD ; undefined opcode
ECH1:F63E F8 D0            ld   hl,sp-$30
ECH1:F640 0A               ld   a,[bc]
ECH1:F641 07               rlca 
ECH1:F642 47               ld   b,a
ECH1:F643 C9               ret  
ECH1:F644 BB               cp   e
ECH1:F645 D3               db   $D3 ; undefined opcode
ECH1:F646 8D               adc  l
ECH1:F647 9D               sbc  l
ECH1:F648 E0 FB            ldh  [$FFFB],a
ECH1:F64A 5E               ld   e,[hl]
ECH1:F64B A9               xor  c
ECH1:F64C F0 70            ldh  a,[$FF70]
ECH1:F64E B1               or   c
ECH1:F64F BD               cp   l
ECH1:F650 2D               dec  l
ECH1:F651 6F               ld   l,a
ECH1:F652 0C               inc  c
ECH1:F653 14               inc  d
ECH1:F654 73               ld   [hl],e
ECH1:F655 3E 8E            ld   a,$8E
ECH1:F657 BF               cp   a
ECH1:F658 52               ld   d,d
ECH1:F659 AC               xor  h
ECH1:F65A D5               push de
ECH1:F65B DA 66 3C         jp   c,$3C66
ECH1:F65E F3               di   
ECH1:F65F 74               ld   [hl],h
ECH1:F660 BF               cp   a
ECH1:F661 59               ld   e,c
ECH1:F662 A3               and  e
ECH1:F663 5F               ld   e,a
ECH1:F664 8B               adc  e
ECH1:F665 ED               db   $ED ; undefined opcode
ECH1:F666 17               rla  
ECH1:F667 EE 8C            xor  a,$8C
ECH1:F669 F0 D2            ldh  a,[$FFD2]
ECH1:F66B 74               ld   [hl],h
ECH1:F66C 52               ld   d,d
ECH1:F66D E5               push hl
ECH1:F66E D8               ret  c
ECH1:F66F D8               ret  c
ECH1:F670 5B               ld   e,e
ECH1:F671 F1               pop  af
ECH1:F672 34               inc  [hl]
ECH1:F673 0C               inc  c
ECH1:F674 6D               ld   l,l
ECH1:F675 1D               dec  e
ECH1:F676 69               ld   l,c
ECH1:F677 45               ld   b,l
ECH1:F678 D1               pop  de
ECH1:F679 E1               pop  hl
ECH1:F67A 31 90 B2         ld   sp,$B290
ECH1:F67D F2               ld   a,[$ff00+c]
ECH1:F67E DA 26 2F         jp   c,$2F26
ECH1:F681 48               ld   c,b
ECH1:F682 07               rlca 
ECH1:F683 9D               sbc  l
ECH1:F684 03               inc  bc
ECH1:F685 C8               ret  z
ECH1:F686 C3 4B E2         jp   $E24B
ECH1:F689 30 F3            jr   nc,$F67E
ECH1:F68B 6A               ld   l,d
ECH1:F68C F8 96            ld   hl,sp-$6A
ECH1:F68E 38 89            jr   c,$F619
ECH1:F690 BF               cp   a
ECH1:F691 9D               sbc  l
ECH1:F692 8F               adc  a
ECH1:F693 09               add  hl,bc
ECH1:F694 2F               cpl  
ECH1:F695 5F               ld   e,a
ECH1:F696 0B               dec  bc
ECH1:F697 43               ld   b,e
ECH1:F698 B2               or   d
ECH1:F699 6E               ld   l,[hl]
ECH1:F69A F0 91            ldh  a,[$FF91]
ECH1:F69C E8 D8            add  sp,-$28
ECH1:F69E D8               ret  c
ECH1:F69F 60               ld   h,b
ECH1:F6A0 8F               adc  a
ECH1:F6A1 0B               dec  bc
ECH1:F6A2 1F               rra  
ECH1:F6A3 8A               adc  d
ECH1:F6A4 ED               db   $ED ; undefined opcode
ECH1:F6A5 4C               ld   c,h
ECH1:F6A6 4F               ld   c,a
ECH1:F6A7 1D               dec  e
ECH1:F6A8 E6 C4            and  a,$C4
ECH1:F6AA 98               sbc  b
ECH1:F6AB B0               or   b
ECH1:F6AC F8 B0            ld   hl,sp-$50
ECH1:F6AE D3               db   $D3 ; undefined opcode
ECH1:F6AF 70               ld   [hl],b
ECH1:F6B0 20 86            jr   nz,$F638
ECH1:F6B2 CD 0B 9E         call $9E0B
ECH1:F6B5 44               ld   b,h
ECH1:F6B6 3D               dec  a
ECH1:F6B7 4C               ld   c,h
ECH1:F6B8 D1               pop  de
ECH1:F6B9 A2               and  d
ECH1:F6BA 80               add  b
ECH1:F6BB 3C               inc  a
ECH1:F6BC F0 48            ldh  a,[$FF48]
ECH1:F6BE B2               or   d
ECH1:F6BF 6C               ld   l,h
ECH1:F6C0 C6 5E            add  a,$5E
ECH1:F6C2 BA               cp   d
ECH1:F6C3 4B               ld   c,e
ECH1:F6C4 16 8C            ld   d,$8C
ECH1:F6C6 C6 8F            add  a,$8F
ECH1:F6C8 70               ld   [hl],b
ECH1:F6C9 F3               di   
ECH1:F6CA 64               ld   h,h
ECH1:F6CB 64               ld   h,h
ECH1:F6CC B1               or   c
ECH1:F6CD 45               ld   b,l
ECH1:F6CE BA               cp   d
ECH1:F6CF E4               db   $E4 ; undefined opcode
ECH1:F6D0 29               add  hl,hl
ECH1:F6D1 80               add  b
ECH1:F6D2 5F               ld   e,a
ECH1:F6D3 1B               dec  de
ECH1:F6D4 AC               xor  h
ECH1:F6D5 6B               ld   l,e
ECH1:F6D6 0D               dec  c
ECH1:F6D7 0D               dec  c
ECH1:F6D8 E0 86            ldh  [$FF86],a
ECH1:F6DA 24               inc  h
ECH1:F6DB 38 82            jr   c,$F65F
ECH1:F6DD C1               pop  bc
ECH1:F6DE F2               ld   a,[$ff00+c]
ECH1:F6DF 92               sub  d
ECH1:F6E0 1D               dec  e
ECH1:F6E1 0B               dec  bc
ECH1:F6E2 1D               dec  e
ECH1:F6E3 2B               dec  hl
ECH1:F6E4 BF               cp   a
ECH1:F6E5 1E 5E            ld   e,$5E
ECH1:F6E7 8C               adc  h
ECH1:F6E8 F2               ld   a,[$ff00+c]
ECH1:F6E9 80               add  b
ECH1:F6EA 79               ld   a,c
ECH1:F6EB FC               db   $FC ; undefined opcode
ECH1:F6EC DA F0 92         jp   c,$92F0
ECH1:F6EF 92               sub  d
ECH1:F6F0 4D               ld   c,l
ECH1:F6F1 2C               inc  l
ECH1:F6F2 2B               dec  hl
ECH1:F6F3 45               ld   b,l
ECH1:F6F4 4B               ld   c,e
ECH1:F6F5 86               add  [hl]
ECH1:F6F6 E3               db   $E3 ; undefined opcode
ECH1:F6F7 47               ld   b,a
ECH1:F6F8 BB               cp   e
ECH1:F6F9 E8 C0            add  sp,-$40
ECH1:F6FB D8               ret  c
ECH1:F6FC D0               ret  nc
ECH1:F6FD 77               ld   [hl],a
ECH1:F6FE 51               ld   d,c
ECH1:F6FF FA F6 75         ld   a,[$75F6]
ECH1:F702 F7               rst  $30
ECH1:F703 67               ld   h,a
ECH1:F704 DA 52 F1         jp   c,$F152
ECH1:F707 E4               db   $E4 ; undefined opcode
ECH1:F708 4F               ld   c,a
ECH1:F709 41               ld   b,c
ECH1:F70A AF               xor  a
ECH1:F70B 9F               sbc  a
ECH1:F70C 15               dec  d
ECH1:F70D 0B               dec  bc
ECH1:F70E 6B               ld   l,e
ECH1:F70F 45               ld   b,l
ECH1:F710 92               sub  d
ECH1:F711 E1               pop  hl
ECH1:F712 F0 D0            ldh  a,[$FFD0]
ECH1:F714 60               ld   h,b
ECH1:F715 B0               or   b
ECH1:F716 F2               ld   a,[$ff00+c]
ECH1:F717 60               ld   h,b
ECH1:F718 FF               rst  $38
ECH1:F719 76               halt 
ECH1:F71A 4A               ld   c,d
ECH1:F71B 47               ld   b,a
ECH1:F71C 02               ld   [bc],a
ECH1:F71D 8D               adc  l
ECH1:F71E 65               ld   h,l
ECH1:F71F 02               ld   [bc],a
ECH1:F720 B8               cp   b
ECH1:F721 74               ld   [hl],h
ECH1:F722 B0               or   b
ECH1:F723 D2 B9 40         jp   nc,$40B9
ECH1:F726 D5               push de
ECH1:F727 B2               or   d
ECH1:F728 6D               ld   l,l
ECH1:F729 36 9F            ld   [hl],$9F
ECH1:F72B 2A               ldi  a,[hl]
ECH1:F72C 18 52            jr   $F780
ECH1:F72E 2C               inc  l
ECH1:F72F 0B               dec  bc
ECH1:F730 87               add  a
ECH1:F731 93               sub  e
ECH1:F732 E2               ld   [$ff00+c],a
ECH1:F733 53               ld   d,e
ECH1:F734 50               ld   d,b
ECH1:F735 F2               ld   a,[$ff00+c]
ECH1:F736 C1               pop  bc
ECH1:F737 E9               jp   hl
ECH1:F738 82               add  d
ECH1:F739 2F               cpl  
ECH1:F73A 0C               inc  c
ECH1:F73B 4E               ld   c,[hl]
ECH1:F73C 14               inc  d
ECH1:F73D 4F               ld   c,a
ECH1:F73E 0B               dec  bc
ECH1:F73F 0E E1            ld   c,$E1
ECH1:F741 CC D4 76         call z,$76D4
ECH1:F744 F8 78            ld   hl,sp+$78
ECH1:F746 57               ld   d,a
ECH1:F747 95               sub  l
ECH1:F748 0F               rrca 
ECH1:F749 07               rlca 
ECH1:F74A 00               nop  
ECH1:F74B 1C               inc  e
ECH1:F74C 19               add  hl,de
ECH1:F74D 0F               rrca 
ECH1:F74E 29               add  hl,hl
ECH1:F74F 21 B8 F7         ld   hl,$F7B8
ECH1:F752 F8 E1            ld   hl,sp-$1F
ECH1:F754 30 9C            jr   nc,$F6F2
ECH1:F756 96               sub  [hl]
ECH1:F757 95               sub  l
ECH1:F758 57               ld   d,a
ECH1:F759 0D               dec  c
ECH1:F75A 4D               ld   c,l
ECH1:F75B 0B               dec  bc
ECH1:F75C 46               ld   b,[hl]
ECH1:F75D 2F               cpl  
ECH1:F75E 01 8E 54         ld   bc,$548E
ECH1:F761 F4               db   $F4 ; undefined opcode
ECH1:F762 90               sub  b
ECH1:F763 F9               ld   sp,hl
ECH1:F764 D4 30 AF         call nc,$AF30
ECH1:F767 E5               push hl
ECH1:F768 CD 9B 13         call $139B
ECH1:F76B 26 98            ld   h,$98
ECH1:F76D 4B               ld   c,e
ECH1:F76E 47               ld   b,a
ECH1:F76F 13               inc  de
ECH1:F770 36 F5            ld   [hl],$F5
ECH1:F772 86               add  [hl]
ECH1:F773 52               ld   d,d
ECH1:F774 E2               ld   [$ff00+c],a
ECH1:F775 72               ld   [hl],d
ECH1:F776 F1               pop  af
ECH1:F777 B8               cp   b
ECH1:F778 06 67            ld   b,$67
ECH1:F77A 0D               dec  c
ECH1:F77B 05               dec  b
ECH1:F77C 17               rla  
ECH1:F77D 15               dec  d
ECH1:F77E 4B               ld   c,e
ECH1:F77F 4E               ld   c,[hl]
ECH1:F780 7C               ld   a,h
ECH1:F781 5A               ld   e,d
ECH1:F782 B2               or   d
ECH1:F783 C4 C1 88         call nz,$88C1
ECH1:F786 32               ldd  [hl],a
ECH1:F787 D0               ret  nc
ECH1:F788 65               ld   h,l
ECH1:F789 2C               inc  l
ECH1:F78A C5               push bc
ECH1:F78B 8F               adc  a
ECH1:F78C 99               sbc  c
ECH1:F78D B6               or   [hl]
ECH1:F78E 08 0F FC         ld   [$FC0F],sp
ECH1:F791 13               inc  de
ECH1:F792 B6               or   [hl]
ECH1:F793 D2 D3 85         jp   nc,$85D3
ECH1:F796 D0               ret  nc
ECH1:F797 12               ld   [de],a
ECH1:F798 CD A8 AF         call $AFA8
ECH1:F79B 82               add  d
ECH1:F79C 8F               adc  a
ECH1:F79D 1E 8C            ld   e,$8C
ECH1:F79F 86               add  [hl]
ECH1:F7A0 EA 60 EF         ld   [$EF60],a
ECH1:F7A3 28 40            jr   z,$F7E5
ECH1:F7A5 FA FC 70         ld   a,[$70FC]
ECH1:F7A8 4F               ld   c,a
ECH1:F7A9 EE 44            xor  a,$44
ECH1:F7AB 4D               ld   c,l
ECH1:F7AC 2D               dec  l
ECH1:F7AD 07               rlca 
ECH1:F7AE 8D               adc  l
ECH1:F7AF 27               daa  
ECH1:F7B0 B1               or   c
ECH1:F7B1 AA               xor  d
ECH1:F7B2 73               ld   [hl],e
ECH1:F7B3 E4               db   $E4 ; undefined opcode
ECH1:F7B4 37               scf  
ECH1:F7B5 60               ld   h,b
ECH1:F7B6 A1               and  c
ECH1:F7B7 72               ld   [hl],d
ECH1:F7B8 6E               ld   l,[hl]
ECH1:F7B9 0E 8C            ld   c,$8C
ECH1:F7BB 45               ld   b,l
ECH1:F7BC 17               rla  
ECH1:F7BD 0A               ld   a,[bc]
ECH1:F7BE A9               xor  c
ECH1:F7BF 36 F1            ld   [hl],$F1
ECH1:F7C1 B2               or   d
ECH1:F7C2 E0 F1            ldh  [$FFF1],a
ECH1:F7C4 78               ld   a,b
ECH1:F7C5 E8 38            add  sp,$38
ECH1:F7C7 AD               xor  l
ECH1:F7C8 4B               ld   c,e
ECH1:F7C9 2B               dec  hl
ECH1:F7CA 5F               ld   e,a
ECH1:F7CB 4F               ld   c,a
ECH1:F7CC A6               and  [hl]
ECH1:F7CD 37               scf  
ECH1:F7CE C5               push bc
ECH1:F7CF 6F               ld   l,a
ECH1:F7D0 EA F8 61         ld   [$61F8],a
ECH1:F7D3 B0               or   b
ECH1:F7D4 EF               rst  $28
ECH1:F7D5 69               ld   l,c
ECH1:F7D6 F8 E9            ld   hl,sp-$17
ECH1:F7D8 0D               dec  c
ECH1:F7D9 27               daa  
ECH1:F7DA FE 0E            cp   a,$0E
ECH1:F7DC 01 2F 8F         ld   bc,$8F2F
ECH1:F7DF DE D6            sbc  a,$D6
ECH1:F7E1 B9               cp   c
ECH1:F7E2 79               ld   a,c
ECH1:F7E3 B0               or   b
ECH1:F7E4 50               ld   d,b
ECH1:F7E5 3E 84            ld   a,$84
ECH1:F7E7 B4               or   h
ECH1:F7E8 4D               ld   c,l
ECH1:F7E9 8F               adc  a
ECH1:F7EA 8F               adc  a
ECH1:F7EB 6F               ld   l,a
ECH1:F7EC 07               rlca 
ECH1:F7ED 66               ld   h,[hl]
ECH1:F7EE 62               ld   h,d
ECH1:F7EF A8               xor  b
ECH1:F7F0 CA D2 F3         jp   z,$F3D2
ECH1:F7F3 34               inc  [hl]
ECH1:F7F4 74               ld   [hl],h
ECH1:F7F5 A6               and  [hl]
ECH1:F7F6 50               ld   d,b
ECH1:F7F7 E0 3E            ldh  [$FF3E],a
ECH1:F7F9 07               rlca 
ECH1:F7FA 1F               rra  
ECH1:F7FB 05               dec  b
ECH1:F7FC 0D               dec  c
ECH1:F7FD 03               inc  bc
ECH1:F7FE 2D               dec  l
ECH1:F7FF B4               or   h
ECH1:F800 01 C3 23         ld   bc,$23C3
ECH1:F803 CB FF            set  7,a
ECH1:F805 85               add  l
ECH1:F806 C1               pop  bc
ECH1:F807 20 20            jr   nz,$F829
ECH1:F809 20 20            jr   nz,$F82B
ECH1:F80B 20 20            jr   nz,$F82D
ECH1:F80D 20 20            jr   nz,$F82F
ECH1:F80F 20 20            jr   nz,$F831
ECH1:F811 20 20            jr   nz,$F833
ECH1:F813 20 20            jr   nz,$F835
ECH1:F815 20 20            jr   nz,$F837
ECH1:F817 20 20            jr   nz,$F839
ECH1:F819 20 20            jr   nz,$F83B
ECH1:F81B 1B               dec  de
ECH1:F81C 00               nop  
ECH1:F81D 10 6D            <corrupted stop>
ECH1:F81F 4C               ld   c,h
ECH1:F820 F5               push af
ECH1:F821 C1               pop  bc
ECH1:F822 F6 6D            or   a,$6D
ECH1:F824 AD               xor  l
ECH1:F825 6F               ld   l,a
ECH1:F826 58               ld   e,b
ECH1:F827 62               ld   h,d
ECH1:F828 53               ld   d,e
ECH1:F829 89               adc  c
ECH1:F82A 54               ld   d,h
ECH1:F82B 8B               adc  e
ECH1:F82C C9               ret  
ECH1:F82D F7               rst  $30
ECH1:F82E 4B               ld   c,e
ECH1:F82F 44               ld   b,h
ECH1:F830 15               dec  d
ECH1:F831 48               ld   c,b
ECH1:F832 E0 ED            ldh  [$FFED],a
ECH1:F834 E8 77            add  sp,$77
ECH1:F836 64               ld   h,h
ECH1:F837 70               ld   [hl],b
ECH1:F838 9E               sbc  [hl]
ECH1:F839 4A               ld   c,d
ECH1:F83A 49               ld   c,c
ECH1:F83B 2E 42            ld   l,$42
ECH1:F83D DF               rst  $18
ECH1:F83E CA CE B1         jp   z,$B1CE
ECH1:F841 F0 D1            ldh  a,[$FFD1]
ECH1:F843 F0 C2            ldh  a,[$FFC2]
ECH1:F845 FB               ei   
ECH1:F846 D6 F5            sub  a,$F5
ECH1:F848 1D               dec  e
ECH1:F849 B7               or   a
ECH1:F84A 0F               rrca 
ECH1:F84B 2F               cpl  
ECH1:F84C 07               rlca 
ECH1:F84D AC               xor  h
ECH1:F84E 0F               rrca 
ECH1:F84F 8F               adc  a
ECH1:F850 7D               ld   a,l
ECH1:F851 E6 F0            and  a,$F0
ECH1:F853 B6               or   [hl]
ECH1:F854 58               ld   e,b
ECH1:F855 50               ld   d,b
ECH1:F856 FD               db   $FD ; undefined opcode
ECH1:F857 D5               push de
ECH1:F858 07               rlca 
ECH1:F859 8E               adc  [hl]
ECH1:F85A 0F               rrca 
ECH1:F85B 8B               adc  e
ECH1:F85C 1A               ld   a,[de]
ECH1:F85D 9E               sbc  [hl]
ECH1:F85E 6F               ld   l,a
ECH1:F85F 06 74            ld   b,$74
ECH1:F861 51               ld   d,c
ECH1:F862 50               ld   d,b
ECH1:F863 F1               pop  af
ECH1:F864 F0 E1            ldh  a,[$FFE1]
ECH1:F866 C4 F6 53         call nz,$53F6
ECH1:F869 06 11            ld   b,$11
ECH1:F86B BE               cp   [hl]
ECH1:F86C 02               ld   [bc],a
ECH1:F86D 03               inc  bc
ECH1:F86E 8E               adc  [hl]
ECH1:F86F 8A               adc  d
ECH1:F870 48               ld   c,b
ECH1:F871 B2               or   d
ECH1:F872 A6               and  [hl]
ECH1:F873 B4               or   h
ECH1:F874 FA 75 36         ld   a,[$3675]
ECH1:F877 B6               or   [hl]
ECH1:F878 18 0D            jr   $F887
ECH1:F87A 4A               ld   c,d
ECH1:F87B C6 2B            add  a,$2B
ECH1:F87D 0E 4F            ld   c,$4F
ECH1:F87F 8E               adc  [hl]
ECH1:F880 A6               and  [hl]
ECH1:F881 88               adc  b
ECH1:F882 93               sub  e
ECH1:F883 1A               ld   a,[de]
ECH1:F884 F1               pop  af
ECH1:F885 32               ldd  [hl],a
ECH1:F886 DA 3A B5         jp   c,$B53A
ECH1:F889 3F               ccf  
ECH1:F88A 62               ld   h,d
ECH1:F88B E6 A7            and  a,$A7
ECH1:F88D F7               rst  $30
ECH1:F88E 0B               dec  bc
ECH1:F88F 0F               rrca 
ECH1:F890 E4               db   $E4 ; undefined opcode
ECH1:F891 F0 F4            ldh  a,[$FFF4]
ECH1:F893 60               ld   h,b
ECH1:F894 E9               jp   hl
ECH1:F895 B2               or   d
ECH1:F896 B1               or   c
ECH1:F897 36 2F            ld   [hl],$2F
ECH1:F899 0F               rrca 
ECH1:F89A 0E 67            ld   c,$67
ECH1:F89C 37               scf  
ECH1:F89D 4B               ld   c,e
ECH1:F89E 27               daa  
ECH1:F89F 0E D1            ld   c,$D1
ECH1:F8A1 7D               ld   a,l
ECH1:F8A2 C0               ret  nz
ECH1:F8A3 C6 F2            add  a,$F2
ECH1:F8A5 F0 10            ldh  a,[$FF10]
ECH1:F8A7 B3               or   e
ECH1:F8A8 5F               ld   e,a
ECH1:F8A9 43               ld   b,e
ECH1:F8AA 0D               dec  c
ECH1:F8AB 92               sub  d
ECH1:F8AC 07               rlca 
ECH1:F8AD 02               ld   [bc],a
ECH1:F8AE 0B               dec  bc
ECH1:F8AF 5E               ld   e,[hl]
ECH1:F8B0 B5               or   l
ECH1:F8B1 92               sub  d
ECH1:F8B2 74               ld   [hl],h
ECH1:F8B3 60               ld   h,b
ECH1:F8B4 69               ld   l,c
ECH1:F8B5 50               ld   d,b
ECH1:F8B6 A0               and  b
ECH1:F8B7 E4               db   $E4 ; undefined opcode
ECH1:F8B8 AE               xor  [hl]
ECH1:F8B9 81               add  c
ECH1:F8BA 2F               cpl  
ECH1:F8BB 0F               rrca 
ECH1:F8BC 4B               ld   c,e
ECH1:F8BD 8F               adc  a
ECH1:F8BE 85               add  l
ECH1:F8BF 6A               ld   l,d
ECH1:F8C0 F1               pop  af
ECH1:F8C1 FA 01 C3         ld   a,[$C301]
ECH1:F8C4 70               ld   [hl],b
ECH1:F8C5 B4               or   h
ECH1:F8C6 D8               ret  c
ECH1:F8C7 E1               pop  hl
ECH1:F8C8 19               add  hl,de
ECH1:F8C9 13               inc  de
ECH1:F8CA 1F               rra  
ECH1:F8CB 0B               dec  bc
ECH1:F8CC C2 0D 0E         jp   nz,$0E0D
ECH1:F8CF 89               adc  c
ECH1:F8D0 31 46 68         ld   sp,$6846
ECH1:F8D3 D0               ret  nc
ECH1:F8D4 B4               or   h
ECH1:F8D5 D0               ret  nc
ECH1:F8D6 79               ld   a,c
ECH1:F8D7 85               add  l
ECH1:F8D8 2D               dec  l
ECH1:F8D9 4E               ld   c,[hl]
ECH1:F8DA 1F               rra  
ECH1:F8DB 3A               ldd  a,[hl]
ECH1:F8DC CF               rst  $08
ECH1:F8DD 45               ld   b,l
ECH1:F8DE 6E               ld   l,[hl]
ECH1:F8DF 4E               ld   c,[hl]
ECH1:F8E0 66               ld   h,[hl]
ECH1:F8E1 72               ld   [hl],d
ECH1:F8E2 98               sbc  b
ECH1:F8E3 7E               ld   a,[hl]
ECH1:F8E4 ED               db   $ED ; undefined opcode
ECH1:F8E5 BC               cp   h
ECH1:F8E6 C0               ret  nz
ECH1:F8E7 90               sub  b
ECH1:F8E8 09               add  hl,bc
ECH1:F8E9 EA 46 BF         ld   [$BF46],a
ECH1:F8EC 57               ld   d,a
ECH1:F8ED 97               sub  a
ECH1:F8EE 8D               adc  l
ECH1:F8EF 0A               ld   a,[bc]
ECH1:F8F0 B2               or   d
ECH1:F8F1 3A               ldd  a,[hl]
ECH1:F8F2 34               inc  [hl]
ECH1:F8F3 F9               ld   sp,hl
ECH1:F8F4 F0 D4            ldh  a,[$FFD4]
ECH1:F8F6 78               ld   a,b
ECH1:F8F7 19               add  hl,de
ECH1:F8F8 8E               adc  [hl]
ECH1:F8F9 8C               adc  h
ECH1:F8FA 93               sub  e
ECH1:F8FB 95               sub  l
ECH1:F8FC 0F               rrca 
ECH1:F8FD 8F               adc  a
ECH1:F8FE 2B               dec  hl
ECH1:F8FF 56               ld   d,[hl]
ECH1:F900 EF               rst  $28
ECH1:F901 5B               ld   e,e
ECH1:F902 27               daa  
ECH1:F903 2D               dec  l
ECH1:F904 8B               adc  e
ECH1:F905 1D               dec  e
ECH1:F906 0D               dec  c
ECH1:F907 E1               pop  hl
ECH1:F908 D0               ret  nc
ECH1:F909 A2               and  d
ECH1:F90A 30 52            jr   nc,$F95E
ECH1:F90C C1               pop  bc
ECH1:F90D F5               push af
ECH1:F90E 58               ld   e,b
ECH1:F90F 7A               ld   a,d
ECH1:F910 95               sub  l
ECH1:F911 2F               cpl  
ECH1:F912 0F               rrca 
ECH1:F913 1C               inc  e
ECH1:F914 B5               or   l
ECH1:F915 14               inc  d
ECH1:F916 85               add  l
ECH1:F917 0D               dec  c
ECH1:F918 C2 F6 C2         jp   nz,$C2F6
ECH1:F91B E9               jp   hl
ECH1:F91C F8 C5            ld   hl,sp-$3B
ECH1:F91E FA A3 0C         ld   a,[$0CA3]
ECH1:F921 4F               ld   c,a
ECH1:F922 20 06            jr   nz,$F92A
ECH1:F924 4F               ld   c,a
ECH1:F925 0F               rrca 
ECH1:F926 E4               db   $E4 ; undefined opcode
ECH1:F927 34               inc  [hl]
ECH1:F928 DC FC 42         call c,$42FC
ECH1:F92B 48               ld   c,b
ECH1:F92C E2               ld   [$ff00+c],a
ECH1:F92D B2               or   d
ECH1:F92E B5               or   l
ECH1:F92F F7               rst  $30
ECH1:F930 7F               ld   a,a
ECH1:F931 63               ld   h,e
ECH1:F932 57               ld   d,a
ECH1:F933 03               inc  bc
ECH1:F934 2B               dec  hl
ECH1:F935 D1               pop  de
ECH1:F936 13               inc  de
ECH1:F937 0D               dec  c
ECH1:F938 39               add  hl,sp
ECH1:F939 38 FF            jr   c,$F93A
ECH1:F93B 88               adc  b
ECH1:F93C E1               pop  hl
ECH1:F93D A1               and  c
ECH1:F93E D0               ret  nc
ECH1:F93F CA DB 02         jp   z,$02DB
ECH1:F942 2F               cpl  
ECH1:F943 9F               sbc  a
ECH1:F944 07               rlca 
ECH1:F945 01 0E A7         ld   bc,$A70E
ECH1:F948 5A               ld   e,d
ECH1:F949 C1               pop  bc
ECH1:F94A 7D               ld   a,l
ECH1:F94B 32               ldd  [hl],a
ECH1:F94C A2               and  d
ECH1:F94D CA F8 28         jp   z,$28F8
ECH1:F950 0A               ld   a,[bc]
ECH1:F951 05               dec  b
ECH1:F952 6C               ld   l,h
ECH1:F953 27               daa  
ECH1:F954 0F               rrca 
ECH1:F955 FA C3 27         ld   a,[$27C3]
ECH1:F958 82               add  d
ECH1:F959 B8               cp   b
ECH1:F95A B9               cp   c
ECH1:F95B EC               db   $EC ; undefined opcode
ECH1:F95C 53               ld   d,e
ECH1:F95D 70               ld   [hl],b
ECH1:F95E F0 FA            ldh  a,[$FFFA]
ECH1:F960 01 19 2E         ld   bc,$2E19
ECH1:F963 4D               ld   c,l
ECH1:F964 4D               ld   c,l
ECH1:F965 0F               rrca 
ECH1:F966 5E               ld   e,[hl]
ECH1:F967 0D               dec  c
ECH1:F968 D2 F0 E8         jp   nc,$E8F0
ECH1:F96B E4               db   $E4 ; undefined opcode
ECH1:F96C 61               ld   h,c
ECH1:F96D 39               add  hl,sp
ECH1:F96E 10 5D            <corrupted stop>
ECH1:F970 6F               ld   l,a
ECH1:F971 7B               ld   a,e
ECH1:F972 0C               inc  c
ECH1:F973 E7               rst  $20
ECH1:F974 14               inc  d
ECH1:F975 8F               adc  a
ECH1:F976 6E               ld   l,[hl]
ECH1:F977 1A               ld   a,[de]
ECH1:F978 F3               di   
ECH1:F979 BD               cp   l
ECH1:F97A 58               ld   e,b
ECH1:F97B 05               dec  b
ECH1:F97C A5               and  l
ECH1:F97D 74               ld   [hl],h
ECH1:F97E F5               push af
ECH1:F97F 70               ld   [hl],b
ECH1:F980 0D               dec  c
ECH1:F981 06 DB            ld   b,$DB
ECH1:F983 A6               and  [hl]
ECH1:F984 DA 4F 86         jp   c,$864F
ECH1:F987 15               dec  d
ECH1:F988 F8 92            ld   hl,sp-$6E
ECH1:F98A 70               ld   [hl],b
ECH1:F98B D7               rst  $10
ECH1:F98C 74               ld   [hl],h
ECH1:F98D D0               ret  nc
ECH1:F98E F4               db   $F4 ; undefined opcode
ECH1:F98F F0 2F            ldh  a,[$FF2F]
ECH1:F991 8E               adc  [hl]
ECH1:F992 A8               xor  b
ECH1:F993 5F               ld   e,a
ECH1:F994 8E               adc  [hl]
ECH1:F995 01 0F 55         ld   bc,$550F
ECH1:F998 40               ld   b,b
ECH1:F999 A0               and  b
ECH1:F99A F8 E0            ld   hl,sp-$20
ECH1:F99C B8               cp   b
ECH1:F99D D6 78            sub  a,$78
ECH1:F99F F2               ld   a,[$ff00+c]
ECH1:F9A0 92               sub  d
ECH1:F9A1 8F               adc  a
ECH1:F9A2 5F               ld   e,a
ECH1:F9A3 6D               ld   l,l
ECH1:F9A4 1B               dec  de
ECH1:F9A5 1E 4C            ld   e,$4C
ECH1:F9A7 2E 32            ld   l,$32
ECH1:F9A9 F7               rst  $30
ECH1:F9AA D9               reti 
ECH1:F9AB 21 FD 22         ld   hl,$22FD
ECH1:F9AE 91               sub  c
ECH1:F9AF D1               pop  de
ECH1:F9B0 1F               rra  
ECH1:F9B1 0E 4E            ld   c,$4E
ECH1:F9B3 A7               and  a
ECH1:F9B4 87               add  a
ECH1:F9B5 8F               adc  a
ECH1:F9B6 34               inc  [hl]
ECH1:F9B7 7B               ld   a,e
ECH1:F9B8 D1               pop  de
ECH1:F9B9 E4               db   $E4 ; undefined opcode
ECH1:F9BA 7A               ld   a,d
ECH1:F9BB E5               push hl
ECH1:F9BC 32               ldd  [hl],a
ECH1:F9BD F4               db   $F4 ; undefined opcode
ECH1:F9BE FA 74 0F         ld   a,[$0F74]
ECH1:F9C1 2C               inc  l
ECH1:F9C2 DF               rst  $18
ECH1:F9C3 1F               rra  
ECH1:F9C4 07               rlca 
ECH1:F9C5 8C               adc  h
ECH1:F9C6 6E               ld   l,[hl]
ECH1:F9C7 0B               dec  bc
ECH1:F9C8 F8 71            ld   hl,sp+$71
ECH1:F9CA 22               ldi  [hl],a
ECH1:F9CB 99               sbc  c
ECH1:F9CC 10 F9            <corrupted stop>
ECH1:F9CE D4 70 D6         call nc,$D670
ECH1:F9D1 42               ld   b,d
ECH1:F9D2 10 22            <corrupted stop>
ECH1:F9D4 1B               dec  de
ECH1:F9D5 0F               rrca 
ECH1:F9D6 2F               cpl  
ECH1:F9D7 8B               adc  e
ECH1:F9D8 92               sub  d
ECH1:F9D9 EC               db   $EC ; undefined opcode
ECH1:F9DA 63               ld   h,e
ECH1:F9DB 62               ld   h,d
ECH1:F9DC 90               sub  b
ECH1:F9DD E5               push hl
ECH1:F9DE 1A               ld   a,[de]
ECH1:F9DF 90               sub  b
ECH1:F9E0 0D               dec  c
ECH1:F9E1 3D               dec  a
ECH1:F9E2 09               add  hl,bc
ECH1:F9E3 96               sub  [hl]
ECH1:F9E4 0C               inc  c
ECH1:F9E5 9A               sbc  d
ECH1:F9E6 14               inc  d
ECH1:F9E7 7D               ld   a,l
ECH1:F9E8 D6 BE            sub  a,$BE
ECH1:F9EA 74               ld   [hl],h
ECH1:F9EB 38 54            jr   c,$FA41
ECH1:F9ED 30 70            jr   nc,$FA5F
ECH1:F9EF E9               jp   hl
ECH1:F9F0 0F               rrca 
ECH1:F9F1 1A               ld   a,[de]
ECH1:F9F2 6B               ld   l,e
ECH1:F9F3 18 25            jr   $FA1A
ECH1:F9F5 0E 46            ld   c,$46
ECH1:F9F7 06 B6            ld   b,$B6
ECH1:F9F9 44               ld   b,h
ECH1:F9FA 45               ld   b,l
ECH1:F9FB E2               ld   [$ff00+c],a
ECH1:F9FC B6               or   [hl]
ECH1:F9FD E9               jp   hl
ECH1:F9FE 70               ld   [hl],b
ECH1:F9FF 78               ld   a,b
ECH1:FA00 F6 77            or   a,$77
ECH1:FA02 F1               pop  af
ECH1:FA03 30 D2            jr   nc,$F9D7
ECH1:FA05 F3               di   
ECH1:FA06 38 30            jr   c,$FA38
ECH1:FA08 49               ld   c,c
ECH1:FA09 29               add  hl,hl
ECH1:FA0A CA 8F 22         jp   z,$228F
ECH1:FA0D 37               scf  
ECH1:FA0E 64               ld   h,h
ECH1:FA0F 0B               dec  bc
ECH1:FA10 F0 81            ldh  a,[$FF81]
ECH1:FA12 74               ld   [hl],h
ECH1:FA13 F0 F2            ldh  a,[$FFF2]
ECH1:FA15 DA 90 98         jp   c,$9890
ECH1:FA18 8F               adc  a
ECH1:FA19 1A               ld   a,[de]
ECH1:FA1A D3               db   $D3 ; undefined opcode
ECH1:FA1B 58               ld   e,b
ECH1:FA1C 1F               rra  
ECH1:FA1D 67               ld   h,a
ECH1:FA1E 08 0F E5         ld   [$E50F],sp
ECH1:FA21 50               ld   d,b
ECH1:FA22 96               sub  [hl]
ECH1:FA23 D3               db   $D3 ; undefined opcode
ECH1:FA24 50               ld   d,b
ECH1:FA25 F4               db   $F4 ; undefined opcode
ECH1:FA26 98               sbc  b
ECH1:FA27 B7               or   a
ECH1:FA28 07               rlca 
ECH1:FA29 7A               ld   a,d
ECH1:FA2A A3               and  e
ECH1:FA2B 47               ld   b,a
ECH1:FA2C 4F               ld   c,a
ECH1:FA2D 0C               inc  c
ECH1:FA2E 0D               dec  c
ECH1:FA2F 05               dec  b
ECH1:FA30 D0               ret  nc
ECH1:FA31 D3               db   $D3 ; undefined opcode
ECH1:FA32 62               ld   h,d
ECH1:FA33 FC               db   $FC ; undefined opcode
ECH1:FA34 EE F9            xor  a,$F9
ECH1:FA36 65               ld   h,l
ECH1:FA37 DC 1B 37         call c,$371B
ECH1:FA3A 87               add  a
ECH1:FA3B BD               cp   l
ECH1:FA3C 0D               dec  c
ECH1:FA3D EF               rst  $28
ECH1:FA3E 0D               dec  c
ECH1:FA3F 1F               rra  
ECH1:FA40 B6               or   [hl]
ECH1:FA41 A2               and  d
ECH1:FA42 D1               pop  de
ECH1:FA43 12               ld   [de],a
ECH1:FA44 01 E0 E0         ld   bc,$E0E0
ECH1:FA47 E8 5F            add  sp,$5F
ECH1:FA49 21 87 47         ld   hl,$4787
ECH1:FA4C 4F               ld   c,a
ECH1:FA4D 4F               ld   c,a
ECH1:FA4E 85               add  l
ECH1:FA4F 8B               adc  e
ECH1:FA50 F3               di   
ECH1:FA51 BF               cp   a
ECH1:FA52 90               sub  b
ECH1:FA53 F4               db   $F4 ; undefined opcode
ECH1:FA54 F3               di   
ECH1:FA55 F8 E0            ld   hl,sp-$20
ECH1:FA57 C4 0F BB         call nz,$BB0F
ECH1:FA5A 01 69 F6         ld   bc,$F669
ECH1:FA5D 61               ld   h,c
ECH1:FA5E 8F               adc  a
ECH1:FA5F 35               dec  [hl]
ECH1:FA60 7C               ld   a,h
ECH1:FA61 B6               or   [hl]
ECH1:FA62 B8               cp   b
ECH1:FA63 A6               and  [hl]
ECH1:FA64 F0 B2            ldh  a,[$FFB2]
ECH1:FA66 6C               ld   l,h
ECH1:FA67 B0               or   b
ECH1:FA68 D3               db   $D3 ; undefined opcode
ECH1:FA69 1D               dec  e
ECH1:FA6A D4 8F 4F         call nc,$4F8F
ECH1:FA6D 9F               sbc  a
ECH1:FA6E 02               ld   [bc],a
ECH1:FA6F 89               adc  c
ECH1:FA70 E2               ld   [$ff00+c],a
ECH1:FA71 77               ld   [hl],a
ECH1:FA72 70               ld   [hl],b
ECH1:FA73 24               inc  h
ECH1:FA74 5F               ld   e,a
ECH1:FA75 84               add  h
ECH1:FA76 F4               db   $F4 ; undefined opcode
ECH1:FA77 C3 7B 1F         jp   $1F7B
ECH1:FA7A E5               push hl
ECH1:FA7B 0F               rrca 
ECH1:FA7C 0E AB            ld   c,$AB
ECH1:FA7E 85               add  l
ECH1:FA7F 51               ld   d,c
ECH1:FA80 4A               ld   c,d
ECH1:FA81 BC               cp   h
ECH1:FA82 E0 D3            ldh  [$FFD3],a
ECH1:FA84 36 E2            ld   [hl],$E2
ECH1:FA86 D0               ret  nc
ECH1:FA87 7F               ld   a,a
ECH1:FA88 5B               ld   e,e
ECH1:FA89 02               ld   [bc],a
ECH1:FA8A 0F               rrca 
ECH1:FA8B F7               rst  $30
ECH1:FA8C 0F               rrca 
ECH1:FA8D 2E 0F            ld   l,$0F
ECH1:FA8F DB               db   $DB ; undefined opcode
ECH1:FA90 B4               or   h
ECH1:FA91 E0 B0            ldh  [$FFB0],a
ECH1:FA93 90               sub  b
ECH1:FA94 E7               rst  $20
ECH1:FA95 01 74 39         ld   bc,$3974
ECH1:FA98 8B               adc  e
ECH1:FA99 3F               ccf  
ECH1:FA9A 6A               ld   l,d
ECH1:FA9B E7               rst  $20
ECH1:FA9C 1C               inc  e
ECH1:FA9D 5A               ld   e,d
ECH1:FA9E 67               ld   h,a
ECH1:FA9F 53               ld   d,e
ECH1:FAA0 75               ld   [hl],l
ECH1:FAA1 B0               or   b
ECH1:FAA2 E8 70            add  sp,$70
ECH1:FAA4 F6 B4            or   a,$B4
ECH1:FAA6 5A               ld   e,d
ECH1:FAA7 C2 1F 35         jp   nz,$351F
ECH1:FAAA 0F               rrca 
ECH1:FAAB C5               push bc
ECH1:FAAC 08 27 07         ld   [$0727],sp
ECH1:FAAF 85               add  l
ECH1:FAB0 F4               db   $F4 ; undefined opcode
ECH1:FAB1 54               ld   d,h
ECH1:FAB2 90               sub  b
ECH1:FAB3 7F               ld   a,a
ECH1:FAB4 76               halt 
ECH1:FAB5 C0               ret  nz
ECH1:FAB6 68               ld   l,b
ECH1:FAB7 70               ld   [hl],b
ECH1:FAB8 47               ld   b,a
ECH1:FAB9 BA               cp   d
ECH1:FABA 6E               ld   l,[hl]
ECH1:FABB A6               and  [hl]
ECH1:FABC 47               ld   b,a
ECH1:FABD 3E 0C            ld   a,$0C
ECH1:FABF 4F               ld   c,a
ECH1:FAC0 BA               cp   d
ECH1:FAC1 44               ld   b,h
ECH1:FAC2 80               add  b
ECH1:FAC3 B8               cp   b
ECH1:FAC4 72               ld   [hl],d
ECH1:FAC5 F0 E6            ldh  a,[$FFE6]
ECH1:FAC7 78               ld   a,b
ECH1:FAC8 17               rla  
ECH1:FAC9 09               add  hl,bc
ECH1:FACA 3A               ldd  a,[hl]
ECH1:FACB 3E 53            ld   a,$53
ECH1:FACD 7F               ld   a,a
ECH1:FACE 0F               rrca 
ECH1:FACF 0B               dec  bc
ECH1:FAD0 F9               ld   sp,hl
ECH1:FAD1 70               ld   [hl],b
ECH1:FAD2 20 CB            jr   nz,$FA9F
ECH1:FAD4 F0 19            ldh  a,[$FF19]
ECH1:FAD6 AB               xor  e
ECH1:FAD7 50               ld   d,b
ECH1:FAD8 2B               dec  hl
ECH1:FAD9 0F               rrca 
ECH1:FADA 9B               sbc  e
ECH1:FADB 03               inc  bc
ECH1:FADC 43               ld   b,e
ECH1:FADD 43               ld   b,e
ECH1:FADE 0B               dec  bc
ECH1:FADF 0F               rrca 
ECH1:FAE0 C2 5D 51         jp   nz,$515D
ECH1:FAE3 E1               pop  hl
ECH1:FAE4 61               ld   h,c
ECH1:FAE5 E2               ld   [$ff00+c],a
ECH1:FAE6 A2               and  d
ECH1:FAE7 50               ld   d,b
ECH1:FAE8 F5               push af
ECH1:FAE9 B7               or   a
ECH1:FAEA 67               ld   h,a
ECH1:FAEB 0C               inc  c
ECH1:FAEC 9B               sbc  e
ECH1:FAED 6E               ld   l,[hl]
ECH1:FAEE 08 4F B1         ld   [$B14F],sp
ECH1:FAF1 38 F4            jr   c,$FAE7
ECH1:FAF3 20 68            jr   nz,$FB5D
ECH1:FAF5 76               halt 
ECH1:FAF6 F0 70            ldh  a,[$FF70]
ECH1:FAF8 03               inc  bc
ECH1:FAF9 AF               xor  a
ECH1:FAFA 9D               sbc  l
ECH1:FAFB 8B               adc  e
ECH1:FAFC 2B               dec  hl
ECH1:FAFD 01 C7 0F         ld   bc,$0FC7
ECH1:FB00 0E 2F            ld   c,$2F
ECH1:FB02 0D               dec  c
ECH1:FB03 37               scf  
ECH1:FB04 B7               or   a
ECH1:FB05 E5               push hl
ECH1:FB06 AF               xor  a
ECH1:FB07 9E               sbc  [hl]
ECH1:FB08 B0               or   b
ECH1:FB09 FB               ei   
ECH1:FB0A 46               ld   b,[hl]
ECH1:FB0B E9               jp   hl
ECH1:FB0C A3               and  e
ECH1:FB0D 3A               ldd  a,[hl]
ECH1:FB0E 16 BA            ld   d,$BA
ECH1:FB10 5B               ld   e,e
ECH1:FB11 95               sub  l
ECH1:FB12 42               ld   b,d
ECH1:FB13 4F               ld   c,a
ECH1:FB14 07               rlca 
ECH1:FB15 2F               cpl  
ECH1:FB16 2C               inc  l
ECH1:FB17 82               add  d
ECH1:FB18 AA               xor  d
ECH1:FB19 50               ld   d,b
ECH1:FB1A 62               ld   h,d
ECH1:FB1B 70               ld   [hl],b
ECH1:FB1C 78               ld   a,b
ECH1:FB1D 58               ld   e,b
ECH1:FB1E F0 D0            ldh  a,[$FFD0]
ECH1:FB20 02               ld   [bc],a
ECH1:FB21 5A               ld   e,d
ECH1:FB22 0E 8F            ld   c,$8F
ECH1:FB24 41               ld   b,c
ECH1:FB25 5E               ld   e,[hl]
ECH1:FB26 8F               adc  a
ECH1:FB27 41               ld   b,c
ECH1:FB28 F6 82            or   a,$82
ECH1:FB2A 99               sbc  c
ECH1:FB2B 56               ld   d,[hl]
ECH1:FB2C A0               and  b
ECH1:FB2D CC 6C 40         call z,$406C
ECH1:FB30 BB               cp   e
ECH1:FB31 37               scf  
ECH1:FB32 BE               cp   [hl]
ECH1:FB33 2B               dec  hl
ECH1:FB34 69               ld   l,c
ECH1:FB35 0B               dec  bc
ECH1:FB36 9F               sbc  a
ECH1:FB37 3B               dec  sp
ECH1:FB38 7C               ld   a,h
ECH1:FB39 B5               or   l
ECH1:FB3A F0 D2            ldh  a,[$FFD2]
ECH1:FB3C EC               db   $EC ; undefined opcode
ECH1:FB3D D2 B0 32         jp   nc,$32B0
ECH1:FB40 15               dec  d
ECH1:FB41 8B               adc  e
ECH1:FB42 AF               xor  a
ECH1:FB43 AE               xor  [hl]
ECH1:FB44 06 8E            ld   b,$8E
ECH1:FB46 DF               rst  $18
ECH1:FB47 29               add  hl,hl
ECH1:FB48 50               ld   d,b
ECH1:FB49 BC               cp   h
ECH1:FB4A F0 CC            ldh  a,[$FFCC]
ECH1:FB4C E1               pop  hl
ECH1:FB4D 71               ld   [hl],c
ECH1:FB4E 51               ld   d,c
ECH1:FB4F DF               rst  $18
ECH1:FB50 0E 63            ld   c,$63
ECH1:FB52 2A               ldi  a,[hl]
ECH1:FB53 97               sub  a
ECH1:FB54 26 0F            ld   h,$0F
ECH1:FB56 F8 3B            ld   hl,sp+$3B
ECH1:FB58 C8               ret  z
ECH1:FB59 B5               or   l
ECH1:FB5A F5               push af
ECH1:FB5B 55               ld   d,l
ECH1:FB5C FC               db   $FC ; undefined opcode
ECH1:FB5D 63               ld   h,e
ECH1:FB5E 51               ld   d,c
ECH1:FB5F 9A               sbc  d
ECH1:FB60 01 6E 87         ld   bc,$876E
ECH1:FB63 89               adc  c
ECH1:FB64 8F               adc  a
ECH1:FB65 24               inc  h
ECH1:FB66 FF               rst  $38
ECH1:FB67 3F               ccf  
ECH1:FB68 74               ld   [hl],h
ECH1:FB69 FB               ei   
ECH1:FB6A A0               and  b
ECH1:FB6B 58               ld   e,b
ECH1:FB6C 90               sub  b
ECH1:FB6D D0               ret  nc
ECH1:FB6E 04               inc  b
ECH1:FB6F CC 0E 87         call z,$870E
ECH1:FB72 0E 2D            ld   c,$2D
ECH1:FB74 14               inc  d
ECH1:FB75 22               ldi  [hl],a
ECH1:FB76 AD               xor  l
ECH1:FB77 6F               ld   l,a
ECH1:FB78 7C               ld   a,h
ECH1:FB79 F8 71            ld   hl,sp+$71
ECH1:FB7B F0 21            ldh  a,[$FF21]
ECH1:FB7D E7               rst  $20
ECH1:FB7E D6 F0            sub  a,$F0
ECH1:FB80 82               add  d
ECH1:FB81 0B               dec  bc
ECH1:FB82 9D               sbc  l
ECH1:FB83 17               rla  
ECH1:FB84 BD               cp   l
ECH1:FB85 E2               ld   [$ff00+c],a
ECH1:FB86 0F               rrca 
ECH1:FB87 AE               xor  [hl]
ECH1:FB88 F0 32            ldh  a,[$FF32]
ECH1:FB8A 39               add  hl,sp
ECH1:FB8B E4               db   $E4 ; undefined opcode
ECH1:FB8C D6 40            sub  a,$40
ECH1:FB8E F0 F1            ldh  a,[$FFF1]
ECH1:FB90 0F               rrca 
ECH1:FB91 CD 99 4E         call $4E99
ECH1:FB94 4F               ld   c,a
ECH1:FB95 07               rlca 
ECH1:FB96 4B               ld   c,e
ECH1:FB97 2E EC            ld   l,$EC
ECH1:FB99 30 38            jr   nc,$FBD3
ECH1:FB9B FC               db   $FC ; undefined opcode
ECH1:FB9C 15               dec  d
ECH1:FB9D DA F4 E4         jp   c,$E4F4
ECH1:FBA0 09               add  hl,bc
ECH1:FBA1 9F               sbc  a
ECH1:FBA2 37               scf  
ECH1:FBA3 C2 16 E3         jp   nz,$E316
ECH1:FBA6 06 3F            ld   b,$3F
ECH1:FBA8 74               ld   [hl],h
ECH1:FBA9 DC F6 78         call c,$78F6
ECH1:FBAC 79               ld   a,c
ECH1:FBAD D1               pop  de
ECH1:FBAE 83               add  e
ECH1:FBAF F4               db   $F4 ; undefined opcode
ECH1:FBB0 15               dec  d
ECH1:FBB1 1F               rra  
ECH1:FBB2 0F               rrca 
ECH1:FBB3 0A               ld   a,[bc]
ECH1:FBB4 05               dec  b
ECH1:FBB5 8C               adc  h
ECH1:FBB6 F7               rst  $30
ECH1:FBB7 28 F8            jr   z,$FBB1
ECH1:FBB9 50               ld   d,b
ECH1:FBBA F8 F5            ld   hl,sp-$0B
ECH1:FBBC 35               dec  [hl]
ECH1:FBBD 70               ld   [hl],b
ECH1:FBBE 5A               ld   e,d
ECH1:FBBF 60               ld   h,b
ECH1:FBC0 93               sub  e
ECH1:FBC1 23               inc  hl
ECH1:FBC2 0E AF            ld   c,$AF
ECH1:FBC4 0D               dec  c
ECH1:FBC5 57               ld   d,a
ECH1:FBC6 52               ld   d,d
ECH1:FBC7 4F               ld   c,a
ECH1:FBC8 36 F6            ld   [hl],$F6
ECH1:FBCA A4               and  h
ECH1:FBCB C4 F0 7A         call nz,$7AF0
ECH1:FBCE FC               db   $FC ; undefined opcode
ECH1:FBCF C5               push bc
ECH1:FBD0 75               ld   [hl],l
ECH1:FBD1 FB               ei   
ECH1:FBD2 DF               rst  $18
ECH1:FBD3 3D               dec  a
ECH1:FBD4 5F               ld   e,a
ECH1:FBD5 1F               rra  
ECH1:FBD6 DB               db   $DB ; undefined opcode
ECH1:FBD7 85               add  l
ECH1:FBD8 F5               push af
ECH1:FBD9 F1               pop  af
ECH1:FBDA F0 D0            ldh  a,[$FFD0]
ECH1:FBDC D0               ret  nc
ECH1:FBDD 76               halt 
ECH1:FBDE 70               ld   [hl],b
ECH1:FBDF E6 4D            and  a,$4D
ECH1:FBE1 83               add  e
ECH1:FBE2 CF               rst  $08
ECH1:FBE3 07               rlca 
ECH1:FBE4 8F               adc  a
ECH1:FBE5 47               ld   b,a
ECH1:FBE6 54               ld   d,h
ECH1:FBE7 0E FC            ld   c,$FC
ECH1:FBE9 BD               cp   l
ECH1:FBEA F9               ld   sp,hl
ECH1:FBEB 55               ld   d,l
ECH1:FBEC 72               ld   [hl],d
ECH1:FBED A0               and  b
ECH1:FBEE E8 F0            add  sp,-$10
ECH1:FBF0 2E 2F            ld   l,$2F
ECH1:FBF2 23               inc  hl
ECH1:FBF3 43               ld   b,e
ECH1:FBF4 0D               dec  c
ECH1:FBF5 BF               cp   a
ECH1:FBF6 0C               inc  c
ECH1:FBF7 3B               dec  sp
ECH1:FBF8 50               ld   d,b
ECH1:FBF9 D9               reti 
ECH1:FBFA E3               db   $E3 ; undefined opcode
ECH1:FBFB 99               sbc  c
ECH1:FBFC F2               ld   a,[$ff00+c]
ECH1:FBFD B0               or   b
ECH1:FBFE 7F               ld   a,a
ECH1:FBFF F4               db   $F4 ; undefined opcode
ECH1:FC00 42               ld   b,d
ECH1:FC01 97               sub  a
ECH1:FC02 6E               ld   l,[hl]
ECH1:FC03 9F               sbc  a
ECH1:FC04 02               ld   [bc],a
ECH1:FC05 99               sbc  c
ECH1:FC06 6E               ld   l,[hl]
ECH1:FC07 58               ld   e,b
ECH1:FC08 10 66            <corrupted stop>
ECH1:FC0A EC               db   $EC ; undefined opcode
ECH1:FC0B 91               sub  c
ECH1:FC0C F8 91            ld   hl,sp-$6F
ECH1:FC0E D2 CD 8F         jp   nc,$8FCD
ECH1:FC11 0F               rrca 
ECH1:FC12 63               ld   h,e
ECH1:FC13 05               dec  b
ECH1:FC14 6F               ld   l,a
ECH1:FC15 1E EF            ld   e,$EF
ECH1:FC17 94               sub  h
ECH1:FC18 55               ld   d,l
ECH1:FC19 96               sub  [hl]
ECH1:FC1A E5               push hl
ECH1:FC1B 38 EC            jr   c,$FC09
ECH1:FC1D F5               push af
ECH1:FC1E F0 30            ldh  a,[$FF30]
ECH1:FC20 95               sub  l
ECH1:FC21 0B               dec  bc
ECH1:FC22 CB 9B            res  3,e
ECH1:FC24 21 2F 44         ld   hl,$442F
ECH1:FC27 2D               dec  l
ECH1:FC28 BA               cp   d
ECH1:FC29 70               ld   [hl],b
ECH1:FC2A F2               ld   a,[$ff00+c]
ECH1:FC2B B1               or   c
ECH1:FC2C FC               db   $FC ; undefined opcode
ECH1:FC2D 70               ld   [hl],b
ECH1:FC2E A9               xor  c
ECH1:FC2F D8               ret  c
ECH1:FC30 47               ld   b,a
ECH1:FC31 AB               xor  e
ECH1:FC32 37               scf  
ECH1:FC33 1F               rra  
ECH1:FC34 5A               ld   e,d
ECH1:FC35 57               ld   d,a
ECH1:FC36 34               inc  [hl]
ECH1:FC37 AE               xor  [hl]
ECH1:FC38 E0 F0            ldh  [$FFF0],a
ECH1:FC3A F8 92            ld   hl,sp-$6E
ECH1:FC3C 30 A1            jr   nc,$FBDF
ECH1:FC3E FA F0 01         ld   a,[$01F0]
ECH1:FC41 AE               xor  [hl]
ECH1:FC42 2D               dec  l
ECH1:FC43 C6 72            add  a,$72
ECH1:FC45 CF               rst  $08
ECH1:FC46 3E 43            ld   a,$43
ECH1:FC48 F8 A5            ld   hl,sp-$5B
ECH1:FC4A 79               ld   a,c
ECH1:FC4B FA D1 A8         ld   a,[$A8D1]
ECH1:FC4E FC               db   $FC ; undefined opcode
ECH1:FC4F 71               ld   [hl],c
ECH1:FC50 DB               db   $DB ; undefined opcode
ECH1:FC51 37               scf  
ECH1:FC52 2D               dec  l
ECH1:FC53 0F               rrca 
ECH1:FC54 80               add  b
ECH1:FC55 8E               adc  [hl]
ECH1:FC56 9B               sbc  e
ECH1:FC57 0D               dec  c
ECH1:FC58 F7               rst  $30
ECH1:FC59 56               ld   d,[hl]
ECH1:FC5A B4               or   h
ECH1:FC5B F1               pop  af
ECH1:FC5C EE E4            xor  a,$E4
ECH1:FC5E 76               halt 
ECH1:FC5F 7A               ld   a,d
ECH1:FC60 67               ld   h,a
ECH1:FC61 AF               xor  a
ECH1:FC62 89               adc  c
ECH1:FC63 0F               rrca 
ECH1:FC64 1F               rra  
ECH1:FC65 9F               sbc  a
ECH1:FC66 10 9E            <corrupted stop>
ECH1:FC68 A2               and  d
ECH1:FC69 B6               or   [hl]
ECH1:FC6A AA               xor  d
ECH1:FC6B DC 7C D5         call c,$D57C
ECH1:FC6E A0               and  b
ECH1:FC6F E8 1E            add  sp,$1E
ECH1:FC71 0F               rrca 
ECH1:FC72 EB               db   $EB ; undefined opcode
ECH1:FC73 0E 05            ld   c,$05
ECH1:FC75 CF               rst  $08
ECH1:FC76 0E 05            ld   c,$05
ECH1:FC78 E4               db   $E4 ; undefined opcode
ECH1:FC79 DB               db   $DB ; undefined opcode
ECH1:FC7A 30 F6            jr   nc,$FC72
ECH1:FC7C 90               sub  b
ECH1:FC7D DA F4 B0         jp   c,$B0F4
ECH1:FC80 5A               ld   e,d
ECH1:FC81 16 1B            ld   d,$1B
ECH1:FC83 8D               adc  l
ECH1:FC84 25               dec  h
ECH1:FC85 07               rlca 
ECH1:FC86 69               ld   l,c
ECH1:FC87 0F               rrca 
ECH1:FC88 40               ld   b,b
ECH1:FC89 EC               db   $EC ; undefined opcode
ECH1:FC8A DA FA 32         jp   c,$32FA
ECH1:FC8D 50               ld   d,b
ECH1:FC8E F3               di   
ECH1:FC8F 31 2F 2C         ld   sp,$2C2F
ECH1:FC92 17               rla  
ECH1:FC93 08 7B 09         ld   [$097B],sp
ECH1:FC96 8B               adc  e
ECH1:FC97 8F               adc  a
ECH1:FC98 31 73 76         ld   sp,$7673
ECH1:FC9B 7D               ld   a,l
ECH1:FC9C B3               or   e
ECH1:FC9D 70               ld   [hl],b
ECH1:FC9E 33               inc  sp
ECH1:FC9F F2               ld   a,[$ff00+c]
ECH1:FCA0 09               add  hl,bc
ECH1:FCA1 4F               ld   c,a
ECH1:FCA2 5C               ld   e,h
ECH1:FCA3 5A               ld   e,d
ECH1:FCA4 4C               ld   c,h
ECH1:FCA5 FA 0B 4D         ld   a,[$4D0B]
ECH1:FCA8 6A               ld   l,d
ECH1:FCA9 B5               or   l
ECH1:FCAA 96               sub  [hl]
ECH1:FCAB F8 8B            ld   hl,sp-$75
ECH1:FCAD EA A0 C0         ld   [$C0A0],a
ECH1:FCB0 87               add  a
ECH1:FCB1 6C               ld   l,h
ECH1:FCB2 8C               adc  h
ECH1:FCB3 95               sub  l
ECH1:FCB4 43               ld   b,e
ECH1:FCB5 0B               dec  bc
ECH1:FCB6 CF               rst  $08
ECH1:FCB7 4A               ld   c,d
ECH1:FCB8 A8               xor  b
ECH1:FCB9 70               ld   [hl],b
ECH1:FCBA 75               ld   [hl],l
ECH1:FCBB D2 F5 70         jp   nc,$70F5
ECH1:FCBE FE 14            cp   a,$14
ECH1:FCC0 8B               adc  e
ECH1:FCC1 8A               adc  d
ECH1:FCC2 0F               rrca 
ECH1:FCC3 4D               ld   c,l
ECH1:FCC4 4D               ld   c,l
ECH1:FCC5 C4 3D 17         call nz,$173D
ECH1:FCC8 E8 40            add  sp,$40
ECH1:FCCA C9               ret  
ECH1:FCCB 74               ld   [hl],h
ECH1:FCCC A0               and  b
ECH1:FCCD B1               or   c
ECH1:FCCE 78               ld   a,b
ECH1:FCCF F3               di   
ECH1:FCD0 C9               ret  
ECH1:FCD1 52               ld   d,d
ECH1:FCD2 1E 81            ld   e,$81
ECH1:FCD4 4F               ld   c,a
ECH1:FCD5 4F               ld   c,a
ECH1:FCD6 1F               rra  
ECH1:FCD7 77               ld   [hl],a
ECH1:FCD8 75               ld   [hl],l
ECH1:FCD9 B4               or   h
ECH1:FCDA 79               ld   a,c
ECH1:FCDB F8 73            ld   hl,sp+$73
ECH1:FCDD D5               push de
ECH1:FCDE BA               cp   d
ECH1:FCDF 84               add  h
ECH1:FCE0 55               ld   d,l
ECH1:FCE1 1D               dec  e
ECH1:FCE2 86               add  [hl]
ECH1:FCE3 07               rlca 
ECH1:FCE4 79               ld   a,c
ECH1:FCE5 2E 01            ld   l,$01
ECH1:FCE7 C2 E8 90         jp   nz,$90E8
ECH1:FCEA 78               ld   a,b
ECH1:FCEB CA A9 94         jp   z,$94A9
ECH1:FCEE 21 70 4E         ld   hl,$4E70
ECH1:FCF1 1A               ld   a,[de]
ECH1:FCF2 84               add  h
ECH1:FCF3 CD 9B 8E         call $8E9B
ECH1:FCF6 05               dec  b
ECH1:FCF7 13               inc  de
ECH1:FCF8 78               ld   a,b
ECH1:FCF9 5E               ld   e,[hl]
ECH1:FCFA C4 31 E0         call nz,$E031
ECH1:FCFD C1               pop  bc
ECH1:FCFE 38 86            jr   c,$FC86
ECH1:FD00 D7               rst  $10
ECH1:FD01 FB               ei   
ECH1:FD02 B8               cp   b
ECH1:FD03 B5               or   l
ECH1:FD04 E9               jp   hl
ECH1:FD05 63               ld   h,e
ECH1:FD06 9A               sbc  d
ECH1:FD07 5C               ld   e,h
ECH1:FD08 1E 25            ld   e,$25
ECH1:FD0A 13               inc  de
ECH1:FD0B 0F               rrca 
ECH1:FD0C 5B               ld   e,e
ECH1:FD0D 11 2B 7C         ld   de,$7C2B
ECH1:FD10 44               ld   b,h
ECH1:FD11 71               ld   [hl],c
ECH1:FD12 FB               ei   
ECH1:FD13 C4 79 B2         call nz,$B279
ECH1:FD16 5A               ld   e,d
ECH1:FD17 F0 86            ldh  a,[$FF86]
ECH1:FD19 82               add  d
ECH1:FD1A 7D               ld   a,l
ECH1:FD1B 87               add  a
ECH1:FD1C 2F               cpl  
ECH1:FD1D D3               db   $D3 ; undefined opcode
ECH1:FD1E 43               ld   b,e
ECH1:FD1F B9               cp   c
ECH1:FD20 D2 F0 B0         jp   nc,$B0F0
ECH1:FD23 66               ld   h,[hl]
ECH1:FD24 72               ld   [hl],d
ECH1:FD25 B6               or   [hl]
ECH1:FD26 F8 EE            ld   hl,sp-$12
ECH1:FD28 8A               adc  d
ECH1:FD29 4E               ld   c,[hl]
ECH1:FD2A 0E 3E            ld   c,$3E
ECH1:FD2C 1F               rra  
ECH1:FD2D A4               and  h
ECH1:FD2E 7B               ld   a,e
ECH1:FD2F 0B               dec  bc
ECH1:FD30 74               ld   [hl],h
ECH1:FD31 9B               sbc  e
ECH1:FD32 87               add  a
ECH1:FD33 60               ld   h,b
ECH1:FD34 D5               push de
ECH1:FD35 A1               and  c
ECH1:FD36 D2 13 C7         jp   nc,$C713
ECH1:FD39 3F               ccf  
ECH1:FD3A 57               ld   d,a
ECH1:FD3B 0E 9D            ld   c,$9D
ECH1:FD3D 81               add  c
ECH1:FD3E CE 2B            adc  a,$2B
ECH1:FD40 7A               ld   a,d
ECH1:FD41 F2               ld   a,[$ff00+c]
ECH1:FD42 94               sub  h
ECH1:FD43 E4               db   $E4 ; undefined opcode
ECH1:FD44 F2               ld   a,[$ff00+c]
ECH1:FD45 E2               ld   [$ff00+c],a
ECH1:FD46 E0 D4            ldh  [$FFD4],a
ECH1:FD48 66               ld   h,[hl]
ECH1:FD49 85               add  l
ECH1:FD4A C3 6E AA         jp   $AA6E
ECH1:FD4D 2F               cpl  
ECH1:FD4E C1               pop  bc
ECH1:FD4F DB               db   $DB ; undefined opcode
ECH1:FD50 32               ldd  [hl],a
ECH1:FD51 3D               dec  a
ECH1:FD52 D6 F7            sub  a,$F7
ECH1:FD54 A1               and  c
ECH1:FD55 64               ld   h,h
ECH1:FD56 61               ld   h,c
ECH1:FD57 73               ld   [hl],e
ECH1:FD58 1A               ld   a,[de]
ECH1:FD59 57               ld   d,a
ECH1:FD5A 0D               dec  c
ECH1:FD5B 4F               ld   c,a
ECH1:FD5C 0F               rrca 
ECH1:FD5D AB               xor  e
ECH1:FD5E 08 4D C3         ld   [$C34D],sp
ECH1:FD61 20 22            jr   nz,$FD85
ECH1:FD63 71               ld   [hl],c
ECH1:FD64 F3               di   
ECH1:FD65 F4               db   $F4 ; undefined opcode
ECH1:FD66 30 7B            jr   nc,$FDE3
ECH1:FD68 26 0F            ld   h,$0F
ECH1:FD6A 7F               ld   a,a
ECH1:FD6B 56               ld   d,[hl]
ECH1:FD6C 0D               dec  c
ECH1:FD6D FB               ei   
ECH1:FD6E 1E 4D            ld   e,$4D
ECH1:FD70 D3               db   $D3 ; undefined opcode
ECH1:FD71 48               ld   c,b
ECH1:FD72 D0               ret  nc
ECH1:FD73 95               sub  l
ECH1:FD74 F8 EE            ld   hl,sp-$12
ECH1:FD76 F0 B0            ldh  a,[$FFB0]
ECH1:FD78 0D               dec  c
ECH1:FD79 5D               ld   e,l
ECH1:FD7A 88               adc  b
ECH1:FD7B 7B               ld   a,e
ECH1:FD7C 13               inc  de
ECH1:FD7D 4F               ld   c,a
ECH1:FD7E 2F               cpl  
ECH1:FD7F CD 51 36         call $3651
ECH1:FD82 C9               ret  
ECH1:FD83 FC               db   $FC ; undefined opcode
ECH1:FD84 F0 70            ldh  a,[$FF70]
ECH1:FD86 B6               or   [hl]
ECH1:FD87 E0 26            ldh  [$FF26],a
ECH1:FD89 C4 A8 4F         call nz,$4FA8
ECH1:FD8C 0E 2C            ld   c,$2C
ECH1:FD8E 8B               adc  e
ECH1:FD8F 03               inc  bc
ECH1:FD90 F5               push af
ECH1:FD91 68               ld   l,b
ECH1:FD92 40               ld   b,b
ECH1:FD93 C2 52 E3         jp   nz,$E352
ECH1:FD96 F1               pop  af
ECH1:FD97 E4               db   $E4 ; undefined opcode
ECH1:FD98 98               sbc  b
ECH1:FD99 1D               dec  e
ECH1:FD9A 28 3A            jr   z,$FDD6
ECH1:FD9C A7               and  a
ECH1:FD9D CE EF            adc  a,$EF
ECH1:FD9F 4A               ld   c,d
ECH1:FDA0 D4 7D E8         call nc,$E87D
ECH1:FDA3 D4 6D 90         call nc,$906D
ECH1:FDA6 74               ld   [hl],h
ECH1:FDA7 74               ld   [hl],h
ECH1:FDA8 8E               adc  [hl]
ECH1:FDA9 9F               sbc  a
ECH1:FDAA 4B               ld   c,e
ECH1:FDAB 5D               ld   e,l
ECH1:FDAC 07               rlca 
ECH1:FDAD 4F               ld   c,a
ECH1:FDAE 5B               ld   e,e
ECH1:FDAF 5D               ld   e,l
ECH1:FDB0 06 32            ld   b,$32
ECH1:FDB2 B2               or   d
ECH1:FDB3 50               ld   d,b
ECH1:FDB4 F0 F8            ldh  a,[$FFF8]
ECH1:FDB6 70               ld   [hl],b
ECH1:FDB7 21 C3 16         ld   hl,$16C3
ECH1:FDBA 6B               ld   l,e
ECH1:FDBB 9B               sbc  e
ECH1:FDBC 8E               adc  [hl]
ECH1:FDBD 32               ldd  [hl],a
ECH1:FDBE C9               ret  
ECH1:FDBF 6E               ld   l,[hl]
ECH1:FDC0 A0               and  b
ECH1:FDC1 E8 F1            add  sp,-$0F
ECH1:FDC3 ED               db   $ED ; undefined opcode
ECH1:FDC4 88               adc  b
ECH1:FDC5 B0               or   b
ECH1:FDC6 A4               and  h
ECH1:FDC7 73               ld   [hl],e
ECH1:FDC8 8A               adc  d
ECH1:FDC9 0F               rrca 
ECH1:FDCA 07               rlca 
ECH1:FDCB 0D               dec  c
ECH1:FDCC 03               inc  bc
ECH1:FDCD 97               sub  a
ECH1:FDCE 20 4F            jr   nz,$FE1F
ECH1:FDD0 84               add  h
ECH1:FDD1 F2               ld   a,[$ff00+c]
ECH1:FDD2 F0 FA            ldh  a,[$FFFA]
ECH1:FDD4 00               nop  
ECH1:FDD5 F1               pop  af
ECH1:FDD6 C9               ret  
ECH1:FDD7 F3               di   
ECH1:FDD8 D2 5F 01         jp   nc,$015F
ECH1:FDDB 1C               inc  e
ECH1:FDDC 1C               inc  e
ECH1:FDDD 3F               ccf  
ECH1:FDDE E6 0C            and  a,$0C
ECH1:FDE0 97               sub  a
ECH1:FDE1 7D               ld   a,l
ECH1:FDE2 D0               ret  nc
ECH1:FDE3 12               ld   [de],a
ECH1:FDE4 D2 42 D2         jp   nc,$D242
ECH1:FDE7 E2               ld   [$ff00+c],a
ECH1:FDE8 0E 1F            ld   c,$1F
ECH1:FDEA A6               and  [hl]
ECH1:FDEB 5F               ld   e,a
ECH1:FDEC 26 06            ld   h,$06
ECH1:FDEE DF               rst  $18
ECH1:FDEF 55               ld   d,l
ECH1:FDF0 F3               di   
ECH1:FDF1 F4               db   $F4 ; undefined opcode
ECH1:FDF2 BC               cp   h
ECH1:FDF3 72               ld   [hl],d
ECH1:FDF4 92               sub  d
ECH1:FDF5 72               ld   [hl],d
ECH1:FDF6 72               ld   [hl],d
ECH1:FDF7 F8 01            ld   hl,sp+$01
ECH1:FDF9 BF               cp   a
ECH1:FDFA 17               rla  
ECH1:FDFB 93               sub  e
ECH1:FDFC 01 25 0E         ld   bc,$0E25
ECH1:FDFF 8E               adc  [hl]
OAM :FE00 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE10 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE20 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE30 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE40 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE50 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE60 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE70 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE80 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
OAM :FE90 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
----:FEA0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
----:FEB0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
----:FEC0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
----:FED0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
----:FEE0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
----:FEF0 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
I/O :FF00 CF               db   $CF
I/O :FF01 FF               db   $FF
I/O :FF02 7F               db   $7F
I/O :FF03 FF               db   $FF
I/O :FF04 56               db   $56
I/O :FF05 00               db   $00
I/O :FF06 00               db   $00
I/O :FF07 F8               db   $F8
I/O :FF08 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF
I/O :FF0F E9               db   $E9
I/O :FF10 80               db   $80
I/O :FF11 3F               db   $3F
I/O :FF12 00               db   $00
I/O :FF13 FF               db   $FF
I/O :FF14 BF               db   $BF
I/O :FF15 FF               db   $FF
I/O :FF16 3F               db   $3F
I/O :FF17 00               db   $00
I/O :FF18 FF               db   $FF
I/O :FF19 BF               db   $BF
I/O :FF1A 7F               db   $7F
I/O :FF1B FF               db   $FF
I/O :FF1C 9F               db   $9F
I/O :FF1D FF               db   $FF
I/O :FF1E BF               db   $BF
I/O :FF1F FF               db   $FF
I/O :FF20 FF               db   $FF
I/O :FF21 00               db   $00
I/O :FF22 00               db   $00
I/O :FF23 BF               db   $BF
I/O :FF24 77               db   $77
I/O :FF25 FF               db   $FF
I/O :FF26 F0               db   $F0
I/O :FF27 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
I/O :FF30 CD FF 26 76+     db   $CD,$FF,$26,$76,$21,$B4,$C9,$66,$8E,$69,$32,$F6,$20,$7F,$C5,$F7
I/O :FF40 91               db   $91
I/O :FF41 82               db   $82
I/O :FF42 88               db   $88
I/O :FF43 00               db   $00
I/O :FF44 50               db   $50
I/O :FF45 00               db   $00
I/O :FF46 FF               db   $FF
I/O :FF47 E4               db   $E4
I/O :FF48 FF               db   $FF
I/O :FF49 FF               db   $FF
I/O :FF4A 00               db   $00
I/O :FF4B 00               db   $00
I/O :FF4C FF               db   $FF
I/O :FF4D FF               db   $FF
I/O :FF4E FF               db   $FF
I/O :FF4F FF               db   $FF
I/O :FF50 FF               db   $FF
I/O :FF51 FF               db   $FF
I/O :FF52 FF               db   $FF
I/O :FF53 FF               db   $FF
I/O :FF54 FF               db   $FF
I/O :FF55 FF               db   $FF
I/O :FF56 FF               db   $FF
I/O :FF57 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
I/O :FF67 FF               db   $FF
I/O :FF68 FF               db   $FF
I/O :FF69 FF               db   $FF
I/O :FF6A FF               db   $FF
I/O :FF6B FF               db   $FF
I/O :FF6C FF FF FF FF      db   $FF,$FF,$FF,$FF
I/O :FF70 FF               db   $FF
I/O :FF71 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF
I/O :FF76 FF               db   $FF
I/O :FF77 FF               db   $FF
I/O :FF78 FF FF FF FF+     db   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
HRAM:FF80 FF               rst  $38
HRAM:FF81 FF               rst  $38
HRAM:FF82 FF               rst  $38
HRAM:FF83 FF               rst  $38
HRAM:FF84 22               ldi  [hl],a
HRAM:FF85 7F               ld   a,a
HRAM:FF86 84               add  h
HRAM:FF87 F5               push af
HRAM:FF88 01 6B 20         ld   bc,$206B
HRAM:FF8B EE A1            xor  a,$A1
HRAM:FF8D EF               rst  $28
HRAM:FF8E 88               adc  b
HRAM:FF8F E5               push hl
HRAM:FF90 15               dec  d
HRAM:FF91 5A               ld   e,d
HRAM:FF92 34               inc  [hl]
HRAM:FF93 79               ld   a,c
HRAM:FF94 C2 31 80         jp   nz,$8031
HRAM:FF97 B9               cp   c
HRAM:FF98 16 7C            ld   d,$7C
HRAM:FF9A 61               ld   h,c
HRAM:FF9B DF               rst  $18
HRAM:FF9C 04               inc  b
HRAM:FF9D FB               ei   
HRAM:FF9E A2               and  d
HRAM:FF9F ED               db   $ED ; undefined opcode
HRAM:FFA0 20 FF            jr   nz,$FFA1
HRAM:FFA2 08 7B B2         ld   [$B27B],sp
HRAM:FFA5 56               ld   d,[hl]
HRAM:FFA6 28 CE            jr   z,$FF76
HRAM:FFA8 C3 D8 10         jp   $10D8
HRAM:FFAB 30 80            jr   nc,$FF2D
HRAM:FFAD 59               ld   e,c
HRAM:FFAE 98               sbc  b
HRAM:FFAF FC               db   $FC ; undefined opcode
HRAM:FFB0 D8               ret  c
HRAM:FFB1 FE 00            cp   a,$00
HRAM:FFB3 FF               rst  $38
HRAM:FFB4 5E               ld   e,[hl]
HRAM:FFB5 FF               rst  $38
HRAM:FFB6 00               nop  
HRAM:FFB7 99               sbc  c
HRAM:FFB8 20 DF            jr   nz,$FF99
HRAM:FFBA 87               add  a
HRAM:FFBB F7               rst  $30
HRAM:FFBC A4               and  h
HRAM:FFBD FF               rst  $38
HRAM:FFBE 03               inc  bc
HRAM:FFBF 0B               dec  bc
HRAM:FFC0 56               ld   d,[hl]
HRAM:FFC1 BC               cp   h
HRAM:FFC2 40               ld   b,b
HRAM:FFC3 B3               or   e
HRAM:FFC4 5B               ld   e,e
HRAM:FFC5 EC               db   $EC ; undefined opcode
HRAM:FFC6 3A               ldd  a,[hl]
HRAM:FFC7 DD               db   $DD ; undefined opcode
HRAM:FFC8 23               inc  hl
HRAM:FFC9 45               ld   b,l
HRAM:FFCA AD               xor  l
HRAM:FFCB E6 00            and  a,$00
HRAM:FFCD FC               db   $FC ; undefined opcode
HRAM:FFCE 08 E7 02         ld   [$02E7],sp
HRAM:FFD1 20 86            jr   nz,$FF59
HRAM:FFD3 EA 05 B1         ld   [$B105],a
HRAM:FFD6 13               inc  de
HRAM:FFD7 BF               cp   a
HRAM:FFD8 BE               cp   [hl]
HRAM:FFD9 F5               push af
HRAM:FFDA 24               inc  h
HRAM:FFDB 99               sbc  c
HRAM:FFDC 9B               sbc  e
HRAM:FFDD 5E               ld   e,[hl]
HRAM:FFDE CD B9 85         call $85B9
HRAM:FFE1 D7               rst  $10
HRAM:FFE2 07               rlca 
HRAM:FFE3 DF               rst  $18
HRAM:FFE4 22               ldi  [hl],a
HRAM:FFE5 7E               ld   a,[hl]
HRAM:FFE6 06 77            ld   b,$77
HRAM:FFE8 01 BB 02         ld   bc,$02BB
HRAM:FFEB D1               pop  de
HRAM:FFEC 60               ld   h,b
HRAM:FFED E5               push hl
HRAM:FFEE 77               ld   [hl],a
HRAM:FFEF FA A8 DA         ld   a,[$DAA8]
HRAM:FFF2 50               ld   d,b
HRAM:FFF3 FE E1            cp   a,$E1
HRAM:FFF5 EE A0            xor  a,$A0
HRAM:FFF7 FE 08            cp   a,$08
HRAM:FFF9 9B               sbc  e
HRAM:FFFA 39               add  hl,sp
HRAM:FFFB 01 2E 00         ld   bc,$002E
HRAM:FFFE 82               add  d
I/O :FFFF 00               db   $00
