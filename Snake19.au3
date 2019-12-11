AutoItSetOption("MustDeclareVars", 1)

;If not define then only in script
;Global Static $MESSAGE = True ;Define then DataOut will show in script or compiled
;Global Static $MESSAGE =  False   ;Pause will still work in script  No DataOut

; Must be Declared before _Prf_startup   ~+~+
Global $ver = "0.109 11 Dec 2019 Replay - My Snake - Changed: Too much Dead Snake"

Global $ini_ver = "10" ;Done

;Global $TESTING = False

#include "R:\!Autoit\Blank\_prf_startup.au3"

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=0.1.0.9
#AutoIt3Wrapper_Icon=R:\!Autoit\Ico\prf.ico
#AutoIt3Wrapper_Res_Description=Another snake game
#AutoIt3Wrapper_Res_LegalCopyright=© Phillip Forrestal 2019
#AutoIt3Wrapper_Res_Field=Compile date|%longdate% %time%
#AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Run_Debug_Mode=N

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
	Replay -The hard to cause random action
	Pause durning game by pressing P
	Hid game durning game by pressing H
	Exit game by press Q and NOT Esc.   Using ESC sometime causes the game to completely exit.
	Color changes.  Change layout.  Add Green snake and Gold snake (default)  save users colors

	Save replay
	Load replay
	Change size of screen.  default 30x40

	min button going not min game board, just Main Menu
	 Save load setting
	 Save load scores merge or clear

	Version
;~+~+
	0.109 11 Dec 2019 Replay - My Snake - Changed: Too much Dead Snake
	0.108 10 Dec 2019 Replay - My Snake - Through wall
	0.107 6 Dec 2019 Fix pass wall endless loop
	0.106 21 Nov 2019 About  - Url to program site
	0.105 21 Nov 2019 Replay - My Snake - Back on self
	0.104 19 Nov 2019 Replay - My Snake - Poop
	0.103 6 Nov 2019 Replay - My Snake - Food
	0.102 4 Nov 2019 Changed Snake Lost
	0.101 4 Nov 2019 Replay - Speed
	0.100 2 Nov 2019 Replay - crashes on end

	0.99 1 Nov 2019 Start 31 Oct Replay try 2
	0.98 31 Oct 2019 Start 28 Oct Replay try 1 - Failed removing
	0.97 28 Oct 2019 Change Main Menu to work with Replay
	0.96 28 Oct 2019 Fixed Go Mouse pointer
	0.95 25 Oct 2019 Make color jpg without using capture
	0.94 24 Oct 2019 Main Menu
	0.93 20 Oct 2019 Failled reverted to 0.92
	0.92 18 Oct 2019 Poop better, Other minor fixes
	0.91 18 Oct 2019 Through wall, might not pass straight through
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

Global $g_GameWhich = 1 ; 0 Norma, 1 Mine
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
Global $g_poop[$s_PoopSize][4]
;0 flag, 1 x, 2 y, 3 cnt down
;flag
;0 not used
;1 Waiting to be empty
;2 show

;0.84
Global $g_pooprnd = True

;0.92
Global $g_StartForm
Global $g_SettingForm

;0.98~~
Global $g_iReplaySz = 6000
;if $TESTING Then
;$g_iReplaySz = 100
;endIf
Global $g_aReplay[$g_iReplaySz]
$g_aReplay[0] = 0 ; so replay check has a value, not 10 or 11
Static $s_ReplayRec = 1
Static $s_ReplayPlay = 2
Static $s_ReplayOff = 3
Global $g_Replay = $s_ReplayOff
Global $gb_replay
Global $g_iReplayRecInx = 0
Global $g_iReplayPlyInx = 0

;0.99
Global $g_iTickCnt = 0 ; replay Tick count

;0.100
Global $g_ReplayActive = False

;0.82 0.101
Global $g_TickTime  ; Game Tick Time  To change Tick time in replay this has to be restored in beginning of Main Menu

;0.107  Fix pass wall endless loop
Global $g_PWsnkTruCnt
Global $g_PWfoodCnt
Global $g_PWchance[15]

PassWallDefault()

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
	$g_GameWhich = IniRead($s_ini, "General", "Game", 1)

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
		$g_GameWhich = IniRead($s_ini, "General", "Game", 1)

		IniDelete($s_scoreini, "HighScoreMySnake")
		IniDelete($s_scoreini, "HighScoreNormal")
		IniWrite($s_scoreini, "Score", "Version", $ini_ver)
	EndIf

	IniHighFive()

	Do
		Switch StartForm()
			Case 0 ; end game
				ExitLoop
			Case 1 ; start game
				Game()
			Case 2 ;Loop back to start form

			Case 3 ;replay
				$g_Replay = $s_ReplayPlay
				$g_iReplayPlyInx = 0
				$g_iTickCnt = 0

				If $TESTING Then
					_FileWriteFromArray("Array.txt", $g_aReplay)
					;					_ArrayDisplay($g_aReplay)
				EndIf

				Game()

		EndSwitch

	Until False

EndFunc   ;==>Main
#CS INFO
	126381 V39 12/11/2019 11:54:15 AM V38 11/2/2019 6:19:14 PM V37 11/1/2019 7:15:17 PM V36 10/31/2019 6:10:24 PM
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

		$g_ctrlBoard = GUICreate("Snake19 - " & $ver, $g_boardx * $g_Size, $g_boardy * $g_Size + $b + 2, -1, -1, $ws_popup + $ws_caption)

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

	;Replay reset game to record
	If $g_Replay = $s_ReplayPlay Then
		$g_iTickCnt = 0
		If $g_iReplayPlyInx <> 0 Then
			$g_iReplayPlyInx = 0
		EndIf
	Else
		$g_Replay = $s_ReplayRec
		$g_iReplayRecInx = 0
		$g_iReplayPlyInx = 0
		$g_iTickCnt = 0
	EndIf

	Switch $g_GameWhich
		Case 1
			ReplayRecData(11)
		Case 0
			ReplayRecData(10)
	EndSwitch
	If $g_Replay = $s_ReplayPlay Then  ;skip first record
		$g_iReplayPlyInx += 1
	EndIf

	StartSnake()
	AddFood(True)

	;clear poop
	$g_PWsnkTruCnt = 0 ;start game as 0
	$g_PWfoodCnt = 0

	For $z = 0 To $s_PoopSize - 1
		$g_poop[$z][0] = 0
	Next

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

	;0.91
	PassWallDefault()

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
	If $g_Replay = $s_ReplayPlay Then
		$a = GetReplayPlay(4)
		$g_gChange = $a[3]
	Else
		ReplayRecData(4, $g_gChange) ; Start cell len
	EndIf

	$g_iTickCnt = 0
	$g_hTick = TimerInit()
	Do ;game Loop
		Tick()
		$g_iTickCnt += 1

		$nMsg = GUIGetMsg()
		If $nMsg = $L_idEsc Then
			ExitLoop
		EndIf

		If $g_Replay = $s_ReplayPlay Then

			$a = GetReplayPlay(2)
			;dataout("Replay", 2)
			;dataout($a[0], "Flag 0")
			If $a[0] Then
				$g_dirX = $a[3]
				$g_dirY = $a[4]
				$g_turnNo = $a[5]
			EndIf
			; ReplayRecData(2, $g_dirX, $g_dirY, $g_turnNo)
		Else

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
				ReplayRecData(2, $g_dirX, $g_dirY, $g_turnNo)

			Else ;If $nMsg > 0 Then
				Do
				Until GUIGetMsg() = 0
				If $g_dirX = 0 And $g_dirY = 0 Then
					$g_iTickCnt = 0
					ContinueLoop
				EndIf
			EndIf ;If $nMsg > 0 Then

		EndIf ;Replay if

		If $g_turnNo <> $g_turnLast Then
			$g_turnLast = $g_turnNo
			$g_ScoreTurn += 1
			$g_Turns += 1

		EndIf

		Switch $g_GameWhich
			Case 1
				Extra()
			Case 0
				Normal()
		EndSwitch

	Until $g_endgame ;;game Loop
	GUISetAccelerators(1, $g_ctrlBoard)     ; Turn off Accelerator

	If $g_ReplayActive = False Then
		UpDateHiScore()
	EndIf
	If $g_Replay = $s_ReplayPlay Then
		$a = GetReplayPlay(5)
		Dataout("REC DONE ____-----------------------????----------------")
		Pause()
	Else
		ReplayRecData(5) ; end of game
		Dataout("REC DONE ____-----End of Game----------------------------------")
	EndIf
	$g_Replay = $s_ReplayOff

EndFunc   ;==>Game
#CS INFO
	396309 V64 12/11/2019 11:54:15 AM V63 12/6/2019 2:47:59 PM V62 11/19/2019 1:09:35 PM V61 11/6/2019 5:52:00 PM
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
		If $fdiff > $g_TickTime Then
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
	66094 V17 11/4/2019 9:35:34 AM V16 8/25/2019 6:50:13 PM V15 8/22/2019 6:28:51 PM V14 7/14/2019 10:20:53 AM
#CE INFO

; $g_iscore is extra + length ~~
Func Extra()
	Local $a, $c, $z
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
				;dataout("DoubleBack", $g_Ouch)

				;$flag = DoubleBackWall()
				;$flag = DoubleBack($x_new + $g_dirX,$y_new + $g_dirY)
				$flag = DoubleBack($g_dirX, $g_dirY)
				If $flag Then
					Status(2, "Double back DEAD", 3)
				Else
					Status(0, "Ate too much dead snake or poop", 1)
					$g_endgame = True
					Return
				EndIf

			EndIf
			$a = LostSnake()
			Status(3, "Ate DEAD snake  Yuck!! Lost " & $a & " cells of snake", 1)
			$g_gChange -= $a

			$Map[$what][$x_new + $g_dirX][$y_new + $g_dirY] = $EMPTY
			$g_Ouch = 2
			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

		Case $POOP
			$a = LostSnake()
			$g_gChange -= $a

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value

			Status(3, "Ate  snake POOP  Yuck! Lost " & $a & " cells of snake", 1)
			If $g_Replay = $s_ReplayPlay Then
				$a = GetReplayPlay(20)
				$z = $a[5]
				;dataout("Poop 1", $z)
				$g_poop[$z][0] = 1
				$g_poop[$z][1] = $a[3]
				$g_poop[$z][2] = $a[4]
				$g_poop[$z][3] = $a[6]
				;		ReplayRecData(20,  $x, $y, $z, $g_poop[$Z][3])
			Else
				PoopAdd($x_new + $g_dirX, $y_new + $g_dirY, $s_PoopSize)
			EndIf

		Case $WALL
			WallTrue()

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

			If $g_PWsnkTruCnt > 2 Then
				$g_PWfoodCnt += 1 ; count to 5 then -1 to $g_PWsnkTruCnt
				If $g_PWfoodCnt = 5 Then
					$g_PWfoodCnt = 0
					$g_PWsnkTruCnt -= 1
					If $g_PWsnkTruCnt < 2 Then
						$g_PWsnkTruCnt = 2
					EndIf
				EndIf
			EndIf

			PoopRemove()

			$c = 0
			For $z = 0 To $s_PoopSize - 1
				If $g_poop[$z][0] = 2 Then
					$c += 1
				EndIf
			Next
			If $c < $s_PoopSize Then

				$a = Ceiling($g_SnakeMax / 10)
				If $a < 5 Then
					$a = 5
				EndIf

				If $g_Replay = $s_ReplayPlay Then
					$a = GetReplayPlay(20)
					If $a[0] Then  ; if false no poop out
						$z = $a[5]
						$g_poop[$z][0] = 1
						$g_poop[$z][1] = $a[3]
						$g_poop[$z][2] = $a[4]
						$g_poop[$z][3] = $a[6]
					EndIf

				Else
					If $c < $a Then ; add more poop
						If $a > 5 Or $g_pooprnd Then
							PoopAdd($x_new + $g_dirX, $y_new + $g_dirY)
							$g_pooprnd = False
						Else
							If Random(0, 1, 1) = 1 Then
								PoopAdd($x_new + $g_dirX, $y_new + $g_dirY)
								$g_pooprnd = False
							Else
								$g_pooprnd = True
							EndIf
						EndIf
					EndIf
				EndIf
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
						$g_iScore += 25
						Status(0, "Turn bonus: Score 25 Snake 2", 4)
					EndIf
				Case 3
					$g_gChange += 1
					If $LS_SnakeLenLast = $g_SnakeMax Then
						$g_iScore += 20
						Status(0, "Turn bonus: Score 20 Snake 1", 4)
					Else
						$g_iScore += 10
						Status(0, "Turn bonus: Score 10 Snake 1", 4)
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

			If $TESTING Then
				$g_gChange = 100
			EndIf

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

			;			If $g_PWsnkTruCnt > 2 Then
			;				$g_PWfoodCnt = 4
			;				$g_PWsnkTruCnt = 3
			;			EndIf

			; 3 1= 3 4 2= 3 5 2= 3 6 2=4 7 3=4
			If $g_PWsnkTruCnt > 2 Then
				$g_PWfoodCnt = 4
				$g_PWsnkTruCnt = Ceiling($g_PWsnkTruCnt / 3)
				If $g_PWsnkTruCnt < 3 Then
					$g_PWsnkTruCnt = 3
				EndIf
			EndIf
			;dataout("FOOD2", $g_PWsnkTruCnt)

			PrevNext($x_new + $g_dirX, $y_new + $g_dirY) ;New value
			RemoveSnakeExtra() ;only empty cell change len
			$g_iScore += 10
			Status(0, "Poop Bonus Food: Score 10, Snake 5", 2)

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
	EndIf

EndFunc   ;==>Extra
#CS INFO
	436702 V51 12/11/2019 11:54:15 AM V50 12/10/2019 8:29:16 PM V49 12/6/2019 2:47:59 PM V48 11/21/2019 3:52:08 PM
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
			Switch $g_Turns
				Case 0
					;ReplayRecData(4, 4)
					$g_gChange += 4
					Status(0, "Turn bonus: Snake 4", 4)
				Case 1
					;ReplayRecData(4, 3)
					$g_gChange += 3
					$g_iScore += 80
					Status(0, "Turn bonus: Snake 3", 4)
				Case 2
					;ReplayRecData(4, 2)
					$g_gChange += 2
					$g_iScore += 60
					Status(0, "Turn bonus: Snake 2", 4)
				Case 3
					;ReplayRecData(4, 1)
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
	114253 V12 11/5/2019 12:50:43 AM V11 10/31/2019 6:10:24 PM V10 10/28/2019 1:14:59 PM V9 8/18/2019 11:56:18 AM
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

		For $z = 0 To 6
			$aa[$z] = $Map[$z][$x][$y]
		Next
		_ArrayDisplay($aa)
	EndIf
EndFunc   ;==>ShowRow
#CS INFO
	15377 V3 11/19/2019 1:09:35 PM V2 6/24/2019 11:22:57 PM V1 6/16/2019 10:16:04 AM
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
	Local $x, $y, $a

	If $g_Replay = $s_ReplayPlay Then
		$a = GetReplayPlay(1)
		$x = $a[3]
		$y = $a[4]
	Else
		$x = Int(Random(5, $g_sx - 5))
		$y = Int(Random(5, $g_sy - 5))
		ReplayRecData(1, $x, $y)
	EndIf

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
	41863 V9 12/6/2019 2:47:59 PM V8 11/1/2019 8:41:21 AM V7 10/30/2019 2:05:21 AM V6 10/28/2019 1:14:59 PM
#CE INFO

; Dirx& Diry moving to wall not like Double Back which has reserves direction
; So they will change, I can't make them Global because I used this name as Local in a number of Function.
Func DoubleBackWall() ;(ByRef $dirx, ByRef $diry) ;;~~
	;	$g_dirX, $g_dirY
	Local $a, $flag

	Pause("DoubleBackWall()")
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
	74740 V10 12/11/2019 11:54:15 AM V9 11/21/2019 3:52:08 PM V8 10/20/2019 12:46:58 AM V7 8/18/2019 11:56:18 AM
#CE

Func DoubleBack($dirx, $diry)
	Local $a, $flag
	;new+dir  is one back.
	; Find which X or Y which is the same, then random _+ one on there
	;dataout("DoubleBack")
	If $g_Replay = $s_ReplayPlay Then
		$a = GetReplayPlay(21)
		If $a[0] Then              ; if false not at location
			PrevNext($a[3], $a[4])
			RemoveSnakeExtra()     ;Same size
			Return True
		EndIf
	Else
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
				ReplayRecData(21, $x_new + $a, $y_new + $diry)
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
				ReplayRecData(21, $x_new + $dirx, $y_new + $a)
				PrevNext($x_new + $dirx, $y_new + $a)
				RemoveSnakeExtra() ;Same size
			EndIf
		EndIf
	EndIf
	Return $flag

EndFunc   ;==>DoubleBack
#CS INFO
	80678 V5 12/10/2019 8:29:16 PM V4 11/21/2019 3:52:08 PM V3 8/25/2019 6:50:13 PM V2 6/20/2019 9:30:52 PM
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
	Local $x, $y, $a

	If Not $start Then ;Force start with one food  below math sometime cause 0 food on start

		$x = Int(($Map[$num][$x_new][$y_new] - $Map[$num][$x_end][$y_end]) / 100) + 1
		If $x > 2 Then ; Only 2 foods
			$x = 2
		EndIf

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

		If $g_Replay = $s_ReplayPlay Then
			$a = GetReplayPlay(3) ;normal
			$x = $a[3]
			$y = $a[4]
		Else
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
			;DataOut("Record 3 Food")
			ReplayRecData(3, $x, $y) ;normal

		EndIf

	Else ;MyGame
		If $g_Replay = $s_ReplayPlay Then
			$a = GetReplayPlay(3) ;extra
			$x = $a[3]
			$y = $a[4]
		Else
			Do
				$x = Random(1, $g_sx, 1)
				$y = Random(1, $g_sy, 1)
			Until $Map[$what][$x][$y] = $EMPTY
			ReplayRecData(3, $x, $y) ;extra
		EndIf
	EndIf

	$Map[$what][$x][$y] = $FOOD
	GUICtrlSetImage($Map[$ctrl][$x][$y], $cFOOD)

EndFunc   ;==>AddFood
#CS INFO
	105394 V20 11/19/2019 1:09:35 PM V19 11/6/2019 5:52:00 PM V18 11/5/2019 12:50:43 AM V17 11/1/2019 8:41:21 AM
#CE INFO

Func ClearBoard()
	Local $var, $NotEmpty

	SayClearBoard(True, False)

	For $y = 0 To $g_boardy - 1
		For $x = 0 To $g_boardx - 1
			Select
				Case $x = 0 Or $x = $g_boardx - 1 Or $y = 0 Or $y = $g_boardy - 1
					$Map[$what][$x][$y] = $WALL     ;outside edge  does need to change picture
					;$var = $cEDGE
				Case Else
					$NotEmpty = $Map[$what][$x][$y] <> $EMPTY
					$Map[$what][$x][$y] = $EMPTY     ; empty
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
	If $g_GameWhich = 0 Then     ; 0 Normal, 1 Mine
		GUICtrlSetState($Radio1, $GUI_CHECKED)

		If $g_iReplayRecInx = 0 Or $g_aReplay[0] <> 10 Then
			GUICtrlSetState($gb_replay, $GUI_HIDE)
		Else
			GUICtrlSetState($gb_replay, $GUI_SHOW)
		EndIf
	Else
		GUICtrlSetState($Radio2, $GUI_CHECKED)
		If $g_iReplayRecInx = 0 Or $g_aReplay[0] <> 11 Then
			GUICtrlSetState($gb_replay, $GUI_HIDE)
		Else
			;If $TESTING = False Then
			;	GUICtrlSetState($gb_replay, $GUI_HIDE)
			;Else
			GUICtrlSetState($gb_replay, $GUI_SHOW)
			;EndIf
		EndIf
	EndIf
	ReadHiScore()
	DisplayHiScore()
EndFunc   ;==>NormalExtra
#CS INFO
	44352 V6 11/6/2019 6:00:26 PM V5 11/2/2019 6:19:14 PM V4 10/30/2019 2:05:21 AM V3 8/11/2019 11:35:36 PM
#CE INFO

Func DisplayHiScore()
	Local $s

	If $g_GameWhich = 0 Then     ; 0 Normal, 1 Mine
		GUICtrlSetData($g_HiScoreWho, "High Score - Normal Snake")
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
		GUICtrlSetData($g_HiScoreWho, "High Score - My Snake")
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
	102931 V9 12/11/2019 11:54:15 AM V8 10/20/2019 12:46:58 AM V7 7/24/2019 11:20:48 PM V6 7/24/2019 12:53:35 PM
#CE

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
		If $g_GameWhich = 0 Then     ; 0 Normal, 1 Mine
			$g_aHiScore[11][2] = $g_SnakeCount
		Else
			$g_aHiScore[11][2] = $g_SnakeMax
		EndIf
		$g_aHiScore[11][3] = $g_ScoreFood
		$g_aHiScore[11][4] = $g_ScoreTurn

		_ArraySort($g_aHiScore, 1, 1, 11)
		SaveHiScore()
		Sleep(4000)
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
	74544 V15 11/4/2019 9:35:34 AM V14 7/24/2019 11:20:48 PM V13 7/18/2019 11:32:28 PM 123V12 7/13/2019 7:36:11 PM
#CE INFO

Func SaveHiScore()
	Local $x, $a[12][2]

	For $x = 1 To 10
		$a[$x][0] = String($x)
		$a[$x][1] = $g_aHiScore[$x][0] & "|" & $g_aHiScore[$x][1] & "|" & $g_aHiScore[$x][2] & "|" & $g_aHiScore[$x][3] & "|" & $g_aHiScore[$x][4] & "|" & $g_aHiScore[$x][5]
	Next
	$a[0][0] = 10
	If $g_GameWhich = 0 Then     ; 0 Normal, 1 Mine
		$x = IniWriteSection($s_scoreini, "HighScoreNormal", $a)
	Else
		$x = IniWriteSection($s_scoreini, "HighScoreMySnake", $a)
	EndIf

EndFunc   ;==>SaveHiScore
#CS INFO
	33617 V7 12/11/2019 11:54:15 AM V6 7/24/2019 11:20:48 PM V5 7/13/2019 7:20:00 PM V4 6/16/2019 10:16:04 AM
#CE

Func IniHighFive()
	Local $a, $c, $z, $Save
	$Save = $g_GameWhich

	For $x = 0 To 1
		$g_GameWhich = $x
		If $g_GameWhich = 0 Then     ; 0 Normal, 1 Mine
			$a = IniReadSection($s_scoreini, "HighScoreNormal")
		Else
			$a = IniReadSection($s_scoreini, "HighScoreMySnake")
		EndIf
		If @error = 0 Then

			For $i = 1 To 10
				If $i > 8 Then
					$g_aHiScore[$i][0] = 0     ;
					$g_aHiScore[$i][1] = ""     ;date
					$g_aHiScore[$i][2] = ""     ;len
					$g_aHiScore[$i][3] = ""     ;food
					$g_aHiScore[$i][4] = ""     ;turns
					$g_aHiScore[$i][5] = ""     ;Max
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
	56710 V6 12/11/2019 11:54:15 AM V5 11/19/2019 1:09:35 PM V4 10/8/2019 4:57:52 PM V3 7/24/2019 11:20:48 PM
#CE

Func ReadHiScore()
	Local $a, $c, $z
	If $g_GameWhich = 0 Then     ; 0 Normal, 1 Mine
		$a = IniReadSection($s_scoreini, "HighScoreNormal")
	Else
		$a = IniReadSection($s_scoreini, "HighScoreMySnake")
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
		$g_first = False     ; first run since startup

	Else
		For $i = 1 To 10     ; not found load
			$g_aHiScore[$i][0] = 0     ;
			$g_aHiScore[$i][1] = ""     ;date
			$g_aHiScore[$i][2] = ""     ;len
			$g_aHiScore[$i][3] = ""     ;food
			$g_aHiScore[$i][4] = ""     ;turns
			$g_aHiScore[$i][5] = ""     ;Max
		Next
		SaveHiScore()
	EndIf
EndFunc   ;==>ReadHiScore
#CS INFO
	55393 V9 12/11/2019 11:54:15 AM V8 11/19/2019 1:09:35 PM V7 10/8/2019 4:57:52 PM V6 7/24/2019 11:20:48 PM
#CE

;Load Level from THE GAME
; to remove Run again
Func SayClearBoard($OnOff = False, $Mode = True)     ; $OnOff = True/False

	Local Static $PleaseWait = 0
	Local $x, $y, $aPos

	If $OnOff Then
		If $Mode Then
			$PleaseWait = GUICreate("", 186, 92, -1, -1, -1, BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE))
			GUICtrlCreateLabel("Generating  Board", 8, 8, 170, 25, $SS_CENTER)
		Else
			$aPos = WinGetPos($g_ctrlBoard)     ;786/708
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
Func CheckColorJpg($filename, $color)     ; $color is only the default color if INI color then use it.
	Local $a

	$a = IniRead($s_ini, "Color", $filename, "X")

	If FileExists($g_data & "\" & $filename & ".jpg") = 0 Then     ;Not found

		If $a <> "X" Then     ; if INI exist then use INI
			$color = $a
		EndIf
		CreateColorJpg($filename, $color)
		Return
	EndIf

	If $a = "X" Then     ;COLOR in INI does not exist use $color
		CreateColorJpg($filename, $color)
		Return
	EndIf

EndFunc   ;==>CheckColorJpg
#CS INFO
	35555 V4 10/11/2019 3:14:30 PM V3 8/16/2019 8:51:46 AM V2 7/14/2019 10:10:20 PM V1 7/14/2019 10:20:53 AM
#CE INFO

;Create Color file and write INI
Func CreateColorJpg($filename, $color)
	CreateJpg($color, $g_data & "\" & $filename & ".jpg")
	IniWrite($s_ini, "Color", $filename, "0x" & Hex($color, 6))
EndFunc   ;==>CreateColorJpg
#CS INFO
	13853 V8 10/25/2019 12:29:56 AM V7 10/13/2019 1:37:57 PM V6 10/11/2019 3:14:30 PM V5 8/22/2019 8:37:33 AM
#CE INFO

Func StartForm()
	;Local $FormMainMenu ; , $Group1
	Local $Radio3, $Checkbox1, $b_start, $b_setting, $b_about
	Local $nMsg, $L_Tick
	Local $a = 260
	Local $b = 50
	Local $c = 200     ;120
	Local $gameLoc, $x, $y, $done

	$g_ReplayActive = False

	Local $sMainMenuTitle = "Snake19 - Main Menu"

	If $g_ctrlBoard = -1 Then
		$g_StartForm = GUICreate($sMainMenuTitle, 600, 600, -1, -1)
	Else
		$gameLoc = WinGetPos($g_ctrlBoard)     ;x=0, y=1

		$x = ($gameLoc[2]) / 2 - 300 + $gameLoc[0]
		$y = ($gameLoc[3]) / 2 - 300 + $gameLoc[1]

		$g_StartForm = GUICreate($sMainMenuTitle, 600, 600, $x, $y)     ;  ,-1 -1, $g_ctrlBoard)  adding this and the program crashes.
	EndIf

	GUICtrlCreateLabel("Snake 19", 0, 0, 600, 24, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Arial")

	GUICtrlCreateLabel($ver, 0, 18, 600, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 8, 400, 0, "Arial")

	GUICtrlCreateLabel("Type of Game", 0, 32, 600, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 10, 900, 0, "Arial")

	GUIStartGroup()
	$Radio1 = GUICtrlCreateRadio("Normal Snake", $a, $b + 20, $c, 20)
	GUICtrlSetFont(-1, 10, 800, 0, "Arial")
	$Radio2 = GUICtrlCreateRadio("My Snake", $a, $b, $c, 20)
	GUICtrlSetFont(-1, 10, 800, 0, "Arial")

	$b += 40

	$g_HiScoreWho = GUICtrlCreateLabel("High Score - My Snake", $a, $b, $c + 60, 24)     ; Height is twice font size
	GUICtrlSetFont(-1, 10, 400, 0, "Arial")
	$a = 50
	$b += 20

	For $x = 0 To 9
		$g_HiScore[$x] = GUICtrlCreateLabel(String($x + 1), $a, $b, 500, 24)     ; Height is twice font size
		GUICtrlSetFont($g_HiScore[$x], 10, 400, 0, "Arial")
		$b += 20
	Next

	$b_setting = GUICtrlCreateButton("Setting", 50, 550, 75, 35)
	$b_about = GUICtrlCreateButton("About", 500, 550, 75, 35)
	$gb_replay = GUICtrlCreateButton("Replay", 270 + 75 + 25, 550, 75, 35)
	$b_start = GUICtrlCreateButton("GO", 270, 550, 75, 35)

	Local $Edit1 = GUICtrlCreateEdit("", 20, $b, 550, 230, $ES_READONLY)
	GUICtrlSetFont($Edit1, 10, 400, 0, "Arial")
	GUICtrlSetData($Edit1, "Press ESC to quit." & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)
	GUICtrlSetData($Edit1, "If you lose Focus or Minimize the game, it will PAUSE" & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)

	GUICtrlSetData($Edit1, "Normal Snake" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Food increase Snake by 1.  Score +1 per food pickup.  There is a bonus." & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)

	GUICtrlSetData($Edit1, "My Snake" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Food increase Snake by 1.  A special food will get you more." & @CRLF, 1)
	GUICtrlSetData($Edit1, @CRLF, 1)
	GUICtrlSetData($Edit1, "My Snake Bonus:" & @CRLF, 1)
	GUICtrlSetData($Edit1, " Snake can 'double back' on self. Pass threw Wall to other side. But loose X cells." & @CRLF, 1)
	GUICtrlSetData($Edit1, " Snake does not like to Turn so, so few turns and Food increase snake & score" & @CRLF, 1)
	GUICtrlSetData($Edit1, "  Too many turns Snake gets shorter", 1)

	GUISetState(@SW_SHOW)

	;restored here because Replay will change it.
	$g_TickTime = IniRead($s_ini, "General", "Speed", 150)

	;Move mouse to the GO button
	$a = WinGetPos(GUICtrlGetHandle($b_start))
	MouseMove($a[0] + (75 / 2), $a[1] + (35 / 2), 0)

	NormalExtra()

	While 1
		If WinGetTitle("[ACTIVE]") <> $sMainMenuTitle Then
			Sleep(3000)
			ControlFocus($g_StartForm, "", $b_start)
		EndIf
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				GUIDelete($g_StartForm)
				Return 0

			Case $b_about
				GUIDelete($g_StartForm)
				If $g_ctrlBoard <> -1 Then
					GUISetState(@SW_DISABLE, $g_ctrlBoard)
				EndIf
				About()
				If $g_ctrlBoard <> -1 Then
					GUISetState(@SW_ENABLE, $g_ctrlBoard)
				EndIf
				Return 2
			Case $b_setting
				GUIDelete($g_StartForm)
				If $g_ctrlBoard <> -1 Then
					GUISetState(@SW_DISABLE, $g_ctrlBoard)
				EndIf
				Settings()
				If $g_ctrlBoard <> -1 Then
					GUISetState(@SW_ENABLE, $g_ctrlBoard)
				EndIf
				Return 2

			Case $gb_replay

				GUIDelete($g_StartForm)

				Local $FormReplay = GUICreate("Replay Speed", 600, 200, -1, -1)
				GUICtrlCreateLabel("Replay - Works for Normal Snake. - Testing My Snake.", 20, 40, 540, 20, $SS_CENTER)
				GUICtrlSetFont(-1, 14, 800, 0, "Arial")
				GUICtrlCreateLabel("ESC to stop --- Pick speed Below", 20, 60, 540, 20, $SS_CENTER)
				GUICtrlSetFont(-1, 14, 400, 0, "Arial")
				Local $b_rpStd = GUICtrlCreateButton("Std 150ms", 40, 150, 100, 40)
				Local $b_rp200 = GUICtrlCreateButton("200ms", 180, 150, 100, 40)
				Local $b_rp100 = GUICtrlCreateButton("100ms", 300, 150, 100, 40)
				Local $b_rpfull = GUICtrlCreateButton("Full", 420, 150, 100, 40)
				GUISetState(@SW_SHOW)

				$L_Tick = 150
				$done = 3     ; start replay

				While 1
					Local $nMsg = GUIGetMsg()
					Switch $nMsg
						Case $GUI_EVENT_CLOSE
							$done = 2     ;restart Start Form
							ExitLoop
						Case $b_rpStd
							$L_Tick = 150
							ExitLoop
						Case $b_rp200
							$L_Tick = 200
							ExitLoop
						Case $b_rp100
							$L_Tick = 100
							ExitLoop
						Case $b_rpfull
							$L_Tick = 0
							ExitLoop

					EndSwitch
				WEnd
				GUIDelete($FormReplay)
				$g_ReplayActive = True
				$g_TickTime = $L_Tick
				Return $done

			Case $b_start
				GUIDelete($g_StartForm)
				Return 1

			Case $Radio1     ;Normal
				$g_GameWhich = 0
				NormalExtra()

			Case $Radio2     ; Extra
				$g_GameWhich = 1
				NormalExtra()

		EndSwitch
	WEnd
	MsgBox(0, "ERROR", "You shound never see me")
	pause()

EndFunc   ;==>StartForm
#CS INFO
	357904 V41 12/11/2019 11:54:15 AM V40 11/6/2019 6:00:26 PM V39 11/6/2019 5:52:00 PM V38 11/4/2019 9:35:34 AM
#CE

Func Settings()
	Local $y

	$g_SettingForm = GUICreate("Change Setting", 600, 150)     ;, -1, -1, -1, -1, $g_StartForm)
	GUICtrlCreateLabel("Settings", 260, 0, 80, 26, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "Arial")

	;47,183,320,456  - 50 100
	Local $b_about = GUICtrlCreateButton("About", 47, 50, 97, 33)
	Local $b_ScreenSize = GUICtrlCreateButton("Screen Size", 183, 50, 97, 33)
	Local $b_Color = GUICtrlCreateButton("Colors", 320, 50, 97, 33)
	Local $b_speed = GUICtrlCreateButton("Speed", 456, 50, 97, 33)

	;Local $b_Adj = GUICtrlCreateButton("Adjust Values", 320, 100, 97, 33) see below
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
				;Case $b_Adj   Going to use buttons in setting  Combo menu is broken
				;	AdjustValues()
				;	ExitLoop
			Case $b_Uni
				DeleteData()
		EndSwitch
	WEnd

	GUIDelete($g_SettingForm)
EndFunc   ;==>Settings
#CS INFO
	77379 V11 10/28/2019 1:14:59 PM V10 10/20/2019 1:07:26 AM V9 10/20/2019 12:46:58 AM V8 10/18/2019 9:17:20 AM
#CE INFO

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

	$sInputBoxAnswer = InputBox("Cell size", $s, $Math, "", -1, -1, Default, Default, 0, $g_SettingForm)
	$err = @error
	Select
		Case $err = 1     ; Cancle was pushed
			Return

		Case $err = 0     ;OK - The string returned is valid
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
	85600 V5 10/20/2019 1:07:26 AM V4 8/25/2019 6:50:13 PM V3 8/18/2019 11:15:59 PM V2 8/16/2019 8:51:46 AM
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

	$Form1 = GUICreate("Colors", 150, 600, -1, -1, -1, -1, $g_SettingForm)
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

	Local $b_save = GUICtrlCreateButton("  Save  ", 40, 510)     ;, 50, 50)
	Local $b_all = GUICtrlCreateButton("  Regenerate ALL  ", 20, 570)     ;, 50, 50)

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
				For $x = 1 To 7
					CreateJpg($r_what[$x][3], $g_data & "\" & $r_what[$x][1] & ".jpg")
				Next
				$restart = True
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
	314692 V13 10/25/2019 12:29:56 AM V12 10/20/2019 1:07:26 AM V11 10/13/2019 1:37:57 PM V10 10/11/2019 3:14:30 PM
#CE INFO

Func LostSnake()
	Local $a

	$g_PWsnkTruCnt += 1
	$g_PWfoodCnt = 0

	$a = $g_PWsnkTruCnt
	If $a > 10 Then
		$a = 10
	EndIf
	Return $a
EndFunc   ;==>LostSnake
#CS INFO
	10491 V2 11/19/2019 1:09:35 PM V1 11/5/2019 12:50:43 AM
#CE INFO

;Search the poop array for time out
;0 flag, 1 x, 2 y, 3 cnt down
;flag
;0 not used
;1 Waiting to be empty
;2 show

Func PoopRemove()
	For $z = 0 To $s_PoopSize - 1
		If $g_poop[$z][0] = 2 Then
			If $Map[$what][$g_poop[$z][1]][$g_poop[$z][2]] = $POOP Then     ;make sure poop exists
				If $g_poop[$z][3] = 0 Then     ;delay = 0
					$g_poop[$z][0] = 0     ;delay is time out
					If $z = 0 Then     ;if zero then is a super food.
						$Map[$what][$g_poop[$z][1]][$g_poop[$z][2]] = $FOOD2
						GUICtrlSetImage($Map[$ctrl][$g_poop[$z][1]][$g_poop[$z][2]], $cFOOD)
					Else
						$Map[$what][$g_poop[$z][1]][$g_poop[$z][2]] = $EMPTY     ; normal remove
						GUICtrlSetImage($Map[$ctrl][$g_poop[$z][1]][$g_poop[$z][2]], $cEMPTY)
					EndIf
				Else
					$g_poop[$z][3] -= 1     ;delay count down
				EndIf
			Else     ; Not Poop, clear this point if not snake
				If $Map[$what][$g_poop[$z][1]][$g_poop[$z][2]] <> $SNAKE Then
					$g_poop[$z][0] = 0
				EndIf
			EndIf
		EndIf
	Next
EndFunc   ;==>PoopRemove
#CS INFO
	61489 V5 11/19/2019 1:09:35 PM V4 10/20/2019 12:46:58 AM V3 8/25/2019 6:50:13 PM V2 8/25/2019 9:54:57 AM
#CE INFO

;Add poop array: Poop will replace food once this loction is empty
Func PoopAdd($x, $y, $delay = $s_PoopSize / 4 + Random(0, Ceiling($s_PoopSize / 3), 1))

	For $z = 0 To $s_PoopSize - 1
		If $g_poop[$z][0] = 0 Then
			If $Map[$what][$x][$y] <> $POOP Then
				$g_poop[$z][0] = 1
				$g_poop[$z][1] = $x
				$g_poop[$z][2] = $y
				$g_poop[$z][3] = $delay + Random(0, 5, 1)
				ReplayRecData(20, $x, $y, $z, $g_poop[$z][3])
				;Status(3, "Add Poop " & $Z & " - " & $delay, 2)
				Return
			EndIf
		EndIf
	Next
EndFunc   ;==>PoopAdd
#CS INFO
	29508 V7 11/19/2019 1:09:35 PM V6 10/24/2019 11:03:40 AM V5 10/20/2019 12:46:58 AM V4 8/25/2019 6:50:13 PM
#CE INFO

;0 flag, 1 x, 2 y, 3 cnt down
;flag
;0 not used
;1 Waiting to be empty
;2 show

;This location will be poop when empty
Func PoopShow($x, $y)
	For $z = 0 To $s_PoopSize - 1
		If $g_poop[$z][0] = 1 Then
			If $g_poop[$z][1] = $x And $g_poop[$z][2] = $y Then
				$g_poop[$z][0] = 2
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
	23709 V5 11/19/2019 1:09:35 PM V4 8/25/2019 6:50:13 PM V3 8/24/2019 6:38:07 PM V2 8/21/2019 10:30:33 PM
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

	$GUI = GUICreate("Test Script", 300, 200, -1, -1, -1, -1, $g_SettingForm)
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
	If $g_TickTime <> $last Then     ;no change skip save
		$g_TickTime = $last
		IniWrite($s_ini, "General", "Speed", $g_TickTime)
	EndIf
EndFunc   ;==>Speed
#CS INFO
	99196 V4 10/20/2019 1:07:26 AM V3 8/28/2019 11:39:16 AM V2 8/26/2019 10:02:39 AM V1 8/22/2019 6:28:51 PM
#CE INFO

Func TickSpeed($speed)     ;
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
	Local $Form1 = GUICreate("Snake19 - Setup Data - " & $ver, 615, 430, -1, -1, $ws_popup + $ws_caption)
	GUICtrlCreateLabel("Welcome to Snake19 data setup - " & $ver, 0, 24, 610, 28, $SS_CENTER)
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
	173822 V3 11/19/2019 1:09:35 PM V2 10/13/2019 1:37:57 PM V1 10/11/2019 3:14:30 PM
#CE INFO

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

	Local $Form1 = GUICreate("Snake19 - Remove Data - " & $ver, 615, 294, -1, -1, $ws_popup + $ws_caption, -1, $g_SettingForm)
	GUICtrlCreateLabel("Thanks for using the Snake19 game - " & $ver, 0, 24, 610, 28, $SS_CENTER)
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
	141228 V3 11/19/2019 1:09:35 PM V2 10/20/2019 1:07:26 AM V1 10/13/2019 1:37:57 PM
#CE INFO

Func About()
	Local $MyUrl, $FormAbout, $Message
	$FormAbout = GUICreate("Snake19 - About", 615, 430, -1, -1, $ws_popup + $ws_caption)
;~+~+
	;$Message &= "|
	$Message = "0.109 11 Dec 2019 Replay - My Snake - Changed: Too much Dead Snake"
	$Message &= "|0.108 10 Dec 2019 Replay - My Snake - Through wall"
	$Message &= "|0.107 6 Dec 2019 Fix pass wall endless loop"
	$Message &= "|0.106 21 Nov 2019 About  - Url to program site"
	$Message &= "|0.105 21 Nov 2019 Replay - My Snake - Back on self"
	$Message &= "|0.104 19 Nov 2019 Replay - My Snake - Poop"
	$Message &= "|0.103 6 Nov 2019 Replay - My Snake - Food"
	$Message &= "|0.102 4 Nov 2019 Changed Snake Lost"
	$Message &= "|0.101 4 Nov 2019 Replay - Speed"
	$Message &= "|0.100 2 Nov 2019 Replay - crashes on end"
	$Message &= "||0.99 1 Nov 2019 Replay try 2"
	$Message &= "|0.98 31 Oct 2019 Str 28 Oct Replay Failed removing"
	$Message &= "|0.97 28 Oct 2019 Change Main Menu to work with Replay"
	$Message &= "|0.96 28 Oct 2019 Fixed Go Mouse pointer"
	$Message &= "|0.95 25 Oct 2019 Make color jpg without using capture"
	$Message &= "|0.94 24 Oct 2019 Main Menu"
	$Message &= "|0.93 20 Oct 2019 Problems, removed"
	$Message &= "|0.92 19 Oct 2019 Poop better, Other minor fixes"
	$Message &= "|0.91 18 Oct 2019 Through wall, might not pass straight through"
	$Message &= "|0.90 12 Oct 2019 Win 7 and up, data in Appdata.  Add start up check, if missing ask box.| Remove data from Appdata: Menu, Settings, Delete Data.  About, Version"

	GUICtrlCreateLabel("Welcome to Snake19", 0, 24, 617, 28, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
	GUICtrlCreateLabel("Copyright (C) 2019 -- by Phillip Forrestal", 0, 104, 620, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlCreateLabel("", 0, 60, 618, 20, $SS_CENTER)
	GUICtrlSetData(-1, "Snake 19 -beta but working version " & $ver)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

	$MyUrl = GUICtrlCreateLabel("", 0, 80, 618, 20, $SS_CENTER + $SS_NOTIFY)
	GUICtrlSetData(-1, "https://github.com/rushlight-2019/Snake19")
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")

	GUICtrlCreateLabel("Versions", 24, 136, 70, 24)
	GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")

	GUICtrlCreateList("", 32, 160, 548, 196, BitAND($GUI_SS_DEFAULT_LIST, BitNOT($LBS_SORT)))
	GUICtrlSetData(-1, $Message)

	GUICtrlCreateLabel("________________________________________________________________________________________________", 16, 360, 580, 17)

	Local $Button1 = GUICtrlCreateButton("Click", 270, 392, 75, 25)
	GUISetState(@SW_SHOW)

	Local $set_1 = True
	Local $set_2 = False
	Local $array

	While 1
		Local $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $MyUrl
				ShellExecute("https://github.com/rushlight-2019/Snake19")
			Case $Button1
				ExitLoop
		EndSwitch

		;change color of label when mouse hovers it
		$array = GUIGetCursorInfo($FormAbout)

		If $array[4] = $MyUrl Then
			;dataout($array[4], $set_1)
			If Not $set_1 Then ;avoid flickering
				GUICtrlSetColor($MyUrl, 0xFF0000) ; RRGGBB
				$set_1 = True
				$set_2 = False
			EndIf
		Else
			If Not $set_2 Then ;avoid flickering
				GUICtrlSetColor($MyUrl, 0x0000FF)
				$set_1 = False
				$set_2 = True
			EndIf
		EndIf

	WEnd

	GUIDelete($FormAbout)
EndFunc   ;==>About
#CS INFO
	226508 V19 12/11/2019 11:54:15 AM V18 12/10/2019 8:29:16 PM V17 12/6/2019 2:47:59 PM V16 11/21/2019 3:52:08 PM
#CE

Func SetCellSide()
	Pause("SetCellSide")
EndFunc   ;==>SetCellSide
#CS INFO
	5273 V1 10/8/2019 4:57:52 PM
#CE INFO

;------ Pass Wall

Func HelpPassWall()
	Local $a
	Local $Form1 = GUICreate("HELP - Hitting a Wall ", 600, 210, -1, -1, $ws_popup + $ws_caption, -1, $g_StartForm)

	$a = 20
	GUICtrlCreateLabel("Snake Hitting a Wall", 32, $a, 550, 28)
	GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")

	$a += 30
	GUICtrlCreateLabel("NORMAL SNAKE: Can not pass through wall.  -  Snake will die - Ate Wall", 32, $a, 550, 24)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	$a += 30
	GUICtrlCreateLabel("MY SNAKE: Can pass through wall. - Very rare: Snake will die.", 32, $a, 550, 24)
	GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
	$a += 30
	GUICtrlCreateLabel("The wall is thick and snake might not pass straight through.", 35, $a, 550, 20)
	GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
	$a += 20
	GUICtrlCreateLabel("If something on  the other side. The snake will find a free area.", 35, $a, 550, 20)
	GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
	$a += 30
	Local $Button1 = GUICtrlCreateButton("OK", 32, $a, 90, 25)
	GUISetState(@SW_SHOW)
	;pause($a, $a+50)

	While 1
		Local $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button1
				ExitLoop
		EndSwitch
	WEnd

	GUIDelete($Form1)

EndFunc   ;==>HelpPassWall
#CS INFO
	79795 V2 10/20/2019 12:46:58 AM V1 10/18/2019 9:17:20 AM
#CE INFO

Func WallTrue()
	Local $a, $flag, $x, $y, $z, $offset, $kx, $ky, $upedge, $downedge, $direction

	$x = $x_new
	$y = $y_new

	$offset = PWrandom()

	$flag = False
	;Which edge snake ran into - check to see if other side is EMPTY
	Select
		Case $x = 1
			$x = $g_sx
			$y = PWedge($y, $offset, $g_sy, $flag) ; $flag True  pass edge and return not valid
		Case $y = 1
			$y = $g_sy
			$x = PWedge($x, $offset, $g_sx, $flag)
		Case $x = $g_sx
			$x = 1
			$y = PWedge($y, $offset, $g_sy, $flag)
		Case $y = $g_sy
			$y = 1
			$x = PWedge($x, $offset, $g_sx, $flag)
	EndSelect

	If $Map[$what][$x][$y] <> $EMPTY Then
		$kx = $x
		$ky = $y
		$offset = 1
		$direction = 1  ; 1 down -1 up

		$upedge = False
		$downedge = False

		While True

			$x = $kx ; $x or $y changes  so on start of loop they are reset
			$y = $ky

			If ($direction = 1 And Not $downedge) Or ($direction = -1 And Not $upedge) Then
				Select
					Case $x = 1
						$y = PWedge($y, $offset * $direction, $g_sy, $flag)
					Case $y = 1
						$x = PWedge($x, $offset * $direction, $g_sx, $flag)
					Case $x = $g_sx
						$y = PWedge($y, $offset * $direction, $g_sy, $flag)
					Case $y = $g_sy
						$x = PWedge($x, $offset * $direction, $g_sx, $flag)
				EndSelect

				If Not $flag Then
					If $Map[$what][$x][$y] = $EMPTY Then
						ExitLoop
					EndIf
				EndIf

			EndIf

			If $direction = 1 And $downedge = False Then
				$downedge = $flag
			ElseIf $direction = -1 And $upedge = False Then
				$upedge = $flag
			EndIf

			If $downedge And $upedge Then ;Fails - Snake Die
				Status(0, "Ate Wall, no way out", 1)
				$g_endgame = True
				Return
			EndIf

			If $direction = 1 Then
				$direction = -1
			Else
				$direction = 1
				$offset += 1
			EndIf
		WEnd
	EndIf

	If $Map[$what][$x][$y] = $EMPTY Then
		$a = LostSnake()
		Status(2, "Pass threw WALL: Lose " & $a, 3)
		$g_gChange -= $a

		If $g_Replay = $s_ReplayPlay Then
			$a = GetReplayPlay(30)
			If $a[0] Then          ; if false not at location
				;	Dataout("Pass threw Wall")
				;	Dataout($a[3], $a[4])
				PrevNext($a[3], $a[4])
				RemoveSnakeExtra() ;Same size
				Return True
			EndIf
		Else
			ReplayRecData(30, $x, $y) ; Start cell len
		EndIf

		PrevNext($x, $y)
		;		Dataout("Pass threw Wall")
		;		Dataout($x, $y)
		RemoveSnakeExtra()     ;Same size
	Else
		MsgBox(0, "ERROR", "Should next get to this point 1")
	EndIf

EndFunc   ;==>WallTrue
#CS INFO
	154119 V9 12/11/2019 11:54:15 AM V8 12/10/2019 8:29:16 PM V7 12/6/2019 2:47:59 PM V6 11/19/2019 1:09:35 PM
#CE

Func PWedge($xy, $offset, $far, ByRef $foundEdge)     ; 2nd output $flag True  pass edge and return not valid
	$foundEdge = False

	;	dataout("PWedge", $xy)
	;	dataout("$offset", $offset)
	;	dataout("$xy + $offset", $xy + $offset)
	;	dataout("$far", $far)

	If $offset < 0 Then
		If $xy + $offset < 1 Then
			$foundEdge = True
			Return $xy
		EndIf
	Else
		If $xy + $offset > $far Then
			$foundEdge = True
			Return $xy
		EndIf
	EndIf

	Return $xy + $offset

EndFunc   ;==>PWedge
#CS INFO
	33526 V3 12/11/2019 11:54:15 AM V2 12/6/2019 2:47:59 PM V1 10/18/2019 9:17:20 AM
#CE

Func PassWallDefault()
	$g_PWchance[0] = -2
	$g_PWchance[1] = -2
	$g_PWchance[2] = -1
	$g_PWchance[3] = -1
	$g_PWchance[4] = -1
	$g_PWchance[5] = 0
	$g_PWchance[6] = 0
	$g_PWchance[7] = 0
	$g_PWchance[8] = 0
	$g_PWchance[9] = 0
	$g_PWchance[10] = 1
	$g_PWchance[11] = 1
	$g_PWchance[12] = 1
	$g_PWchance[13] = 2
	$g_PWchance[14] = 2

	$g_PWsnkTruCnt = 0     ;
	$g_PWfoodCnt = 0     ; count to 5 then -1 to $g_PWsnkTruCnt
EndFunc   ;==>PassWallDefault
#CS INFO
	30967 V4 12/6/2019 2:47:59 PM V3 11/5/2019 12:50:43 AM V2 10/24/2019 11:03:40 AM V1 10/18/2019 9:17:20 AM
#CE INFO

Func PWrandom()
	Local $a, $b, $c

	$a = Random(0, 14, 1)     ;Dim 0-14 = 15
	Return $g_PWchance[$a]
EndFunc   ;==>PWrandom
#CS INFO
	7828 V3 12/11/2019 11:54:15 AM V2 12/6/2019 2:47:59 PM V1 10/18/2019 9:17:20 AM
#CE

;----------------------------------------------------
; In Color out Picture using color
Func CreateJpg($color, $picture)
	_GDIPlus_Startup()
	Local Const $iW = 50, $iH = 50
	Local $hBitmap = _GDIPlus_BitmapCreateFromScan0($iW, $iH)     ;create an empty bitmap
	Local $hBmpCtxt = _GDIPlus_ImageGetGraphicsContext($hBitmap)     ;get the graphics context of the bitmap
	_GDIPlus_GraphicsSetSmoothingMode($hBmpCtxt, $GDIP_SMOOTHINGMODE_HIGHQUALITY)
	_GDIPlus_GraphicsClear($hBmpCtxt, 0xFF000000 + $color)     ;clear bitmap with color

	_GDIPlus_ImageSaveToFile($hBitmap, $picture)     ;save bitmap to disk
	;cleanup GDI+ resources
	_GDIPlus_GraphicsDispose($hBmpCtxt)
	_GDIPlus_BitmapDispose($hBitmap)
	_GDIPlus_Shutdown()
EndFunc   ;==>CreateJpg
#CS INFO
	52681 V1 10/25/2019 12:29:56 AM
#CE INFO

;-----------------------------------------
; Replay
Func ReplayRecData($func, $x = 0, $y = 0, $z = 0, $zz = 0)

	;Func ~~
	;1 Start Snake
	;2 Move snake
	;3 Food add
	;4 Add Cell  +-x
	;5 End of game
	;20 Poop
	;21 Bounce back on self
	;30 Pass through wall

	;X, Y
	If $g_Replay <> $s_ReplayRec Then
		Return
	EndIf

	If $g_iReplayRecInx >= $g_iReplaySz Then
		$g_Replay = $s_ReplayOff

		Return
	EndIf

	Switch $func
		Case 2             ;Func, $g_iTickCnt,  add 3 data,2 = Move
			$g_aReplay[$g_iReplayRecInx] = $func & "|" & $g_iTickCnt & "|" & $x & "|" & $y & "|" & $z
		Case 1, 3, 21, 30            ; add 2 data
			$g_aReplay[$g_iReplayRecInx] = $func & "|" & $g_iTickCnt & "|" & $x & "|" & $y
		Case 4             ; add 1 data
			$g_aReplay[$g_iReplayRecInx] = $func & "|" & $g_iTickCnt & "|" & $x
		Case 5          ;func and tick
			$g_aReplay[$g_iReplayRecInx] = $func & "|" & $g_iTickCnt
		Case 10, 11     ;func
			$g_aReplay[$g_iReplayRecInx] = $func
		Case 20     ;Func, $g_iTickCnt,  add 4 data  20 = Poop extra only
			$g_aReplay[$g_iReplayRecInx] = $func & "|" & $g_iTickCnt & "|" & $x & "|" & $y & "|" & $z & "|" & $zz
	EndSwitch
	$g_iReplayRecInx += 1
	If $g_iReplayRecInx >= $g_iReplaySz Then
		$g_Replay = $s_ReplayOff
		Pause("End of array")
		Return
	EndIf

	$g_aReplay[$g_iReplayRecInx] = -1     ;remove last one

EndFunc   ;==>ReplayRecData
#CS INFO
	85912 V10 12/10/2019 8:29:16 PM V9 11/21/2019 3:52:08 PM V8 11/19/2019 1:09:35 PM V7 11/2/2019 6:19:14 PM
#CE INFO

;$nMsg = GetReplayPlay(N)

;Local $a
;	If $g_Replay = $s_ReplayPlay Then
;	$a=GetReplayPlay(func)
;$x = $a[3]
;		$y = $a[4]
;	else
;	EndIf

Func GetReplayPlay($Expecting)     ;~~
	Local $a

	If $g_Replay <> $s_ReplayPlay Then
		Return
	EndIf
	;DataOut("GetReplayPlay", $Expecting)
	If $g_iReplayPlyInx >= $g_iReplayRecInx Then
		$g_Replay = $s_ReplayOff
		$g_endgame = True
		$a = "5|0|0|0|0"
	Else
		$a = $g_aReplay[$g_iReplayPlyInx]
	EndIf
	;DataOut("AT loc", $a)
	$a = StringSplit($a, "|")

	;_ArrayDisplay($a)

	If $g_iTickCnt >= $a[2] Then

		;If $TESTING And $Expecting = 20 Then
		;dataout("Tick cnt", $a[2])
		;dataout("Tick Cur", $g_iTickCnt)
		;dataout("Func", $a[1])
		;EndIf

		If $a[1] = 5 Then
			$g_Replay = $s_ReplayOff
			$g_endgame = True
		EndIf

		If $Expecting <> $a[1] Then
			$a[0] = False
			;dataout($Expecting, $a[1])
			Return $a
		EndIf
		$g_iReplayPlyInx += 1
		$a[0] = True
	Else
		$a[0] = False
	EndIf
	Return $a

EndFunc   ;==>GetReplayPlay
#CS INFO
	58456 V9 12/10/2019 8:29:16 PM V8 12/6/2019 2:47:59 PM V7 11/21/2019 3:52:08 PM V6 11/19/2019 1:09:35 PM
#CE INFO

;Main
Main()

Exit

;~T ScriptFunc.exe V0.54a 15 May 2019 - 12/11/2019 11:54:15 AM
