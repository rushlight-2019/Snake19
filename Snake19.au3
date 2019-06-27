AutoItSetOption("MustDeclareVars", 1)

;If not define then only in script
;Global Static $MESSAGE = True ;Define then DataOut will show in script or compiled
;Global Static $MESSAGE =  False   ;Pause will still work in script  No Dataout

; Must be Declared before _Prf_startup
Global $ver = "0.36 27 Jun 2019 Please wait boxes"
Global $ini_ver = "1"

;Global $TESTING = False

#include "R:\!Autoit\Blank\_prf_startup.au3"

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=0.0.3.6
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
	poop
	Health of snake

	current
	Add max lenght in Extra
	Message eat unheath meat
	died meat
	OUCH

	Need Poop chain  after 20 po0p turn to 25% of time food what does creat new food.
	What happen it snake eat Poop  10% health
	Snake Poop

	As eat snake 50% sick  Sick snake uses 50% new off too get healty

	Mouse as arrow keys????
	Pick different arrow keys.

	Change dead snake to brown

	Need head for snake. need 4 picture for each directiion.
	Health

	Better clean /  Please wait while cleaning.

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
	0.06 30 May 2019  Redo Layout like The Game
	Too much flicker
	0.04 30 May 2019 Eat Food
	0.03 29 May 2019 Move snake
	0.02 29 May 2019 Layout game.
	0.01 28 May 2019  Start form

#ce ----------------------------------------------------------------------------

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <Misc.au3>
#include <Constants.au3>
#include <ButtonConstants.au3>
#include <Date.au3>
#include <File.au3>

;Static
Static $s_pic = @ScriptDir & "\Pic\"
Static $s_ini = @WorkingDir & "\snake.ini"
Static $WALL = -1
Static $cEDGE = $s_pic & "Edge.jpg"
Static $EMPTY = 0
Static $cEMPTY = $s_pic & "blue.jpg"
;Static $cEMPTY = $s_pic & "black.jpg"
Static $SNAKE = 1
Static $cSNAKE = $s_pic & "gold.jpg"
Static $FOOD = 10
Static $cFOOD = $s_pic & "brightgreen.jpg"
Static $BLOOD = 20
Static $cBLOOD = $s_pic & "red.jpg"
Static $cPOOP = $s_pic & "earth.jpg"
Static $POOP = -30

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

Global $g_Size = 15 ;10
Global $g_Font = 24

Global $g_Status[4]
Global $g_StatusText[4]
Global $g_StatusOff = 2

Global $g_aHiScore[10][6] ; data load by INI.  10 =  score,  date, len.food, turns, Max
Global $g_iScore
Global $g_cSetting ;ini

Global $g_GameWhich = 1 ; 0 Norma, 1 Mine
Global $g_HiScoreWho ;ctrl
Global $g_HiScore[8]

Global $Radio1, $Radio2
Global $g_ScoreLen ; Normal Traveled, Extra Length of snake
Global $g_ScoreTurn
Global $g_ScoreFood

Global $g_Status0Off = 1000
; Size can be zero at the begin so once size is > 0 then hunger is active.
Global $g_RemoveBegining = False
Global $g_Mouse = 0

;0.27+
Static $s_bdCycle = 0 ;No active -1, 1 or 0
Static $s_bdX = 1
Static $s_bdY = 2
Static $s_size = 3
Static $M1 = -1
Static $s_delay = 10
Static $s_rand = 5

Global $g_bdPrev[$s_size] ;Cycle , X, Y Pre 2,3
Global $g_bdNext[$s_size] ;Cycle , X, Y Nx 4,5

$g_bdPrev[$s_bdCycle] = $M1
$g_bdNext[$s_bdCycle] = $M1

Global $g_bdEnd ;Cycle
$g_bdEnd = $M1

;.31
Global $g_Focus = "Snake19 - " & $ver
DataOut($g_Focus)

;0.32  Taking types out of game loop put into function
Global $g_endgame = False
Global $g_gChange, $g_gChangeHalf
Static $s_gChange = 3
Global $g_gHunger
Global $g_gHungerCnt
Static $g_gHungerStr = 50
Global $g_turnBonus
Static $g_turnBonusStr = 6
Global $g_turnNo
Global $g_turnLast
Global $g_dirX
Global $g_dirY

;0.33
Global $g_GameScore = 0

;0.34
Global $g_PoopCnt = 0
Global $g_Health = 100

Global $timing[100]
Global $timingCnt = -0

;0.35
Global $BounceWall = False

; Main is call at end
Func Main()
	Local $a

	If Not FileExists($cSNAKE) Then
		MsgBox(0, "Problem Pictures", $s_pic & " Folder missing. Should 7 color JPG in it")
		Return
	EndIf

	$a = _FileListToArray($s_pic, "*.jpg", $FLTA_FILES)
	If $a[0] <> 8 Then
		MsgBox(0, "ERROR", "Not enough jpg files in " & $s_pic & @CRLF & "Found " & $a[0] & ". Should have 8.")
		Return
	EndIf

	;Check Version of INI if wrong version delete Hi Scores
	;because wrong highscore layout crashed the game.
	$a = IniRead($s_ini, "Score", "Version", "x")
	If $a = "x" Then ; old layout or ini missing
		FileDelete($s_ini)
		Sleep(500)
		IniWrite($s_ini, "Score", "Version", $ini_ver)
	ElseIf $a <> $ini_ver Then
		IniDelete($s_ini, "HighScoreExtra")
		IniDelete($s_ini, "HighScoreNormal")
		IniWrite($s_ini, "Score", "Version", $ini_ver)
	EndIf

	Do
		If StartForm() Then
			Return
		EndIf
		Game()
	Until False

EndFunc   ;==>Main
#CS INFO
	64020 V14 6/27/2019 5:39:48 PM V13 6/27/2019 1:22:34 AM V12 6/24/2019 11:22:57 PM V11 6/20/2019 9:30:52 PM
#CE

Func Game()
	Local $nMsg, $x, $y, $flag
	;Keys acc
	Local Static $L_idDown
	Local Static $L_idRight
	Local Static $L_idLeft
	Local Static $L_idUp
	Local Static $L_idEsc

	Local $a, $b

	$g_turnBonus = $g_turnBonusStr + 1 ; The way it start with 1 turn on start. To fix start with +1

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
				$a = $cEDGE
				$Map[$ctrl][$x][$y] = GUICtrlCreatePic($a, $x * $g_Size, $y * $g_Size + $b + $g_StatusOff, $g_Size, $g_Size)
			Next
		Next

		$a = ($g_bx * $g_Size) / 2 ;Half way
		$b = $a - $g_Size ; len  = half - $g_size (half of it at both ends)
		; Start both 1) ($g_size/2)  2) half +($g_size/2)

		$g_Status[0] = GUICtrlCreateLabel("", 0, 0, $a, $g_Font + $g_StatusOff)
		$g_Status[1] = GUICtrlCreateLabel("", $a, 0, $a, $g_Font + $g_StatusOff)
		$g_Status[2] = GUICtrlCreateLabel("", 0, $g_Font, $a, $g_Font + $g_StatusOff)
		$g_Status[3] = GUICtrlCreateLabel("", $a, $g_Font, $a, $g_Font + $g_StatusOff)

		$g_StatusText[0] = GUICtrlCreateLabel("Status1", $g_Size / 2, $g_StatusOff, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")
;~~

		$g_StatusText[1] = GUICtrlCreateLabel("Status2", $a + ($g_Size / 2), $g_StatusOff, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")

		$g_StatusText[2] = GUICtrlCreateLabel("Health", $g_Size / 2, $g_StatusOff + $g_Font, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")

		$g_StatusText[3] = GUICtrlCreateLabel("Health", $a + $g_Size / 2, $g_StatusOff + $g_Font, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")
		SayClearBoard()

	EndIf
	GUISetState(@SW_SHOW, $g_ctrlBoard)

	$g_dirX = 0
	$g_dirY = 0

	Status(1, "", 0)
	Status(0, "", 0)
	Status(2, "", 0)
	Status(3, "", 0)
	ClearBoard()
	StartSnake()
	AddFood(True)

	;Default before start
	DataOut("New Game")
	$g_turnLast = 0
	$g_ScoreTurn = 0
	$g_ScoreFood = 0
	$g_SnakeCount = 1
	$g_iScore = 0
	$g_gChange = 0
	$g_gChangeHalf = 0
	$g_foodCnt = 1
	$g_PoopCnt = 0

	$g_gHungerCnt = 0
	$g_gHunger = 1000

	; Size can be zero at the begin so once size is > 0 then hunger is active.
	$g_RemoveBegining = False

	;.29
	$g_bdPrev[$s_bdCycle] = $M1
	$g_bdNext[$s_bdCycle] = $M1

	Local $aAccelKey2[][] = [["{RIGHT}", $L_idRight], ["{LEFT}", $L_idLeft], ["{DOWN}", $L_idDown], ["{UP}", $L_idUp], ["{ESC}", $L_idEsc]]
	GUISetAccelerators($aAccelKey2, $g_ctrlBoard)
	MouseMove(0, 0, 0)

	;	If $TESTING Then
	;	$g_ScoreFood = 40
	$g_gChange = 50
	;	EndIf

	$g_endgame = False

	$g_hTick = TimerInit()
	Do ;game Loop
		Tick()

		;Blood Loop ~~
		DoBlood()

		$nMsg = GUIGetMsg()
		If $nMsg = $GUI_EVENT_MINIMIZE Or $nMsg = $GUI_EVENT_CLOSE Then
			DataOut("EVENT", $nMsg)
			$nMsg = 0
		EndIf

		If $nMsg > 0 Then
			Switch $nMsg

				Case $L_idEsc
					ExitLoop

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
				$g_turnBonus -= 1
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
	GUISetState(@SW_HIDE, $g_ctrlBoard)

EndFunc   ;==>Game
#CS INFO
	275843 V28 6/27/2019 5:39:48 PM V27 6/27/2019 1:22:34 AM V26 6/24/2019 11:22:57 PM V25 6/24/2019 9:33:41 AM
#CE

Func Tick() ;
	Local $fdiff

	$timing[$timingCnt] = TimerDiff($g_hTick)
	$timingCnt += 1
	If $timingCnt = 100 Then
		$timingCnt = 0
		$fdiff = 0
		For $x = 0 To 99
			$fdiff += $timing[$x]
		Next
		Status(2, String($fdiff / 100), 4)
	EndIf

	While 1
		$fdiff = TimerDiff($g_hTick)
		;If $fdiff > 1000 then ;150 Then ;150
		If $fdiff > 150 Then ;150
			ExitLoop
		EndIf
	WEnd

	If $g_Focus <> WinGetTitle("[ACTIVE]") Then
		Status(0, "Lost Focus - Pause", 1)
		While $g_Focus <> WinGetTitle("[ACTIVE]")
			Sleep(1000)
		WEnd
		Status(0, "Found Focus - Wait 2 seconds", 4)
		Sleep(2000)
		MouseMove(0, 0, 0)
		Status(0, "", 0)
	EndIf

	$g_hTick = TimerInit()
EndFunc   ;==>Tick
#CS INFO
	44313 V7 6/27/2019 5:39:48 PM V6 6/27/2019 1:22:34 AM V5 6/22/2019 3:41:30 AM V4 6/20/2019 9:30:52 PM
#CE

; $g_iscore is extra + length
Func Extra()
	Local $a
	Local Static $LS_ScoreLast
	Local $flag

	;EXTRA
	Switch $Map[$what][$x_new + $g_dirX][$y_new + $g_dirY]
		Case $WALL
			;	Extra Wall removed 0.32 = return 0.35
			If $BounceWall Then

				dataout("WALL")

				;Nice I ideal but too much
				;dataout($CantDie)

				; Check  prev to be the same  last location
				DataOut("Eat wall Double back on self")
				;	DataOut($x_new, $y_new)
				;	DataOut($Map[$prX][$x_new][$y_new], $Map[$prY][$x_new][$y_new])

				If $Map[$prX][$x_new][$y_new] = $x_new And $Map[$prY][$x_new][$y_new] = $y_new Then ; Double back
					DataOut("Eat wall Double back on self")

					$flag = DoubleBackWall()
					If $flag Then
						Status(0, "Double back", 3)
						$g_gChange -= 2
						$g_iScore -= 100
					Else
						Status(0, "Ate Wallf", 1)
						$g_endgame = True
						Return
					EndIf
				EndIf
			Else ;.35
				Status(0, "Ate wall", 1)
				$g_endgame = True
				Return
			EndIf
		Case $SNAKE

			; Check  prev to be the same  last location
			If $Map[$prX][$x_new][$y_new] = $x_new + $g_dirX And $Map[$prY][$x_new][$y_new] = $y_new + $g_dirY Then ; Double back
				DataOut("Eat me Double back on self")
				$flag = DoubleBack($g_dirX, $g_dirY)
				If $flag Then
					Status(0, "Double back", 3)
					$g_gChange -= 5
					$g_iScore -= 100
				Else
					Status(0, "Ate self", 1)
					$g_endgame = True
					Return
				EndIf
			Else

				;dataout($x_new, $y_new)
				;dataout($x_new + $g_dirX, $y_new + $g_dirY)

				If StartBlood($x_new + $g_dirX, $y_new + $g_dirY) = False Then
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

			; .36 $g_gHunger = ($g_gHungerStr * 2) - $g_ScoreFood

			$g_gHunger = ($g_gHungerStr) - $g_ScoreFood
			If $g_gHunger < 20 Then
				$g_gHunger = 20
			EndIf
			$g_gHungerCnt = 0
			dataout("$g_gHunger at food", $g_gHunger)

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

			$g_turnBonus = $g_turnBonusStr
			$g_gChange += 1 ; doing this way because furture versions might not be one ***************************

			;RemoveFood()  NOT needed because  snake will over write with out looking
			AddFood()
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			$g_PoopCnt = Random(5, 10, 1)

		Case $EMPTY

			If $g_Status0Off = 0 Then
				Status(0, "", 0)
			EndIf
			$g_Status0Off -= 1

			If $g_gHunger = 0 Then
				$g_gHungerCnt += 1
				Status(0, "Hungery - " & $g_gHungerCnt & " Snake shorter", 3)
				$g_Status0Off = 30

				$g_gHunger = $g_gHungerStr - $g_gHungerCnt
				If $g_gHunger < 30 Then
					$g_gHunger = 30
				EndIf
				Dataout($g_gHunger, "$g_gHunger")

				$g_iScore -= $g_gHungerCnt
				$g_gChange -= $g_gHungerCnt
				dataout($g_gHungerCnt, "$g_gHungerCnt")

			Else
				$g_gHunger -= 1
			EndIf

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

			;Check to see if snake grow longer or shorter
			If $g_gChange = 0 Then
				RemoveSnakeExtra()
			ElseIf $g_gChange > 0 Then ; snake get longer don't remove end
				Switch $g_gChangeHalf
					Case 0
						$g_gChange -= 1
						$g_gChangeHalf = $s_gChange
					Case Else
						RemoveSnakeExtra() ;Same size
						$g_gChangeHalf -= 1
				EndSwitch

			ElseIf $g_gChange < 0 Then ; snake get shorter remove end twice
				Switch $g_gChangeHalf
					Case 0
						$g_gChange += 1
						$g_gChangeHalf = $s_gChange
						If RemoveSnakeExtra() Then ;one smaller
							$g_endgame = True
							Return ;no snake
						EndIf
						If RemoveSnakeExtra() Then
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
	If $LS_ScoreLast <> $g_iScore + $a Then
		$LS_ScoreLast = $g_iScore + $a
		If $TESTING Then
			Status(1, "Snake length: " & $a & " Score: " & $g_iScore & " (" & $g_iScore + $a & ")", 2)
		Else
			Status(1, "Snake length: " & $a & " Score: " & $g_iScore + $a, 2)
		EndIf
		$g_GameScore = $g_iScore + $a
	EndIf

EndFunc   ;==>Extra
#CS INFO
	309526 V5 6/27/2019 5:39:48 PM V4 6/27/2019 1:22:34 AM V3 6/24/2019 11:22:57 PM V2 6/24/2019 9:33:41 AM
#CE

Func Normal()
	Local Static $LS_ScoreLast = 0

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
			$g_ScoreFood += 1

			;RemoveFood()  NOT needed because  snake will over write with out looking
			AddFood()
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

		Case $EMPTY ;Normal

			If $g_Status0Off = 0 Then
				Status(0, "", 0)
			EndIf
			$g_Status0Off -= 1

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			RemoveSnakeNormal()

	EndSwitch
	;Score NORMAL
	$g_iScore = $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1
	If $LS_ScoreLast <> $g_iScore Then
		$LS_ScoreLast = $g_iScore
		Status(1, "Snake length: " & $g_iScore, 2)
	EndIf
	$g_GameScore = $g_iScore

	; END NORMAL
EndFunc   ;==>Normal
#CS INFO
	65639 V3 6/24/2019 11:22:57 PM V2 6/24/2019 9:33:41 AM V1 6/22/2019 7:09:09 PM
#CE

Func DoBlood()
	Local $x, $y, $x1, $y1

	If $g_bdPrev[$s_bdCycle] > $M1 Then ;  active cycle count down
		$g_bdPrev[$s_bdCycle] -= 1
		If $g_bdPrev[$s_bdCycle] = 0 Then ; do move

			$x = $g_bdPrev[$s_bdX]
			$y = $g_bdPrev[$s_bdY]

			;: Clear current location
			$Map[$what][$x][$y] = $EMPTY
			GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)
			$g_iScore -= 10

			;next location current prev
			$x1 = $Map[$prX][$x][$y]
			$y1 = $Map[$prY][$x][$y]

			;Save in Prev  Active Cycle
			$g_bdPrev[$s_bdX] = $x1
			$g_bdPrev[$s_bdY] = $y1
			$g_bdPrev[$s_bdCycle] = $s_delay + Random(-$s_rand, $s_rand, 1)

			;clear nx
			$Map[$nxX][$x1][$y1] = 0
			$Map[$nxY][$x1][$y1] = 0

			If $Map[$what][$x1][$y1] <> $SNAKE Then
				DataOut("DO PREV is not Snake", $Map[$what][$x1][$y1])
				$g_bdPrev[$s_bdCycle] = $M1 ; -1 no active if active cycle count down
			Else
				$Map[$what][$x1][$y1] = $BLOOD
				GUICtrlSetImage($Map[$ctrl][$x1][$y1], $cBLOOD)
			EndIf
		EndIf

	EndIf
	;Save in Next  Active Cycle
	;$g_bdNext[$s_bdX] = $x
	;$g_bdNext[$s_bdY] = $y
	;$g_bdNext[$s_bdCycle] = 6 ; -1 no active if active cycle count down  start slower
	;.29
	If $g_bdNext[$s_bdCycle] > $M1 Then ;  active cycle count down

		$g_bdNext[$s_bdCycle] -= 1
		If $g_bdNext[$s_bdCycle] = 0 Then ; do move

			$x = $g_bdNext[$s_bdX]
			$y = $g_bdNext[$s_bdY]

			; Clear current location
			$Map[$what][$x][$y] = $EMPTY
			GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)
			$g_iScore -= 10

			;next location current Next
			$x1 = $Map[$nxX][$x][$y]
			$y1 = $Map[$nxY][$x][$y]

			;Save in Next  Active Cycle
			$g_bdNext[$s_bdX] = $x1
			$g_bdNext[$s_bdY] = $y1
			$g_bdNext[$s_bdCycle] = $s_delay + Random(-$s_rand, $s_rand, 1)

			;clear pv  not sure this is needed
			$Map[$prX][$x1][$y1] = 0
			$Map[$prY][$x1][$y1] = 0

			If $Map[$what][$x1][$y1] <> $SNAKE Then
				DataOut("DO Next is not Snake", $Map[$what][$x1][$y1])
				$g_bdNext[$s_bdCycle] = $M1 ; -1 no active if active cycle count down
			Else
				$Map[$what][$x1][$y1] = $BLOOD
				GUICtrlSetImage($Map[$ctrl][$x1][$y1], $cBLOOD)
			EndIf
			;ShowRow($x, $y)

			;pause()

		EndIf

	EndIf

EndFunc   ;==>DoBlood
#CS INFO
	150810 V3 6/20/2019 9:30:52 PM V2 6/19/2019 11:41:56 AM V1 6/19/2019 2:58:37 AM
#CE

Func StartBlood($inX, $inY) ;  .28, .29
	Local $x, $y

	;Global $g_bdPrev[4] ;Cycle, CycleStr , X, Y Pre 2,3
	;Global $g_bdNext[4] ;Cycle, CycleStr , X, Y Nx 4,5
	;Global $g_bdEnd[4] ;Cycle, CycleStr,  X, Y

	;.0.28 Do First
	; Here to old tail
	;Check to see if active, if Active snake dies because it ate itself twice.  Return False
	If $g_bdPrev[$s_bdCycle] <> -1 Then
		Return False
	EndIf

	;Blood start with previous cross location so Zero out next location  And this location RED
	$x = $Map[$prX][$inX][$inY]
	$y = $Map[$prY][$inX][$inY]

	;Save in Prev  Active Cycle
	$g_bdPrev[$s_bdX] = $x
	$g_bdPrev[$s_bdY] = $y
	$g_bdPrev[$s_bdCycle] = $s_delay

	;clear nx
	$Map[$nxX][$x][$y] = 0
	$Map[$nxY][$x][$y] = 0

	$Map[$what][$x][$y] = $BLOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cBLOOD)
	;-----------------------------end prev

	;-------------------------start old tail
	;This one will be the new end.  The old end will be bdStart2

	$x = $x_end
	$y = $y_end
	;ShowRow($x, $y)

	;Save in Next  Active Cycle
	$g_bdNext[$s_bdX] = $x
	$g_bdNext[$s_bdY] = $y
	$g_bdNext[$s_bdCycle] = $s_delay + 1 ;offset

	;Clear prv   Not sure I need to do this
	$Map[$prX][$x][$y] = 0
	$Map[$prY][$x][$y] = 0

	;Add blood to old tail
	$Map[$what][$x][$y] = $BLOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cBLOOD)

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

	$Map[$what][$x][$y] = $BLOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cBLOOD)

	;ShowRow($x, $y)
	$x_end = $x
	$y_end = $y

	Return True
EndFunc   ;==>StartBlood
#CS INFO
	134924 V4 6/27/2019 1:22:34 AM V3 6/24/2019 11:22:57 PM V2 6/19/2019 11:41:56 AM V1 6/19/2019 2:58:37 AM
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

;~~
Func Status($status, $string, $color)
	Local $c
	;dataout($status, $string)

	If $status = 0 Then
		$g_Status0Off = 25
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
	33886 V5 6/9/2019 5:40:22 PM V4 6/9/2019 1:07:49 PM V3 6/6/2019 11:09:42 PM V2 6/3/2019 8:05:25 PM
#CE

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
	;DataOut($g_dirX, $g_diry)
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
	67432 V4 6/27/2019 5:39:48 PM V3 6/27/2019 1:22:34 AM V2 6/20/2019 9:30:52 PM V1 6/12/2019 12:36:42 PM
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

	$g_SnakeCount += 1
	$Map[$num][$x_new][$y_new] = $g_SnakeCount

	$Map[$what][$x_new][$y_new] = $SNAKE
	GUICtrlSetImage($Map[$ctrl][$x_new][$y_new], $cSNAKE)
EndFunc   ;==>PrevNext
#CS INFO
	34980 V4 6/22/2019 7:09:09 PM V3 6/3/2019 8:05:25 PM V2 6/3/2019 10:34:22 AM V1 6/3/2019 1:09:45 AM
#CE

Func RemoveSnakeExtra() ; at end
	Local $x, $y
	; Size can be zero at the begin so once size is > 0 then hunger is active.
	;Global $g_RemoveBegining = False

	$x = $x_end
	$y = $y_end

	;MsgBox(0, "Remove snake", "x " & $x & " y " & $y & " Num: " & $Map[$num][$x][$y], 10)

	$g_PoopCnt -= 1
	$g_PoopCnt = 1
	If $g_PoopCnt = 0 Then
		$Map[$what][$x][$y] = $POOP
		GUICtrlSetImage($Map[$ctrl][$x][$y], $cPOOP)
	Else
		$Map[$what][$x][$y] = $EMPTY
		GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)
	EndIf

	$x_end = $Map[$nxX][$x][$y]
	$y_end = $Map[$nxY][$x][$y]

	;$Map[$prX][$x_end][$y_end] = 0
	;$Map[$prY][$x_end][$y_end] = 0

	;$Map[$nxX][$x_end][$y_end] = 0
	;$Map[$nxY][$x_end][$y_end] = 0

	;dataout("remove", $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end])
	;dataout($g_RemoveBegining)
	; Size can be zero at the begin so once size is > 0 then hunger is active.
	;Global $g_RemoveBegining = False

	If $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] = 0 Then
		If $g_RemoveBegining Then
			Status(0, "Died of hunger:", 1)
			Return True
		EndIf
		Return False
	EndIf
	$g_RemoveBegining = True
	Return False

EndFunc   ;==>RemoveSnakeExtra
#CS INFO
	86293 V9 6/24/2019 11:22:57 PM V8 6/22/2019 7:09:09 PM V7 6/6/2019 11:09:42 PM V6 6/3/2019 10:34:22 AM
#CE

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
	18081 V9 6/24/2019 11:22:57 PM V8 6/22/2019 7:09:09 PM V7 6/6/2019 11:09:42 PM V6 6/3/2019 10:34:22 AM
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
	Do
		$x = Int(Random(1, $g_sx))
		$y = Int(Random(1, $g_sy))
	Until $Map[$what][$x][$y] = $EMPTY

	$Map[$what][$x][$y] = $FOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cFOOD)

EndFunc   ;==>AddFood
#CS INFO
	38491 V9 6/24/2019 11:22:57 PM V8 6/22/2019 7:09:09 PM V7 6/3/2019 1:09:45 AM V6 6/2/2019 7:12:26 PM
#CE

Func ClearBoard()
	Local $var
	SayClearBoard(True, False)

	For $y = 0 To $g_by - 1
		For $x = 0 To $g_bx - 1
			Select
				Case $x = 0 Or $x = $g_bx - 1 Or $y = 0 Or $y = $g_by - 1
					$Map[$what][$x][$y] = $WALL ;outside edge

					$var = $cEDGE
				Case Else
					$Map[$what][$x][$y] = $EMPTY ; empty
					$var = $cEMPTY
			EndSelect
			GUICtrlSetImage($Map[$ctrl][$x][$y], $var)
		Next
	Next
	SayClearBoard()

EndFunc   ;==>ClearBoard
#CS INFO
	28013 V10 6/27/2019 5:39:48 PM V9 6/20/2019 9:30:52 PM V8 6/12/2019 12:36:42 PM V7 6/3/2019 1:09:45 AM
#CE

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
	16149 V1 6/5/2019 11:59:45 PM
#CE

Func DisplayHiScore()
	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		GUICtrlSetData($g_HiScoreWho, "High Score - Normal")
		For $i = 0 To 7
			GUICtrlSetData($g_HiScore[$i], $i + 1 & " - " & $g_aHiScore[$i + 1][0] & " - " & $g_aHiScore[$i + 1][1] & " Travel: " & $g_aHiScore[$i + 1][2] & " Turn: " & $g_aHiScore[$i + 1][4] & " Max: " & $g_aHiScore[$i + 1][5])
		Next
	Else
		GUICtrlSetData($g_HiScoreWho, "High Score - Extra")
		For $i = 0 To 7
			GUICtrlSetData($g_HiScore[$i], $i + 1 & " - " & $g_aHiScore[$i + 1][0] & " - " & $g_aHiScore[$i + 1][1] & " Length: " & $g_aHiScore[$i + 1][2] & " Food: " & $g_aHiScore[$i + 1][3] & " Turn: " & $g_aHiScore[$i + 1][4])
		Next
	EndIf

EndFunc   ;==>DisplayHiScore
#CS INFO
	46183 V2 6/16/2019 10:16:04 AM V1 6/5/2019 11:59:45 PM
#CE

Func UpDateHiScore()
	Local $Form1
	If $g_aHiScore[8][0] < $g_GameScore Then
		;		MsgBox($MB_TOPMOST, "High Score", "New High Score: " & $g_iScore, 5)
		$Form1 = GUICreate("", 250, 100, -1, -1, $WS_DLGFRAME, BitOR($WS_EX_TOPMOST, $WS_EX_STATICEDGE))
		GUICtrlCreateLabel("New High Score: " & $g_GameScore, 25, 30, 200, 25)
		GUICtrlSetFont(-1, 12, 400, 0, "Arial")
		GUISetState(@SW_SHOW)

		$g_aHiScore[9][0] = $g_GameScore
		$g_aHiScore[9][1] = _Now()
		If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
			$g_aHiScore[9][2] = $g_SnakeCount
		Else
			$g_aHiScore[9][2] = $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1
		EndIf
		$g_aHiScore[9][3] = $g_ScoreFood
		$g_aHiScore[9][4] = $g_ScoreTurn

		_ArraySort($g_aHiScore, 1, 1, 9)
		SaveHiScore()
		Sleep(4000)
		GUIDelete($Form1)
	Else
		Sleep(5000)
	EndIf
EndFunc   ;==>UpDateHiScore
#CS INFO
	59024 V8 6/27/2019 5:39:48 PM V7 6/24/2019 9:33:41 AM V6 6/22/2019 7:09:09 PM V5 6/10/2019 8:01:23 PM
#CE

Func SaveHiScore()
	Local $x, $a[9][2]

	For $x = 1 To 8
		$a[$x][0] = String($x)
		$a[$x][1] = $g_aHiScore[$x][0] & "|" & $g_aHiScore[$x][1] & "|" & $g_aHiScore[$x][2] & "|" & $g_aHiScore[$x][3] & "|" & $g_aHiScore[$x][4] & "|" & $g_aHiScore[$x][5]
	Next
	$a[0][0] = 8

	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		$x = IniWriteSection($s_ini, "HighScoreNormal", $a)
	Else
		$x = IniWriteSection($s_ini, "HighScoreExtra", $a)
	EndIf

EndFunc   ;==>SaveHiScore
#CS INFO
	32233 V4 6/16/2019 10:16:04 AM V3 6/5/2019 11:59:45 PM V2 6/5/2019 2:01:25 AM V1 6/4/2019 8:01:23 PM
#CE

Func ReadHiScore()
	Local $a, $c, $Z
	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		$a = IniReadSection($s_ini, "HighScoreNormal")
	Else
		$a = IniReadSection($s_ini, "HighScoreExtra")
	EndIf
	If @error = 0 Then

		For $i = 1 To 8
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
		For $i = 1 To 8 ; not found load
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
	69341 V4 6/16/2019 10:16:04 AM V3 6/5/2019 11:59:45 PM V2 6/5/2019 2:01:25 AM V1 6/4/2019 8:01:23 PM
#CE

;Load Level from THE GAME ~~
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

Func StartForm()
	Local $Form1, $Group1
	Local $Radio3, $Checkbox1, $b_start
	Local $nMsg
	Local $a = 260
	Local $b = 50
	Local $c = 120
	Local $Z

	$Form1 = GUICreate("Snake 19 - " & $ver, 600, 600, -1, -1)
	If IsArray($g_Mouse) Then
		MouseMove($g_Mouse[0], $g_Mouse[1], 0)
	EndIf

	GUICtrlCreateLabel("Snake 19", 0, 0, 600, 24, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Arial")

	GUICtrlCreateLabel($ver, 0, 24, 600, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	$Group1 = GUICtrlCreateGroup("", $a - 10, $b - 10, $c + 30, 40)
	$Radio1 = GUICtrlCreateRadio("Normal", $a, $b, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$Radio2 = GUICtrlCreateRadio("Extra", $a, $b + 20, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	;$Radio3 = GUICtrlCreateRadio("Radio3", $a, $b + 60, 120, 20)
	;	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	;	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	;		GUICtrlCreateGroup("", -99, -99, 1, 1)

	$b += 40

	$g_HiScoreWho = GUICtrlCreateLabel("High Score - Extra", $a, $b, $c + 30, 24) ; Height is twice font size
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$a = 100
	$b += 40

	For $x = 0 To 7
		$g_HiScore[$x] = GUICtrlCreateLabel(String($x + 1), $a, $b, 400, 24) ; Height is twice font size
		GUICtrlSetFont($g_HiScore[$x], 10, 400, 0, "Arial")
		$b += 20
	Next

	$b_start = GUICtrlCreateButton("GO", 270, 550, 100, 35)
	$Checkbox1 = GUICtrlCreateCheckbox("Testing", 1, 555)

	Local $Edit1 = GUICtrlCreateEdit("", 20, $b, 550, 250)
	GUICtrlSetData($Edit1, "Press ESC to quit." & @CRLF, 1)
	GUICtrlSetData($Edit1, "If you lose Focus the game will PAUSE" & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)

	GUICtrlSetData($Edit1, "Normal" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Food increase Snake by 1.  Score +1 per food pickup " & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)

	;	GUICtrlSetData($Edit1, "NOT WORKING  Maybe optional Jump snake. Snake slower and shorted" & @CRLF, 1)
	GUICtrlSetData($Edit1, "Extra:" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Food increase snake by 2" & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)
	GUICtrlSetData($Edit1, "Bonus:" & @CRLF, 1)
	GUICtrlSetData($Edit1, " Snake does not like to turn so, so few turns and Food increase snake & score" & @CRLF, 1)
	GUICtrlSetData($Edit1, " Snake can double back most of the times. But lose length and score" & @CRLF, 1)
	GUICtrlSetData($Edit1, " Snake does not like to travel far for next meal. Snake does get shorter & score get smaller" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, "NOT WORKING: Snake can eat itself - hurts. bloody. It it does snake get shorter & score get smaller" & @CRLF, 1)
	;	GUICtrlSetData($Edit1, "NOT WORKING: When Snake is bloody, Not sure what happen with the food." & @CRLF, 1)
	GUISetState(@SW_SHOW)

	NormalExtra()

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Form1)
				Return True

			Case $b_start
				$g_Mouse = MouseGetPos()
				GUIDelete($Form1)
				Return False

			Case $Radio1 ;Normal
				$g_GameWhich = 0
				NormalExtra()

			Case $Radio2 ; Extra
				$g_GameWhich = 1
				NormalExtra()

			Case $Checkbox1 ;debug
				$BounceWall = BitAND(GUICtrlRead($Checkbox1), $GUI_CHECKED) = $GUI_CHECKED
				Dataout($TESTING)

		EndSwitch
	WEnd

EndFunc   ;==>StartForm
#CS INFO
	220689 V18 6/27/2019 5:39:48 PM V17 6/24/2019 11:22:57 PM V16 6/24/2019 9:33:41 AM V15 6/22/2019 7:09:09 PM
#CE

;Main
Main()

Exit

;~T ScriptFunc.exe V0.54a 15 May 2019 - 6/27/2019 5:39:48 PM
