#Include debug.ahk

MyGui := Gui()

ReloadButton := MyGui.Add("Button", "w100 Default", "&Reload")
ReloadButton.OnEvent("Click", OnReloadClick)
OnReloadClick(*) {
    Reload
}

TestButton := MyGui.Add("Button", "w300", "&Test")
TestButton.OnEvent("Click", OnTestClick)

ShowButton := MyGui.Add("Button", "w300", "&Show")
ShowButton.OnEvent("Click", OnShowClick)

MyGui.Show()

OnTestClick(*) {
    window := GetTopFileExplorer()
    if not window {
        Return
    }

    folderPath := window.Document.Folder.Self.Path
    result := "folderPath=" . folderPath

    svnRoot := FindSvnRoot(folderPath)
    result .= "`n svnRoot=" . svnRoot
    ; https://github.com/networm/ExplorerToCommander/blob/main/ExplorerToTotalCommander.ahk
    result := "`n LocationURL=" . window.LocationURL

    if not svnRoot {
        Return
    }

    ; SetWorkingDir folderPath

    MsgBox(result)

    script := "abc.bat"
    ; Run(script, svnRoot)
}

FindSvnRoot(folderPath) {
    while folderPath {
        if DirExist(folderPath . "\.svn") {
            Return folderPath
        }

        SplitPath(folderPath, , &folderPath, , , &drive)
        if folderPath = drive {
            Break
        }
    }
}

OnShowClick(*) {
    explorerPath := ShowExplorerInfo()
    if explorerPath {
        MsgBox(explorerPath)
    } else {
        MsgBox("explorer not found")
    }
}

^+!t::{
    OnTestClick()
}

GetTopFileExplorer() {
    hwnd := WinExist("ahk_class CabinetWClass")
    shellWindows := ComObject("Shell.Application").Windows
    for window in shellWindows {
        if (window.HWND = hwnd) {
            Return window
        }
    }
}

ShowExplorerInfo() {
    ; https://www.autohotkey.com/boards/viewtopic.php?style=17&t=60403#p255169
    hWnd := WinExist("ahk_class CabinetWClass")
    ; hWnd := WinExist("A")
    winClass := WinGetClass("ahk_id" . hWnd)

    result := ""
    result .= " hWnd=" . hWnd
    result .= " winClass=" . winClass
    result .= "`n"

    if !(winClass ~= "^(Progman|WorkerW|(Cabinet|Explore)WClass)$") {
        Return result
    }

    shellWindows := ComObject("Shell.Application").Windows
    if (winClass ~= "Progman|WorkerW") {
        window := shellWindows.Item(ComValue(VT_UI4 := 0x13, SWC_DESKTOP := 0x8))
        result .= GetExplorerInfo(window)
    } else {
        for window in shellWindows {
            result .= GetExplorerInfo(window)
            result .= "`n"
        }
    }

    Return result
}

GetExplorerInfo(window) {
    shellFolderView := window.Document
    result := ""
    ; result .= "`n Folder=" . shellFolderView.Folder
    ; result .= "`n Parent=" . shellFolderView.Parent
    ; result .= "`n Path=" . shellFolderView.Folder.Path
    result .= "`n Title=" . shellFolderView.Folder.Title
    result .= " HWND=" . window.HWND

    hWnd := window.HWND
    GW_HWNDPREV := 3
    zOrder := 0
    ; 使用 DllCall 调用 GetWindow 函数来获取窗口的 z-order
    while hWnd := DllCall("GetWindow", "Ptr", hWnd, "UInt", GW_HWNDPREV, "Ptr") {  ; 3 表示 GW_HWNDPREV
        zOrder++
    }

    ; zOrder := WinGet(window.HWND, "MinMax")
    result .= " zOrder=" . zOrder

    result .= "`n FoldPath=" . shellFolderView.Folder.Self.Path
    result .= "`n ParentFolder.Title=" . shellFolderView.Folder.ParentFolder.Title

    for item in shellFolderView.Folder.Items {
        result .= "`n Item=" . item.Path
    }

    for item in shellFolderView.SelectedItems {
        result .= "`n SelectedItems=" . item.Path
    }

    Return result
}

RunWaitOne(command) {
    shell := ComObject("WScript.Shell")
    exec := shell.Exec(A_ComSpec " /C " command)
    ; return exec.StdErr.ReadAll()
    return exec.StdOut.ReadAll()
}
