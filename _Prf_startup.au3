#include-once
#include "R:\!Autoit\Blank\_Debug.au3"

Global Static $TESTING = @Compiled = 0
If Not IsDeclared("MESSAGE") Then
	Global Static $MESSAGE = $TESTING
EndIf

Global $LOG = ""

If $useLOG Then
	$LOG = @WorkingDir & "\Log.txt"
	Local $hLOG = FileOpen($LOG, 2)
	FileWriteLine($hLOG, $ver)
	FileWriteLine($hLOG, "")
	FileClose($hLOG)
EndIf

If $MESSAGE Then
	_DebugSetup(@ScriptName, True) ; start
	_DebugOut($ver)
	;Global $DEBUG = @error = 0
EndIf

Func DataOut($sString = "", $sString2 = "")

	If $MESSAGE Then
		If StringInStr($sString, "~~") Then
			_DebugOut(" ")
		EndIf
		_DebugOut($sString & " " & $sString2)

		If $useLOG Then
			Local $hLOG = FileOpen($LOG, 1)
			If StringInStr($sString, "~~") Then
				FileWriteLine($hLOG, "")
			EndIf
			FileWriteLine($hLOG, $sString & " " & $sString2)
			FileClose($hLOG)
		EndIf
	EndIf
EndFunc   ;==>DataOut
#CS INFO
	27314 V3 5/22/2019 1:51:26 AM V2 5/19/2019 1:08:18 PM V1 5/9/2019 12:49:19 PM
#CE

Func Pause($sString = "", $sString2 = "")
	Local $PauseForm, $PauseButton, $nMsg

	$nMsg = StringInStr($sString, "**")

	If $TESTING Or $nMsg Then

		If StringInStr($sString, "~~") Then
			DataOut("~~")
		EndIf

		$PauseForm = GUICreate($ver, 383, 90, -1, 0)
		$PauseButton = GUICtrlCreateButton($sString & " " & $sString2, 24, 24, 337, 25)
		GUISetState(@SW_SHOW)

		While 1
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case -3, $PauseButton
					ExitLoop
			EndSwitch
		WEnd
		GUIDelete($PauseForm)
	EndIf
EndFunc   ;==>Pause
#CS INFO
	35776 V3 5/19/2019 1:08:18 PM V2 5/18/2019 12:03:12 PM V1 5/9/2019 12:49:19 PM
#CE

$ver = StringLeft($ver, StringInStr($ver, " ", 0, 4))

;-----------------START OF PROGRAM-------------

;~T ScriptFunc.exe V0.54a 15 May 2019 - 5/22/2019 1:51:26 AM