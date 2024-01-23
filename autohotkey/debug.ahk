; use for debug:
; #Include reload.ahk

^+!r::Reload

ScriptFullPath := A_ScriptFullPath
TrayTip("Reload " . ScriptFullPath)

ShowLog(Log) {
    Tooltip Log
    SetTimer () => Tooltip(), -2000
}
