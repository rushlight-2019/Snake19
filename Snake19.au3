AutoItSetOption("MustDeclareVars", 1)

;If not define then only in script
;Global Static $MESSAGE = True ;Define then DataOut will show in script or compiled
;Global Static $MESSAGE =  False   ;Pause will still work in script  No Dataout

; Must be Declared before _Prf_startup
Global $ver = "0.09 1 Jun 2019 Minor fixes."

If @Compiled = 0 Then
	Global Static $useLog = True
Else
	Global Static $useLog = False
EndIf

;$TESTING
#include "R:\!Autoit\Blank\_prf_startup.au3"

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=0.0.0.9
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

	to do
	eat the wall and escaped
	eat self- bloody  or cut in half
	Return to start menu
	Replay
	Create score
	Add hiscore
	Create bosus if use short distance to next food.
	Add quick game.  Return normal back to add 1
	Add bonus food
	poop

	Blood change needed.
	1.  On array
	0 = Ctrl
	1 = What at cell  snake, food, empty
	2 = previous X
	3 = previous Y
	4 = next X
	5 = next Y
	6 = snake cell number

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

;Static $UserLoction = EnvGet("USERPROFILE");
;Static $Temp = EnvGet("TEMP")

;AutoItSetOption("SendKeyDelay", 15)
;AutoItSetOption("SendKeyDownDelay", 15)

;$CmdLine[0] ; Contains the total number of items in the array.
;$CmdLine[1] ; The first parameter.
;$CmdLine[2] ; The second parameter.

;Static
Static $s_pic = @ScriptDir & "\Pic\"

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
Global $g_ctrlBoard

Global $g_food[2] ; x, y , Ctrl
Global $g_snake[($g_sx) * ($g_sy)][2] ; x, y
Global $g_start = 0
Global $g_end = 0
Global $g_cnt = 1
Global $g_unbound = UBound($g_snake)

;Game
Global $g_x
Global $g_y
Global $g_hTick
Global $g_aMap[$g_bx][$g_by]

Global $g_aDisplayMap[$g_bx][$g_by]
Global $g_Size = 15 ;10
Global $g_Font = 24
Global $g_Status
Global $g_StatusText
Global $g_StatusOff = 2

; Main is call at end
Func Main()
	If Not $TESTING Then
		;If True Then
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
	10317 V8 6/2/2019 1:14:05 AM V7 5/31/2019 6:26:23 PM V6 5/31/2019 9:17:59 AM V5 5/30/2019 10:14:46 AM
#CE

Func Game()
	Local $nMsg, $x, $y
	;Keys acc
	Local $L_idDown
	Local $L_idRight
	Local $L_idLeft
	Local $L_idUp
	Local $L_idEsc

	Local $L_dirx
	Local $L_diry
	Local $L_change, $L_changeHalf
	Local $var

	$g_ctrlBoard = GUICreate("Snake19 - " & $ver, $g_bx * $g_Size, $g_by * $g_Size + $g_Font + 2)

	$L_idDown = GUICtrlCreateDummy()
	$L_idRight = GUICtrlCreateDummy()
	$L_idLeft = GUICtrlCreateDummy()
	$L_idUp = GUICtrlCreateDummy()
	$L_idEsc = GUICtrlCreateDummy()

	$g_Status = GUICtrlCreateLabel("", 0, 0, $g_bx * $g_Size, $g_Font + $g_StatusOff)
	$g_StatusText = GUICtrlCreateLabel("Status", $g_Size / 2, $g_StatusOff, $g_bx * $g_Size - $g_Size, $g_Font)
	GUICtrlSetFont(-1, 10, 700, 0, "Arial")
	GUISetState()

	For $y = 0 To $g_by - 1
		For $x = 0 To $g_bx - 1
			Select
				Case $x = 0 Or $x = $g_bx - 1 Or $y = 0 Or $y = $g_by - 1
					$g_aMap[$x][$y] = -1 ;outside edge
					$var = $cEDGE
				Case Else
					$g_aMap[$x][$y] = $EMPTY ; empty
					$var = $cEMPTY1 ;$cEMPTY
			EndSelect
			$g_aDisplayMap[$x][$y] = GUICtrlCreatePic($var, $x * $g_Size, $y * $g_Size + $g_Font + $g_StatusOff, $g_Size, $g_Size)
		Next
	Next

	$L_dirx = 0
	$L_diry = 0
	$L_change = 0 ; change $g_cnt  snake lenght
	$L_changeHalf = False

	StartSnake()
	;Pause("Start working~~~")
	AddFood()
	;Pause("Temp End~~~")

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
					$L_dirx = -1
					$L_diry = 0

				Case $L_idRight
					Do
					Until GUIGetMsg() <> $L_idRight
					$L_dirx = 1
					$L_diry = 0

				Case $L_idUp

					Do
					Until GUIGetMsg() <> $L_idUp
					$L_dirx = 0
					$L_diry = -1

				Case $L_idDown
					Do
					Until GUIGetMsg() <> $L_idDown
					$L_dirx = 0
					$L_diry = 1

			EndSwitch
		Else
			Do
			Until GUIGetMsg() = 0
		EndIf
		If $L_dirx = 0 And $L_diry = 0 Then
			ContinueLoop
		EndIf

		Switch $g_aMap[$g_x + $L_dirx][$g_y + $L_diry]
			Case -1
				Status("Ate wall", 1)

				ExitLoop
			Case $SNAKE
				Status("Ate self", 1)
				ExitLoop
			Case $FOOD
				$g_x += $L_dirx
				$g_y += $L_diry

				$L_change += 0 ; doing this way because furture versions might not be one

				$L_change += 10 ; doing this way because furture versions might not be one ***************************
				RemoveFood()
				AddSnake()

			Case $EMPTY
				$g_x += $L_dirx
				$g_y += $L_diry

				AddSnake()
				;Check to see if snake grow longer or shorter
				If $L_change = 0 Then
					RemoveSnake()

				ElseIf $L_change > 0 Then ; snake get longer don't remove end
					$g_cnt += 1
					$L_change -= 1
					If $L_changeHalf = True Then
						$L_changeHalf = False
						RemoveSnake()
					Else
						$L_changeHalf = True
					EndIf

				ElseIf $L_change < 0 Then ; snake get shorter remove end twice
					$g_cnt -= 1
					$L_change += 1
					RemoveSnake()
					RemoveSnake()
				EndIf
		EndSwitch

	WEnd

	GUISetAccelerators(1, $g_ctrlBoard) ; Turn off Accelerator

	GUIDelete($g_ctrlBoard)

EndFunc   ;==>Game
#CS INFO
	201824 V5 6/2/2019 1:14:05 AM V4 5/31/2019 6:26:23 PM V3 5/31/2019 9:17:59 AM V2 5/30/2019 10:14:46 AM
#CE

Func Tick() ;
	Local $fdiff = -1

	While 1
		$fdiff = TimerDiff($g_hTick)
		If $fdiff > 150 Then ;150
			ExitLoop
		EndIf
	WEnd
	$g_hTick = TimerInit()
EndFunc   ;==>Tick
#CS INFO
	11277 V2 5/30/2019 10:14:46 AM V1 5/30/2019 1:07:20 AM
#CE

Func Status($string, $color, $delay = 4)
	Local $c

	GUICtrlSetData($g_StatusText, $string)
	Switch $color
		Case 1
			$c = 0xff69b4
	EndSwitch
	GUICtrlSetBkColor($g_Status, $c)
	GUICtrlSetBkColor($g_StatusText, $c)
	If $delay > 0 Then
		Sleep($delay * 1000)
	EndIf
EndFunc   ;==>Status
#CS INFO
	21172 V1 5/31/2019 6:26:23 PM
#CE

Func RemoveSnake() ; at end
	$g_aMap[$g_snake[$g_end][0]][$g_snake[$g_end][1]] = $EMPTY
	GUICtrlSetImage($g_aDisplayMap[$g_snake[$g_end][0]][$g_snake[$g_end][1]], $cEMPTY)

	$g_end += 1
	If $g_end = $g_unbound Then
		$g_end = 0
	EndIf

EndFunc   ;==>RemoveSnake
#CS INFO
	20371 V3 6/2/2019 1:14:05 AM V2 5/31/2019 9:17:59 AM V1 5/30/2019 10:14:46 AM
#CE

Func StartSnake()
	Local $x, $y

	$g_x = Int(Random(5, $g_sx - 5))
	$g_y = Int(Random(5, $g_sy - 5))

	$g_start = 0
	$g_end = 0
	$g_cnt = 1
	DataOut($g_x, $g_y)
	AddSnake(False)

EndFunc   ;==>StartSnake
#CS INFO
	13674 V4 5/31/2019 9:17:59 AM V3 5/30/2019 10:14:46 AM V2 5/30/2019 1:07:20 AM V1 5/29/2019 6:31:27 PM
#CE

Func AddSnake($flag = True) ;at start
	If $flag Then
		$g_start += 1
		If $g_start = $g_unbound Then
			$g_start = 0
		EndIf
	EndIf

	$g_aMap[$g_x][$g_y] = $SNAKE
	$g_snake[$g_start][0] = $g_x ; x, y, ctrl
	$g_snake[$g_start][1] = $g_y
	GUICtrlSetImage($g_aDisplayMap[$g_x][$g_y], $cSNAKE)

EndFunc   ;==>AddSnake
#CS INFO
	23101 V3 6/2/2019 1:14:05 AM V2 5/31/2019 9:17:59 AM V1 5/30/2019 10:14:46 AM
#CE

Func RemoveFood()
	;Local $x, $y  Not needed Snake will rewright location without looking

	;$x=$g_food[0]  ; keep food on board so food won't  be added here.
	;$y=$g_food[0]

	GUICtrlSetImage($g_aDisplayMap[$g_food[0]][$g_food[1]], $cEMPTY)
	AddFood()

	;$g_aMap[$x][$y] = 0 ;empty

EndFunc   ;==>RemoveFood
#CS INFO
	24138 V3 6/2/2019 1:14:05 AM V2 5/31/2019 9:17:59 AM V1 5/30/2019 10:14:46 AM
#CE

Func AddFood()
	;$g_CtrlBG[$Y][$X] = GUICtrlCreateGraphic($X * 64, (7 - $Y) * 64, 64, 64) ;Clickable
	Local $x, $y

	Do
		$x = Int(Random(1, $g_sx))
		$y = Int(Random(1, $g_sy))
		;dataout($x,$y)
		dataout($g_aMap[$x][$y])
	Until $g_aMap[$x][$y] = $EMPTY

	dataout($x, $y)

	$g_aMap[$x][$y] = 10 ; Food
	$g_food[0] = $x ; x, y, ctrl
	$g_food[1] = $y
	GUICtrlSetImage($g_aDisplayMap[$x][$y], $cFOOD)

	dataout($x, $y)

EndFunc   ;==>AddFood
#CS INFO
	30012 V5 6/2/2019 1:14:05 AM V4 5/31/2019 9:17:59 AM V3 5/30/2019 10:14:46 AM V2 5/30/2019 1:07:20 AM
#CE

Func ClearBoard()
	Local $var

	For $x = 0 To $g_bx - 1
		For $y = 0 To $g_by - 1
			Select
				Case $x = 0 Or $x = $g_bx - 1 Or $y = 0 Or $y = $g_by - 1
					$g_aMap[$x][$y] = -1 ;outside edge
					$var = $cEDGE
				Case Else
					$g_aMap[$x][$y] = 0 ; empty
					$var = $cEMPTY1
			EndSelect
			GUICtrlSetImage($g_aDisplayMap[$x][$y], $var)
		Next
	Next

	StartSnake()
	AddFood()
EndFunc   ;==>ClearBoard
#CS INFO
	25249 V5 6/2/2019 1:14:05 AM V4 5/31/2019 6:26:23 PM V3 5/31/2019 9:17:59 AM V2 5/30/2019 10:14:46 AM
#CE

Func StartForm()
	Local $Form1, $Group1
	Local $Radio1, $Radio2, $Radio3, $Checkbox1, $b_start
	Local $nMsg

	$Form1 = GUICreate("Snake 19 - " & $ver, 600, 600, -1, -1)
	GUICtrlCreateLabel("Snake 19", 0, 0, 600, 24, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Arial")

	GUICtrlCreateLabel($ver, 0, 24, 600, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	Local $a = 260
	Local $b = 50
	$Group1 = GUICtrlCreateGroup("", 200, 40, 200, 150)
	$Radio1 = GUICtrlCreateRadio("Normal", $a, $b, 120, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	GUICtrlSetState($Radio1, $GUI_CHECKED)
	$Radio2 = GUICtrlCreateRadio("Radio2", $a, $b + 30, 120, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")

	$Radio3 = GUICtrlCreateRadio("Radio3", $a, $b + 60, 120, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$Checkbox1 = GUICtrlCreateCheckbox("Checkbox1", $a, $b + 90, 120, 20)
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$b_start = GUICtrlCreateButton("GO", 270, 550, 100, 35)

	Local $Edit1 = GUICtrlCreateEdit("", 20, $b + 150, 550, 250)
	GUICtrlSetData($Edit1, "Press ESC to quit." & @CRLF, 1)
	;GUICtrlSetData($Edit1, "Normal:  One snake, one food" & @CRLF, 1)
	GUICtrlSetData($Edit1, "Beta:  Normal: One snake, one food,  each food increase snake by 10" & @CRLF, 1)

	GUICtrlSetData($Edit1, @CRLF, 1)

	GUISetState(@SW_SHOW)

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($Form1)
				Return True

			Case $b_start
				GUIDelete($Form1)
				Return False

		EndSwitch
	WEnd

EndFunc   ;==>StartForm
#CS INFO
	102673 V5 5/31/2019 6:26:23 PM V4 5/31/2019 9:17:59 AM V3 5/30/2019 10:14:46 AM V2 5/29/2019 1:14:38 PM
#CE

;Main
Main()

Exit
;~T ScriptFunc.exe V0.54a 15 May 2019 - 6/2/2019 1:14:05 AM
