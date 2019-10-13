AutoItSetOption("MustDeclareVars", 1)

;If not define then only in script
;Global Static $MESSAGE = True ;Define then DataOut will show in script or compiled
;Global Static $MESSAGE =  False   ;Pause will still work in script  No DataOut

; Must be Declared before _Prf_startup
Global $ver = "0.90 12 Oct 2019 Win 7 and up, data in Appdata. Add start up check, if missing ask box. Remove data from Appdata: Menu, Settings, Delete Data. About, Version, Lin"
Global $ini_ver = "10" ;Done

;Global $TESTING = False

#include "R:\!Autoit\Blank\_prf_startup.au3"

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=0.0.9.0
#AutoIt3Wrapper_Icon=R:\!Autoit\Ico\prf.ico
#AutoIt3Wrapper_Res_Description=Another snake game
#AutoIt3Wrapper_Res_LegalCopyright=© Phillip Forrestal 2019
#AutoIt3Wrapper_Res_Field=Compile date|%longdate% %time%
#AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Run_Debug_Mode=Y

#AutoIt3Wrapper_Run_Debug=On
#AutoIt3Wrapper_Run_Debug=Off

#pragma compile(inputboxres, true)

;#AutoIt3Wrapper_Outfile=Snake19_32.exe
#AutoIt3Wrapper_Outfile_x64=Snake19.exe
;#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;-----------------START OF PROGRAM-------------
#cs
	MIT License

	Copyright (c) 2019 Phillip Forrestal

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
#ce

#cs ----------------------------------------------------------------------------
	Another snake game - My first.

	1.  On array
	0 = Ctrl
	1 = What at cell  snake, food, empty
	2 = previous X
	3 = previous Y
	4 = next X
	5 = next Y
	6 = snake cell number (to computer size)

	to do

	Version
	Board Cell size.
	0. Tony can't play problem
	.5 Picture can not be capture, fails on Desktop with great then 100% font  I change the loction to be farther down and right until I can remove capture.
	1, Extra food only at X = default 100
	2. Poop 10 at 50%.  1 more each 25 over 100
	3. Threw wall start at 2 each time +1
	4. Threw wall  0,1,2,4.2,1,0  if all block free not on side else die
	5. Poop 2 +1 each time
	6. Died  snake 2 +1 each time
	7. Replay
	8 Change score, below max  rate diff rate.

	0.90 12 Oct 2019 Win 7 and up, data in Appdata.  Add start up check, if missing ask box. Remove data from Appdata: Menu, Settings, Delete Data.  About, Version, Lin

	0.89 10 Sep 2019 Score 8 not 5 - Remember last game
	0.88 28 Aug 2019 Aline Color and Speed, fix Color HEX input
	0.87 27 Aug 2019 Adjust Values windows
	0.86 Removed
	0.85 25 Aug 2019 FOOD2 should act like FOOD, fix Normal lock up
	0.84 24 Aug 2019 Changing poop with food
	0.83 22 Aug 2019 Speed
	0.82 22 Aug 2019 Regenerate Colors
	0.81 21 Aug 2019 Extra  Poop better
	0.80 21 Aug 2019 Extra Poop back, fix location of food

	0.79 21 Aug 2019 Extra - Wall
	0.78 20 Aug 2019 Hungery better
	0.77 20 Aug 2019 Playing with settings
	0.76 18 Aug 2019 Fix Setting Size - Color
	0.75 18 Aug 2019 Extra - Hunger
	0.74 16 Aug 2019 Setting: Color Works
	0.73 15 Aug 2019 Setting: Color  - Screen size change
	0.72 12 Aug 2019 Setting: Size
	0.71 11 Aug 2019 reverted to version 0.63

	Removed 0.70 to 0.64 Works. But not the way I wanted. May put it back later.
	0.70 11 Aug 2019 Replay is not right  - Reverting to 0.64  Save this version
	Directory 'Version 0.70' has code and executable
	0.69 9 Aug 2019 Replay - Set speed Std, 200ms, 1/2 speed, no tick
	0.68 8 Aug 2019 Replay full speed, no tick
	0.67 8 Aug 2019 Remove Tail, Food
	0.66 8 Aug 2019 More replay work: Start Snake XY, Move snake
	0.65 7 Aug 2019 Replay to Test - works but wrong
	0.64 6 Aug 2019 Add Test game
	Removed replaced with 0..63

	0.63 5 Aug 2019 Focus Start on top
	0.62 2 Aug 2019 Startup Buttons. -- Fix Extra Food add from 1 to 2 -- Bug at watch 3 once  -- Bounce back wall
	0.61 24 Jul 2019 Score 8 to 10
	0.60 24 Jul 2019 Format High Score/ Normal
	0.59 23 Jul 2019 Format Game score
	0.58 18 Jul 2019 Found below problem - something I tried but didn't like, now removed completely
	Problem: 0.51 Still have the NULL snake location problem. Upper Left of board turns black.
	Problem: Testing mode has some test to show when this happens. Rarely happens. Err
	Problem: 0.53 Testing mode: Added 4 test point X & Y #  #1 has occurred (once)

	0.57 15 Jul 2019 Adjustments
	0.56 15 Jul 2019 Normal less boring 5 to 1
	0.55 14 Jul 2019 Create Color.jpg  put in Data - Removed PIC folder
	0.54 13 Jul 2019 put INI  Data.folder -Splitting INI between program setting and score.
	0.53 13 Jul 2019 problem again - 4 test points.  Status changes
	0.52 9 Jul 2019 Add snake head
	0.51 7 Jul 2019 Food and dead snake issues
	0.50 6 Jul 2019 Twiking Death, Score

	0.49 5 Jul 2019  Found progam endless cycle in Convert to dead
	0.48 5 Jul 2019 Max lenght new score. Score + Max + Food
	0.47 4 Jul 2019 *Fix Hit wall  - got endless cycle - can't find
	0.46 3 Jul 2019 Poop normal, Missing files better.
	0.45 3 Jul 2019 Break or done = OK
	0.44 3 Jul 2019 Hit dead snake - bad taste
	0.43 2 Jul 2019 Change dead snake to brown
	0.42 1 Jul 2019 Hunger removing to many
	0.41 1 Jul 2019 End game Score
	0.40 30 Jun 2019 Changed hunger (done)(not 0.42)

	0.39 28 Jun 2019 Fixed top 5 high score, Normal Food
	0.38 28 Jun 2019 Update the failed.  Reverted to 0.37
	0.37 28 Jun 2019  Better Create vs Clean board
	0.36 27 Jun 2019  Please wait boxes
	0.35 27 Jun 2019 Testing Check add Bounce Wall
	0.34 27 Jun 2019 add 2 more status - add ms used
	0.33 24 Jun 2019 Final score wrong
	0.32 22 Jun 2019 Internal changes
	0.31 20 Jun 2019 Lost Focus Stop Game
	0.30 20 Jun 2019 If PIC file missing  add warning and exit

	0.29 19 Jun 2019 just do 2nd blood old tail
	0.28 19 Jun 2019 just do first blood
	0.27 17 Jun 2019 Start Eat snake across bloody
	0.26 15 Jun 2019 Keep top 5 scores on boot.
	0.25 12 Jun 2019 DEBUG - Harder to die box  Upper Left
	0.24 10 Jun 2019 High Box without OK
	0.23 10 Jun 2019 Make 2 games loops Normal / Extra
	0.22 10 Jun 2019 Status score only when change flicker 99% gone
	0.21 9 Jun 2019 Mouse cursor
	0.20 7 Jun 2019 Eat me Double back on self

	0.19 6 Jun 2019  Hungery
	0.18 6 Jun 2019 Turns
	0.17 5 Jun 2019 Make Normal functional
	0.16 5 Jun 2019 High Score for Extra
	0.15 3 Jun 2019 High Score on main screen
	0.14 3 Jun 2019 Status, length score
	0.12 3 Jun 2019 Move snake
	0.11 2 Jun 2019 Add Snake - add previous and next. Snake cell number
	0.10 2 Jun 2019 Major change to map array

	0.09 1 Jun 2019 Minor fixes.
	0.08 31 May 2019 Eat wall & Status
	0.07 31 May 2019 New Layout Snake/Food
	0.06 30 May 2019 Redo Layout like The Game
	Too much flicker
	0.04 30 May 2019 Eat Food
	0.03 29 May 2019 Move snake
	0.02 29 May 2019 Layout game.
	0.01 28 May 2019 Start form
	Version end

	Extra:
	$g_iScore + $g_ScoreFood + $g_SnakeMax

	iScore added only when Snake increase max length
	Lenght decrease when to many turns between food, eat dead snake, eat poop
	Poop added when eat poop.

#ce ----------------------------------------------------------------------------

;StringFormat
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <Misc.au3>
#include <Constants.au3>
#include <ButtonConstants.au3>
#include <Date.au3>
#include <File.au3>
#include <ScreenCapture.au3>
#include <EditConstants.au3>
#include <ComboConstants.au3>
#include <ListBoxConstants.au3>

;Static
Global $g_data ;= @ScriptDir & "\SNAKE19-Data"
$g_data = CheckDataLoc() ;find data folder
If $g_data = "" Then
	Exit
EndIf

Static $s_ini = $g_data & "\snake.ini"
Static $s_scoreini = $g_data & "\score.ini"

Static $WALL = -1
Static $cEDGE = $g_data & "\Edge.jpg"

Static $EMPTY = 0
Static $cEMPTY = $g_data & "\empty.jpg"

Static $SNAKE = 1
Static $cSNAKE = $g_data & "\snake.jpg"
Static $HEAD = 1
Static $cHEAD = $g_data & "\Head.jpg"

Static $FOOD = 2
Static $FOOD2 = 7 ; from 0
Static $cFOOD = $g_data & "\Food.jpg"

Static $DEAD = 3
Static $cDEAD = $g_data & "\Dead.jpg"

Static $POOP = 5
Static $cPOOP = $g_data & "\Poop.jpg"

Static $MaxLost = 7 ;   5 to 10

;Global
Global $g_first = True
Global $g_sx = 40 ;50
Global $g_sy = 30 ;40
Global $g_boardx = $g_sx + 2
Global $g_boardy = $g_sy + 2
Global $g_ctrlBoard = -1

Global $g_Size = 22 ; max?20 ;min = 10
Global $g_sizeDef = $g_Size
Global $g_Font = 24
Global $g_hTick

ReadIni()

;Map
;Column 1
Static $ctrl = 0 ;	0 = Ctrl
Static $what = 1 ;		1 = What at cell  $SNAKE, $FOOD, $EMPTY
Static $prX = 2 ;	2 = previous X
Static $prY = 3 ;	3 = previous Y
Static $nxX = 4 ;	4 = next X
Static $nxY = 5 ;	5 = next Y
Static $num = 6 ;	6 = snake cell number
Global $Map[7][$g_boardx][$g_boardy]
;$Map[$what][x][y]

Global $g_SnakeCount
Global $x_new
Global $y_new
Global $x_end
Global $y_end

Global $g_foodCnt = 1

Global $g_Status[4]
Global $g_StatusText[4]
Global $g_StatusOff = 2

Global $g_aHiScore[12][6] ; data load by INI.  10 =  score,  date, len.food, turns, Max
Global $g_iScore

Global $g_GameWhich = 0 ; 0 Norma, 1 Mine
Global $g_HiScoreWho ;ctrl
Global $g_HiScore[10]

Global $Radio1, $Radio2
Global $g_ScoreTurn
Global $g_ScoreFood
Global $g_SnakeMax

Global $g_Status0Off = 1000
Global $g_Status2Off = 1000
Global $g_Status3Off = 1000
; Size can be zero at the begin so once size is > 0 then hunger is active.
Global $g_Mouse = 0

;0.27+
Static $s_bdCycle = 0 ;No active -1, 1 or 0
Static $s_bdX = 1
Static $s_bdY = 2
Static $s_size = 3
Static $M1 = -1
Static $s_delay = 200
Static $s_rand = 50

Global $g_bdEnd ;Cycle
$g_bdEnd = $M1

;.31
$ver = StringStripWS($ver, 7)
Global $g_Focus = "Snake19 - " & $ver

;0.32  Taking types out of game loop put into function
Global $g_endgame = False
Global $g_gChange
Global $g_gChangeHalf
Static $s_gChangeBaseExtra = 5
Static $s_gChangeBaseNormal = 10

Global $g_turnNo ; Keyboard turn number
Global $g_turnLast ;Keyboard turn number last to see it a turn was made.

Global $g_dirX
Global $g_dirY

;0.33
Global $g_GameScore = 0

;0.34
Global $timing[100]
Global $timingCnt = -0

;0.35
Global $BounceWall = False

;0.40 0.75
Global $g_Turns
Static $g_turnNormalStr = 3

Global $HungerCnt = 0

;0.51
Global $g_Ouch = 0 ;Ate Dead snake 2 or 1, 0 no   Set to 2 because b4 next check it goes -1  so at DEAD it will be 1, so it not 2 in a row then -1  next loop = 0

;0.55
Global $g_tc ; move to score

;0.75
Global $g_HungeryLast

;0.80
Static $s_PoopSize = 20
Global $g_poop[$s_PoopSize][4] ;0 flag, 1 x, 2 y, 3 cnt down
;0 not used
;1 Waiting to be empty
;2 show

;0.82
Global $g_TickTime

;0.84
Global $g_pooprnd

; Main is call at end
Func Main()
	Local $a

	;Check to see if snake19.ini can be created or exists or can read correct data
	If FileExists($s_ini) = 0 Then ;not exist
		DirCreate($g_data)
		IniWrite($s_ini, "Program", "Version", $ver)
		If FileExists($s_ini) = 0 Then ;not exist
			MsgBox(1, "ERROR", "Can not create data files at " & $g_data)
			Exit
		EndIf
	EndIf
	IniWrite($s_ini, "Program", "Version", $ver)
	Sleep(500)
	$a = IniRead($s_ini, "Program", "Version", "X")
	If $a <> $ver Then ;check if can read ini file
		MsgBox(1, "ERROR", "Can not READ correct data from Snake19.ini " & $g_data)
		Exit
	EndIf

	;0.86
	$g_TickTime = IniRead($s_ini, "General", "Speed", 150)

	;1.01
	$g_GameWhich = IniRead($s_ini, "General", "Game", 0)
	;IniWrite($s_ini, "General", "Game", $g_GameWhich)

	;Check to see if color files exist, if not create them.
	CheckJpg()

	;Check Version of INI if wrong version delete Hi Scores
	;because wrong highscore layout will crashed the game.
	$a = IniRead($s_scoreini, "Score", "Version", "x")
	If $a = "x" Then ; old layout or ini missing
		FileDelete($s_scoreini)
		Sleep(500)
		IniWrite($s_scoreini, "Score", "Version", $ini_ver)
	ElseIf $a <> $ini_ver Then
		;1.01
		$g_GameWhich = IniRead($s_ini, "General", "Game", 0)
		;IniWrite($s_ini, "General", "Game", $g_GameWhich)

		IniDelete($s_scoreini, "HighScoreExtra")
		IniDelete($s_scoreini, "HighScoreNormal")
		IniWrite($s_scoreini, "Score", "Version", $ini_ver)
	EndIf

	IniHighFive()

	Do
		If StartForm() Then
			Return
		EndIf
		Game()
	Until False

EndFunc   ;==>Main
#CS INFO
	97650 V31 10/11/2019 3:14:30 PM V30 10/8/2019 4:57:52 PM V29 8/26/2019 10:02:39 AM V28 8/16/2019 10:06:14 PM
#CE

Func Game()
	Local $nMsg, $x, $y, $flag
	;Keys acc
	Local Static $L_idDown
	Local Static $L_idRight
	Local Static $L_idLeft
	Local Static $L_idUp
	Local Static $L_idEsc
	Local $NotFirstPass
	Local $a, $b

	$NotFirstPass = True
	IniWrite($s_ini, "General", "Game", $g_GameWhich)

	If $g_ctrlBoard = -1 Then

		$b = $g_Font * 2
		SayClearBoard(True)

		$g_ctrlBoard = GUICreate("Snake19 - " & $ver, $g_boardx * $g_Size, $g_boardy * $g_Size + $b + 2)

		MouseMove(0, 0, 0)

		$L_idDown = GUICtrlCreateDummy()
		$L_idRight = GUICtrlCreateDummy()
		$L_idLeft = GUICtrlCreateDummy()
		$L_idUp = GUICtrlCreateDummy()
		$L_idEsc = GUICtrlCreateDummy()
		GUISetState(@SW_SHOW, $g_ctrlBoard)

		For $y = 0 To $g_boardy - 1
			For $x = 0 To $g_boardx - 1
				Select
					Case $x = 0 Or $x = $g_boardx - 1 Or $y = 0 Or $y = $g_boardy - 1
						$Map[$what][$x][$y] = $WALL ;outside edge
						$a = $cEDGE
					Case Else
						$Map[$what][$x][$y] = $EMPTY ; empty
						$a = $cEMPTY
				EndSelect
				$Map[$ctrl][$x][$y] = GUICtrlCreatePic($a, $x * $g_Size, $y * $g_Size + $b + $g_StatusOff, $g_Size, $g_Size)
			Next
		Next
		$NotFirstPass = False

		$a = ($g_boardx * $g_Size) / 2 ;Half way
		$b = $a - $g_Size ; len  = half - $g_size (half of it at both ends)
		; Start both 1) ($g_size/2)  2) half +($g_size/2)

		$g_Status[0] = GUICtrlCreateLabel("", 0, 0, $a, $g_Font + $g_StatusOff)
		$g_Status[1] = GUICtrlCreateLabel("", $a, 0, $a, $g_Font + $g_StatusOff)
		$g_Status[2] = GUICtrlCreateLabel("", 0, $g_Font, $a, $g_Font + $g_StatusOff)
		$g_Status[3] = GUICtrlCreateLabel("", $a, $g_Font, $a, $g_Font + $g_StatusOff)

		$g_StatusText[0] = GUICtrlCreateLabel("", $g_Size / 2, $g_StatusOff, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")

		$g_StatusText[1] = GUICtrlCreateLabel("", $a + ($g_Size / 2), $g_StatusOff, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")

		$g_StatusText[2] = GUICtrlCreateLabel("", $g_Size / 2, $g_StatusOff + $g_Font, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")

		$g_StatusText[3] = GUICtrlCreateLabel("", $a + $g_Size / 2, $g_StatusOff + $g_Font, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")
		SayClearBoard()

	EndIf
	GUISetState(@SW_SHOW, $g_ctrlBoard)

	$g_dirX = 0
	$g_dirY = 0

	Status(0, "", 0)
	Status(1, "", 0)
	Status(2, "", 0)
	Status(3, "", 0)

	If $NotFirstPass Then
		ClearBoard() ; Change how create is done not need on fist pass
	EndIf

	StartSnake()
	AddFood(True)
	;clear poop
	For $Z = 0 To $s_PoopSize - 1
		$g_poop[$Z][0] = 0
	Next

	$BounceWall = True

	;Default before start
	$g_turnLast = 0
	$g_ScoreTurn = 0
	$g_ScoreFood = 0
	$g_SnakeMax = 0
	$g_SnakeCount = 1
	$g_iScore = 0
	$g_gChangeHalf = 0
	$g_foodCnt = 1 ; How many on Board
	$g_tc = "??"

	;0.40
	$HungerCnt = 0

	;0.84
	$g_pooprnd = $s_PoopSize / 4 ;  no poop for first few foods

	Local $aAccelKey2[][] = [["{RIGHT}", $L_idRight], ["{LEFT}", $L_idLeft], ["{DOWN}", $L_idDown], ["{UP}", $L_idUp], ["{ESC}", $L_idEsc]]
	GUISetAccelerators($aAccelKey2, $g_ctrlBoard)
	MouseMove(0, 0, 0)

	Switch $g_GameWhich
		Case 1 ;extra
			$g_gChange = 2 ;Start with X so snake will not die at start
			$g_Turns = -1 ; The way it start with 1 turn on start. To fix start with +1
			$g_HungeryLast = $g_Turns
			$HungerCnt = 0
		Case 0 ;			Normal
			$g_gChange = 1
			$g_Turns = -1 ; The way it start with 1 turn on start. To fix start with +1

	EndSwitch

	$g_endgame = False

	$g_hTick = TimerInit()
	Do ;game Loop
		Tick()

		$nMsg = GUIGetMsg()
		If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $L_idEsc Then
			ExitLoop
		EndIf

		If $nMsg > 0 Then
			Switch $nMsg

				Case $L_idLeft
					Do
					Until GUIGetMsg() <> $L_idLeft
					$g_turnNo = 1
					$g_dirX = -1
					$g_dirY = 0

				Case $L_idRight
					Do
					Until GUIGetMsg() <> $L_idRight
					$g_turnNo = 2
					$g_dirX = 1
					$g_dirY = 0

				Case $L_idUp

					Do
					Until GUIGetMsg() <> $L_idUp
					$g_turnNo = 3
					$g_dirX = 0
					$g_dirY = -1

				Case $L_idDown
					Do
					Until GUIGetMsg() <> $L_idDown
					$g_turnNo = 4
					$g_dirX = 0
					$g_dirY = 1

			EndSwitch
			If $g_turnNo <> $g_turnLast Then
				$g_turnLast = $g_turnNo
				$g_ScoreTurn += 1
				$g_Turns += 1

			EndIf

		Else
			Do
			Until GUIGetMsg() = 0
		EndIf
		If $g_dirX = 0 And $g_dirY = 0 Then
			ContinueLoop
		EndIf

		Switch $g_GameWhich
			Case 1
				Extra()
			Case 0
				Normal()
		EndSwitch

	Until $g_endgame

	GUISetAccelerators(1, $g_ctrlBoard) ; Turn off Accelerator
	UpDateHiScore()

EndFunc   ;==>Game
#CS INFO
	304622 V50 10/8/2019 4:57:52 PM V49 8/26/2019 10:02:39 AM V48 8/25/2019 6:50:13 PM V47 8/24/2019 6:38:07 PM
#CE

Func Tick() ;
	Local $fdiff

	If $TESTING Then
		If $Map[$what][0][0] <> $M1 Then
			Pause("Null not edge", $Map[$what][0][0])
			$Map[$what][0][0] = -1
		EndIf
	EndIf

	If $g_Status0Off = 0 Then
		Status(0, "", 0)
	EndIf
	$g_Status0Off -= 1
	If $g_Status2Off = 0 Then
		Status(2, "", 0)
	EndIf
	$g_Status2Off -= 1
	If $g_Status3Off = 0 Then
		Status(3, "", 0)
	EndIf
	$g_Status3Off -= 1

	$timing[$timingCnt] = TimerDiff($g_hTick)
	$timingCnt += 1
	If $timingCnt = 100 Then
		$timingCnt = 0
		$fdiff = 0
		For $x = 0 To 99
			$fdiff += $timing[$x]
		Next

		$g_tc = String(Int(($fdiff / 100)))

	EndIf

	While 1
		$fdiff = TimerDiff($g_hTick)
		;If $fdiff > 1000 then ;150 Then ;150
		If $fdiff > $g_TickTime Then ;150
			ExitLoop
		EndIf
	WEnd

	If $g_Focus <> WinGetTitle("[ACTIVE]") Then
		Status(3, "Lost Focus - Pause", 1)
		While $g_Focus <> WinGetTitle("[ACTIVE]")
			Sleep(1000)
		WEnd

		Status(3, "Found Focus - Wait 2 seconds", 4)
		Sleep(2000)
		MouseMove(0, 0, 0)
		Status(3, "", 0)
	EndIf

	$g_hTick = TimerInit()
EndFunc   ;==>Tick
#CS INFO
	68587 V16 8/25/2019 6:50:13 PM V15 8/22/2019 6:28:51 PM V14 7/14/2019 10:20:53 AM V13 7/13/2019 7:20:00 PM
#CE INFO

; $g_iscore is extra + length  ~~
Func Extra()
	Local $a
	Local Static $ls_SnakeLenLast
	Local Static $ls_HungerFug
	Local $flag

	If $g_Ouch > 0 Then
		;DataOut("OUCH", $g_Ouch)
		;pause("Ouch", $g_Ouch)
		$g_Ouch -= 1
	EndIf

	;EXTRA
	Switch $Map[$what][$x_new + $g_dirX][$y_new + $g_dirY]
		Case $DEAD
			If $g_Ouch > 0 Then
				$flag = DoubleBackWall()
				If $flag Then
					Status(2, "Double back DEAD", 3)
				Else
					Status(0, "Ate too much dead snake or poop", 1)
					$g_endgame = True
					Return
				EndIf

			EndIf

			Status(3, "Ate DEAD snake  Yuck!! Lost " & $MaxLost + 3 & " cells of snake", 1)
			If $g_gChange > $MaxLost * 2 Then
				$g_gChange -= Int($MaxLost / 2)
			Else
				$g_gChange -= $MaxLost + 3
			EndIf

			$Map[$what][$x_new + $g_dirX][$y_new + $g_dirY] = $EMPTY
			$g_Ouch = 2
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

		Case $POOP
			If $g_gChange > $MaxLost * 1.5 Then
				$g_gChange -= Int($MaxLost / 2)
			Else
				$g_gChange -= $MaxLost
			EndIf
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			Status(3, "Ate  snake POOP  Yuck! Lost " & $MaxLost & " cells of snake", 1)
			PoopAdd($x_new + $g_dirX, $y_new + $g_dirY, $s_PoopSize)

		Case $WALL
			$flag = WallTrue()
			If Not $flag Then
				$flag = DoubleBackWall()
				If $flag Then
					Status(2, "Double back WALL, Lost 2", 3)
					$g_gChange -= 2
				Else
					Status(0, "Ate Wall", 1)
					$g_endgame = True
					Return
				EndIf
			EndIf

		Case $SNAKE

			; Check  prev to be the same  last location
			If $Map[$prX][$x_new][$y_new] = $x_new + $g_dirX And $Map[$prY][$x_new][$y_new] = $y_new + $g_dirY Then ; Double back
				$flag = DoubleBack($g_dirX, $g_dirY)
				If $flag Then
					Status(2, "Double back on self, Lost 2", 3)
					$g_gChange -= 2
				Else
					Status(0, "Ate self", 1)
					$g_endgame = True
					Return
				EndIf
			Else

				If StartDead($x_new + $g_dirX, $y_new + $g_dirY) = False Then
					Status(0, "Ate self to many times", 1)
					$g_endgame = True
					Return

				EndIf
				PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			EndIf

		Case $FOOD
			;$Map[$what][$x_new + $g_dirX][$y_new + $g_dirY]
			PoopRemove()

			$g_pooprnd += 1
			If Random(0, $g_pooprnd, 1) > 6 Then
				PoopAdd($x_new + $g_dirX, $y_new + $g_dirY)
				$g_pooprnd = Ceiling($LS_SnakeLenLast / 10) + 5
			EndIf

			$g_ScoreFood += 1
			$HungerCnt = 0
			$g_gChange += 1

			Switch $g_Turns
				Case 0, 1, 2
					$g_gChange += 2
					If $LS_SnakeLenLast = $g_SnakeMax Then
						$g_iScore += 50
						Status(0, "Turn bonus: Score 50 Snake 2", 4)
					Else
						Status(0, "Turn bonus: Snake 2", 4)
					EndIf
				Case 3
					$g_gChange += 1
					If $LS_SnakeLenLast = $g_SnakeMax Then
						$g_iScore += 20
						Status(0, "Turn bonus: Score 20 Snake 1", 4)
					Else
						Status(0, "Turn bonus: Snake 1", 4)
					EndIf
				Case 4
					$g_gChange += 0
					If $LS_SnakeLenLast = $g_SnakeMax Then
						$g_iScore += 5
						Status(0, "Turn bonus: Score 5", 4)
					Else
						Status(0, "", 0)
					EndIf
				Case Else
					Status(0, "", 0)

			EndSwitch
			$ls_HungerFug = 3 - Int($LS_SnakeLenLast / 20)
			If $ls_HungerFug < 1 Then
				$ls_HungerFug = 0
			EndIf

			$g_Turns = 0
			$g_HungeryLast = 0
			$HungerCnt = 0

			;RemoveFood()  NOT needed because  snake will over write with out looking
			AddFood()
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			RemoveSnakeExtra() ;only empty cell change len

		Case $FOOD2 ;Food from Food from 0
			;$Map[$what][$x_new + $g_dirX][$y_new + $g_dirY]
			$g_ScoreFood += 1
			$g_gChange += 5

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			RemoveSnakeExtra() ;only empty cell change len
			$g_iScore += 10
			Status(0, "Poop Bonus Food: Score 10, Snake 5", 4)

			$g_Turns = 0
			$g_HungeryLast = 0
			$HungerCnt = 0
			$ls_HungerFug = 0

		Case $EMPTY
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

			;Check to see if snake grow longer or shorter
			If $g_gChange = 0 Then
				RemoveSnakeExtra()
			ElseIf $g_gChange > 0 Then ; snake get longer don't remove end
				Switch $g_gChangeHalf
					Case 0
						$g_gChange -= 1
						$g_gChangeHalf = $s_gChangeBaseExtra
					Case Else
						RemoveSnakeExtra() ;Same size
						$g_gChangeHalf -= 1
				EndSwitch

			ElseIf $g_gChange < 0 Then ; snake get shorter remove end twice
				Switch $g_gChangeHalf
					Case 0
						$g_gChange += 1
						$g_gChangeHalf = $s_gChangeBaseExtra
						If RemoveSnakeExtra() Then ;one smaller
							$g_endgame = True
							Return ;no snake
						EndIf
						If RemoveSnakeExtra(True) Then
							$g_endgame = True
							Return ;no snake
						EndIf
					Case Else
						$g_gChangeHalf -= 1
						RemoveSnakeExtra() ;same size
				EndSwitch
			EndIf
			If $g_Turns > 4 Then
				If $g_HungeryLast < $g_Turns Then
					$g_HungeryLast = $g_Turns
					$HungerCnt += 1

					If $HungerCnt > $ls_HungerFug Then
						Status(2, "Hungery -  Snake shorter", 3)
						$ls_HungerFug -= 1
						If $ls_HungerFug < 0 Then
							$ls_HungerFug = 0
						EndIf
						$HungerCnt = 0
						$g_gChange -= 1
					EndIf
				EndIf
			EndIf
	EndSwitch

	;Score

	$a = $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1
	If $a > $g_SnakeMax Then
		$g_SnakeMax = $a
	EndIf
	If $LS_SnakeLenLast <> $a Then
		$LS_SnakeLenLast = $a
		$g_GameScore = $g_iScore + $g_ScoreFood + $g_SnakeMax

		Status(1, StringFormat("Lenght: %4u, Max: %4u, Score: %6u,   ms/cyc %u", $a, $g_SnakeMax, $g_GameScore, $g_tc), 2)

		;		Status(1, "Snake length: " & $a & " Max " & $g_SnakeMax & "   Score: " & $g_GameScore & "     tick:" & $g_tc, 2)

	EndIf

EndFunc   ;==>Extra
#CS INFO
	364074 V41 8/30/2019 2:18:51 PM V40 8/26/2019 10:02:39 AM V39 8/25/2019 6:50:13 PM V38 8/25/2019 12:01:59 AM
#CE INFO

Func Normal()
	Local Static $LS_SnakeLenLast = 0

	Switch $Map[$what][$x_new + $g_dirX][$y_new + $g_dirY]
		Case $WALL ;Normal Wall
			Status(0, "Ate wall", 1)
			$g_endgame = True
			Return

		Case $SNAKE ;Normal
			Status(0, "Ate self", 1)
			$g_endgame = True
			Return

		Case $FOOD ;Normal
			Switch $g_Turns
				Case 0
					$g_gChange += 4
					Status(0, "Turn bonus: Snake 4", 4)
				Case 1
					$g_gChange += 3
					$g_iScore += 80
					Status(0, "Turn bonus: Snake 3", 4)
				Case 2
					$g_gChange += 2
					$g_iScore += 60
					Status(0, "Turn bonus: Snake 2", 4)
				Case 3
					$g_gChange += 1
					Status(0, "Turn bonus: Snake 1", 4)
				Case Else
					Status(0, "", 0)
			EndSwitch
			$g_Turns = 0
			$g_gChangeHalf = $s_gChangeBaseNormal
			$g_ScoreFood += 1

			;RemoveFood()  NOT needed because  snake will over write with out looking
			AddFood()
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

		Case $EMPTY ;Normal

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

			If $g_gChange = 0 Then
				RemoveSnakeNormal()
			ElseIf $g_gChange > 0 Then ; snake get longer don't remove end
				Switch $g_gChangeHalf
					Case 0
						$g_gChange -= 1
						$g_gChangeHalf = $s_gChangeBaseNormal
					Case Else
						RemoveSnakeNormal() ;Same size
						$g_gChangeHalf -= 1
				EndSwitch
			EndIf
	EndSwitch
	;Score NORMAL
	$g_iScore = $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1
	If $LS_SnakeLenLast <> $g_iScore Then
		$LS_SnakeLenLast = $g_iScore
		Status(1, "Snake length: " & $g_iScore, 2)
	EndIf
	$g_GameScore = $g_iScore

	; END NORMAL
EndFunc   ;==>Normal
#CS INFO
	107983 V9 8/18/2019 11:56:18 AM V8 7/18/2019 11:32:28 PM V7 7/15/2019 9:15:04 AM V6 7/13/2019 7:36:11 PM
#CE INFO

Func StartDead($inX, $inY)
	Local $x, $y

	;Blood start with previous cross location so Zero out next location  And this location RED
	$x = $Map[$prX][$inX][$inY]
	$y = $Map[$prY][$inX][$inY]

	;clear nx
	$Map[$nxX][$x][$y] = 0
	$Map[$nxY][$x][$y] = 0

	ConvDead($x, $y)

	$x = $x_end
	$y = $y_end
	;ShowRow($x, $y)

	;Clear prv   Not sure I need to do this
	$Map[$prX][$x][$y] = 0
	$Map[$prY][$x][$y] = 0

	;Add blood to old tail
	Status(3, "Ate Live snake OUCH OUCH", 1)

	;Blood 2nd with next cross location so Zero out prv location  And this location RED
	;This one will be the new end.  The old end will be bdStart2
	$x = $Map[$nxX][$inX][$inY]
	$y = $Map[$nxY][$inX][$inY]

	$Map[$prX][$x][$y] = 0
	$Map[$prY][$x][$y] = 0

	$x_end = $x
	$y_end = $y

	Return True
EndFunc   ;==>StartDead
#CS INFO
	57982 V14 8/25/2019 6:50:13 PM V13 8/2/2019 8:56:18 PM V12 7/18/2019 11:32:28 PM V11 7/14/2019 10:20:53 AM
#CE INFO

Func ConvDead($x, $y, $useNext = False) ; start map location
	;----------------- convert Snake to Dead until end

	Local $tx, $ty

	;ShowRow($x, $y)
	While $Map[$what][$x][$y] = $SNAKE

		$Map[$what][$x][$y] = $DEAD
		GUICtrlSetImage($Map[$ctrl][$x][$y], $cDEAD)

		$tx = $x
		$ty = $y

		If $useNext Then
			Status(2, "ConvDead from End", 3)
			$x = $Map[$nxX][$tx][$ty]
			$y = $Map[$nxY][$tx][$ty]
		Else
			$x = $Map[$prX][$tx][$ty]
			$y = $Map[$prY][$tx][$ty]
		EndIf

	WEnd

EndFunc   ;==>ConvDead
#CS INFO
	34565 V6 8/25/2019 6:50:13 PM V5 7/9/2019 1:03:14 AM V4 7/6/2019 6:24:29 PM V3 7/5/2019 4:03:49 PM
#CE INFO

Func ShowRow($x, $y)
	If $TESTING Then ; Not used in compiled, in case if forget to comment out.

		Local $aa[7]

		For $Z = 0 To 6
			$aa[$Z] = $Map[$Z][$x][$y]
		Next
		_ArrayDisplay($aa)
	EndIf
EndFunc   ;==>ShowRow
#CS INFO
	15281 V2 6/24/2019 11:22:57 PM V1 6/16/2019 10:16:04 AM
#CE INFO

Func Status($status, $string, $color)
	Local $c

	If $status = 0 Then
		$g_Status0Off = 25
	EndIf
	If $status = 2 Then
		$g_Status2Off = 25
	EndIf
	If $status = 3 Then
		$g_Status3Off = 25
	EndIf

	GUICtrlSetData($g_StatusText[$status], $string)
	Switch $color
		Case 0 ;Black
			$c = 0x000000
		Case 1 ;Pink
			$c = 0xff69b4
		Case 2 ;White
			$c = 0xffffff
		Case 3 ; yellow
			$c = 0xffff00
		Case 4 ;pale green
			$c = 0x90EE90

	EndSwitch
	GUICtrlSetBkColor($g_Status[$status], $c)
	GUICtrlSetBkColor($g_StatusText[$status], $c)
EndFunc   ;==>Status
#CS INFO
	38718 V10 8/25/2019 6:50:13 PM V9 8/25/2019 9:54:57 AM V8 7/14/2019 10:20:53 AM V7 7/13/2019 3:59:17 PM
#CE INFO

Func StartSnake()
	Local $x, $y

	$x = Int(Random(5, $g_sx - 5))
	$y = Int(Random(5, $g_sy - 5))

	$x_new = $x
	$y_new = $y
	$Map[$prX][$x_new][$y_new] = 0
	$Map[$prY][$x_new][$y_new] = 0

	$Map[$nxX][$x_new][$y_new] = 0
	$Map[$nxY][$x_new][$y_new] = 0

	$Map[$num][$x_new][$y_new] = $g_SnakeCount

	$Map[$what][$x_new][$y_new] = $SNAKE
	GUICtrlSetImage($Map[$ctrl][$x_new][$y_new], $cSNAKE)

	$x_end = $x_new
	$y_end = $y_new

EndFunc   ;==>StartSnake
#CS INFO
	33453 V5 6/22/2019 7:09:09 PM V4 6/6/2019 11:09:42 PM V3 6/3/2019 8:05:25 PM V2 6/3/2019 10:34:22 AM
#CE INFO

; Dirx& Diry moving to wall not like Double Back which has reserves direction
; So they will change, I can't make them Global because I used this name as Local in a number of Function.
Func DoubleBackWall() ;(ByRef $dirx, ByRef $diry) ; ~~
	;	$g_dirX, $g_dirY
	Local $a, $flag

	;Reverse $dirx and $g_diry here and after that they must not change.
	$g_dirX *= -1 ;1 to -1: 0 to 0: -1 to 1
	$g_dirY *= -1

	;new+dir  is one back.
	; Find which X or Y which is the same, then random _+ one on there

	If $g_dirX = 0 Then
		$a = Random(0, 1, 1)
		If $a = 0 Then
			$a = -1
		EndIf
		$flag = False
		If $Map[$what][$x_new + $a][$y_new] = 0 Then
			$flag = True
		Else
			$a *= -1
			If $Map[$what][$x_new + $a][$y_new] = 0 Then
				$flag = True
			EndIf
		EndIf
		If $flag Then
			PrevNext($x_new + $a, $y_new + $g_dirY)
			RemoveSnakeExtra() ;Same size
			$g_Turns += 2
		EndIf
	Else ;$g_diry =0
		$a = Random(0, 1, 1)
		If $a = 0 Then
			$a = -1
		EndIf
		$flag = False
		If $Map[$what][$x_new][$y_new + $a] = 0 Then
			$flag = True
		Else
			$a *= -1
			If $Map[$what][$x_new][$y_new + $a] = 0 Then
				$flag = True
			EndIf
		EndIf
		If $flag Then
			PrevNext($x_new + $g_dirX, $y_new + $a)
			RemoveSnakeExtra() ;Same size
			$g_Turns += 2
		EndIf

	EndIf
	Return $flag

EndFunc   ;==>DoubleBackWall
#CS INFO
	72569 V7 8/18/2019 11:56:18 AM V6 7/5/2019 4:03:49 PM V5 7/4/2019 11:42:05 AM V4 6/27/2019 5:39:48 PM
#CE INFO

Func DoubleBack($dirx, $diry)
	Local $a, $flag
	;new+dir  is one back.
	; Find which X or Y which is the same, then random _+ one on there
	If $dirx = 0 Then
		$a = Random(0, 1, 1)
		If $a = 0 Then
			$a = -1
		EndIf
		$flag = False
		If $Map[$what][$x_new + $a][$y_new] = 0 Then
			$flag = True
		Else
			$a *= -1
			If $Map[$what][$x_new + $a][$y_new] = 0 Then
				$flag = True
			EndIf
		EndIf
		If $flag Then
			PrevNext($x_new + $a, $y_new + $diry)
			RemoveSnakeExtra() ;Same size
		EndIf
	Else ;$diry =0
		$a = Random(0, 1, 1)
		If $a = 0 Then
			$a = -1
		EndIf
		$flag = False
		If $Map[$what][$x_new][$y_new + $a] = 0 Then
			$flag = True
		Else
			$a *= -1
			If $Map[$what][$x_new][$y_new + $a] = 0 Then
				$flag = True
			EndIf
		EndIf
		If $flag Then
			PrevNext($x_new + $dirx, $y_new + $a)
			RemoveSnakeExtra() ;Same size
		EndIf

	EndIf
	Return $flag

EndFunc   ;==>DoubleBack
#CS INFO
	57688 V3 8/25/2019 6:50:13 PM V2 6/20/2019 9:30:52 PM V1 6/9/2019 1:07:49 PM
#CE INFO

Func PrevNext($x, $y) ;New value
	Local $x_prv, $y_prv

	$x_prv = $x_new
	$y_prv = $y_new
	$x_new = $x
	$y_new = $y
	$Map[$prX][$x_new][$y_new] = $x_prv
	$Map[$prY][$x_new][$y_new] = $y_prv

	$Map[$nxX][$x_prv][$y_prv] = $x_new
	$Map[$nxY][$x_prv][$y_prv] = $y_new
	GUICtrlSetImage($Map[$ctrl][$x_prv][$y_prv], $cSNAKE)
	$g_SnakeCount += 1
	$Map[$num][$x_new][$y_new] = $g_SnakeCount

	$Map[$what][$x_new][$y_new] = $SNAKE
	GUICtrlSetImage($Map[$ctrl][$x_new][$y_new], $cHEAD)

EndFunc   ;==>PrevNext
#CS INFO
	39469 V7 8/21/2019 10:55:18 AM V6 7/13/2019 3:59:17 PM V5 7/9/2019 1:03:14 AM V4 6/22/2019 7:09:09 PM
#CE INFO

;Add poop here
Func RemoveSnakeExtra($inputflag = False) ; at end
	Local $x, $y, $flag

	$x = $x_end
	$y = $y_end

	$flag = False

	If PoopShow($x, $y) Then
		$Map[$what][$x][$y] = $EMPTY
		GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)
	EndIf

	$x_end = $Map[$nxX][$x][$y]
	$y_end = $Map[$nxY][$x][$y]

	;Put in zero

	If $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] = 0 Then
		Status(3, "Died of hunger:", 1)
		Return True
	EndIf
	Return False

EndFunc   ;==>RemoveSnakeExtra
#CS INFO
	34681 V21 8/26/2019 10:02:39 AM V20 8/21/2019 10:55:18 AM V19 8/18/2019 11:15:59 PM V18 7/13/2019 7:20:00 PM
#CE INFO

Func RemoveSnakeNormal() ; at end
	Local $x, $y

	$x = $x_end
	$y = $y_end

	$Map[$what][$x][$y] = $EMPTY
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)

	$x_end = $Map[$nxX][$x][$y]
	$y_end = $Map[$nxY][$x][$y]

EndFunc   ;==>RemoveSnakeNormal
#CS INFO
	18081 V11 8/26/2019 10:02:39 AM V10 7/13/2019 3:59:17 PM V9 6/24/2019 11:22:57 PM V8 6/22/2019 7:09:09 PM
#CE INFO

Func AddFood($start = False)
	Local $x, $y

	If Not $start Then ;Force start with one food  below math sometime cause 0 food on start

		$x = Int(($Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end]) / 100) + 1

		If $g_foodCnt > $x Then
			$g_foodCnt -= 1
			Return
		ElseIf $g_foodCnt < $x Then
			$g_foodCnt += 1
			AddFood()
		EndIf

	EndIf
	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine

		Local $len, $x1, $y1, $mid, $len2, $x2, $y2

		$len = ($Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end])
		If $len < 50 Then
			If $len < 10 Then
				$len = 10
			EndIf
			$len2 = Int($len / 2)
			If $len > $g_sx - 2 Then
				$x2 = $g_sx - 1
				$x1 = 2
			Else
				$mid = Int($g_sx / 2)
				$x2 = $mid + $len2
				$x1 = $mid - $len2
			EndIf

			If $len > $g_sy - 2 Then
				$y2 = $g_sy - 1
				$y1 = 2
			Else
				$mid = Int($g_sy / 2)
				$y2 = $mid + $len2
				$y1 = $mid - $len2
			EndIf

			Do
				$x = Random($x1, $x2, 1)
				$y = Random($y1, $y2, 1)
			Until $Map[$what][$x][$y] = $EMPTY
		Else
			Do
				$x = Random(1, $g_sx, 1)
				$y = Random(1, $g_sy, 1)
			Until $Map[$what][$x][$y] = $EMPTY
		EndIf
	Else
		Do
			$x = Random(1, $g_sx, 1)
			$y = Random(1, $g_sy, 1)
		Until $Map[$what][$x][$y] = $EMPTY
	EndIf

	$Map[$what][$x][$y] = $FOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cFOOD)

EndFunc   ;==>AddFood
#CS INFO
	80901 V12 8/26/2019 10:02:39 AM V11 8/25/2019 6:50:13 PM V10 6/28/2019 7:37:37 PM V9 6/24/2019 11:22:57 PM
#CE INFO

Func ClearBoard()
	Local $var, $NotEmpty

	SayClearBoard(True, False)

	For $y = 0 To $g_boardy - 1
		For $x = 0 To $g_boardx - 1
			Select
				Case $x = 0 Or $x = $g_boardx - 1 Or $y = 0 Or $y = $g_boardy - 1
					$Map[$what][$x][$y] = $WALL ;outside edge  does need to change picture
					;$var = $cEDGE
				Case Else
					$NotEmpty = $Map[$what][$x][$y] <> $EMPTY
					$Map[$what][$x][$y] = $EMPTY ; empty
					$var = $cEMPTY

					If $NotEmpty Then
						GUICtrlSetImage($Map[$ctrl][$x][$y], $var)
					EndIf
			EndSelect

		Next
	Next
	SayClearBoard()

EndFunc   ;==>ClearBoard
#CS INFO
	38157 V16 8/12/2019 11:06:11 AM V15 7/13/2019 3:59:17 PM V14 7/8/2019 1:00:13 AM V13 7/6/2019 6:24:29 PM
#CE INFO

Func NormalPoop()
	Local Static $PoopCnt = 100

	$PoopCnt -= 1
	If $PoopCnt = 0 Then
		$PoopCnt = Random(99, 149, 1)
		Return True
	EndIf
	Return False
EndFunc   ;==>NormalPoop
#CS INFO
	12381 V2 7/8/2019 1:00:13 AM V1 7/3/2019 8:35:19 PM
#CE INFO

Func NormalExtra()
	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		GUICtrlSetState($Radio1, $GUI_CHECKED)
	Else
		GUICtrlSetState($Radio2, $GUI_CHECKED)
	EndIf
	ReadHiScore()
	DisplayHiScore()
EndFunc   ;==>NormalExtra
#CS INFO
	16149 V3 8/11/2019 11:35:36 PM V2 8/2/2019 8:56:18 PM V1 6/5/2019 11:59:45 PM
#CE INFO

Func DisplayHiScore()
	Local $s

	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		GUICtrlSetData($g_HiScoreWho, "High Score - Normal")
		For $i = 0 To 9
			If $g_aHiScore[$i + 1][0] = 0 Then
				GUICtrlSetData($g_HiScore[$i], "")
			Else
				$s = StringFormat("%u : %5u - Turn: %4u, Food; %4u, Travel: %6u,  %s", $i + 1, $g_aHiScore[$i + 1][0], $g_aHiScore[$i + 1][4], $g_aHiScore[$i + 1][3], $g_aHiScore[$i + 1][2], $g_aHiScore[$i + 1][1])
				GUICtrlSetData($g_HiScore[$i], $s)
				;GUICtrlSetData($g_HiScore[$i], $i + 1 & " - " & $g_aHiScore[$i + 1][0] & " - " & $g_aHiScore[$i + 1][1] & " Travel: " & $g_aHiScore[$i + 1][2] & " Turn: " & $g_aHiScore[$i + 1][4])
			EndIf
		Next
	Else
		GUICtrlSetData($g_HiScoreWho, "High Score - Extra")
		For $i = 0 To 9
			;GUICtrlSetData($g_HiScore[$i], $i + 1 & " - " & $g_aHiScore[$i + 1][0] & " - " & $g_aHiScore[$i + 1][1] & " Length: " & $g_aHiScore[$i + 1][2] & " Food: " & $g_aHiScore[$i + 1][3] & " Turn: " & $g_aHiScore[$i + 1][4])
			If $g_aHiScore[$i + 1][0] = 0 Then
				GUICtrlSetData($g_HiScore[$i], "")
			Else
				$s = StringFormat("%u : %5u - Max: %4u, Food; %4u, Turn: %5u,  %s", $i + 1, $g_aHiScore[$i + 1][0], $g_aHiScore[$i + 1][2], $g_aHiScore[$i + 1][3], $g_aHiScore[$i + 1][4], $g_aHiScore[$i + 1][1])
				GUICtrlSetData($g_HiScore[$i], $s)
				;	GUICtrlSetData($g_HiScore[$i], $i + 1 & " - " & $g_aHiScore[$i + 1][0] & " - " & $g_aHiScore[$i + 1][1] & " Max: " & $g_aHiScore[$i + 1][2] & " Food: " & $g_aHiScore[$i + 1][3] & " Turn: " & $g_aHiScore[$i + 1][4])
			EndIf
		Next
	EndIf

EndFunc   ;==>DisplayHiScore
#CS INFO
	102253 V7 7/24/2019 11:20:48 PM V6 7/24/2019 12:53:35 PM V5 7/15/2019 9:15:04 AM V4 7/5/2019 8:47:35 AM
#CE INFO

Func UpDateHiScore()
	Local $Form1

	If $g_aHiScore[10][0] < $g_GameScore Then
		;		MsgBox($MB_TOPMOST, "High Score", "New High Score: " & $g_iScore, 5)
		$Form1 = GUICreate("", 250, 100, -1, -1, $WS_DLGFRAME, BitOR($WS_EX_TOPMOST, $WS_EX_STATICEDGE))
		GUICtrlCreateLabel("New High Score: " & $g_GameScore, 25, 30, 200, 25)
		GUICtrlSetFont(-1, 12, 400, 0, "Arial")
		GUISetState(@SW_SHOW)

		$g_aHiScore[11][0] = $g_GameScore
		$g_aHiScore[11][1] = _Now()
		If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
			$g_aHiScore[11][2] = $g_SnakeCount
		Else
			$g_aHiScore[11][2] = $g_SnakeMax
		EndIf
		$g_aHiScore[11][3] = $g_ScoreFood
		$g_aHiScore[11][4] = $g_ScoreTurn

		_ArraySort($g_aHiScore, 1, 1, 11)
		SaveHiScore()
		Sleep(5000)
		GUIDelete($Form1)
		$g_GameScore = 0

	ElseIf $g_GameScore > 0 Then
		$Form1 = GUICreate("", 250, 100, -1, -1, $WS_DLGFRAME, BitOR($WS_EX_TOPMOST, $WS_EX_STATICEDGE))
		GUICtrlCreateLabel("Score: " & $g_GameScore, 25, 30, 200, 25)
		GUICtrlSetFont(-1, 12, 400, 0, "Arial")
		GUISetState(@SW_SHOW)
		Sleep(5000)
		GUIDelete($Form1)
	EndIf
EndFunc   ;==>UpDateHiScore
#CS INFO
	74545 V14 7/24/2019 11:20:48 PM V13 7/18/2019 11:32:28 PM 123V12 7/13/2019 7:36:11 PM V11 7/5/2019 8:47:35 AM
#CE INFO

Func SaveHiScore()
	Local $x, $a[12][2]

	For $x = 1 To 10
		$a[$x][0] = String($x)
		$a[$x][1] = $g_aHiScore[$x][0] & "|" & $g_aHiScore[$x][1] & "|" & $g_aHiScore[$x][2] & "|" & $g_aHiScore[$x][3] & "|" & $g_aHiScore[$x][4] & "|" & $g_aHiScore[$x][5]
	Next
	$a[0][0] = 10
	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		$x = IniWriteSection($s_scoreini, "HighScoreNormal", $a)
	Else
		$x = IniWriteSection($s_scoreini, "HighScoreExtra", $a)
	EndIf

EndFunc   ;==>SaveHiScore
#CS INFO
	33437 V6 7/24/2019 11:20:48 PM V5 7/13/2019 7:20:00 PM V4 6/16/2019 10:16:04 AM V3 6/5/2019 11:59:45 PM
#CE INFO

Func IniHighFive()
	Local $a, $c, $Z, $Save
	$Save = $g_GameWhich

	For $x = 0 To 1
		$g_GameWhich = $x
		If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
			$a = IniReadSection($s_scoreini, "HighScoreNormal")
		Else
			$a = IniReadSection($s_scoreini, "HighScoreExtra")
		EndIf
		If @error = 0 Then

			For $i = 1 To 10
				If $i > 8 Then
					$g_aHiScore[$i][0] = 0 ;
					$g_aHiScore[$i][1] = "" ;date
					$g_aHiScore[$i][2] = "" ;len
					$g_aHiScore[$i][3] = "" ;food
					$g_aHiScore[$i][4] = "" ;turns
					$g_aHiScore[$i][5] = "" ;Max
				Else
					$c = StringSplit($a[$i][1], "|")
					$g_aHiScore[$i][0] = Int($c[1])
					$g_aHiScore[$i][1] = $c[2]
					$g_aHiScore[$i][2] = $c[3]
					$g_aHiScore[$i][3] = $c[4]
					$g_aHiScore[$i][4] = $c[5]
					$g_aHiScore[$i][5] = $c[6]
				EndIf
			Next

			SaveHiScore()

		EndIf
	Next
	$g_GameWhich = $Save

EndFunc   ;==>IniHighFive
#CS INFO
	56498 V4 10/8/2019 4:57:52 PM V3 7/24/2019 11:20:48 PM V2 7/13/2019 7:20:00 PM V1 6/28/2019 7:37:37 PM
#CE

Func ReadHiScore()
	Local $a, $c, $Z
	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		$a = IniReadSection($s_scoreini, "HighScoreNormal")
	Else
		$a = IniReadSection($s_scoreini, "HighScoreExtra")
	EndIf
	If @error = 0 Then

		For $i = 1 To 10
			$c = StringSplit($a[$i][1], "|")
			$g_aHiScore[$i][0] = Int($c[1])
			$g_aHiScore[$i][1] = $c[2]
			$g_aHiScore[$i][2] = $c[3]
			$g_aHiScore[$i][3] = $c[4]
			$g_aHiScore[$i][4] = $c[5]
			$g_aHiScore[$i][5] = $c[6]
		Next
		$g_first = False ; first run since startup

	Else
		For $i = 1 To 10 ; not found load
			$g_aHiScore[$i][0] = 0 ;
			$g_aHiScore[$i][1] = "" ;date
			$g_aHiScore[$i][2] = "" ;len
			$g_aHiScore[$i][3] = "" ;food
			$g_aHiScore[$i][4] = "" ;turns
			$g_aHiScore[$i][5] = "" ;Max
		Next
		SaveHiScore()
	EndIf
EndFunc   ;==>ReadHiScore
#CS INFO
	55181 V7 10/8/2019 4:57:52 PM V6 7/24/2019 11:20:48 PM V5 7/13/2019 7:20:00 PM V4 6/16/2019 10:16:04 AM
#CE

;Load Level from THE GAME
; to remove Run again
Func SayClearBoard($OnOff = False, $Mode = True) ; $OnOff = True/False

	Local Static $PleaseWait = 0
	Local $x, $y, $aPos

	If $OnOff Then
		If $Mode Then
			$PleaseWait = GUICreate("", 186, 92, -1, -1, -1, BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE))
			GUICtrlCreateLabel("Generating  Board", 8, 8, 170, 25, $SS_CENTER)
		Else
			$aPos = WinGetPos($g_ctrlBoard) ;786/708
			$x = $aPos[0] + ((786 - 186) / 2)
			$y = $aPos[1] + ((708 - 92) / 2)
			$PleaseWait = GUICreate("", 186, 92, $x, $y, -1, BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE))
			GUICtrlCreateLabel("Clearing Board", 8, 8, 170, 25, $SS_CENTER)
		EndIf
		GUICtrlSetFont(-1, 12, 800, 0, "Arial Black")

		GUICtrlCreateLabel("Please Wait", 8, 68, 170, 25, $SS_CENTER)
		GUICtrlSetFont(-1, 12, 400, 0, "Arial")
		GUISetState(@SW_SHOW)
	Else
		If $PleaseWait <> 0 Then
			GUIDelete($PleaseWait)
			$PleaseWait = 0
		EndIf

	EndIf

EndFunc   ;==>SayClearBoard
#CS INFO
	59050 V1 6/27/2019 5:39:48 PM
#CE INFO

;Check to see if color files exist, if not create them.
;Does a sum check to make sure they haven't change
;Might remove sum check.
Func CheckColorJpg($filename, $color) ; $color is only the default color if INI color then use it.
	Local $a

	$a = IniRead($s_ini, "Color", $filename, "X")

	If FileExists($g_data & "\" & $filename & ".jpg") = 0 Then ;Not found

		If $a <> "X" Then ; if INI exist then use INI
			$color = $a
		EndIf
		CreateColorJpg($filename, $color)
		Return
	EndIf

	If $a = "X" Then ;COLOR in INI does not exist use $color
		CreateColorJpg($filename, $color)
		Return
	EndIf

EndFunc   ;==>CheckColorJpg
#CS INFO
	35555 V4 10/11/2019 3:14:30 PM V3 8/16/2019 8:51:46 AM V2 7/14/2019 10:10:20 PM V1 7/14/2019 10:20:53 AM
#CE

;Create Color file and write INI
Func CreateColorJpg($filename, $color)
	Local $a
	Local $handle, $err
	Local $tRECT
	Local $hGUI

	;$hGUI = GUICreate("", 100, 100)
	$hGUI = GUICreate("", 100, 100, -1, -1, $DS_SETFOREGROUND)
	GUISetState(@SW_SHOW, $hGUI)

	; create, sumchk, store in ini Color Filename
	GUISetBkColor($color, $hGUI)
	Sleep(500)
	_ScreenCapture_CaptureWnd($g_data & "\" & $filename & ".jpg", $hGUI, 50, 50, 50 + 25, 50 + 25, False)
	If @error <> 0 Then ;Failed
		MsgBox(0, "ERROR", "Color Jpg could not be created " & $filename)
		Exit
	EndIf

	IniWrite($s_ini, "Color", $filename, "0x" & Hex($color, 6))

	GUIDelete($hGUI)

EndFunc   ;==>CreateColorJpg
#CS INFO
	43939 V7 10/13/2019 1:37:57 PM V6 10/11/2019 3:14:30 PM V5 8/22/2019 8:37:33 AM V4 8/18/2019 11:15:59 PM
#CE

Func StartForm()
	Local $Form1, $Group1
	Local $Radio3, $Checkbox1, $b_start, $b_setting, $b_replay
	Local $nMsg
	Local $a = 260
	Local $b = 50
	Local $c = 120
	Local $Z

	Local $sForm1 = "Snake19 - Main Menu"
	$Form1 = GUICreate($sForm1, 600, 600, -1, -1)
	If IsArray($g_Mouse) Then
		MouseMove($g_Mouse[0], $g_Mouse[1], 0)
	EndIf

	GUICtrlCreateLabel("Snake 19", 0, 0, 600, 24, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Arial")

	GUICtrlCreateLabel($ver, 0, 24, 600, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	$Group1 = GUIStartGroup()
	$Radio1 = GUICtrlCreateRadio("Normal", $a, $b, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$Radio2 = GUICtrlCreateRadio("Extra", $a, $b + 20, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	$b += 40

	$g_HiScoreWho = GUICtrlCreateLabel("High Score - Extra", $a, $b, $c + 30, 24) ; Height is twice font size
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$a = 50
	$b += 20

	For $x = 0 To 9
		$g_HiScore[$x] = GUICtrlCreateLabel(String($x + 1), $a, $b, 500, 24) ; Height is twice font size
		GUICtrlSetFont($g_HiScore[$x], 10, 400, 0, "Arial")
		$b += 20
	Next

	$b_setting = GUICtrlCreateButton("Setting", 100, 550, 75, 35) ;~~
	$b_replay = GUICtrlCreateButton("Replay", 500, 550, 75, 35)
	$b_start = GUICtrlCreateButton("GO", 270, 550, 100, 35)

	Local $Edit1 = GUICtrlCreateEdit("", 20, $b, 550, 230, $ES_READONLY)
	GUICtrlSetFont($Edit1, 10, 400, 0, "Arial")
	GUICtrlSetData($Edit1, "Press ESC to quit." & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)
	GUICtrlSetData($Edit1, "If you lose Focus or Minimize the game, it will PAUSE" & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)

	GUICtrlSetData($Edit1, "Normal" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Food increase Snake by 1.  Score +1 per food pickup.  There is a bonus." & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)

	GUICtrlSetData($Edit1, "Extra:" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Food increase Snake by 1.  A special food will get you more." & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)
	GUICtrlSetData($Edit1, "Extra Bonus:" & @CRLF, 1)
	GUICtrlSetData($Edit1, " Snake can 'double back' on self. Pass threw Wall to other side. But loose 2 cells." & @CRLF, 1)
	GUICtrlSetData($Edit1, " Snake does not like to Turn so, so few turns and Food increase snake & score" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Too many turns Snake gets shorter", 1)

	GUISetState(@SW_SHOW)

	NormalExtra()

	While 1
		If WinGetTitle("[ACTIVE]") <> $sForm1 Then
			Sleep(3000)
			ControlFocus($Form1, "", $b_start)
		EndIf
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Form1)
				Return True

			Case $b_replay
				ReplayStart()

			Case $b_start
				$g_Mouse = MouseGetPos()
				GUIDelete($Form1)
				Return False

			Case $b_setting
				Settings()

			Case $Radio1 ;Normal
				$g_GameWhich = 0
				NormalExtra()

			Case $Radio2 ; Extra
				$g_GameWhich = 1
				NormalExtra()

		EndSwitch
	WEnd
	Game()
	pause()

EndFunc   ;==>StartForm
#CS INFO
	202120 V31 10/11/2019 3:14:30 PM V30 10/8/2019 4:57:52 PM V29 8/25/2019 6:50:13 PM V28 8/18/2019 11:56:18 AM
#CE

Func Settings()
	Local $Setting, $y

	$Setting = GUICreate("Change Setting", 600, 150)
	GUICtrlCreateLabel("Settings", 260, 0, 80, 26, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "Arial")

	;47,183,320,456  - 50 100
	Local $b_about = GUICtrlCreateButton("About", 47, 50, 97, 33)
	Local $b_ScreenSize = GUICtrlCreateButton("Screen Size", 183, 50, 97, 33)
	Local $b_Color = GUICtrlCreateButton("Colors", 320, 50, 97, 33)
	Local $b_speed = GUICtrlCreateButton("Speed", 456, 50, 97, 33)

	Local $b_Adj = GUICtrlCreateButton("Adjust Values", 320, 100, 97, 33)
	Local $b_Uni = GUICtrlCreateButton("Delete Data", 456, 100, 97, 33)
	GUISetState(@SW_SHOW)

	While 1

		Local $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $b_about
				About()
				ExitLoop
			Case $b_ScreenSize
				ScreenSize()
			Case $b_Color
				ChooseColor()
			Case $b_speed
				Speed()
			Case $b_Adj
				AdjustValues()
				ExitLoop
			Case $b_Uni
				DeleteData()
		EndSwitch
	WEnd

	GUIDelete($Setting)
EndFunc   ;==>Settings
#CS INFO
	69421 V7 10/13/2019 1:37:57 PM V6 8/28/2019 11:39:16 AM V5 8/28/2019 2:01:59 AM V4 8/26/2019 10:02:39 AM
#CE

Func ScreenSize()
	Local $sInputBoxAnswer, $keep, $s, $mathW, $mathH, $Math
	Local $err

	$keep = $g_Size
	$mathW = Int(@DesktopWidth / $g_boardx) - 1
	$mathH = Int((@DesktopHeight - ($g_Font * 2)) / $g_boardy) - 1

	If $mathW > $mathH Then
		$Math = $mathH
	Else
		$Math = $mathW
	EndIf

	$s = "Default side is " & $g_sizeDef
	$s &= @CRLF & "Current cell size: " & $g_Size & @CRLF & "Desktop screen size: " & @DesktopHeight & "x" & @DesktopWidth & @CRLF & "Maximum cell size: "
	$s &= $Math & @CRLF & @CRLF & "Use Maximum cell size or enter a smaller size."

	$sInputBoxAnswer = InputBox("Cell size", $s, $Math)
	$err = @error
	Select
		Case $err = 1 ; Cancle was pushed
			Return

		Case $err = 0 ;OK - The string returned is valid
			If $sInputBoxAnswer <= $Math Then
				If $sInputBoxAnswer < 10 Then
					$sInputBoxAnswer = 10
				EndIf
				$g_Size = Int($sInputBoxAnswer)
			Else
				$g_Size = $Math
			EndIf
			If $g_Size <> $keep Then
				IniWrite($s_ini, "General", "SizeCell", $g_Size)
				Sleep(500)

				If @Compiled Then
					Run(@ScriptFullPath)
					Exit
				Else
					Pause("Compile it would restart the program")
				EndIf
				Exit
			EndIf
	EndSelect
EndFunc   ;==>ScreenSize
#CS INFO
	82198 V4 8/25/2019 6:50:13 PM V3 8/18/2019 11:15:59 PM V2 8/16/2019 8:51:46 AM V1 8/12/2019 11:06:11 AM
#CE INFO

; Read INI setting
Func ReadIni()
	Local $i
	Local $a, $c

	;SizeCell  default 16
	$g_Size = Int(IniRead($s_ini, "General", "SizeCell", 0))
	If $g_Size = 0 Then
		IniWrite($s_ini, "General", "SizeCell", $g_sizeDef)
		$g_Size = $g_sizeDef
	EndIf

EndFunc   ;==>ReadIni
#CS INFO
	17685 V2 8/16/2019 8:51:46 AM V1 8/12/2019 11:06:11 AM
#CE INFO

Func ChooseColor()
	Local $Which = 1
	Local $a, $color, $y
	Local $r_what[8][5]
	Local $Form1
	Local $restart = False
	Local $hGUI

	$Form1 = GUICreate("Colors", 150, 600)
	GUISetState(@SW_SHOW)

	GUIStartGroup()

	$r_what[1][0] = GUICtrlCreateRadio("Background", 40, 20, 113, 17)
	$r_what[2][0] = GUICtrlCreateRadio("Edge", 40, 40, 113, 17)
	$r_what[3][0] = GUICtrlCreateRadio("Snake Head", 40, 70, 113, 17)
	$r_what[4][0] = GUICtrlCreateRadio("Snake", 40, 90, 113, 17)
	$r_what[5][0] = GUICtrlCreateRadio("Food", 40, 110, 113, 17)
	$r_what[6][0] = GUICtrlCreateRadio("Dead snake", 40, 140, 113, 17)
	$r_what[7][0] = GUICtrlCreateRadio("Snake Poop", 40, 160, 113, 17)

	GUICtrlCreateLabel("Default Color", 40, 200)
	Local $b_default = GUICtrlCreateButton("", 40, 220, 50, 50)
	GUICtrlCreateLabel("Current Color", 40, 300)
	Local $b_current = GUICtrlCreateButton("", 40, 320, 50, 50)
	GUICtrlCreateLabel("Change Color", 40, 400)
	Local $b_change = GUICtrlCreateButton("", 40, 420, 50, 50)

	Local $e_value = GUICtrlCreateInput("FFFFFF", 30, 480, 60, 20)
	GUICtrlSetFont(-1, 10, 900, 0, "Arial")

	Local $b_save = GUICtrlCreateButton("  Save  ", 40, 510) ;, 50, 50)
	Local $b_all = GUICtrlCreateButton("  Regenerate ALL  ", 20, 570) ;, 50, 50)

	GUISetState(@SW_SHOW)

	$a = IniReadSection($s_ini, "Color")

	For $x = 1 To 7
		Select
			Case $a[$x][0] = "Empty"
				$y = 1
				$r_what[$y][1] = $a[$x][0]
				$r_what[$y][2] = 0x000080
				$r_what[$y][3] = $a[$x][1]
				$r_what[$y][4] = $a[$x][1]
			Case $a[$x][0] = "Edge"
				$y = 2
				$r_what[$y][1] = $a[$x][0]
				$r_what[$y][2] = 0x989898
				$r_what[$y][3] = $a[$x][1]
				$r_what[$y][4] = $a[$x][1]
			Case $a[$x][0] = "Head"
				$y = 3
				$r_what[$y][1] = $a[$x][0]
				$r_what[$y][2] = 0xFFFF00
				$r_what[$y][3] = $a[$x][1]
				$r_what[$y][4] = $a[$x][1]
			Case $a[$x][0] = "Snake"
				$y = 4
				$r_what[$y][1] = $a[$x][0]
				$r_what[$y][2] = 0xfc8c04
				$r_what[$y][3] = $a[$x][1]
				$r_what[$y][4] = $a[$x][1]
			Case $a[$x][0] = "Food"
				$y = 5
				$r_what[$y][1] = $a[$x][0]
				$r_what[$y][2] = 0x20CC1C
				$r_what[$y][3] = $a[$x][1]
				$r_what[$y][4] = $a[$x][1]
			Case $a[$x][0] = "Dead"
				$y = 6
				$r_what[$y][1] = $a[$x][0]
				$r_what[$y][2] = 0xA42C2C
				$r_what[$y][3] = $a[$x][1]
				$r_what[$y][4] = $a[$x][1]
			Case $a[$x][0] = "Poop"
				$y = 7
				$r_what[$y][1] = $a[$x][0]
				$r_what[$y][2] = 0x9C5404
				$r_what[$y][3] = $a[$x][1]
				$r_what[$y][4] = $a[$x][1]

		EndSelect
	Next

	$Which = 1

	GUICtrlSetState($r_what[$Which][0], $GUI_CHECKED)
	GUICtrlSetBkColor($b_default, $r_what[$Which][2])
	GUICtrlSetBkColor($b_current, $r_what[$Which][3])
	GUICtrlSetBkColor($b_change, $r_what[$Which][4])
	GUICtrlSetData($e_value, Hex($r_what[$Which][4], 6))

	While 1
		Local $nMsg = GUIGetMsg()

		For $x = 1 To 7
			If $r_what[$x][0] = $nMsg Then
				GUICtrlSetState($r_what[$x][0], $GUI_CHECKED)
				$Which = $x
				GUICtrlSetBkColor($b_default, $r_what[$Which][2])
				GUICtrlSetBkColor($b_current, $r_what[$Which][3])
				GUICtrlSetBkColor($b_change, $r_what[$Which][4])
				GUICtrlSetData($e_value, Hex($r_what[$Which][4], 6))
				ContinueLoop 2
			EndIf
		Next

		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $b_default
				$r_what[$Which][4] = $r_what[$Which][2]
				GUICtrlSetBkColor($b_change, $r_what[$Which][2])
				GUICtrlSetData($e_value, Hex($r_what[$Which][2], 6))
			Case $b_current
				$r_what[$Which][4] = $r_what[$Which][3]
				GUICtrlSetBkColor($b_change, $r_what[$Which][3])
				GUICtrlSetData($e_value, Hex($r_what[$Which][3], 6))
			Case $b_change
				$r_what[$Which][4] = _ChooseColor(2, $r_what[$Which][4], 2, $Form1)
				GUICtrlSetBkColor($b_change, $r_what[$Which][4])
				GUICtrlSetData($e_value, Hex($r_what[$Which][4], 6))
			Case $b_save
				$r_what[$Which][3] = $r_what[$Which][4]
				GUICtrlSetBkColor($b_current, $r_what[$Which][3])
				CreateColorJpg($r_what[$Which][1], $r_what[$Which][3])
				If $Which = 1 Or $Which = 2 Then
					$restart = True
				EndIf

			Case $b_all
				Local $hGUI = GUICreate("", 100, 100, -1, -1, $DS_SETFOREGROUND, -1, $Form1)
				GUISetState(@SW_SHOW, $hGUI)
				For $x = 1 To 7

					GUISetBkColor($r_what[$x][3], $hGUI)
					Sleep(500)
					_ScreenCapture_CaptureWnd($g_data & "\" & $r_what[$x][1] & ".jpg", $hGUI, 50, 50, 50 + 25, 50 + 25, False)
					$restart = True
				Next
				GUIDelete($hGUI)
			Case $e_value
				$r_what[$Which][4] = Int("0x" & GUICtrlRead($e_value))
				GUICtrlSetBkColor($b_change, $r_what[$Which][4])
				GUICtrlSetData($e_value, Hex($r_what[$Which][4], 6))

		EndSwitch
	WEnd
	GUIDelete($Form1)
	If $restart Then
		If @Compiled Then
			Run(@ScriptFullPath)
			Exit
		Else
			Pause("Compile it would restart the program")
		EndIf
		Exit
	EndIf
EndFunc   ;==>ChooseColor
#CS INFO
	326605 V11 10/13/2019 1:37:57 PM V10 10/11/2019 3:14:30 PM V9 8/28/2019 11:39:16 AM V8 8/25/2019 6:50:13 PM
#CE

Func WallTrue() ;0.79

	;	$g_dirX, $g_dirY
	Local $a, $flag, $x, $y
	;1 Keep direction
	;2 other side.  Check to see if free
	;Global $g_sx = 40 ;50
	;Global $g_sy = 30 ;40

	$x = $x_new
	$y = $y_new

	Select
		Case $x = 1
			$x = $g_sx
		Case $y = 1
			$y = $g_sy
		Case $x = $g_sx
			$x = 1
		Case $y = $g_sy
			$y = 1
	EndSelect

	$flag = False
	If $Map[$what][$x][$y] = $EMPTY Then
		$flag = True
		Status(2, "Pass threw WALL: Lose 2", 3)
		$g_gChange -= 2
		PrevNext($x, $y)
		RemoveSnakeExtra() ;Same size
	EndIf

	Return $flag

EndFunc   ;==>WallTrue
#CS INFO
	35628 V1 8/21/2019 3:27:01 AM
#CE INFO

Func PoopRemove()
	For $Z = 0 To $s_PoopSize - 1
		If $g_poop[$Z][0] = 2 Then
			If $Map[$what][$g_poop[$Z][1]][$g_poop[$Z][2]] = $POOP Then
				If $g_poop[$Z][3] = 0 Then ;delay = 0
					$g_poop[$Z][0] = 0
					If $Z = 0 Then
						$Map[$what][$g_poop[$Z][1]][$g_poop[$Z][2]] = $FOOD2
						GUICtrlSetImage($Map[$ctrl][$g_poop[$Z][1]][$g_poop[$Z][2]], $cFOOD)
					Else
						$Map[$what][$g_poop[$Z][1]][$g_poop[$Z][2]] = $EMPTY
						GUICtrlSetImage($Map[$ctrl][$g_poop[$Z][1]][$g_poop[$Z][2]], $cEMPTY)
					EndIf
				Else
					$g_poop[$Z][3] -= 1 ;delay
				EndIf
			Else ; Not Poop, clear this point if not snake
				If $Map[$what][$g_poop[$Z][1]][$g_poop[$Z][2]] <> $SNAKE Then
					$g_poop[$Z][0] = 0
				EndIf
			EndIf
		EndIf
	Next
EndFunc   ;==>PoopRemove
#CS INFO
	52416 V3 8/25/2019 6:50:13 PM V2 8/25/2019 9:54:57 AM V1 8/24/2019 6:38:07 PM
#CE INFO

Func PoopAdd($x, $y, $delay = $s_PoopSize / 2)
	For $Z = 0 To $s_PoopSize - 1
		If $g_poop[$Z][0] = 0 Then
			If $Map[$what][$x][$y] <> $POOP Then
				$g_poop[$Z][0] = 1
				$g_poop[$Z][1] = $x
				$g_poop[$Z][2] = $y
				$g_poop[$Z][3] = $delay + Random(0, 5, 1)
				;Status(3, "Add Poop " & $Z, 2)
				Return
			EndIf
		EndIf
	Next
EndFunc   ;==>PoopAdd
#CS INFO
	22331 V4 8/25/2019 6:50:13 PM V3 8/24/2019 6:38:07 PM V2 8/21/2019 10:30:33 PM V1 8/21/2019 10:55:18 AM
#CE INFO

Func PoopShow($x, $y)
	For $Z = 0 To $s_PoopSize - 1
		If $g_poop[$Z][0] = 1 Then
			If $g_poop[$Z][1] = $x And $g_poop[$Z][2] = $y Then
				$g_poop[$Z][0] = 2
				;Status(3, "Show Poop " & $Z, 2)
				$Map[$what][$x][$y] = $POOP
				GUICtrlSetImage($Map[$ctrl][$x][$y], $cPOOP)

				Return False
			EndIf
		EndIf

	Next
	Return True
EndFunc   ;==>PoopShow
#CS INFO
	23549 V4 8/25/2019 6:50:13 PM V3 8/24/2019 6:38:07 PM V2 8/21/2019 10:30:33 PM V1 8/21/2019 10:55:18 AM
#CE INFO

;Check to see if color files exist, if not create them.
Func CheckJpg()

	CheckColorJpg("Snake", 0xfc8c04)
	CheckColorJpg("Edge", 0x989898)
	CheckColorJpg("Empty", 0x000080)
	CheckColorJpg("Head", 0xFFFF00)

	CheckColorJpg("Dead", 0xA42C2C)
	CheckColorJpg("Poop", 0x9C5404)
	CheckColorJpg("Food", 0x20CC1C)

EndFunc   ;==>CheckJpg
#CS INFO
	19837 V5 8/25/2019 6:50:13 PM V4 8/20/2019 5:46:24 PM V3 8/16/2019 8:51:46 AM V2 7/14/2019 10:10:20 PM
#CE INFO

Func Speed()
	Local $last
	Local $GUI, $Input, $x, $loc
	Local $bSlower, $bFaster, $bDefault
	Local $bar[10]
	;Local $nMsg

	$GUI = GUICreate("Test Script", 300, 200)
	GUICtrlCreateLabel("ms/cycle", 125, 25, 80, 25)
	GUICtrlSetFont(-1, 10, 900, 0, "Arial")
	$Input = GUICtrlCreateInput("Input1", 130, 45, 25, 25)
	GUICtrlSetFont(-1, 10, 700, 0, "Arial")

	$bFaster = GUICtrlCreateButton("Faster", 20, 128, 60, 30)
	$bDefault = GUICtrlCreateButton("Default", 120, 128, 60, 30)
	$bSlower = GUICtrlCreateButton("Slower", 220, 128, 60, 30)
	GUISetState(@SW_SHOW)

	$last = $g_TickTime
	$loc = 0

	GUICtrlSetData($Input, $last)
	For $x = 0 To 9
		$bar[$x] = GUICtrlCreatePic($cEMPTY, $x * 30, 80, 30, 30)
	Next
	GUISetState(@SW_SHOW, $GUI)

	$g_hTick = TimerInit()

	While 1
		TickSpeed($last)

		GUICtrlSetImage($bar[$loc], $cEMPTY)
		$loc += 1
		If $loc > 9 Then
			$loc = 0
		EndIf
		GUICtrlSetImage($bar[$loc], $cSNAKE)

		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $bDefault
				$last = 150
				GUICtrlSetData($Input, $last)
			Case $bFaster
				$last -= 10
				GUICtrlSetData($Input, $last)
			Case $bSlower
				$last += 10
				GUICtrlSetData($Input, $last)
			Case $Input
				$last = GUICtrlRead($Input)

		EndSwitch
		Do
		Until GUIGetMsg() = 0

	WEnd
	GUIDelete($GUI)
	If $g_TickTime <> $last Then ;no change skip save
		$g_TickTime = $last
		IniWrite($s_ini, "General", "Speed", $g_TickTime)
	EndIf
EndFunc   ;==>Speed
#CS INFO
	97228 V3 8/28/2019 11:39:16 AM V2 8/26/2019 10:02:39 AM V1 8/22/2019 6:28:51 PM
#CE INFO

Func TickSpeed($speed) ;
	Local $fdiff

	While 1
		$fdiff = TimerDiff($g_hTick)
		If $fdiff > $speed Then
			ExitLoop
		EndIf
	WEnd

	$g_hTick = TimerInit()
EndFunc   ;==>TickSpeed
#CS INFO
	12887 V1 8/22/2019 6:28:51 PM
#CE INFO

Func AdjustValues()
	Local $sComboRead
	Local $Form1_1 = GUICreate("", 601, 153) ; , 991, 302)
	GUICtrlCreateLabel("Adjust Values", 260, 0, 131, 26, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "Arial")
	GUICtrlCreateLabel("+ Some changes will cause the High Scores to be delete.", 124, 32, 398, 22)
	GUICtrlSetFont(-1, 12, 400, 0, "Arial")
	GUICtrlCreateLabel("* Other changes will cause the game to restart", 124, 56, 320, 22)
	GUICtrlSetFont(-1, 12, 400, 0, "Arial")

	Local $Label4 = GUICtrlCreateLabel("Game", 43, 88, 145, 17, $SS_CENTER)
	Local $Label5 = GUICtrlCreateLabel("Normal", 228, 88, 145, 17, $SS_CENTER)
	Local $Label6 = GUICtrlCreateLabel("Extra", 413, 88, 145, 17, $SS_CENTER)

	Local $ComboGame = GUICtrlCreateCombo("Game", 43, 112, 145, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	Local $ComboNormal = GUICtrlCreateCombo("Normal", 228, 112, 145, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	Local $ComboExtra = GUICtrlCreateCombo("Extra", 413, 112, 145, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))

	GUICtrlSetData($ComboGame, "Set Cell Size *+|Item 2|Item 3", "")
	GUICtrlSetData($ComboNormal, "Item 1|Item 2|Item 3", "")
	GUICtrlSetData($ComboExtra, "Item 1|Item 2|Item 3", "")

	GUISetState(@SW_SHOW)

	While 1

		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $ComboGame
				$sComboRead = GUICtrlRead($ComboGame)
				Switch $sComboRead
					Case "Set Cell Size *+"
						SetCellSide()
					Case Else
						MsgBox($MB_SYSTEMMODAL, "", $sComboRead)
				EndSwitch

			Case $ComboNormal
				$sComboRead = GUICtrlRead($ComboNormal)
				MsgBox($MB_SYSTEMMODAL, "", $sComboRead)

			Case $ComboExtra
				$sComboRead = GUICtrlRead($ComboExtra)
				MsgBox($MB_SYSTEMMODAL, "", $sComboRead)

		EndSwitch
	WEnd
	GUIDelete($Form1_1)
EndFunc   ;==>AdjustValues
#CS INFO
	123023 V3 10/8/2019 4:57:52 PM V2 8/30/2019 2:18:51 PM V1 8/28/2019 2:01:59 AM
#CE

Func SetCellSide()
	Pause("SetCellSide")
EndFunc   ;==>SetCellSide
#CS INFO
	5273 V1 10/8/2019 4:57:52 PM
#CE

Func ReplayStart()
	MsgBox(0, "Replay", "Problem: No program code. 10/Oct/2019")
EndFunc   ;==>ReplayStart
#CS INFO
	8129 V1 10/11/2019 3:14:30 PM
#CE

;Check to see it Data is store in one of the two locations. If not ask where to store the data
Func CheckDataLoc()
	Local $progr
	Local $data

	$progr = @ScriptDir
	$data = @AppDataDir & "\SNAKE19-Data"

	;@ScriptDir & "\SNAKE19-Data"
	If FileExists($data & "\snake.ini") = 1 Then
		Return $data
	EndIf

	If FileExists(@ScriptDir & "\SNAKE19-Data\snake.ini") = 1 Then
		Return @ScriptDir & "\SNAKE19-Data"
	EndIf

	;Ask where to store the data
	Local $Form1 = GUICreate("Snake19 - Setup Data", 615, 430, -1, -1, $ws_popup + $ws_caption)
	GUICtrlCreateLabel("Welcome to Snake19 data setup", 0, 24, 610, 28, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
	GUICtrlCreateLabel("Set Data files folder:", 32, 144, 610, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

	Local $ProgLabel = GUICtrlCreateLabel("", 32, 80, 610, 20)
	GUICtrlSetData(-1, "Program file directory: " & $progr)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	Local $Radio1 = GUICtrlCreateRadio("User's Application Ddata folder (recommended for( Win7, Win 8, Win10)", 64, 176, 610, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	Local $Radio2 = GUICtrlCreateRadio("Snake19 folder in Program folder (portability)", 64, 216, 610, 17)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	Local $DataLabel = GUICtrlCreateLabel("", 32, 264, 610, 17)
	GUICtrlSetData(-1, "Data files directory: " & $data)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	Local $DeleteData = GUICtrlCreateLabel("To delete data folder:  Menu, Settings, Change Data", 32, 296, 610, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

	Local $Bgo = GUICtrlCreateButton("Create", 420, 392, 75, 25)
	Local $Bexit = GUICtrlCreateButton("Exit", 520, 392, 75, 25)
	GUICtrlCreateLabel("________________________________________________________________________________________________", 16, 360, 580, 17)
	GUISetState(@SW_SHOW)

	While 1
		Local $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE, $Bexit
				GUIDelete($Form1)
				Return ""
			Case $Radio1
				$data = @AppDataDir & "\SNAKE19-Data"
				GUICtrlSetData($DataLabel, "Data files directory: " & $data)
				GUICtrlSetData($DeleteData, "To delete data folder:  Menu, Settings, Uninstall")
			Case $Radio2
				$data = $progr & "\SNAKE19-Data"
				GUICtrlSetData($DataLabel, "Data files directory: " & $data)
				GUICtrlSetData($DeleteData, "To delete data folder:  Delete " & $data)
			Case $Bgo
				GUIDelete($Form1)
				Return $data
		EndSwitch
	WEnd

EndFunc   ;==>CheckDataLoc
#CS INFO
	172918 V2 10/13/2019 1:37:57 PM V1 10/11/2019 3:14:30 PM
#CE

;This will delete the data files and exit the game
Func DeleteData()
	Local $progr = @ScriptDir
	Local $data = @AppDataDir & "\SNAKE19-Data"

	If FileExists($data & "\snake.ini") = 0 Then
		$data = @ScriptDir & "\SNAKE19-Data"
		If FileExists(@ScriptDir & "\SNAKE19-Data\snake.ini") = 0 Then
			MsgBox(0, "Error", "Data folder missing - Tell programer")
			Exit
		EndIf
	EndIf

	Local $Form1 = GUICreate("Snake19 - Remove Data", 615, 294, -1, -1, $ws_popup + $ws_caption)
	GUICtrlCreateLabel("Thanks for using the Snake19 game", 0, 24, 610, 28, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
	GUICtrlCreateLabel("To delete the program Snake19.exe. Go to the program folder and delete it manually.", 32, 144, 504, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlCreateLabel("This will delete the data files created by the Snake19 game.", 32, 80, 355, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlCreateLabel("________________________________________________________________________________________________", 24, 216, 580, 17)

	Local $Label5 = GUICtrlCreateLabel("Data folder: ", 32, 112, 610, 20)
	GUICtrlSetData(-1, "Data files directory: " & $data)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

	Local $Label6 = GUICtrlCreateLabel("Program folder: ", 32, 184, 610, 20)
	GUICtrlSetData(-1, "Program file directory: " & $progr)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

	Local $Button1 = GUICtrlCreateButton("Delete Data", 416, 248, 75, 25)
	Local $Button2 = GUICtrlCreateButton("Cancel", 520, 248, 75, 25)

	GUISetState(@SW_SHOW)

	While 1
		Local $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE, $Button2
				GUIDelete($Form1)
				Return
			Case $Button1
				FileDelete($s_ini)
				FileDelete($s_scoreini)

				FileDelete($cEDGE)
				FileDelete($cEMPTY)
				FileDelete($cSNAKE)
				FileDelete($cHEAD)
				FileDelete($cFOOD)
				FileDelete($cDEAD)
				FileDelete($cPOOP)
				Exit
		EndSwitch
	WEnd
	GUIDelete($Form1)

	Exit
EndFunc   ;==>DeleteData
#CS INFO
	138770 V1 10/13/2019 1:37:57 PM
#CE

Func About()
	Local $FormAbout = GUICreate("Snake19 - About", 615, 430, -1, -1, $ws_popup + $ws_caption)

	Local $Message = "0.90 12 Oct 2019 Win 7 and up, data in Appdata.  Add start up check, if missing ask box.| Remove data from Appdata: Menu, Settings, Delete Data.  About, Version"

	$Message &= "||0.89 10 Sep 2019 Score 8 not 5 - Remember last game"
	$Message &= "||0.88 28 Aug 2019 Aline Color and Speed, fix Color HEX input"
	$Message &= "|0.87 27 Aug 2019 Adjust Values windows"
	$Message &= "|0.86 Removed"
	$Message &= "|0.85 25 Aug 2019 FOOD2 should act like FOOD, fix Normal lock up"
	$Message &= "|0.84 24 Aug 2019 Changing poop with food"
	$Message &= "|0.83 22 Aug 2019 Speed"
	$Message &= "|0.82 22 Aug 2019 Regenerate Colors"
	$Message &= "|0.81 21 Aug 2019 Extra  Poop better"
	$Message &= "|0.80 21 Aug 2019 Extra Poop back, fix location of food"

	GUICtrlCreateLabel("Welcome to Snake19", 0, 24, 617, 28, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
	GUICtrlCreateLabel("Copyright (C) 2019 -- by Phillip Forrestal", 0, 104, 620, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlCreateLabel("", 0, 80, 618, 20, $SS_CENTER)
	GUICtrlSetData(-1, "Snake 19 -beta but working version " & $ver)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

	GUICtrlCreateLabel("Versions", 24, 136, 70, 24)
	GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")

	GUICtrlCreateList("", 32, 160, 548, 196, BitAND($GUI_SS_DEFAULT_LIST, BitNOT($LBS_SORT)))
	GUICtrlSetData(-1, $Message)

	GUICtrlCreateLabel("________________________________________________________________________________________________", 16, 360, 580, 17)

	Local $Button1 = GUICtrlCreateButton("Click", 270, 392, 75, 25)
	GUISetState(@SW_SHOW)

	While 1
		Local $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button1
				ExitLoop
		EndSwitch
	WEnd

	GUIDelete($FormAbout)
EndFunc   ;==>About
#CS INFO
	132285 V1 10/13/2019 1:37:57 PM
#CE

;Main

Main()

Exit

;~T ScriptFunc.exe V0.54a 15 May 2019 - 10/13/2019 1:37:57 PM
