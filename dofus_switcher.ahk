;; This section makes the flashing dofus window come to front, dont touch this without knowing what you are doing
DetectHiddenWindows, On
Script_Hwnd := WinExist("ahk_class AutoHotkey ahk_pid " DllCall("GetCurrentProcessId"))
DetectHiddenWindows, Off
DllCall("RegisterShellHookWindow", "uint", Script_Hwnd)
OnMessage(DllCall("RegisterWindowMessage", "str", "SHELLHOOK"), "ShellEvent")
ShellEvent(wParam, lParam) {
    if (wParam = 0x8006) HSHELL_FLASH
    {
        WinGet,descobre,ProcessName, ahk_id %lParam%
        if(descobre = "Dofus.exe")
          WinActivate, ahk_id %lParam%

    }
}
