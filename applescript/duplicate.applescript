on run {}
  tell application "Finder"
    set dir to target of front Finder window as text
    -- display dialog(dir)
    set target of (make new Finder window) to dir
  end tell
end run
