Dim Mode
If Wscript.arguments.count > 0 Then	
	Mode = Wscript.arguments(0)
End If	
On Error Resume Next
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colItems = objWMIService.ExecQuery("Select * from Win32_ComputerSystem",,48)
Set objShell = CreateObject("Wscript.Shell")
CurrentDir = Left(Wscript.ScriptFullName,InstrRev(WScript.ScriptFullName,"\"))
For Each objItem in colItems
	If InStr(objItem.SystemType, "86") <> 0 Then
		RunMenuZ = """" & CurrentDir & "Apps\Autohotkey\AutoHotkeyU32.exe"" " & """" & CurrentDir & "Menuz.ahk"" " & Mode
    ElseIf InStr(objItem.SystemType, "64") <> 0 Then
        RunMenuZ = """" & CurrentDir & "Apps\Autohotkey\AutoHotkeyU64.exe"" " & """" & CurrentDir & "Menuz.ahk"" " & Mode
    Else
        X86orX64 = objItem.SystemType
    End If
Next
objShell.Run RunMenuZ