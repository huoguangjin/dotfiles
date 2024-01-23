; press win+r, type shell:startup, open the starup folder
; create a shortcut to init.ahk and copy it to the starup folder

RunAhk(script) {
    Run(A_ScriptDir . "\" . script)
}

RunAhk("shift+space--space.ahk")
RunAhk("lalt+h,j,k,l--left,down,up,right.ahk")
RunAhk("lalt+u,p,d,n--page left,down,up,right.ahk")
RunAhk("caps_lock--escape,ctrl.ahk")
RunAhk("ctrl+shift+c--copy_path.ahk")

; ExitApp
