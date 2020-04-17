#include-once
;#include "R:\!Autoit\Blank\_Debug.au3"
#include "_Debug.au3"

;Ver 16 Apr 2020 add _ArrayDataOut and 3rd Parm of DataOut
;27 Jun 2019 $Log problem
;24 Jun 2019
; 23 Jun 2019 Removed Static in $TESTING

If Not IsDeclared("TESTING") Then
	Global $TESTING = @Compiled = 0
EndIf

If Not IsDeclared("MESSAGE") Then
	Global Static $MESSAGE = $TESTING
EndIf

If Not IsDeclared("useLOG") Then
	Global $useLOG = $TESTING
EndIf

If $useLOG Then
	Global $LOG = @WorkingDir & "\Log.txt"
	Local $hLOG = FileOpen($LOG, 2)

	FileWriteLine($hLOG, "") ;Clear Log
	FileClose($hLOG)
EndIf

If $MESSAGE Then
	_DebugSetup(@ScriptName, True) ; start
	_DebugOut($ver)
	;Global $DEBUG = @error = 0
EndIf

;1st parm includes ~~~ blank line in outputed.
;16 Apr 2020 3rd parm added

Func DataOut($sString = "", $sString2 = "", $sString3 = "")

	If $MESSAGE Then
		If StringInStr($sString, "~~~") Then
			_DebugOut("")
		EndIf
		_DebugOut($sString & " " & $sString2 & " " & $sString3)

		If $useLOG Then
			Local $hLOG = FileOpen($LOG, 1)
			If StringInStr($sString, "~~~") Then
				FileWriteLine($hLOG, "")
			EndIf
			FileWriteLine($hLOG, $sString & " " & $sString2 & " " & $sString3)
			FileClose($hLOG)
		EndIf
	EndIf
EndFunc   ;==>DataOut
#CS INFO
	30526 V5 4/16/2020 12:53:31 PM V4 6/24/2019 10:16:28 AM V3 5/22/2019 1:51:26 AM V2 5/19/2019 1:08:18 PM
#CE

Func Pause($sString = "", $sString2 = "")
	Local $PauseForm, $PauseButton, $nMsg

	$nMsg = StringInStr($sString, "**")

	If $TESTING Or $nMsg Then

		If StringInStr($sString, "~~~") Then
			DataOut("~~~")
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
	36028 V4 6/24/2019 10:16:28 AM V3 5/19/2019 1:08:18 PM V2 5/18/2019 12:03:12 PM V1 5/9/2019 12:49:19 PM
#CE INFO

;Created for Snake19
Func _ArrayDataOut(Const ByRef $aArray, $title = "") ;one dimention
	Local $UB
	DataOut("Array = ", $title)
	$UB = UBound($aArray)
	For $x = 0 To $UB - 1
		DataOut($x, $aArray[$x])
	Next
EndFunc   ;==>_ArrayDataOut
#CS INFO
	15408 V2 4/16/2020 12:53:31 PM V1 4/15/2020 2:57:51 AM
#CE

$ver = StringLeft($ver, StringInStr($ver, " ", 0, 4))

;-----------------START OF PROGRAM-------------

;~T ScriptFunc.exe V0.54a 15 May 2019 - 4/16/2020 12:53:31 PM
