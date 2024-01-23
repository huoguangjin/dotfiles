#HotIf !WinActive("ahk_exe rider64.exe") && !WinActive("ahk_exe clion64.exe") && !WinActive("ahk_exe idea64.exe")
LAlt & h::Send "{Left}"
LAlt & j::Send "{Down}"
LAlt & k::Send "{Up}"
LAlt & l::Send "{Right}"
#HotIf
