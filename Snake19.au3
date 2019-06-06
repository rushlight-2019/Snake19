AutoItSetOption("MustDeclareVars", 1)

;If not define then only in script
Global Static $MESSAGE = True ;Define then DataOut will show in script or compiled
;Global Static $MESSAGE =  False   ;Pause will still work in script  No Dataout

; Must be Declared before _Prf_startup
Global $ver = "0.17 5 Jun 2019 Make Normal functional"

If @Compiled = 0 Then
	Global Static $useLog = True
Else
	Global Static $useLog = False
EndIf

;$TESTING
#include "R:\!Autoit\Blank\_prf_startup.au3"

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=0.0.1.7
#AutoIt3Wrapper_Icon=R:\!Autoit\Ico\prf.ico
#AutoIt3Wrapper_Res_Description=Another snake game
#AutoIt3Wrapper_Res_LegalCopyright=© Phillip Forrestal 2019

;#AutoIt3Wrapper_Outfile=Snake19_32.exe
#AutoIt3Wrapper_Outfile_x64=BETA-Snake19.exe
;#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;-----------------START OF PROGRAM-------------

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

	0.17 5 Jun 2019 Make Normal functional
	0.16 5 Jun 2019 High Score for Mine
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

;Static
Static $s_pic = @ScriptDir & "\Pic\"
Static $s_ini = @WorkingDir & "\snake.ini"

Static $cEDGE = $s_pic & "Edge.jpg"
Static $EMPTY = 0
Static $cEMPTY1 = $s_pic & "blue.jpg"
Static $cEMPTY = $s_pic & "black.jpg"
Static $SNAKE = 1
Static $cSNAKE = $s_pic & "gold.jpg"
Static $FOOD = 10
Static $cFOOD = $s_pic & "green.jpg"
Static $cRED = $s_pic & "red.jpg"

;Global

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

Global $count
Global $x_new
Global $y_new
Global $x_end
Global $y_end

Global $g_foodX
Global $g_foodY

Global $g_hTick

Global $g_Size = 15 ;10
Global $g_Font = 24

Global $g_Status[2]
Global $g_StatusText[2]
Global $g_StatusOff = 2

Global $g_aHiScore[10][5] ; data load by INI.  10 =  score,  date, len.food, turns
Global $g_iScore
Global $g_cSetting ;ini

Global $g_GameWhich = 1 ; 0 Norma, 1 Mine
Global $g_HiScoreWho ;ctrl
Global $g_HiScore[8]

Global $Radio1, $Radio2
Global $g_ScoreLen ; Normal Traveled, Extra Length of snake
Global $g_ScoreTurn
Global $g_ScoreFood

; Main is call at end
Func Main()
	;	If Not $TESTING Then

	If True Then
		Do
			If StartForm() Then
				Return
			EndIf
			Game()
		Until False
	Else
		Game()
	EndIf
EndFunc   ;==>Main
#CS INFO
	10317 V10 6/5/2019 11:59:45 PM V9 6/5/2019 2:01:25 AM V8 6/2/2019 1:14:05 AM V7 5/31/2019 6:26:23 PM
#CE

Func Game()
	Local $nMsg, $x, $y
	;Keys acc
	Local Static $L_idDown
	Local Static $L_idRight
	Local Static $L_idLeft
	Local Static $L_idUp
	Local Static $L_idEsc

	Local $L_dirx
	Local $L_diry
	Local $L_change, $L_changeHalf
	Local $a, $b
	Local $L_turnNo, $L_turnLast
	$L_turnLast = 0
	$g_ScoreTurn = 0
	$g_ScoreFood = 0

	If $g_ctrlBoard = -1 Then

		$g_ctrlBoard = GUICreate("Snake19 - " & $ver, $g_bx * $g_Size, $g_by * $g_Size + $g_Font + 2)

		$L_idDown = GUICtrlCreateDummy()
		$L_idRight = GUICtrlCreateDummy()
		$L_idLeft = GUICtrlCreateDummy()
		$L_idUp = GUICtrlCreateDummy()
		$L_idEsc = GUICtrlCreateDummy()
		GUISetState(@SW_SHOW, $g_ctrlBoard)

		For $y = 0 To $g_by - 1
			For $x = 0 To $g_bx - 1
				$a = $cEDGE
				$Map[$ctrl][$x][$y] = GUICtrlCreatePic($a, $x * $g_Size, $y * $g_Size + $g_Font + $g_StatusOff, $g_Size, $g_Size)
			Next
		Next

		$a = ($g_bx * $g_Size) / 2 ;Half way
		$b = $a - $g_Size ; len  = half - $g_size (half of it at both ends)
		; Start both 1) ($g_size/2)  2) half +($g_size/2)

		$g_Status[0] = GUICtrlCreateLabel("", 0, 0, $a, $g_Font + $g_StatusOff)
		$g_Status[1] = GUICtrlCreateLabel("", $a, 0, $a, $g_Font + $g_StatusOff)

		$g_StatusText[0] = GUICtrlCreateLabel("Status1", $g_Size / 2, $g_StatusOff, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")

		$g_StatusText[1] = GUICtrlCreateLabel("Status2", $a + ($g_Size / 2), $g_StatusOff, $a - $g_Size, $g_Font)
		GUICtrlSetFont(-1, 10, 700, 0, "Arial")

	EndIf
	GUISetState(@SW_SHOW, $g_ctrlBoard)
	Status(0, "", 0, 0)

	$L_dirx = 0
	$L_diry = 0
	$L_change = 0 ; change $g_cnt  snake lenght
	$L_changeHalf = False

	ClearBoard()
	StartSnake()
	AddFood()

	;Pause("Start working~~~")
	;Pause("Temp End~~~")
	;exit

	Local $aAccelKey2[][] = [["{RIGHT}", $L_idRight], ["{LEFT}", $L_idLeft], ["{DOWN}", $L_idDown], ["{UP}", $L_idUp], ["{ESC}", $L_idEsc]]

	GUISetAccelerators($aAccelKey2, $g_ctrlBoard)

	$g_hTick = TimerInit()
	While 1 ; Game Loop
		Tick()

		$nMsg = GUIGetMsg()
		If $nMsg > 0 Then

			Switch $nMsg
				Case $L_idEsc
					ExitLoop

				Case $L_idLeft
					Do
					Until GUIGetMsg() <> $L_idLeft
					$L_turnNo = 1
					$L_dirx = -1
					$L_diry = 0

				Case $L_idRight
					Do
					Until GUIGetMsg() <> $L_idRight
					$L_turnNo = 2
					$L_dirx = 1
					$L_diry = 0

				Case $L_idUp

					Do
					Until GUIGetMsg() <> $L_idUp
					$L_turnNo = 3
					$L_dirx = 0
					$L_diry = -1

				Case $L_idDown
					Do
					Until GUIGetMsg() <> $L_idDown
					$L_turnNo = 4
					$L_dirx = 0
					$L_diry = 1

			EndSwitch
			If $L_turnNo <> $L_turnLast Then
				$L_turnLast = $L_turnNo
				$g_ScoreTurn += 1
			EndIf

		Else
			Do
			Until GUIGetMsg() = 0
		EndIf
		If $L_dirx = 0 And $L_diry = 0 Then
			ContinueLoop
		EndIf

		Switch $Map[$what][$x_new + $L_dirx][$y_new + $L_diry]
			Case -1
				Status(0, "Ate wall", 1)

				ExitLoop
			Case $SNAKE
				Status(0, "Ate self", 1)
				ExitLoop
			Case $FOOD
				$g_ScoreFood += 1
				If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
					;$L_change += 1
				Else
					$L_change += 9 ; doing this way because furture versions might not be one ***************************
				EndIf

				;RemoveFood()  NOT needed because  snake will over write with out looking
				AddFood()
				PrevNext($x_new + $L_dirx, $y_new + $L_diry) ;New value

			Case $EMPTY

				PrevNext($x_new + $L_dirx, $y_new + $L_diry) ;New value

				;Check to see if snake grow longer or shorter
				;Dataout("Change", $L_change)

				If $L_change = 0 Then
					RemoveSnake()
				ElseIf $L_change > 0 Then ; snake get longer don't remove end

					If $L_changeHalf = True Then
						$L_changeHalf = False
						RemoveSnake()
					Else
						$L_change -= 1
						$L_changeHalf = True
					EndIf

				ElseIf $L_change < 0 Then ; snake get shorter remove end twice
					$L_change += 1
					RemoveSnake()
					RemoveSnake()
				EndIf
		EndSwitch

		$a = $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1
		If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
			Status(1, "Normal: Snake length: " & $a, 2, 0)
			$g_iScore = $a
		Else
			Status(1, "Snake length: " & $a & " Score: " & $count + $a, 2, 0)
			$g_iScore = $count + $a
		EndIf
	WEnd

	GUISetAccelerators(1, $g_ctrlBoard) ; Turn off Accelerator

	;MsgBox(0, "Snake", $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1 & " score:  " & $count, 5)
	UpDateHiScore()
	GUISetState(@SW_HIDE, $g_ctrlBoard)

EndFunc   ;==>Game
#CS INFO
	294853 V12 6/5/2019 11:59:45 PM V11 6/5/2019 2:01:25 AM V10 6/4/2019 8:01:23 PM V9 6/3/2019 8:05:25 PM
#CE

Func Tick() ;
	Local $fdiff = -1

	While 1
		$fdiff = TimerDiff($g_hTick)
		;If $fdiff > 1000 then ;150 Then ;150
		If $fdiff > 150 Then ;150
			ExitLoop
		EndIf
	WEnd
	$g_hTick = TimerInit()
EndFunc   ;==>Tick
#CS INFO
	13561 V3 6/3/2019 10:34:22 AM V2 5/30/2019 10:14:46 AM V1 5/30/2019 1:07:20 AM
#CE

Func Status($status, $string, $color, $delay = 4)
	Local $c

	GUICtrlSetData($g_StatusText[$status], $string)
	Switch $color
		Case 0 ;Black
			$c = 0x000000
		Case 1 ;Pink
			$c = 0xff69b4
		Case 2 ;White
			$c = 0xffffff
	EndSwitch
	GUICtrlSetBkColor($g_Status[$status], $c)
	GUICtrlSetBkColor($g_StatusText[$status], $c)
	If $delay > 0 Then
		Sleep($delay * 1000)
	EndIf
EndFunc   ;==>Status
#CS INFO
	28671 V2 6/3/2019 8:05:25 PM V1 5/31/2019 6:26:23 PM
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

	$count = 1
	$Map[$num][$x_new][$y_new] = $count

	$Map[$what][$x_new][$y_new] = $SNAKE
	GUICtrlSetImage($Map[$ctrl][$x_new][$y_new], $cSNAKE)

	$x_end = $x_new
	$y_end = $y_new

EndFunc   ;==>StartSnake
#CS INFO
	33488 V3 6/3/2019 8:05:25 PM V2 6/3/2019 10:34:22 AM V1 6/3/2019 1:09:45 AM
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

	$count += 1
	$Map[$num][$x_new][$y_new] = $count

	$Map[$what][$x_new][$y_new] = $SNAKE
	GUICtrlSetImage($Map[$ctrl][$x_new][$y_new], $cSNAKE)
EndFunc   ;==>PrevNext
#CS INFO
	33652 V3 6/3/2019 8:05:25 PM V2 6/3/2019 10:34:22 AM V1 6/3/2019 1:09:45 AM
#CE

Func RemoveSnake() ; at end
	Local $x, $y

	$x = $x_end
	$y = $y_end

	;MsgBox(0, "Remove snake", "x " & $x & " y " & $y & " Num: " & $Map[$num][$x][$y], 10)

	$Map[$what][$x][$y] = $EMPTY
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cEMPTY)
	$Map[$num][$x][$y] = 0 ; don't really need to zero out

	$x_end = $Map[$nxX][$x][$y]
	$y_end = $Map[$nxY][$x][$y]

	;$Map[$prX][$x_end][$y_end] = 0
	;$Map[$prY][$x_end][$y_end] = 0

	;$Map[$nxX][$x_end][$y_end] = 0
	;$Map[$nxY][$x_end][$y_end] = 0

EndFunc   ;==>RemoveSnake
#CS INFO
	36306 V6 6/3/2019 10:34:22 AM V5 6/3/2019 1:09:45 AM V4 6/2/2019 7:12:26 PM V3 6/2/2019 1:14:05 AM
#CE

Func AddFood()
	Local $x, $y

	Do
		$x = Int(Random(1, $g_sx))
		$y = Int(Random(1, $g_sy))
	Until $Map[$what][$x][$y] = $EMPTY

	$g_foodX = $x ; x, y, ctrl
	$g_foodY = $y
	$Map[$what][$x][$y] = $FOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cFOOD)
EndFunc   ;==>AddFood
#CS INFO
	18553 V7 6/3/2019 1:09:45 AM V6 6/2/2019 7:12:26 PM V5 6/2/2019 1:14:05 AM V4 5/31/2019 9:17:59 AM
#CE

Func ClearBoard()
	Local $var

	For $y = 0 To $g_by - 1
		For $x = 0 To $g_bx - 1
			Select
				Case $x = 0 Or $x = $g_bx - 1 Or $y = 0 Or $y = $g_by - 1
					$Map[$what][$x][$y] = -1 ;outside edge
					$var = $cEDGE
				Case Else
					$Map[$what][$x][$y] = $EMPTY ; empty
					$var = $cEMPTY1
			EndSelect
			GUICtrlSetImage($Map[$ctrl][$x][$y], $var)
		Next
	Next

EndFunc   ;==>ClearBoard
#CS INFO
	24151 V7 6/3/2019 1:09:45 AM V6 6/2/2019 7:12:26 PM V5 6/2/2019 1:14:05 AM V4 5/31/2019 6:26:23 PM
#CE

Func StartForm()
	Local $Form1, $Group1
	Local $Radio3, $Checkbox1, $b_start
	Local $nMsg

	$Form1 = GUICreate("Snake 19 - " & $ver, 600, 600, -1, -1)
	GUICtrlCreateLabel("Snake 19", 0, 0, 600, 24, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Arial")

	GUICtrlCreateLabel($ver, 0, 24, 600, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	Local $a = 260
	Local $b = 50
	Local $c = 120
	$Group1 = GUICtrlCreateGroup("", $a - 10, $b - 10, $c + 30, 40)
	$Radio1 = GUICtrlCreateRadio("Normal", $a, $b, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$Radio2 = GUICtrlCreateRadio("Extra", $a, $b + 20, $c, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	;$Radio3 = GUICtrlCreateRadio("Radio3", $a, $b + 60, 120, 20)
	;	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	;	$Checkbox1 = GUICtrlCreateCheckbox("Checkbox1", $a, $b + 90, 120, 20)
	;	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	;	GUICtrlCreateGroup("", -99, -99, 1, 1)
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

	Local $Edit1 = GUICtrlCreateEdit("", 20, $b, 550, 250)
	GUICtrlSetData($Edit1, "Press ESC to quit." & @CRLF, 1)

	GUICtrlSetData($Edit1, "Normal:  Food increase Snake by 1.  Score +1 per food pickup " & @CRLF, 1)
	;	GUICtrlSetData($Edit1, "NOT WORKING  Maybe optional Jump snake. Snake slower and shorted" & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)
	GUICtrlSetData($Edit1, "Mine Beta:  Food increase snake by X with FAKE score" & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)
	GUICtrlSetData($Edit1, "NOT WORKING: Snake does not like to turn so, so few turns (2) and Food increase snake & score" & @CRLF, 1)
	GUICtrlSetData($Edit1, "NOT WORKING: Snake does not like to travel far for next meal. So get there quick. So Food increase snake & score" & @CRLF, 1)
	GUICtrlSetData($Edit1, "NOT WORKING: Snake does not like to travel far for next meal. Snake does get shorter & score get smaller" & @CRLF, 1)
	GUICtrlSetData($Edit1, "NOT WORKING: Snake can eat itself - hurts. bloody. It it does snake get shorter & score get smaller" & @CRLF, 1)
	GUICtrlSetData($Edit1, "NOT WORKING: When Snake is bloody, Not sure what happen with the food." & @CRLF, 1)
	GUISetState(@SW_SHOW)

	NormalExtra()

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Form1)
				Return True

			Case $b_start
				GUIDelete($Form1)
				Return False

			Case $Radio1 ;Normal
				$g_GameWhich = 0
				NormalExtra()

			Case $Radio2 ; Extra
				$g_GameWhich = 1
				NormalExtra()

		EndSwitch
	WEnd

EndFunc   ;==>StartForm
#CS INFO
	195362 V9 6/5/2019 11:59:45 PM V8 6/5/2019 2:01:25 AM V7 6/4/2019 8:01:23 PM V6 6/3/2019 8:05:25 PM
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
			GUICtrlSetData($g_HiScore[$i], $i + 1 & " - " & $g_aHiScore[$i + 1][0] & " - " & $g_aHiScore[$i + 1][1] & " Travel: " & $g_aHiScore[$i + 1][2] & " Turn: " & $g_aHiScore[$i + 1][4])
		Next
	Else
		GUICtrlSetData($g_HiScoreWho, "High Score - Extra")
		For $i = 0 To 7
			GUICtrlSetData($g_HiScore[$i], $i + 1 & " - " & $g_aHiScore[$i + 1][0] & " - " & $g_aHiScore[$i + 1][1] & " Length: " & $g_aHiScore[$i + 1][2] & " Food: " & $g_aHiScore[$i + 1][3] & " Turn: " & $g_aHiScore[$i + 1][4])
		Next
	EndIf

EndFunc   ;==>DisplayHiScore
#CS INFO
	44017 V1 6/5/2019 11:59:45 PM
#CE

Func UpDateHiScore()
	If $g_aHiScore[8][0] < $g_iScore Then
		MsgBox($MB_TOPMOST, "High Score", "New High Score: " & $g_iScore, 5)

		$g_aHiScore[9][0] = $g_iScore
		$g_aHiScore[9][1] = _Now()
		If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
			$g_aHiScore[9][2] = $count
		Else
			$g_aHiScore[9][2] = $Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end] + 1
		EndIf
		$g_aHiScore[9][3] = $g_ScoreFood
		$g_aHiScore[9][4] = $g_ScoreTurn

		_ArraySort($g_aHiScore, 1, 1, 9)
		SaveHiScore()
	EndIf
EndFunc   ;==>UpDateHiScore
#CS INFO
	38085 V3 6/5/2019 11:59:45 PM V2 6/5/2019 2:01:25 AM V1 6/4/2019 8:01:23 PM
#CE

Func SaveHiScore()
	Local $x, $a[9][2]

	For $x = 1 To 8
		$a[$x][0] = String($x)
		$a[$x][1] = $g_aHiScore[$x][0] & "|" & $g_aHiScore[$x][1] & "|" & $g_aHiScore[$x][2] & "|" & $g_aHiScore[$x][3] & "|" & $g_aHiScore[$x][4]
	Next
	$a[0][0] = 8

	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		$x = IniWriteSection($s_ini, "HighScoreNormal", $a)
	Else
		$x = IniWriteSection($s_ini, "HighScoreExtra", $a)
	EndIf

EndFunc   ;==>SaveHiScore
#CS INFO
	30372 V3 6/5/2019 11:59:45 PM V2 6/5/2019 2:01:25 AM V1 6/4/2019 8:01:23 PM
#CE

Func ReadHiScore()
	Local $a, $c
	If $g_GameWhich = 0 Then ; 0 Normal, 1 Mine
		$a = IniReadSection($s_ini, "HighScoreNormal")
	Else
		$a = IniReadSection($s_ini, "HighScoreExtra")
	EndIf
	If @error = 0 Then
		For $i = 1 To 8
			$c = StringSplit($a[$i][1], "|")
			$g_aHiScore[$i][0] = Int($c[1])
			$g_aHiScore[$i][1] = $c[2]
			$g_aHiScore[$i][2] = $c[3]
			$g_aHiScore[$i][3] = $c[4]
			$g_aHiScore[$i][4] = $c[5]

		Next
	Else
		For $i = 1 To 8 ; not found load
			$g_aHiScore[$i][0] = 0 ;
			$g_aHiScore[$i][1] = "" ;date
			$g_aHiScore[$i][2] = "" ;len
			$g_aHiScore[$i][3] = "" ;food
			$g_aHiScore[$i][4] = "" ;turns
		Next
		SaveHiScore()
	EndIf
EndFunc   ;==>ReadHiScore
#CS INFO
	46170 V3 6/5/2019 11:59:45 PM V2 6/5/2019 2:01:25 AM V1 6/4/2019 8:01:23 PM
#CE

;Main
Main()

Exit

;~T ScriptFunc.exe V0.54a 15 May 2019 - 6/5/2019 11:59:45 PM
