#Persistent
#SingleInstance Force
SendMode Input
SetBatchLines -1

running := false
keys := ["w","a","s","d","{Space}"]

; ================= GUI =================
Gui, Font, s10

Gui, Add, Text, cGray w420 Center, MADE BY IGEN321

Gui, Add, Text,, Max wait (seconds):
Gui, Add, Edit, vMaxSec w60, 30

Gui, Add, Text,, Key hold (ms):
Gui, Add, Edit, vHoldMs w60, 120

Gui, Add, Button, gStart w80, Start
Gui, Add, Button, gStop x+10 w80, Stop

Gui, Add, Edit, vLogBox w420 h180 ReadOnly

Gui, Add, Text, x+320 y+180 cGray, IGEN321

Gui, Show,, EASYANTIAFK BY IGEN321
return
; =======================================

Start:
Gui, Submit, NoHide
running := true
AddLog("Started")
SetTimer, AntiAFK, -1
return

Stop:
running := false
SetTimer, AntiAFK, Off
AddLog("Stopped")
return

AntiAFK:
if (!running)
    return

Random, waitTime, 10000, % MaxSec*1000
Sleep, %waitTime%

Random, index, 1, 5
key := keys[index]

Random, holdTime, 50, %HoldMs%

AddLog("Pressing: " key)

Send, {%key% down}
Sleep, %holdTime%
Send, {%key% up}

SetTimer, AntiAFK, -1
return

AddLog(msg)
{
    FormatTime, t,, HH:mm:ss
    GuiControlGet, old,, LogBox
    GuiControl,, LogBox, % old "[" t "] " msg "`r`n"
}

Esc::
ExitApp
return

GuiClose:
ExitApp
return
