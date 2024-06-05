#Requires AutoHotkey v2.0

;单实例执行
#SingleInstance Force

;必须以管理员身份执行
full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}

;Capslock增强

*CapsLock::
{
    Send("{LCtrl down}")
}

*CapsLock up::
{
    Send("{LCtrl Up}")

    if (A_PriorKey == "CapsLock") {
        if (A_TimeSincePriorHotkey < 1000) {
            Suspend(1)
            Send("{Esc}")
            Suspend(0)
        }
    }
}

Esc:: {
    SetCapsLockState(!GetKeyState("CapsLock", "T"))
}

;osx风格退出
LAlt & q:: {
    Send("{LAlt down}{F4}{LAlt up}")
}

;控制Alt-Tab
LAlt & Tab::AltTab
LAlt & `::ShiftAltTab