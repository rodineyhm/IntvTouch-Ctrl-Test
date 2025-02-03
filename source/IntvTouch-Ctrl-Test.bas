' =========================================================================
' IntyBASIC Project: InvtTouch
' -------------------------------------------------------------------------
' =========================================================================

'OPTION EXPLICIT

' Include useful predefined constants
INCLUDE "constants.bas"

' =========================================================================

DEF FN TextCenterPos(aLength, aRow)  = SCREENPOS((((BACKGROUND_COLUMNS - aLength) + 1) / 2), aRow)
DEF FN SpritePosX(aColumn, anOffset) = ((aColumn + 1) * 8 ) + anOffset
DEF FN SpritePosY(aRow, anOffset)    = ((aRow    + 1) * 8) + anOffset

' ============================
' Draw Classic Title Screen
' ============================

' Set Screen Mode to "Color Stack" and define the stack
MODE   SCREEN_COLOR_STACK, STACK_BROWN, STACK_BLACK, STACK_BROWN, STACK_BLACK
BORDER BORDER_BROWN
'DEFINE DEF00,5,Graphics
DEFINE DEF00,10,Graphics
CLS

' Logo is a double-vertical resolution sprite
'SPRITE 0, SpritePosX(16, 3) + VISIBLE, SpritePosY(2, 6) + ZOOMY2 + DOUBLEY, SPR00 + CS_BLUE + BEHIND
SPRITE 1, SpritePosX(17, 3) + VISIBLE, SpritePosY(2, 6) + ZOOMY2 + DOUBLEY, SPR02 + CS_WHITE + BEHIND
WAIT

' Print classic colored bars
'  Vertical bars on the left
PRINT AT SCREENPOS( 2, 1) COLOR CS_WHITE,     "\165"
PRINT AT SCREENPOS( 4, 1) COLOR CS_YELLOW,    "\165"
PRINT AT SCREENPOS( 6, 1) COLOR CS_GREEN,     "\165"
PRINT AT SCREENPOS( 8, 1) COLOR CS_DARKGREEN, "\165"

'  Vertical bars on the right
PRINT AT SCREENPOS(11, 1) COLOR CS_TAN,       "\164"
PRINT AT SCREENPOS(13, 1) COLOR CS_RED,       "\164"
PRINT AT SCREENPOS(15, 1) COLOR CS_BLUE,      "\164"
PRINT AT SCREENPOS(17, 1) COLOR CS_BLACK,     "\164"

' Print SDK brand and logo
PRINT AT TextCenterPos( 10, 3 + 0) COLOR CS_RED, "MasterMIB"
PRINT AT TextCenterPos( 10, 3 + 1) COLOR CS_GREEN, " presents"

' Print project-specific information
PRINT AT TextCenterPos(LEN("IntvTouch") - 1,  6) COLOR CS_YELLOW, "IntvTouch"

PRINT AT TextCenterPos(LEN("controller test") - 1,  7) COLOR CS_TAN, "controller test"

PRINT AT TextCenterPos((LEN("MasterMIB") + 6), 10) + 0 -1 , BG08 + CS_WHITE
PRINT AT TextCenterPos((LEN("MasterMIB") + 6), 10) + 1 -1 COLOR CS_WHITE,  "2025 RodineyHM"


'SPRITE 0, SpritePosX(16   , 3) + VISIBLE, SpritePosY(2, 6) + ZOOMY2 + DOUBLEY, SPR00 + CS_BLUE + BEHIND
FOR Xanima=0 TO 15
    FOR Atraso=1 TO 5
        WAIT
    NEXT Atraso
    SPRITE 0, SpritePosX(16 -16 +Xanima  , 3) + VISIBLE, SpritePosY(2, 6) + ZOOMY2 + DOUBLEY, SPR00 + CS_PURPLE + BEHIND

    FOR Atraso=1 TO 5
        WAIT
    NEXT Atraso
    SPRITE 0, SpritePosX(16 -16 +1 +Xanima  , 3) + VISIBLE, SpritePosY(2, 6) + ZOOMY2 + DOUBLEY, SPR04 + CS_PURPLE + BEHIND
NEXT Xanima
FOR Atraso=1 TO 20
        WAIT
NEXT Atraso

SPRITE 0, SpritePosX(16 , 3) + VISIBLE, SpritePosY(2, 6) + ZOOMY2 + DOUBLEY, SPR06 + CS_PURPLE + BEHIND
FOR Atraso=1 TO 20
        WAIT
NEXT Atraso

SPRITE 1, SpritePosX(17, 3) + VISIBLE, SpritePosY(2, 6) + ZOOMY2 + DOUBLEY, SPR02 + CS_BLUE + BEHIND


' ============================
' Wait For Any Key
' ============================

' ------------------------------------------------------
' First, we wait for the controller to be completely
' at rest, with no input, for DEBOUNCE_DELAY cycles.
' This ensures we will get a brand new key press.
' ------------------------------------------------------
Dim Counter

Counter = 0
WHILE (Counter < 2)
    WAIT
    IF (cont <> 0) THEN
        Counter = 0
    ELSE
        Counter = (Counter + 1)
    END IF
WEND

' ------------------------------------------------------
' Then, we wait for a new controller key press.
' ------------------------------------------------------
espera = 250
WHILE (cont = 0) AND (espera > 0)
    WAIT
    espera = espera -1
WEND

' ------------------------------------------------------
' At this point we have a valid user input signal, so we
' could jump to an appropriate subroutine depending on
' the key pressed.  In this case, we just wanted
' *any key* pressed, so we're done.
' ------------------------------------------------------
WAIT
ResetSprite(0)
ResetSprite(1)
ResetSprite(2)
ResetSprite(3)
ResetSprite(4)
ResetSprite(5)
CLS

' Skip graphics and go to program code
GOTO Main

Graphics:
' SDK Logo - Left Side
BITMAP "........"
BITMAP "....##.."
BITMAP "....#..."
BITMAP "..####.."
BITMAP ".####..."
BITMAP ".#.#####"
BITMAP "........"
BITMAP "...##..."
BITMAP "...##..."
BITMAP "..######"
BITMAP "..#....#"
BITMAP ".##...#."
BITMAP ".#....#."
BITMAP "##......"
BITMAP "#......."
BITMAP "........"

' SDK Logo - Right Side
BITMAP "########"
BITMAP "#......#"
BITMAP "#.####.#"
BITMAP "#.#..#.#"
BITMAP "#.#..#.#"
BITMAP "#.#..#.#"
BITMAP "#.#..#.#"
BITMAP "#.#..#.#"
BITMAP "#.#..#.#"
BITMAP "#.####.#"
BITMAP "#......#"
BITMAP "#......#"
BITMAP "#..##..#"
BITMAP "#..##..#"
BITMAP "#......#"
BITMAP "########"

' SDK Logo - Left Side2
BITMAP "........"
BITMAP ".....##."
BITMAP ".....#.."
BITMAP "...####."
BITMAP "..####.."
BITMAP "..####.."
BITMAP "..#####."
BITMAP "...##..."
BITMAP "...##..."
BITMAP "...##..."
BITMAP "...##..."
BITMAP ".####..."
BITMAP ".#..#..."
BITMAP ".#..#..."
BITMAP "....##.."
BITMAP "........"

' SDK Logo - Left Side3
BITMAP "........"
BITMAP "...##..."
BITMAP "...##..#"
BITMAP ".......#"
BITMAP "..####.#"
BITMAP ".#######"
BITMAP ".#.##..."
BITMAP ".#.##..."
BITMAP "........"
BITMAP "...##..."
BITMAP "..#..#.."
BITMAP "..#..#.."
BITMAP "..#..#.."
BITMAP "........"
BITMAP "..#..#.."
BITMAP "........"

' Real Copyright Symbol
BITMAP ".######."
BITMAP "#......#"
BITMAP "#..###.#"
BITMAP "#.#....#"
BITMAP "#.#....#"
BITMAP "#..###.#"
BITMAP "#......#"
BITMAP ".######."

' Disco1A 00
BITMAP "........"
BITMAP "........"
BITMAP "...##..."
BITMAP "..####.."
BITMAP "..####.."
BITMAP "...##..."
BITMAP "........"
BITMAP "........"

BITMAP "........"
BITMAP "........"
BITMAP "...##..."
BITMAP "..####.."
BITMAP "..####.."
BITMAP "...##..."
BITMAP "........"
BITMAP "........"


Main:   ' Continue normal code flow

WAIT
CLS
WAIT
'                                          01234567890123456789
PRINT AT SCREENPOS(0, 0) COLOR CS_WHITE,  " Intellivision      "
PRINT AT SCREENPOS(0, 1) COLOR CS_WHITE,  "    controller test "
PRINT AT SCREENPOS(0, 2) COLOR CS_WHITE,  " Developed in       "
PRINT AT SCREENPOS(0, 3) COLOR CS_WHITE,  "   Intybasic with   "
PRINT AT SCREENPOS(0, 4) COLOR CS_WHITE,  "        IntelliTool "
PRINT AT SCREENPOS(0, 6) COLOR CS_WHITE,  "     Thank you!     "
PRINT AT SCREENPOS(0, 10) COLOR CS_BLUE,  "github.com/rodineyhm"
PRINT AT SCREENPOS(0, 11) COLOR CS_RED,   "WWW.MASTERMIB.COM.BR"

Counter = 0
WHILE (Counter < 2)
    WAIT
    IF (cont <> 0) THEN
        Counter = 0
    ELSE
        Counter = (Counter + 1)
    END IF
WEND

espera = 150
WHILE (cont = 0) AND (espera > 0)
    WAIT
    espera = espera -1
WEND

CLS
ResetSprite(0)
WAIT

SOUND 0,100,15
WAIT
WAIT
WAIT
SOUND 0,,0 ' beeper

'                                         01234567890123456789
PRINT AT SCREENPOS(0, 0) COLOR CS_TAN,   "  LEFT1      RIGHT2 "
'PRINT AT SCREENPOS(0, 1) COLOR CS_TAN,   "  -----      -----  "
PRINT AT SCREENPOS(0, 2) COLOR CS_TAN,   " |     |    |     |"
PRINT AT SCREENPOS(0, 3) COLOR CS_TAN,   " |     |    |     |"
PRINT AT SCREENPOS(0, 4) COLOR CS_TAN,   " |     |    |     |"
PRINT AT SCREENPOS(0, 5) COLOR CS_TAN,   " |     |    |     |"
PRINT AT SCREENPOS(0, 8) COLOR CS_TAN,   " |     |    |     |"
PRINT AT SCREENPOS(0, 9) COLOR CS_TAN,   " |     |    |     |"
PRINT AT SCREENPOS(0,10) COLOR CS_TAN,   " |     |    |     |"

loopTeste:
    IF CONT1 = KEYPAD_1 THEN PRINT AT SCREENPOS(2, 2) COLOR CS_RED, "1" ELSE PRINT AT SCREENPOS(2, 2) COLOR CS_WHITE, "1" 
    IF CONT1 = KEYPAD_2 THEN PRINT AT SCREENPOS(4, 2) COLOR CS_RED, "2" ELSE PRINT AT SCREENPOS(4, 2) COLOR CS_WHITE, "2" 
    IF CONT1 = KEYPAD_3 THEN PRINT AT SCREENPOS(6, 2) COLOR CS_RED, "3" ELSE PRINT AT SCREENPOS(6, 2) COLOR CS_WHITE, "3" 
    IF CONT1 = KEYPAD_4 THEN PRINT AT SCREENPOS(2, 3) COLOR CS_RED, "4" ELSE PRINT AT SCREENPOS(2, 3) COLOR CS_WHITE, "4" 
    IF CONT1 = KEYPAD_5 THEN PRINT AT SCREENPOS(4, 3) COLOR CS_RED, "5" ELSE PRINT AT SCREENPOS(4, 3) COLOR CS_WHITE, "5" 
    IF CONT1 = KEYPAD_6 THEN PRINT AT SCREENPOS(6, 3) COLOR CS_RED, "6" ELSE PRINT AT SCREENPOS(6, 3) COLOR CS_WHITE, "6" 
    IF CONT1 = KEYPAD_7 THEN PRINT AT SCREENPOS(2, 4) COLOR CS_RED, "7" ELSE PRINT AT SCREENPOS(2, 4) COLOR CS_WHITE, "7" 
    IF CONT1 = KEYPAD_8 THEN PRINT AT SCREENPOS(4, 4) COLOR CS_RED, "8" ELSE PRINT AT SCREENPOS(4, 4) COLOR CS_WHITE, "8" 
    IF CONT1 = KEYPAD_9 THEN PRINT AT SCREENPOS(6, 4) COLOR CS_RED, "9" ELSE PRINT AT SCREENPOS(6, 4) COLOR CS_WHITE, "9" 
    IF CONT1 = KEYPAD_CLEAR THEN PRINT AT SCREENPOS(2, 5) COLOR CS_RED, "C" ELSE PRINT AT SCREENPOS(2, 5) COLOR CS_WHITE, "C" 
    IF CONT1 = KEYPAD_0 THEN PRINT AT SCREENPOS(4, 5) COLOR CS_RED, "0" ELSE PRINT AT SCREENPOS(4, 5) COLOR CS_WHITE, "0" 
    IF CONT1 = KEYPAD_ENTER THEN PRINT AT SCREENPOS(6, 5) COLOR CS_RED, "E" ELSE PRINT AT SCREENPOS(6, 5) COLOR CS_WHITE, "E" 
    IF CONT1 = BUTTON_1 THEN PRINT AT SCREENPOS(1, 6) COLOR CS_RED, "F" : PRINT AT SCREENPOS(7, 6) COLOR CS_RED, "F"  ELSE PRINT AT SCREENPOS(1, 6) COLOR CS_WHITE, "F" : PRINT AT SCREENPOS(7, 6) COLOR CS_WHITE, "F"
    IF CONT1 = BUTTON_2 THEN PRINT AT SCREENPOS(1, 7) COLOR CS_RED, "L" ELSE PRINT AT SCREENPOS(1, 7) COLOR CS_WHITE, "L" 
    IF CONT1 = BUTTON_3 THEN PRINT AT SCREENPOS(7, 7) COLOR CS_RED, "R" ELSE PRINT AT SCREENPOS(7, 7) COLOR CS_WHITE, "R" 
    IF CONT1 = KEYPAD_PAUSE THEN PRINT AT SCREENPOS(2,11) COLOR CS_RED, "PAUSE" ELSE PRINT AT SCREENPOS(2,11) COLOR CS_WHITE, "PAUSE" 
    
    direcao1 = 0    
    IF CONT1 = DISC_N     THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "01" : direcao1 = 1 
    IF CONT1 = DISC_NNE   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "02" : direcao1 = 2
    IF CONT1 = DISC_NE    THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "03" : direcao1 = 3
    IF CONT1 = DISC_ENE   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "04" : direcao1 = 4
    IF CONT1 = DISC_EAST  THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "05" : direcao1 = 5
    IF CONT1 = DISC_ESE   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "06" : direcao1 = 6
    IF CONT1 = DISC_SE    THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "07" : direcao1 = 7
    IF CONT1 = DISC_SSE   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "08" : direcao1 = 8
    IF CONT1 = DISC_SOUTH THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "09" : direcao1 = 9
    IF CONT1 = DISC_SSW   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "10" : direcao1 = 10
    IF CONT1 = DISC_SW    THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "11" : direcao1 = 11
    IF CONT1 = DISC_WSW   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "12" : direcao1 = 12
    IF CONT1 = DISC_WEST  THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "13" : direcao1 = 13
    IF CONT1 = DISC_WNW   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "14" : direcao1 = 14
    IF CONT1 = DISC_NW    THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "15" : direcao1 = 15
    IF CONT1 = DISC_NNW   THEN PRINT AT SCREENPOS(4,8) COLOR CS_RED, "16" : direcao1 = 16
    IF direcao1 = 0 THEN PRINT AT SCREENPOS(4,8) COLOR CS_WHITE, "  " '"00"

    Px1 = 40
    Py1 = 72
    IF direcao1 =  0 THEN Px1=Px1     : Py1=Py1 +00 : Pcor1 = CS_WHITE
    IF direcao1 =  1 THEN Px1=Px1 +00 : Py1=Py1 -12 : Pcor1 = CS_RED
    IF direcao1 =  2 THEN Px1=Px1 +05 : Py1=Py1 -11 : Pcor1 = CS_RED
    IF direcao1 =  3 THEN Px1=Px1 +10 : Py1=Py1 -09 : Pcor1 = CS_RED
    IF direcao1 =  4 THEN Px1=Px1 +14 : Py1=Py1 -05 : Pcor1 = CS_RED
    IF direcao1 =  5 THEN Px1=Px1 +15 : Py1=Py1 -00 : Pcor1 = CS_RED
    IF direcao1 =  6 THEN Px1=Px1 +14 : Py1=Py1 +05 : Pcor1 = CS_RED
    IF direcao1 =  7 THEN Px1=Px1 +10 : Py1=Py1 +08 : Pcor1 = CS_RED
    IF direcao1 =  8 THEN Px1=Px1 +05 : Py1=Py1 +11 : Pcor1 = CS_RED
    IF direcao1 =  9 THEN Px1=Px1 +00 : Py1=Py1 +12 : Pcor1 = CS_RED
    IF direcao1 = 10 THEN Px1=Px1 -05 : Py1=Py1 +11 : Pcor1 = CS_RED
    IF direcao1 = 11 THEN Px1=Px1 -10 : Py1=Py1 +08 : Pcor1 = CS_RED
    IF direcao1 = 12 THEN Px1=Px1 -14 : Py1=Py1 +05 : Pcor1 = CS_RED
    IF direcao1 = 13 THEN Px1=Px1 -15 : Py1=Py1 +00 : Pcor1 = CS_RED
    IF direcao1 = 14 THEN Px1=Px1 -14 : Py1=Py1 -05 : Pcor1 = CS_RED
    IF direcao1 = 15 THEN Px1=Px1 -10 : Py1=Py1 -09 : Pcor1 = CS_RED
    IF direcao1 = 16 THEN Px1=Px1 -05 : Py1=Py1 -11 : Pcor1 = CS_RED

    SPRITE 0, Px1 + VISIBLE, Py1 + ZOOMY2, SPR09 + Pcor1 + BEHIND


    IF CONT2 = KEYPAD_1 THEN PRINT AT SCREENPOS(13, 2) COLOR CS_RED, "1" ELSE PRINT AT SCREENPOS(13, 2) COLOR CS_WHITE, "1" 
    IF CONT2 = KEYPAD_2 THEN PRINT AT SCREENPOS(15, 2) COLOR CS_RED, "2" ELSE PRINT AT SCREENPOS(15, 2) COLOR CS_WHITE, "2" 
    IF CONT2 = KEYPAD_3 THEN PRINT AT SCREENPOS(17, 2) COLOR CS_RED, "3" ELSE PRINT AT SCREENPOS(17, 2) COLOR CS_WHITE, "3" 
    IF CONT2 = KEYPAD_4 THEN PRINT AT SCREENPOS(13, 3) COLOR CS_RED, "4" ELSE PRINT AT SCREENPOS(13, 3) COLOR CS_WHITE, "4" 
    IF CONT2 = KEYPAD_5 THEN PRINT AT SCREENPOS(15, 3) COLOR CS_RED, "5" ELSE PRINT AT SCREENPOS(15, 3) COLOR CS_WHITE, "5" 
    IF CONT2 = KEYPAD_6 THEN PRINT AT SCREENPOS(17, 3) COLOR CS_RED, "6" ELSE PRINT AT SCREENPOS(17, 3) COLOR CS_WHITE, "6" 
    IF CONT2 = KEYPAD_7 THEN PRINT AT SCREENPOS(13, 4) COLOR CS_RED, "7" ELSE PRINT AT SCREENPOS(13, 4) COLOR CS_WHITE, "7" 
    IF CONT2 = KEYPAD_8 THEN PRINT AT SCREENPOS(15, 4) COLOR CS_RED, "8" ELSE PRINT AT SCREENPOS(15, 4) COLOR CS_WHITE, "8" 
    IF CONT2 = KEYPAD_9 THEN PRINT AT SCREENPOS(17, 4) COLOR CS_RED, "9" ELSE PRINT AT SCREENPOS(17, 4) COLOR CS_WHITE, "9" 
    IF CONT2 = KEYPAD_CLEAR THEN PRINT AT SCREENPOS(13, 5) COLOR CS_RED, "C" ELSE PRINT AT SCREENPOS(13, 5) COLOR CS_WHITE, "C" 
    IF CONT2 = KEYPAD_0 THEN PRINT AT SCREENPOS(15, 5) COLOR CS_RED, "0" ELSE PRINT AT SCREENPOS(15, 5) COLOR CS_WHITE, "0" 
    IF CONT2 = KEYPAD_ENTER THEN PRINT AT SCREENPOS(17, 5) COLOR CS_RED, "E" ELSE PRINT AT SCREENPOS(17, 5) COLOR CS_WHITE, "E" 
    IF CONT2 = BUTTON_1 THEN PRINT AT SCREENPOS(12, 6) COLOR CS_RED, "F" : PRINT AT SCREENPOS(18, 6) COLOR CS_RED, "F"  ELSE PRINT AT SCREENPOS(12, 6) COLOR CS_WHITE, "F" : PRINT AT SCREENPOS(18, 6) COLOR CS_WHITE, "F"
    IF CONT2 = BUTTON_2 THEN PRINT AT SCREENPOS(12, 7) COLOR CS_RED, "L" ELSE PRINT AT SCREENPOS(12, 7) COLOR CS_WHITE, "L" 
    IF CONT2 = BUTTON_3 THEN PRINT AT SCREENPOS(18, 7) COLOR CS_RED, "R" ELSE PRINT AT SCREENPOS(18, 7) COLOR CS_WHITE, "R" 
    IF CONT2 = KEYPAD_PAUSE THEN PRINT AT SCREENPOS(13,11) COLOR CS_RED, "PAUSE" ELSE PRINT AT SCREENPOS(13,11) COLOR CS_WHITE, "PAUSE" 
    
    direcao2 = 0    
    IF CONT2 = DISC_N     THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "01" : direcao2 = 1 
    IF CONT2 = DISC_NNE   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "02" : direcao2 = 2
    IF CONT2 = DISC_NE    THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "03" : direcao2 = 3
    IF CONT2 = DISC_ENE   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "04" : direcao2 = 4
    IF CONT2 = DISC_EAST  THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "05" : direcao2 = 5
    IF CONT2 = DISC_ESE   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "06" : direcao2 = 6
    IF CONT2 = DISC_SE    THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "07" : direcao2 = 7
    IF CONT2 = DISC_SSE   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "08" : direcao2 = 8
    IF CONT2 = DISC_SOUTH THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "09" : direcao2 = 9
    IF CONT2 = DISC_SSW   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "10" : direcao2 = 10
    IF CONT2 = DISC_SW    THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "11" : direcao2 = 11
    IF CONT2 = DISC_WSW   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "12" : direcao2 = 12
    IF CONT2 = DISC_WEST  THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "13" : direcao2 = 13
    IF CONT2 = DISC_WNW   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "14" : direcao2 = 14
    IF CONT2 = DISC_NW    THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "15" : direcao2 = 15
    IF CONT2 = DISC_NNW   THEN PRINT AT SCREENPOS(15,8) COLOR CS_RED, "16" : direcao2 = 16
    IF direcao2 = 0 THEN PRINT AT SCREENPOS(15,8) COLOR CS_WHITE, "  " '"00"

    Px2 = 128 
    Py2 = 200 
    IF direcao2 =  0 THEN Px2=Px2     : Py2=Py2 +00 : Pcor2 = CS_WHITE
    IF direcao2 =  1 THEN Px2=Px2 +00 : Py2=Py2 -12 : Pcor2 = CS_RED
    IF direcao2 =  2 THEN Px2=Px2 +05 : Py2=Py2 -11 : Pcor2 = CS_RED
    IF direcao2 =  3 THEN Px2=Px2 +10 : Py2=Py2 -09 : Pcor2 = CS_RED
    IF direcao2 =  4 THEN Px2=Px2 +14 : Py2=Py2 -05 : Pcor2 = CS_RED
    IF direcao2 =  5 THEN Px2=Px2 +15 : Py2=Py2 -00 : Pcor2 = CS_RED
    IF direcao2 =  6 THEN Px2=Px2 +14 : Py2=Py2 +05 : Pcor2 = CS_RED
    IF direcao2 =  7 THEN Px2=Px2 +10 : Py2=Py2 +08 : Pcor2 = CS_RED
    IF direcao2 =  8 THEN Px2=Px2 +05 : Py2=Py2 +11 : Pcor2 = CS_RED
    IF direcao2 =  9 THEN Px2=Px2 +00 : Py2=Py2 +12 : Pcor2 = CS_RED
    IF direcao2 = 10 THEN Px2=Px2 -05 : Py2=Py2 +11 : Pcor2 = CS_RED
    IF direcao2 = 11 THEN Px2=Px2 -10 : Py2=Py2 +08 : Pcor2 = CS_RED
    IF direcao2 = 12 THEN Px2=Px2 -14 : Py2=Py2 +05 : Pcor2 = CS_RED
    IF direcao2 = 13 THEN Px2=Px2 -15 : Py2=Py2 +00 : Pcor2 = CS_RED
    IF direcao2 = 14 THEN Px2=Px2 -14 : Py2=Py2 -05 : Pcor2 = CS_RED
    IF direcao2 = 15 THEN Px2=Px2 -10 : Py2=Py2 -09 : Pcor2 = CS_RED
    IF direcao2 = 16 THEN Px2=Px2 -05 : Py2=Py2 -11 : Pcor2 = CS_RED


    'SPRITE 1, Px2 + VISIBLE, Py2 + ZOOMY2 + DOUBLEY, SPR09 + Pcor2 + BEHIND
    SPRITE 1, Px2 + VISIBLE, Py2 +  DOUBLEY, SPR09 + Pcor2 + BEHIND


    WAIT


GOTO loopTeste




