AutoItSetOption("MustDeclareVars", 1)

;If not define then only in script
;Global Static $MESSAGE = True ;Define then message box will show in script or compiled
;Global Static $MESSAGE =  False   ;Pause will still work in script  No Dataout

; Must be Declared before _Prf_startup
Global $ver = "0.01 29 May 2019  Start form"

Global Static $useLog = True ; False

;$TESTING
#include "R:\!Autoit\Blank\_prf_startup.au3"

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=0.0.0.1
#AutoIt3Wrapper_Icon=R:\!Autoit\Ico\prf.ico
#AutoIt3Wrapper_Res_Description=What am I
#AutoIt3Wrapper_Res_LegalCopyright=© Phillip Forrestal 2019

#AutoIt3Wrapper_Outfile=Blank.exe
#AutoIt3Wrapper_Outfile_x64=Blank64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;-----------------START OF PROGRAM-------------

#cs ----------------------------------------------------------------------------
	to do

	0.01 29 May 2019  Start form

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

;Global

; Main is call at end
Func Main()
	If StartForm() Then
		Return
	EndIf

EndFunc   ;==>Main
#CS INFO
	4852 V2 5/29/2019 3:12:10 AM V1 5/9/2019 12:49:19 PM
#CE

Func StartForm()
	Local $Form1, $Group1
	Local $Radio1, $Radio2, $Radio3, $Checkbox1
	Local $nMsg

	#Region ### START Koda GUI section ### Form=
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
	Local $Edit1 = GUICtrlCreateEdit("", 20, $b + 150, 550, 250)
	GUICtrlSetData(-1, "Normal:  One snake, one food")

	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Return True
		EndSwitch
	WEnd

EndFunc   ;==>StartForm
#CS INFO
	76252 V1 5/29/2019 3:12:10 AM
#CE

;Main
Main()
;MsgBox(0, "Done", $ver)
Exit
;~T ScriptFunc.exe V0.54a 15 May 2019 - 5/29/2019 3:12:10 AM
