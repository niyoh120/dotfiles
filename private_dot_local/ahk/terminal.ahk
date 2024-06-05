#Requires AutoHotkey v2.0

; #NoTrayIcon
#SingleInstance Force

ToggleTerminal() {
    if !ProcessExist("WindowsTerminal.exe") {
        Run "wt.exe"
    } else {
        WinActivate("ahk_exe WindowsTerminal.exe")
    }
}

LWin & Enter:: {
    ToggleTerminal()
}