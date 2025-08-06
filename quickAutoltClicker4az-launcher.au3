#RequireAdmin
#include <Misc.au3>
#include <MsgBoxConstants.au3>

Opt("WinTitleMatchMode", 2)
Opt("SendKeyDelay", 0)
Opt("SendKeyDownDelay", 0)


Local $scriptName = @ScriptName
Local $exeName = StringLeft($scriptName, StringInStr($scriptName, ".exe", 0, -1) - 1)
$exeName = StringLower($exeName) 

If StringLen($exeName) <> 1 Or Not StringIsAlpha($exeName) Then
    MsgBox($MB_ICONERROR, "Error 1 discord : superlila", _
           "renomme le programme avec le bind pour on/off le clicker/ rename the executable to the key/bind u want to use to toggle the clicker on/off")
    Exit
EndIf
MsgBox($MB_TOPMOST, "CIA", "clicker released by cia, discord : .cia14 or superlila", 1)

Local $letter1 = StringUpper(StringMid($exeName, 1, 1))  ; uppercase pour code VK correct
Local $keyCode = StringFormat("%02X", Asc($letter1))  ; code hex pour _Ispressed 


Local $isOn = False
While True
    If _IsPressed($keyCode) Then
        Sleep(99) 
        $isOn = Not $isOn
    EndIf

    Local $hWnd = WinActive("[CLASS:GLFW30; REGEXPTITLE:Minecraft.*]")
    If $isOn And $hWnd And _IsPressed("01") Then
        ControlClick($hWnd, "", "", "left", 1)
        Sleep(Random(50, 52, 1)) ; c'est ici pour changer le délai chat, stv mettre plus de cps réduit les deux premieres value
    EndIf
	
    Sleep(10)
WEnd

