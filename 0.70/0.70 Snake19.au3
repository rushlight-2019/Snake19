AutoItSetOption("MustDeclareVars", 1)

;If not define then only in script
;Global Static $MESSAGE = True ;Define then DataOut will show in script or compiled
;Global Static $MESSAGE =  False   ;Pause will still work in script  No DataOut

; Must be Declared before _Prf_startup
Global $ver = "0.70 11 Aug 2019 Replay is not right"

; "0.71 12 Aug 2019 Restore 0.65"
Global $ini_ver = "4" ;24 Jul 2019 8 to 10
;"3" ;15 Jul 2019 Timing changes
;"2" ;5 Jul 2019 removed Len and add Max in extra
; "1" start+

;Global $TESTING = False

#include "R:\!Autoit\Blank\_prf_startup.au3"

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=0.0.7.0
#AutoIt3Wrapper_Icon=R:\!Autoit\Ico\prf.ico
#AutoIt3Wrapper_Res_Description=Another snake game
#AutoIt3Wrapper_Res_LegalCopyright=© Phillip Forrestal 2019

;#AutoIt3Wrapper_Outfile=Snake19_32.exe
#AutoIt3Wrapper_Outfile_x64=BETA-Snake19.exe
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

	Remove things I won't do but left in code

	Setting: Size, Speed.

	No more just clean up game.

	Version
	Problem: 0.58 left some testing in just in case  X & Y 3 & 4

	Replay - Normal only -- need to rethink it. - maybe a mode of it own?
	Setting
	Color select
	Size
	Yuck

	0.70 10 Aug 2019 Replay is not right  - Reverting to 0.65  Save this version
	0.69 9 Aug 2019 Replay - Set speed Std, 200ms, 1/2 speed, no tick
	0.68 8 Aug 2019 Replay full speed, no tick
	0.67 8 Aug 2019 Remove Tail, Food
	0.66 8 Aug 2019 More replay work: Start Snake XY, Move snake
	0.65 7 Aug 2019 Replay to Test - works but wrong
	0.64 6 Aug 2019 Add Test game
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

	Start of Game
	$HungerStr  =30
	Goes down 1 of each 100 snake length created.
	$HungerSnake =0
	Lowest is 20

	Start
	$HungerStr  =30
	$HungerSnake=0
	$HungerCycle=$HungerStr
	$HungerCnt = 0

	Each Food
	$HungerCycle=$HungerStr
	$HungerCnt = 0

	Add Snake
	Each Hunger Time off goes up 1  Max value is 10
	$HungerCycle  -1
	$HungerCycle=$HungerStr - $HungerCnt
	$HungerSnake +1
	$HungerSnake  = 100 then
	$HungerStr  -1
	Lowest vaule is 20
	$HungerSnake = 0

	$HungerStr  =30
	$HungerSnake =0
	$HungerCycle=$HungerStr
	$HungerCnt

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

;Static
Static $s_data = @ScriptDir & "\SNAKE19-Data"
Static $s_ini = $s_data & "\snake.ini"
Static $s_scoreini = $s_data & "\score.ini"

Static $WALL = -1
Static $cEDGE = $s_data & "\Edge.jpg"
Static $SNAKE = 1
Static $cSNAKE = $s_data & "\snake.jpg"
Static $EMPTY = 0
Static $cEMPTY = $s_data & "\empty.jpg"
Static $HEAD = 1
Static $cHEAD = $s_data & "\Head.jpg"

Static $FOOD = 2
Static $cFOOD = $s_data & "\Food.jpg"
Static $DEAD = 3
Static $cDEAD = $s_data & "\Dead.jpg"
Static $POOP = 5
Static $cPOOP = $s_data & "\Poop.jpg"

Static $MaxLost = 10 ;   5 to 10

;Global
Global $g_first = True
Global $g_sx = 50
Global $g_sy = 40
Global $g_bx = $g_sx + 2
Global $g_by = $g_sy + 2
Global $g_ctrlBoard = -1

;Map
;Column 1
Static $ctrl = 0 ;	0 = Ctrl
Static $what = 1 ;		1 = What at cell  $SNAKE, $FOOD, $EMPTY
Static $prX = 2 ;	2 = previous X
Static $prY = 3 ;	3 = previous Y
Static $nxX = 4 ;	4 = next X
Static $nxY = 5 ;	5 = next Y
Static $num = 6 ;	6 = snake cell number
Global $Map[7][$g_bx][$g_by]
;$Map[$what][x][y]

Global $g_SnakeCount
Global $x_new
Global $y_new
Global $x_end
Global $y_end

Global $g_foodCnt = 1

Global $g_hTick
Global $g_Tick

Global $g_Size = 16 ; max?20 ;min = 10
Global $g_Font = 24

Global $g_Status[4]
Global $g_StatusText[4]
Global $g_StatusOff = 2

Global $g_aHiScore[12][6] ; data load by INI.  10 =  score,  date, len.food, turns, Max
Global $g_iScore
Global $g_cSetting ;ini

Global $g_GameWhich = -1 ; 0 Normal, 1 Mine(extra), 2 Test
Static $s_GameNormal = 0
Static $s_GameExtra = 1
Static $s_GameTest = 2
If $TESTING Then
	$g_GameWhich = $s_GameTest
Else
	$g_GameWhich = $s_GameExtra
EndIf

Global $g_HiScoreWho ;ctrl
Global $g_HiScore[10]

Global $g_ScoreLen ; Normal Traveled, Extra Length of snake
Global $g_ScoreTurn
Global $g_ScoreFood
Global $g_SnakeMax

Global $g_Status0Off = 1000
Global $g_Status2Off = 1000
Global $g_Status3Off = 1000
; Size can be zero at the begin so once size is > 0 then hunger is active.
Global $g_RemoveBegining = False
Global $g_Mouse = 0

;0.27+
Static $s_bdCycle = 0 ;No active -1, 1 or 0
Static $s_bdX = 1
Static $s_bdY = 2
Static $s_size = 3
Static $M1 = -1
Static $s_delay = 200
Static $s_rand = 50

;Global $g_bdPrev[$s_size] ;Cycle , X, Y Pre 2,3
;Global $g_bdNext[$s_size] ;Cycle , X, Y Nx 4,5

Global $g_bdEnd ;Cycle
$g_bdEnd = $M1

;.31
Global $g_Focus = "Snake19 - " & $ver

;0.32  Taking types out of game loop put into function
Global $g_endgame = False
Global $g_gChange
Global $g_gChangeHalf
Static $s_gChangeBaseExtra = 5
Static $s_gChangeBaseNormal = 10

;Global $g_gHunger
;Global $g_gHungerCnt
;Static $g_gHungerStr = 30

Global $g_turnBonus
Static $g_turnExtraStr = 6
Static $g_turnNormalStr = 3
Global $g_turnNo
Global $g_turnLast
Global $g_dirX
Global $g_dirY

;0.33
Global $g_GameScore = 0

;0.34
Global $g_Health = 100

Global $timing[100]
Global $timingCnt = -0

;0.40
Global $HungerStr = ($g_sx + $g_sy) / 2
Global $HungerSnake = 0
Global $HungerCycle = $HungerStr
Global $HungerCnt = 0

;0.51
Global $g_Ouch = 0 ;Ate Dead snake 2 or 1, 0 no   Set to 2 because b4 next check it goes -1  so at DEAD it will be 1, so it not 2 in a row then -1  next loop = 0

;0.55
Global $g_tc ; move to score

;0.62 Replay  ~~
Global $g_iReplaySz = 6000
Global $g_aReplay[$g_iReplaySz]
Global $g_fReplayRec = False
Global $g_fReplayPlay = False
Global $g_iReplayRecInx = 0
Global $g_iReplayPlyInx = 0

;0.66
Global Static $L_idDown
Global Static $L_idRight
Global Static $L_idLeft
Global Static $L_idUp
Global Static $L_idEsc
Global $NotFirstPass

; Main is call at end
Func Main()
	Local $a

	;Check to see if snake19.ini can be created or exists
	If FileExists($s_ini) = 0 Then ;not exist
		DirCreate($s_data)
		IniWrite($s_ini, "Program", "Version", $ver)
		If FileExists($s_ini) = 0 Then ;not exist
			MsgBox(1, "ERROR", "Can not create data files at " & $s_data)
			Exit
		EndIf
	EndIf
	IniWrite($s_ini, "Program", "Version", $ver)

	If False Then
		pause(@AppDataDir)
		pause()
		pause(@LocalAppDataDir)
		pause(@ProgramsDir)
		pause(@UserProfileDir)
		pause(@StartMenuDir)
		;pause(@DesktopCommonDir)
	EndIf

	CheckJpg()

	;Check Version of INI if wrong version delete Hi Scores
	;because wrong highscore layout will crashed the game.
	$a = IniRead($s_scoreini, "Score", "Version", "x")
	If $a = "x" Then ; old layout or ini missing
		FileDelete($s_scoreini)
		Sleep(500)
		IniWrite($s_scoreini, "Score", "Version", $ini_ver)
	ElseIf $a <> $ini_ver Then
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
	86686 V26 8/2/2019 8:56:18 PM V25 7/14/2019 10:10:20 PM V24 7/14/2019 10:20:53 AM V23 7/13/2019 7:20:00 PM
#CE

Func Game()
	Local $nMsg, $x, $y, $flag
	;Keys acc
	Local $a, $b

	$NotFirstPass = True

	If $g_ctrlBoard = -1 Then

		$b = $g_Font * 2
		SayClearBoard(True)

		$g_ctrlBoard = GUICreate("Snake19 - " & $ver, $g_bx * $g_Size, $g_by * $g_Size + $b + 2)

		MouseMove(0, 0, 0)

		$L_idDown = GUICtrlCreateDummy()
		$L_idRight = GUICtrlCreateDummy()
		$L_idLeft = GUICtrlCreateDummy()
		$L_idUp = GUICtrlCreateDummy()
		$L_idEsc = GUICtrlCreateDummy()
		GUISetState(@SW_SHOW, $g_ctrlBoard)

		For $y = 0 To $g_by - 1
			For $x = 0 To $g_bx - 1
				Select
					Case $x = 0 Or $x = $g_bx - 1 Or $y = 0 Or $y = $g_by - 1
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

		$a = ($g_bx * $g_Size) / 2 ;Half way
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

	If False Then ;$TESTING Then
		Status(1, "  1", 1)
		Sleep(500)
		Status(1, " 2", 2)
		Sleep(500)
		Status(1, " 3", 3)
		Sleep(500)
		Status(1, " 4", 4)
		Sleep(500)
	EndIf
	Status(1, "", 0)
	Status(0, "", 0)
	Status(2, "", 0)
	Status(3, "", 0)

	If $NotFirstPass Then
		ClearBoard() ; Change how create is done not need on fist pass
	EndIf

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
	$HungerStr = ($g_sx + $g_sy) / 2
	$HungerSnake = 0
	$HungerCycle = $HungerStr
	$HungerCnt = 0

	; Size can be zero at the begin so once size is > 0 then hunger is active.
	$g_RemoveBegining = False

	Switch $g_GameWhich
		Case $s_GameExtra
			$g_gChange = 4 ;Start with 5 so snake will not die at start
			$g_turnBonus = $g_turnExtraStr + 1 ; The way it start with 1 turn on start. To fix start with +1

		Case $s_GameNormal
			$g_gChange = 1
			$g_turnBonus = $g_turnNormalStr + 1 ; The way it start with 1 turn on start. To fix start with +1

		Case $s_GameTest
			$g_gChange = 9
			$g_turnBonus = 0 ;$g_turnNormalStr + 1 ; The way it start with 1 turn on start. To fix start with +1

	EndSwitch

	$g_endgame = False

	If $g_fReplayPlay Then
		dataout("+++++++++++++++++++++++++++++ GO TO REPLAY")
		ReplayDo()
	Else
		dataout("+++++++++++++++++++++++NORMAL GAME")
		GameDo()

	EndIf
EndFunc   ;==>Game
#CS INFO
	238879 V4 8/11/2019 10:47:42 PM V3 8/8/2019 11:30:50 PM V2 8/8/2019 4:33:56 PM V1 8/7/2019 11:02:23 PM
#CE

Func ReplayRecData($func, $x = 0, $y = 0)
	;Func ~~
	;1 Start Snake
	;2 Move snake
	;3 Food add
	;4 Add Cell  +-x

	;X, Y

	If $g_fReplayRec Then
		If $g_iReplayRecInx < $g_iReplaySz Then
			dataout("Func: ", $func)
			dataout($x, $y)

			Switch $func
				Case 1, 2, 3
					$g_aReplay[$g_iReplayRecInx] = $func & "|" & $x & "|" & $y
					$g_iReplayRecInx += 1
				Case 4
					$g_aReplay[$g_iReplayRecInx] = $func & "|" & $x
					$g_iReplayRecInx += 1

			EndSwitch

		Else
			$g_fReplayRec = False
		EndIf
	EndIf

EndFunc   ;==>ReplayRecData
#CS INFO
	35404 V3 8/11/2019 10:47:42 PM V2 8/8/2019 11:30:50 PM V1 8/8/2019 4:33:56 PM
#CE

;+++++++++++++++++++++++++++++++++++~~
Func GameDo()
	Local $nMsg
	DataOut("New Game")

	$g_Tick = 150

	;Replay reset game
	$g_fReplayRec = True
	$g_fReplayPlay = False
	$g_iReplayRecInx = 0
	$g_iReplayPlyInx = 0

	StartSnake()
	AddFood(True)
	ReplayRecData(4, $g_gChange) ; Start cell len

	Do
		$nMsg = GUIGetMsg()
	Until $nMsg = 0

	Local $aAccelKey2[][] = [["{RIGHT}", $L_idRight], ["{LEFT}", $L_idLeft], ["{DOWN}", $L_idDown], ["{UP}", $L_idUp], ["{ESC}", $L_idEsc]]
	GUISetAccelerators($aAccelKey2, $g_ctrlBoard)
	MouseMove(0, 0, 0)

	$g_hTick = TimerInit()
	Do ;game Loop
		Tick()
		Local $ReplayMove = -1

		$nMsg = GUIGetMsg()
		If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $L_idEsc Then
			ExitLoop
		EndIf

		;	If $g_fReplayPlay Then
		;		If $g_iReplayPlyInx < $g_iReplaySz Then
		;			Sleep(500)
		;			$nMsg = $g_aReplay[$g_iReplayPlyInx]
		;			$g_iReplayPlyInx += 1
		;		Else
		;			$g_fReplayPlay = False
		;			pause(2)
		;			ExitLoop
		;		EndIf
		;	EndIf

		If $nMsg > 0 Then

			Switch $nMsg

				Case $L_idLeft
					;$ReplayMove = $nMsg
					Do
					Until GUIGetMsg() <> $L_idLeft
					$g_turnNo = 1
					$g_dirX = -1
					$g_dirY = 0

				Case $L_idRight
					;$ReplayMove = $nMsg
					Do
					Until GUIGetMsg() <> $L_idRight
					$g_turnNo = 2
					$g_dirX = 1
					$g_dirY = 0

				Case $L_idUp
					;$ReplayMove = $nMsg
					Do
					Until GUIGetMsg() <> $L_idUp
					$g_turnNo = 3
					$g_dirX = 0
					$g_dirY = -1

				Case $L_idDown
					;$ReplayMove = $nMsg
					Do
					Until GUIGetMsg() <> $L_idDown
					$g_turnNo = 4
					$g_dirX = 0
					$g_dirY = 1

			EndSwitch

			If $g_turnNo <> $g_turnLast Then
				$g_turnLast = $g_turnNo
				$g_ScoreTurn += 1
				$g_turnBonus -= 1
			EndIf

		Else
			Do
			Until GUIGetMsg() = 0
		EndIf
		If $g_dirX = 0 And $g_dirY = 0 Then
			ContinueLoop
		EndIf

		ReplayRecData(2, $g_dirX, $g_dirY)

		Switch $g_GameWhich
			Case $s_GameExtra
				Extra()
			Case $s_GameNormal
				Normal()
			Case $s_GameTest
				TestCycle()
		EndSwitch

	Until $g_endgame

	GUISetAccelerators(1, $g_ctrlBoard) ; Turn off Accelerator
	UpDateHiScore()

	DataOut("Traveled", $g_SnakeCount)
	DataOut($g_iReplayRecInx)
	;_ArrayDisplay($g_aReplay)
	$g_fReplayPlay = False
	$g_fReplayRec = False

EndFunc   ;==>GameDo
#CS INFO
	146500 V47 8/11/2019 10:47:42 PM V46 8/9/2019 3:59:53 PM V45 8/8/2019 11:30:50 PM V44 8/8/2019 4:33:56 PM
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
		DataOut("Tick", $fdiff / 100)
	EndIf

	While 1
		$fdiff = TimerDiff($g_hTick)
		;If $fdiff > 1000 then ;150 Then ;150
		If $fdiff > $g_Tick Then ;150
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
	70205 V15 8/9/2019 3:59:53 PM V14 7/14/2019 10:20:53 AM V13 7/13/2019 7:20:00 PM V12 7/13/2019 3:59:17 PM
#CE

;+++++++++++++++++++++++++++++++++++++++Replay ~~
Func ReplayDo()
	Local $nMsg
	Local $func

	DataOut("Replay Game")
	$g_gChange = 0 ;Func 4 will add to it.

	;Pause("Replay DO")
	Do
		$nMsg = GUIGetMsg()
	Until $nMsg = 0

	;Local $aAccelKey2[][] = [["{RIGHT}", $L_idRight], ["{LEFT}", $L_idLeft], ["{DOWN}", $L_idDown], ["{UP}", $L_idUp], ["{ESC}", $L_idEsc]]
	;GUISetAccelerators($aAccelKey2, $g_ctrlBoard)
	MouseMove(0, 0, 0)

	$g_hTick = TimerInit()
	Do ;Replay Loop
		Local $ReplayMove = -1

		$nMsg = GUIGetMsg()
		If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $L_idEsc Then
			ExitLoop
		EndIf
		dataout($g_aReplay[$g_iReplayPlyInx])
		$func = StringSplit($g_aReplay[$g_iReplayPlyInx], "|")
		;_ArrayDisplay($func)

		$g_iReplayPlyInx += 1
		If $g_iReplayPlyInx >= $g_iReplayRecInx Then
			Sleep(500)

			pause("Replay done")
			$g_fReplayPlay = False
			ExitLoop
		EndIf

		Switch $func[1] ;Func  ~~
			Case 1 ; Add snake
				StartSnakeLoc($func[2], $func[3])
			Case 3 ; Add Food
				MapFood($func[2], $func[3])
				$g_gChangeHalf = $s_gChangeBaseNormal
			Case 4 ; cell
				dataout("Func4 in ", $g_gChange)
				$g_gChange += $func[2]
				dataout("Func4 out ", $g_gChange)
			Case 2 ; Move
				Tick()
				$g_dirX = $func[2]
				$g_dirY = $func[3]

				dataout($x_new, $g_dirX)
				dataout($y_new, $g_dirY)
				dataout("11")
				;---------------
				Switch $Map[$what][$x_new + $g_dirX][$y_new + $g_dirY]
					Case $WALL ;Normal Wall
						;		Status(0, "Ate wall", 1)
						;		$g_endgame = True
						;		Return

					Case $SNAKE ;Normal
						;		Status(0, "Ate self", 1)
						;		$g_endgame = True
						;		Return

					Case $FOOD ;Normal
						;Switch $g_turnBonus
						;	Case 4
						;		$g_gChange += 4
						;		Status(0, "Turn bonus: Snake 4", 4)
						;	Case 3
						;		$g_gChange += 3
						;		$g_iScore += 80
						;		Status(0, "Turn bonus: Snake 3", 4)
						;	Case 2
						;		$g_gChange += 2
						;		$g_iScore += 60
						;		Status(0, "Turn bonus: Snake 2", 4)
						;	Case 1
						;		$g_gChange += 1
						;		Status(0, "Turn bonus: Snake 1", 4)
						;	Case Else
						;		Status(0, "", 0)
						;EndSwitch
						;$g_turnBonus = $g_turnNormalStr
						;$g_gChangeHalf = $s_gChangeBaseNormal

						;Remove Food  NOT needed because  snake will over write with out looking
						$g_ScoreFood += 1 ;Score of pick up a piece of Food.
						;	AddFood()
						PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

					Case $EMPTY ;Normal

						PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
						;
						Select
							Case $g_gChange = 0
								RemoveSnakeTest()

							Case $g_gChange > 0 ; snake get longer don't remove end
								Switch $g_gChangeHalf
									Case 0
										dataout("Change Half 0")
										$g_gChange -= 1
										$g_gChangeHalf = $s_gChangeBaseNormal
									Case Else
										dataout("Change Half", $g_gChangeHalf)
										RemoveSnakeTest() ;Same size
										$g_gChangeHalf -= 1
								EndSwitch

							Case $g_gChange < 0 ; snake get shorter buy removing the end twice
								$g_gChange += 1
								RemoveSnakeTest() ; to keep same size
								RemoveSnakeTest() ;to get one smaller

						EndSelect
				EndSwitch
		EndSwitch

		;---------------

	Until $g_endgame

	;GUISetAccelerators(1, $g_ctrlBoard) ; Turn off Accelerator
	;UpDateHiScore()

	;DataOut($g_iReplayRecInx) ;~~
	;_ArrayDisplay($g_aReplay)
	$g_fReplayPlay = False
	$g_fReplayRec = False

	DataOut("Traveled", "Replay")

EndFunc   ;==>ReplayDo
#CS INFO
	222039 V48 8/11/2019 10:47:42 PM V47 8/9/2019 3:59:53 PM V46 8/9/2019 8:40:50 AM V45 8/8/2019 11:30:50 PM
#CE

;+++++++++++++++++++++++++++++++++++++++TEST~~
Func TestCycle()
	Local $a
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
			;Switch $g_turnBonus
			;	Case 4
			;		$g_gChange += 4
			;		Status(0, "Turn bonus: Snake 4", 4)
			;	Case 3
			;		$g_gChange += 3
			;		$g_iScore += 80
			;		Status(0, "Turn bonus: Snake 3", 4)
			;	Case 2
			;		$g_gChange += 2
			;		$g_iScore += 60
			;		Status(0, "Turn bonus: Snake 2", 4)
			;	Case 1
			;		$g_gChange += 1
			;		Status(0, "Turn bonus: Snake 1", 4)
			;	Case Else
			;		Status(0, "", 0)
			;EndSwitch
			;$g_turnBonus = $g_turnNormalStr
			;$g_gChangeHalf = $s_gChangeBaseNormal

			;Remove Food  NOT needed because  snake will over write with out looking
			$g_ScoreFood += 1 ;Score of pick up a piece of Food.
			AddFood()
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

		Case $EMPTY ;Normal

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

			Select
				Case $g_gChange = 0
					RemoveSnakeTest()

				Case $g_gChange > 0 ; snake get longer don't remove end
					Switch $g_gChangeHalf
						Case 0
							$g_gChange -= 1
							$g_gChangeHalf = $s_gChangeBaseNormal
						Case Else
							RemoveSnakeTest() ;Same size
							$g_gChangeHalf -= 1
					EndSwitch

				Case $g_gChange < 0 ; snake get shorter buy removing the end twice
					$g_gChange += 1
					RemoveSnakeTest() ; to keep same size
					RemoveSnakeTest() ;to get one smaller

			EndSelect
	EndSwitch

	$a = $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1
	If $a > $g_SnakeMax Then
		$g_SnakeMax = $a
	EndIf

	If $LS_SnakeLenLast <> $a Then
		$LS_SnakeLenLast = $a
		$g_GameScore = $g_iScore + $g_ScoreFood + $g_SnakeMax

		Status(1, StringFormat("Lenght: %4u, Max: %4u, Score: %6u,   ms/cyc %u", $a, $g_SnakeMax, $g_GameScore, $g_tc), 2)

	EndIf

EndFunc   ;==>TestCycle
#CS INFO
	135379 V10 8/11/2019 10:47:42 PM V9 8/7/2019 11:02:23 PM V8 7/18/2019 11:32:28 PM V7 7/15/2019 9:15:04 AM
#CE

Func RemoveSnakeTest() ; at end
	Local $x, $y

	$x = $x_end
	$y = $y_end
	If $TESTING Then
		If $x = 0 Or $y = 0 Then

			Pause("Null X & Y 4:", $Map[$what][0][0])
			Pause($x, $y)

		EndIf
	EndIf

	$Map[$what][$x][$y] = $EMPTY
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)

	$x_end = $Map[$nxX][$x][$y]
	$y_end = $Map[$nxY][$x][$y]

EndFunc   ;==>RemoveSnakeTest
#CS INFO
	24866 V11 8/7/2019 11:02:23 PM V10 7/13/2019 3:59:17 PM V9 6/24/2019 11:22:57 PM V8 6/22/2019 7:09:09 PM
#CE

;++++++++++++++++++++++++++++++++++++++++++++++EXTRA
; $g_iscore is extra + length
Func Extra()
	Local $a
	Local Static $LS_SnakeLenLast
	Local $flag

	If $g_Ouch > 0 Then
		DataOut("OUCH", $g_Ouch)
		$g_Ouch -= 1
	EndIf

	;EXTRA
	Switch $Map[$what][$x_new + $g_dirX][$y_new + $g_dirY]
		Case $DEAD
			DataOut("OUCH", $g_Ouch)
			If $g_Ouch > 0 Then
				$flag = DoubleBackWall()
				If $flag Then
					DataOut("Double back DEAD")
					Status(2, "Double back DEAD", 3)

				Else
					Status(0, "Ate too much dead snake or poop", 1)
					$g_endgame = True
					Return
				EndIf

			EndIf

			Status(3, "Ate DEAD snake Yuck! Lost " & $MaxLost & " cells of snake", 1)
			;Status(2, "Lost 10 Snake cells. Lost 100 points.", 1)
			$g_gChange -= $MaxLost

			$Map[$what][$x_new + $g_dirX][$y_new + $g_dirY] = $EMPTY
			$g_Ouch = 2
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

		Case $POOP
			Status(3, "Ate  snake POOP - Yuck! Lost " & $MaxLost & " cells of snake", 1)
			;Status(2, "Lost 10 Snake cells. Lost 100 points.", 1)
			$g_gChange -= $MaxLost

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			;			$Map[$what][$x_new + $g_dirX][$y_new + $g_dirY] = $EMPTY

		Case $WALL
			DataOut("WALL")

			; Check  prev to be the same  last location
			DataOut("Eat wall Double back on self")

			$flag = DoubleBackWall()
			If $flag Then
				DataOut("Double back WALL")
				Status(2, "Double back WALL", 3)
				;$g_gChange -= 2

			Else
				Status(0, "Ate Wall", 1)
				$g_endgame = True
				Return
			EndIf
			;				EndIf

		Case $SNAKE

			; Check  prev to be the same  last location
			If $Map[$prX][$x_new][$y_new] = $x_new + $g_dirX And $Map[$prY][$x_new][$y_new] = $y_new + $g_dirY Then ; Double back
				DataOut("Eat me Double back on self")
				$flag = DoubleBack($g_dirX, $g_dirY)
				If $flag Then
					Status(2, "Double back on self", 3)
					;	$g_gChange -= 2
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

				;ShowRow($x_new, $y_new)
				;ShowRow($x_new + $g_dirX, $y_new + $g_dirY)

				;	Status(0, "Ate self", 1)
				;	ExitLoop
			EndIf

		Case $FOOD
			$g_ScoreFood += 1

			$HungerCycle = $HungerStr
			$HungerCnt = 0
			$g_gChange += 2

			Switch $g_turnBonus
				Case 6, 5, 4
					$g_gChange += 3
					$g_iScore += 100
					Status(0, "Turn bonus 100 Snake 3", 4)
				Case 3
					$g_gChange += 2
					$g_iScore += 80
					Status(0, "Turn bonus 80 Snake 2", 4)
				Case 2
					$g_gChange += 2
					$g_iScore += 60
					Status(0, "Turn bonus 60 Snake 2", 4)
				Case 1
					$g_gChange += 1
					$g_iScore += 30
					Status(0, "Turn bonus 30 Snake 1", 4)
				Case 0
					$g_iScore += 10
					Status(0, "Turn bonus 10", 4)
				Case Else
					Status(0, "", 0)
			EndSwitch

			$g_turnBonus = $g_turnExtraStr

			;RemoveFood()  NOT needed because  snake will over write with out looking
			AddFood()
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			RemoveSnakeExtra() ;onlhy empty cell change len

		Case $EMPTY

			;	Each Hunger Time off goes up 1 Max value is 10
			$HungerSnake += 1
			If $HungerSnake = 100 Then
				$HungerStr -= 1
				$HungerSnake = 0
				If $HungerStr < 20 Then
					$HungerStr = 20
				EndIf
			EndIf

			$HungerCycle -= 1
			If $HungerCycle = 0 Then
				$HungerCnt += 1
				If $HungerCnt > 5 Then
					$HungerCnt = 5
				EndIf
				$HungerCycle = $HungerStr - $HungerCnt

				Status(2, "Hungery - " & $HungerCnt & " Snake shorter", 3)
				;$g_Status0Off = 30

				$g_gChange -= $HungerCnt

			EndIf

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
	328802 V27 8/9/2019 8:40:50 AM V26 8/2/2019 8:56:18 PM V25 7/24/2019 12:53:35 PM V24 7/23/2019 9:33:59 AM
#CE

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
			Switch $g_turnBonus
				Case 4
					$g_gChange += 4
					ReplayRecData(4, 4)
					Status(0, "Turn bonus: Snake 4", 4)
				Case 3
					$g_gChange += 3
					ReplayRecData(4, 3)
					$g_iScore += 80
					Status(0, "Turn bonus: Snake 3", 4)
				Case 2
					$g_gChange += 2
					ReplayRecData(4, 2)
					$g_iScore += 60
					Status(0, "Turn bonus: Snake 2", 4)
				Case 1
					$g_gChange += 1
					ReplayRecData(4, 1)
					Status(0, "Turn bonus: Snake 1", 4)
				Case Else
					Status(0, "", 0)
			EndSwitch
			$g_turnBonus = $g_turnNormalStr
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
	116466 V9 8/11/2019 10:47:42 PM V8 7/18/2019 11:32:28 PM V7 7/15/2019 9:15:04 AM V6 7/13/2019 7:36:11 PM
#CE

Func StartDead($inX, $inY)
	Local $x, $y

	;Global $g_bdPrev[4] ;Cycle, CycleStr , X, Y Pre 2,3
	;Global $g_bdNext[4] ;Cycle, CycleStr , X, Y Nx 4,5
	;Global $g_bdEnd[4] ;Cycle, CycleStr,  X, Y

	;.0.28 Do First
	; Here to old tail
	;Check to see if active, if Active snake dies because it ate itself twice.  Return False
	;If $g_bdPrev[$s_bdCycle] <> -1 Then
	;	Return False
	;EndIf

	;Blood start with previous cross location so Zero out next location  And this location RED
	$x = $Map[$prX][$inX][$inY]
	$y = $Map[$prY][$inX][$inY]

	;clear nx
	$Map[$nxX][$x][$y] = 0
	$Map[$nxY][$x][$y] = 0

	ConvDead($x, $y)

	;	$Map[$what][$x][$y] = $DEAD
	;	GUICtrlSetImage($Map[$ctrl][$x][$y], $cDEAD)

	;-----------------------------end prev
	;-------------------------start old tail
	;This one will be the new end.  The old end will be bdStart2

	$x = $x_end
	$y = $y_end
	;ShowRow($x, $y)

	;Clear prv   Not sure I need to do this
	$Map[$prX][$x][$y] = 0
	$Map[$prY][$x][$y] = 0

	;Add blood to old tail
	Status(3, "Ate Live snake OUCH OUCH", 1)
	;ConvDead($x, $y, True)

	;	$Map[$what][$x][$y] = $DEAD
	;	GUICtrlSetImage($Map[$ctrl][$x][$y], $cDEAD)

	;--------------------end old tail

	;	ShowRow($x, $y)
	;	pause()

	;	ShowRow($x, $y)

	;$g_bdEnd[$s_bdX] = $x ;
	;$g_bdEnd[$s_bdY] = $y

	;pause()

	;Blood 2nd with next cross location so Zero out prv location  And this location RED
	;This one will be the new end.  The old end will be bdStart2
	$x = $Map[$nxX][$inX][$inY]
	$y = $Map[$nxY][$inX][$inY]

	$Map[$prX][$x][$y] = 0
	$Map[$prY][$x][$y] = 0

	;$Map[$what][$x][$y] = $DEAD
	;GUICtrlSetImage($Map[$ctrl][$x][$y], $cDEAD)

	;ShowRow($x, $y)
	$x_end = $x
	$y_end = $y

	Return True
EndFunc   ;==>StartDead
#CS INFO
	122037 V13 8/2/2019 8:56:18 PM V12 7/18/2019 11:32:28 PM V11 7/14/2019 10:20:53 AM V10 7/13/2019 7:20:00 PM
#CE

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
			DataOut("ConvDead from End")
			$x = $Map[$nxX][$tx][$ty]
			$y = $Map[$nxY][$tx][$ty]
		Else
			$x = $Map[$prX][$tx][$ty]
			$y = $Map[$prY][$tx][$ty]
		EndIf

	WEnd

EndFunc   ;==>ConvDead
#CS INFO
	36891 V5 7/9/2019 1:03:14 AM V4 7/6/2019 6:24:29 PM V3 7/5/2019 4:03:49 PM V2 7/3/2019 6:50:03 PM
#CE

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
#CE

Func Status($status, $string, $color)
	Local $c
	;DataOut($status, $string)

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
		Case 4 ;pale green
			$c = 0x90EE90
		Case 3
			$c = 0xffff00

	EndSwitch
	GUICtrlSetBkColor($g_Status[$status], $c)
	GUICtrlSetBkColor($g_StatusText[$status], $c)
EndFunc   ;==>Status
#CS INFO
	40276 V8 7/14/2019 10:20:53 AM V7 7/13/2019 3:59:17 PM V6 7/9/2019 1:03:14 AM V5 6/9/2019 5:40:22 PM
#CE

Func StartSnake()
	Local $x, $y

	$x = Int(Random(5, $g_sx - 5))
	$y = Int(Random(5, $g_sy - 5))

	ReplayRecData(1, $x, $y)

	StartSnakeLoc($x, $y)
EndFunc   ;==>StartSnake
#CS INFO
	11755 V1 8/8/2019 4:33:56 PM
#CE

Func StartSnakeLoc($x, $y)
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

EndFunc   ;==>StartSnakeLoc
#CS INFO
	29630 V6 8/8/2019 4:33:56 PM V5 6/22/2019 7:09:09 PM V4 6/6/2019 11:09:42 PM V3 6/3/2019 8:05:25 PM
#CE

; Dirx& Diry moving to wall not like Double Back which has reserves direction
; So they will change, I can't make them Global because I used this name as Local in a number of Function.
Func DoubleBackWall() ;(ByRef $dirx, ByRef $diry) ;
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
		EndIf

	EndIf
	Return $flag

EndFunc   ;==>DoubleBackWall
#CS INFO
	65243 V6 7/5/2019 4:03:49 PM V5 7/4/2019 11:42:05 AM V4 6/27/2019 5:39:48 PM V3 6/27/2019 1:22:34 AM
#CE

Func DoubleBack($dirx, $diry)
	Local $a, $flag
	;new+dir  is one back.
	; Find which X or Y which is the same, then random _+ one on there
	;DataOut($dirx, $diry)
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
		EndIf

	EndIf
	Return $flag

EndFunc   ;==>DoubleBack
#CS INFO
	54295 V2 6/20/2019 9:30:52 PM V1 6/9/2019 1:07:49 PM
#CE

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
	;	DataOut($x_prv, $y_prv)
	$g_SnakeCount += 1
	$Map[$num][$x_new][$y_new] = $g_SnakeCount

	$Map[$what][$x_new][$y_new] = $SNAKE
	GUICtrlSetImage($Map[$ctrl][$x_new][$y_new], $cHEAD)
	;DataOut($x_new, $y_new)

EndFunc   ;==>PrevNext
#CS INFO
	43571 V6 7/13/2019 3:59:17 PM V5 7/9/2019 1:03:14 AM V4 6/22/2019 7:09:09 PM V3 6/3/2019 8:05:25 PM
#CE

Func RemoveSnakeExtra($inputflag = False) ; at end
	Local $x, $y, $flag
	Local Static $PoopCnt = 25
	; Size can be zero at the begin so once size is > 0 then hunger is active.
	;Global $g_RemoveBegining = False

	$x = $x_end
	$y = $y_end

	$flag = False
	If $inputflag Then
		$PoopCnt -= 1
		If $PoopCnt = 0 Then
			$PoopCnt = Random(20, 40, 1)
			$flag = True
		EndIf
	EndIf

	If $flag Then
		$Map[$what][$x][$y] = $POOP
		GUICtrlSetImage($Map[$ctrl][$x][$y], $cPOOP)
	Else
		If NormalPoop() Then
			$Map[$what][$x][$y] = $POOP
			GUICtrlSetImage($Map[$ctrl][$x][$y], $cPOOP)
		Else
			If $TESTING Then
				If $x = 0 Or $y = 0 Then

					Pause("Null X & Y 3:", $Map[$what][0][0])
					Pause($x, $y)

				EndIf
			EndIf

			$Map[$what][$x][$y] = $EMPTY
			GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)
		EndIf
	EndIf

	$x_end = $Map[$nxX][$x][$y]
	$y_end = $Map[$nxY][$x][$y]

	;$Map[$prX][$x_end][$y_end] = 0
	;$Map[$prY][$x_end][$y_end] = 0

	;$Map[$nxX][$x_end][$y_end] = 0
	;$Map[$nxY][$x_end][$y_end] = 0

	; Size can be zero at the begin so once size is > 0 then hunger is active.
	;Global $g_RemoveBegining = False

	If $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] = 0 Then
		If $g_RemoveBegining Then
			Status(3, "Died of hunger:", 1)
			Return True
		EndIf
		Return False
	EndIf
	$g_RemoveBegining = True
	Return False

EndFunc   ;==>RemoveSnakeExtra
#CS INFO
	97481 V19 8/9/2019 3:59:53 PM V18 7/13/2019 7:20:00 PM V17 7/13/2019 3:59:17 PM V16 7/8/2019 1:00:13 AM
#CE

Func RemoveSnakeNormal() ; at end
	Local $x, $y

	$x = $x_end
	$y = $y_end
	If $TESTING Then
		If $x = 0 Or $y = 0 Then

			Pause("Null X & Y 4:", $Map[$what][0][0])
			Pause($x, $y)

		EndIf
	EndIf

	$Map[$what][$x][$y] = $EMPTY
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)

	$x_end = $Map[$nxX][$x][$y]
	$y_end = $Map[$nxY][$x][$y]

EndFunc   ;==>RemoveSnakeNormal
#CS INFO
	25268 V10 7/13/2019 3:59:17 PM V9 6/24/2019 11:22:57 PM V8 6/22/2019 7:09:09 PM V7 6/6/2019 11:09:42 PM
#CE

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

		Local $area = 10
		Local $len, $x1, $y1, $mid, $len2

		$len = ($Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end])
		If $len < $area Then
			$len = $area
		EndIf
		$len2 = $len / 2
		If $len > $g_sx - 2 Then
			$x = $g_sx - 1
			$x1 = 2
		Else
			$mid = Int($g_sx / 2)
			$x = $mid + $len2
			$x1 = $mid - $len2
		EndIf

		If $len > $g_sy - 2 Then
			$y = $g_sy - 1
			$y1 = 2
		Else
			$mid = Int($g_sy / 2)
			$y = $mid + $len2
			$y1 = $mid - $len2
		EndIf

		Do
			$x = Int(Random($x1, $x))
			$y = Int(Random($y1, $y))
		Until $Map[$what][$x][$y] = $EMPTY
	Else
		Do
			$x = Int(Random(1, $g_sx))
			$y = Int(Random(1, $g_sy))
		Until $Map[$what][$x][$y] = $EMPTY
	EndIf
	ReplayRecData(3, $x, $y)
	MapFood($x, $y)

EndFunc   ;==>AddFood
#CS INFO
	71982 V1 8/8/2019 11:30:50 PM
#CE

Func MapFood($x, $y)

	$Map[$what][$x][$y] = $FOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cFOOD)

EndFunc   ;==>MapFood
#CS INFO
	8793 V11 8/8/2019 11:30:50 PM V10 6/28/2019 7:37:37 PM V9 6/24/2019 11:22:57 PM V8 6/22/2019 7:09:09 PM
#CE

Func ClearBoard()
	Local $var, $NotEmpty

	SayClearBoard(True, False)

	For $y = 0 To $g_by - 1
		For $x = 0 To $g_bx - 1
			Select
				Case $x = 0 Or $x = $g_bx - 1 Or $y = 0 Or $y = $g_by - 1
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
	36469 V15 7/13/2019 3:59:17 PM V14 7/8/2019 1:00:13 AM V13 7/6/2019 6:24:29 PM V12 7/5/2019 4:03:49 PM
#CE

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
#CE

Func SwapGame($b_replay)

	Switch $g_GameWhich
		Case $s_GameNormal
			GUICtrlSetState($b_replay, $GUI_HIDE)

		Case $s_GameExtra
			GUICtrlSetState($b_replay, $GUI_HIDE)

		Case $s_GameTest
			;			If $g_iReplayRecInx > 0 Then
			;				GUICtrlSetState($b_replay, $GUI_SHOW)
			;			Else
			;				GUICtrlSetState($b_replay, $GUI_HIDE)
			;			EndIf

	EndSwitch

	If $g_iReplayRecInx > 0 Then
		GUICtrlSetState($b_replay, $GUI_SHOW)
	Else
		GUICtrlSetState($b_replay, $GUI_HIDE)
	EndIf

	ReadHiScore()
	DisplayHiScore()
EndFunc   ;==>SwapGame
#CS INFO
	38797 V5 8/9/2019 3:59:53 PM V4 8/8/2019 11:30:50 PM V3 8/7/2019 11:02:23 PM V2 8/2/2019 8:56:18 PM
#CE

Func DisplayHiScore()
	Local $s
	Switch $g_GameWhich

		Case $s_GameNormal
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
		Case $s_GameExtra
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
		Case $s_GameTest
			GUICtrlSetData($g_HiScoreWho, "High Score - TEST")
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
	EndSwitch

EndFunc   ;==>DisplayHiScore
#CS INFO
	159792 V8 8/7/2019 11:02:23 PM V7 7/24/2019 11:20:48 PM V6 7/24/2019 12:53:35 PM V5 7/15/2019 9:15:04 AM
#CE

Func UpDateHiScore()
	Local $Form1

	If $g_aHiScore[10][0] < $g_GameScore Then
		$Form1 = GUICreate("", 250, 100, -1, -1, $WS_DLGFRAME, BitOR($WS_EX_TOPMOST, $WS_EX_STATICEDGE))
		GUICtrlCreateLabel("New High Score: " & $g_GameScore, 25, 30, 200, 25)
		GUICtrlSetFont(-1, 12, 400, 0, "Arial")
		GUISetState(@SW_SHOW)

		$g_aHiScore[11][0] = $g_GameScore
		$g_aHiScore[11][1] = _Now()
		Switch $g_GameWhich
			Case $s_GameNormal
				$g_aHiScore[11][2] = $g_SnakeCount
			Case $s_GameExtra
				$g_aHiScore[11][2] = $g_SnakeMax
			Case $s_GameTest
				$g_aHiScore[11][2] = $g_SnakeMax
		EndSwitch

		$g_aHiScore[11][3] = $g_ScoreFood
		$g_aHiScore[11][4] = $g_ScoreTurn

		_ArraySort($g_aHiScore, 1, 1, 11)
		SaveHiScore()

	ElseIf $g_GameScore > 0 Then
		$Form1 = GUICreate("", 250, 100, -1, -1, $WS_DLGFRAME, BitOR($WS_EX_TOPMOST, $WS_EX_STATICEDGE))
		GUICtrlCreateLabel("Score: " & $g_GameScore, 25, 30, 200, 25)
		GUICtrlSetFont(-1, 12, 400, 0, "Arial")
		GUISetState(@SW_SHOW)
	EndIf

	$g_GameScore = 0
	Sleep(5000)
	GUIDelete($Form1)

EndFunc   ;==>UpDateHiScore
#CS INFO
	73421 V16 8/9/2019 3:59:53 PM V15 8/7/2019 11:02:23 PM V14 7/24/2019 11:20:48 PM V13 7/18/2019 11:32:28 PM
#CE

Func SaveHiScore()
	Local $x, $a[12][2]

	For $x = 1 To 10
		$a[$x][0] = String($x)
		$a[$x][1] = $g_aHiScore[$x][0] & "|" & $g_aHiScore[$x][1] & "|" & $g_aHiScore[$x][2] & "|" & $g_aHiScore[$x][3] & "|" & $g_aHiScore[$x][4] & "|" & $g_aHiScore[$x][5]
	Next
	$a[0][0] = 10
	Switch $g_GameWhich
		Case $s_GameNormal
			$x = IniWriteSection($s_scoreini, "HighScoreNormal", $a)
		Case $s_GameExtra
			$x = IniWriteSection($s_scoreini, "HighScoreExtra", $a)
		Case $s_GameTest
			$x = IniWriteSection($s_scoreini, "HighScoreTest", $a)
	EndSwitch

EndFunc   ;==>SaveHiScore
#CS INFO
	41326 V7 8/7/2019 11:02:23 PM V6 7/24/2019 11:20:48 PM V5 7/13/2019 7:20:00 PM V4 6/16/2019 10:16:04 AM
#CE

Func IniHighFive()
	Local $a, $c, $Z, $keep

	$keep = $g_GameWhich

	For $x = 0 To 1
		$g_GameWhich = $x
		Switch $g_GameWhich
			Case $s_GameNormal
				$a = IniReadSection($s_scoreini, "HighScoreNormal")
			Case $s_GameExtra
				$a = IniReadSection($s_scoreini, "HighScoreExtra")
			Case $s_GameTest
				$a = IniReadSection($s_scoreini, "HighScoreTest")
		EndSwitch

		If @error = 0 Then

			For $i = 1 To 10
				If $i > 5 Then
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
	$g_GameWhich = $keep
EndFunc   ;==>IniHighFive
#CS INFO
	64107 V4 8/7/2019 11:02:23 PM V3 7/24/2019 11:20:48 PM V2 7/13/2019 7:20:00 PM V1 6/28/2019 7:37:37 PM
#CE

Func ReadHiScore()
	Local $a, $c, $Z
	Switch $g_GameWhich
		Case $s_GameNormal
			$a = IniReadSection($s_scoreini, "HighScoreNormal")
		Case $s_GameExtra
			$a = IniReadSection($s_scoreini, "HighScoreExtra")
		Case $s_GameTest
			$a = IniReadSection($s_scoreini, "HighScoreTest")
	EndSwitch
	If @error = 0 Then

		For $i = 1 To 10
			If $g_first And $i > 5 Then
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
	78049 V7 8/7/2019 11:02:23 PM V6 7/24/2019 11:20:48 PM V5 7/13/2019 7:20:00 PM V4 6/16/2019 10:16:04 AM
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
#CE

Func CheckJpg()
	Local $hGUI
	$hGUI = GUICreate("", 100, 100)

	CheckColorJpg("Snake", 0xfc8c04, $hGUI)
	CheckColorJpg("Edge", 0x989898, $hGUI)
	CheckColorJpg("Empty", 0x000000, $hGUI)
	CheckColorJpg("Head", 0xFFFFFF, $hGUI)

	CheckColorJpg("Dead", 0xA42C2C, $hGUI)
	CheckColorJpg("Poop", 0x9C5404, $hGUI)
	CheckColorJpg("Food", 0x20CC1C, $hGUI)

	GUIDelete($hGUI)
EndFunc   ;==>CheckJpg
#CS INFO
	26680 V2 7/14/2019 10:10:20 PM V1 7/14/2019 10:20:53 AM
#CE

Func CheckColorJpg($filename, $color, $hform) ; $color is only the default color if INI color then use it.
	Local $sum

	If FileExists($s_data & "\" & $filename & ".jpg") = 0 Then ;Not found
		CreateColorJpg($filename, $color, $hform)
		Return
	EndIf

	If IniRead($s_ini, "Color", $filename, "X") = "X" Then ;COLOR in INI does not exist use $color
		CreateColorJpg($filename, $color, $hform)
		Return
	EndIf

	$color = IniRead($s_ini, "Color", $filename, "X") ;use COLOR in INI if create pass here.
	$sum = Int(IniRead($s_ini, "Sum", $filename, 0))

	If $sum = Sum($filename) Then ;same exit
		Return
	EndIf
	; Sum not equal recreate.
	CreateColorJpg($filename, $color, $hform)

EndFunc   ;==>CheckColorJpg
#CS INFO
	53308 V2 7/14/2019 10:10:20 PM V1 7/14/2019 10:20:53 AM
#CE

Func CreateColorJpg($filename, $color, $hform)
	Local $sum, $a
	Local $handle, $err
	Local $tRECT
	GUISetState(@SW_SHOW, $hform)

	; create, sumchk, store in ini Color Filename
	GUISetBkColor($color, $hform)
	Sleep(250)
	_ScreenCapture_CaptureWnd($s_data & "\" & $filename & ".jpg", $hform, 30, 30, 30 + 25, 30 + 25, False)
	If @error <> 0 Then ;Failed
		MsgBox(0, "ERROR", "Color Jpg could not be created " & $filename)
		Exit
	EndIf

	$sum = Sum($filename)

	IniWrite($s_ini, "Color", $filename, "0x" & Hex($color, 6))
	IniWrite($s_ini, "Sum", $filename, $sum)

EndFunc   ;==>CreateColorJpg
#CS INFO
	43159 V2 7/14/2019 10:10:20 PM V1 7/14/2019 10:20:53 AM
#CE

Func Sum($filename)
	Local $handle, $sum, $a, $err

	$handle = FileOpen($s_data & "\" & $filename & ".jpg", $FO_BINARY)
	If $handle = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
		Exit
	EndIf
	$sum = 0

	$a = FileRead($handle, 1)
	$err = @extended
	While @extended = 1
		$sum += Number($a, 1)
		$a = FileRead($handle, 1)
		$err = @extended

	WEnd
	FileClose($handle)
	Return $sum
EndFunc   ;==>Sum
#CS INFO
	30111 V1 7/14/2019 10:20:53 AM
#CE

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Func StartForm()
	Local $Form1, $Group1
	Global $Radio1, $Radio2, $Radio3

	Local $Checkbox1, $b_start, $b_replay, $b_setting
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
	$Radio1 = GUICtrlCreateRadio("Normal", $a, $b + 20, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$Radio2 = GUICtrlCreateRadio("Extra", $a, $b + 40, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$Radio3 = GUICtrlCreateRadio("Test", $a, $b, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	$b += 60

	$g_HiScoreWho = GUICtrlCreateLabel("High Score - Extra", $a, $b, $c + 30, 24) ; Height is twice font size
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$a = 50
	$b += 20

	For $x = 0 To 9
		$g_HiScore[$x] = GUICtrlCreateLabel(String($x + 1), $a, $b, 500, 24) ; Height is twice font size
		GUICtrlSetFont($g_HiScore[$x], 10, 400, 0, "Arial")
		$b += 20
	Next
	DataOut("$B", $b)

	Local $b_info

	$b_info = GUICtrlCreateButton($ver, 50, $b, 100, 25)

	$b_setting = GUICtrlCreateButton("Setting", 100, 550, 75, 35)
	$b_replay = GUICtrlCreateButton("Replay", 400, 550, 75, 35)
	$b_start = GUICtrlCreateButton("GO", 270, 550, 100, 35)
	$Checkbox1 = GUICtrlCreateCheckbox("Testing", 1, 555)

	;	Local $Edit1 = GUICtrlCreateEdit("", 20, $b, 550, 230, $ES_READONLY)
	;	GUICtrlSetFont($Edit1, 10, 400, 0, "Arial")
	;	GUICtrlSetData($Edit1, "Press ESC to quit." & @CRLF, 1)
	;	GUICtrlSetData($Edit1, @CRLF, 1)
	;	GUICtrlSetData($Edit1, "If you lose Focus the game will PAUSE" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, @CRLF, 1)

	;	GUICtrlSetData($Edit1, "Normal" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, "  Food increase Snake by 1.  Score +1 per food pickup.  There is a bonus." & @CRLF, 1)
	;	GUICtrlSetData($Edit1, @CRLF, 1)

	;	GUICtrlSetData($Edit1, "Extra:" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, "  Food increase snake by 2" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, @CRLF, 1)
	;	GUICtrlSetData($Edit1, "Bonus:" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, " Snake does not like to turn so, so few turns and Food increase snake & score" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, " Snake can 'double back' on self or wall, most of the times." & @CRLF, 1)
	;	GUICtrlSetData($Edit1, " Snake does not like to travel far for next meal. Snake does get shorter", 1)

	GUISetState(@SW_SHOW)

	Switch $g_GameWhich
		Case $s_GameNormal
			GUICtrlSetState($Radio1, $GUI_CHECKED)
		Case $s_GameExtra
			GUICtrlSetState($Radio2, $GUI_CHECKED)
		Case $s_GameTest
			GUICtrlSetState($Radio3, $GUI_CHECKED)
	EndSwitch

	SwapGame($b_replay)

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

			Case $b_start
				$g_Mouse = MouseGetPos()
				GUIDelete($Form1)
				Return False

			Case $b_replay
				GUIDelete($Form1)
				$g_fReplayPlay = True
				$g_iReplayPlyInx = 0

				Local $FormReplay = GUICreate("Replay Speed", 600, 200, -1, -1)
				GUICtrlCreateLabel("Replay - still has problems.  --- Works: Start, Move, Food", 40, 40)
				Local $b_rpStd = GUICtrlCreateButton("Std 150ms", 40, 150, 100, 40)
				Local $b_rp200 = GUICtrlCreateButton("200ms", 180, 150, 100, 40)
				Local $b_rp100 = GUICtrlCreateButton("100ms", 300, 150, 100, 40)
				Local $b_rpfull = GUICtrlCreateButton("Full", 420, 150, 100, 40)
				GUISetState(@SW_SHOW)

				$g_Tick = 150
				While 1
					$nMsg = GUIGetMsg()
					Switch $nMsg
						Case $GUI_EVENT_CLOSE
							ExitLoop
						Case $b_rpStd
							$g_Tick = 150
							ExitLoop
						Case $b_rp200
							$g_Tick = 200
							ExitLoop
						Case $b_rp100
							$g_Tick = 100
							ExitLoop
						Case $b_rpfull
							$g_Tick = 0
							ExitLoop

					EndSwitch
				WEnd
				GUIDelete($FormReplay)

				Return False

			Case $b_setting
				$TESTING = True
				Pause("Setting - still has problems.", "Like no code added")

			Case $Radio1 ;Normal
				GUICtrlSetState($Radio1, $GUI_CHECKED)
				$g_GameWhich = $s_GameNormal
				SwapGame($b_replay)

			Case $Radio2 ; Extra
				GUICtrlSetState($Radio2, $GUI_CHECKED)
				$g_GameWhich = $s_GameExtra
				SwapGame($b_replay)

			Case $Radio3 ; Test
				GUICtrlSetState($Radio3, $GUI_CHECKED)
				$g_GameWhich = $s_GameTest
				SwapGame($b_replay)

			Case $b_info
				MsgBox(0, "Readme", $ver)

			Case $Checkbox1 ;debug

				$TESTING = BitAND(GUICtrlRead($Checkbox1), $GUI_CHECKED) = $GUI_CHECKED
				DataOut($TESTING)

		EndSwitch
	WEnd
	pause("Should never get here")

EndFunc   ;==>StartForm
#CS INFO
	325531 V28 8/9/2019 3:59:53 PM V27 8/8/2019 11:30:50 PM V26 8/8/2019 4:33:56 PM V25 8/7/2019 11:02:23 PM
#CE

;Main
Main()

Exit

;~T ScriptFunc.exe V0.54a 15 May 2019 - 8/11/2019 10:47:42 PM
