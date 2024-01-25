hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'C', function()
  hs.application.launchOrFocus('iTerm.app')
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'F', function()
  hs.application.launchOrFocus('Finder.app')
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'E', function()
  hs.application.launchOrFocus('Visual Studio Code.app')
end)
