#!/usr/bin/env osascript

on run {}
  tell application "Google Chrome"
    set theTab to active tab of first window

    set tabTitle to title of theTab
    set tabUrl to url of theTab

    return tabTitle & "\n" & tabUrl
  end tell
end run
