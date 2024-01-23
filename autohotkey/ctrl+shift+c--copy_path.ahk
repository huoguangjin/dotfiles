#HotIf WinActive("ahk_class CabinetWClass")
^+c::CopyFilePaths
#HotIf

CopyFilePaths() {
    window := GetTopFileExplorer()
    filePaths := GetSelectedFilePaths(window)

    text := Sort(JoinStringArray(filePaths, "`n"))
    A_Clipboard := text

    ToolTip(text)
    SetTimer () => ToolTip(), -3000
}

GetSelectedFilePaths(window) {
    if not window {
        Return []
    }

    selectedItems := window.Document.SelectedItems()
    if selectedItems.Count = 0 {
        folderPath := window.Document.Folder.Self.Path
        Return Array(folderPath)
    }

    filePaths := []
    for f in selectedItems {
        filePaths.Push(f.Path)
    }

    Return filePaths
}

GetTopFileExplorer() {
    hwnd := WinExist("ahk_class CabinetWClass")
    shellWindows := ComObject("Shell.Application").Windows
    for window in shellWindows {
        if (window.HWND = hwnd) {
            Return window
        }
    }

    Return
}

JoinStringArray(array, delimiter:="`n") {
    str := ""
    for v in array {
        if A_Index > 1 {
            str .= delimiter
        }
        str .= v
    }

    Return str
}
