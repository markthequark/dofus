GroupAdd, Dofus, ahk_class ApolloRuntimeContentWindow 
SetTitleMatchMode, 2

;; when true this flag overrides easy to reach keys like f with custom functions
HotKeyMode := false

;; used to remember if hotkeymode was deactivated to type text input
TempDeactivateHotKeyMode := false

;; Alt-F5    toggle hotkey mode
!F5::HotKeyMode := !HotKeyMode

;; Space    If on a dofus window, temporarily deactivate hotkey mode and send space (space opens the text input prompt)
$Space::
If (WinActive("ahk_group Dofus") and HotKeyMode) {
  HotKeyMode := false
  TempDeactivateHotKeyMode := true
}
Send {Space}
Return

;; Enter    If on a dofus window, reactivate hotkeymode if it was temporarily deactivated
$Enter::
If (WinActive("ahk_group Dofus") and TempDeactivateHotKeyMode) {
  HotKeyMode := true
  TempDeactivateHotKeyMode := false
}
Send {Enter}
Return

;; Esc    If on a dofus window, reactivate hotkeymode if it was temporarily deactivated
$Esc::
If (WinActive("ahk_group Dofus") and TempDeactivateHotKeyMode) {
  HotKeyMode := true
  TempDeactivateHotKeyMode := false
}
Send {Esc}
Return

;; f    If on a dofus window and using hotkeymode, cycle dofus windows
$f::
If (WinActive("ahk_group Dofus") and HotKeyMode)
  GroupActivate, Dofus, r
Else
  Send f
Return

;; Alt-`    cycle dofus windows
!`::GroupActivate, Dofus, r

;; Alt-F1    activate the window which contains the string Mark
$!F1::
if WinExist("Mark") {
  WinActivate
  Return
}

$!F4::
if WinExist("Kelpie") {
  WinActivate
  Return
}

$!F2::
if WinExist("Haeler") {
  WinActivate
  Return
}

$!F3::
if WinExist("Ichorid") {
  WinActivate
  Return
}

;; to display system tray tips
;; TrayTip, Title, Body with string interpolation %Variable%, 0, 16
;; Sleep 2500
;; HideTrayTip()

HideTrayTip() {
  TrayTip  ; Attempt to hide it the normal way.
  if SubStr(A_OSVersion,1,3) = "10." {
    Menu Tray, NoIcon
    Sleep 200  ; It may be necessary to adjust this sleep.
    Menu Tray, Icon
  }
}
