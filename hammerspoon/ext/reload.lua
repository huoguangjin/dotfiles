local function reloadConfig(paths)
  for _, file in pairs(paths) do
    if file:sub(-4) == '.lua' then
      hs.reload()
      break
    end
  end
end

local configFileWatcher = hs.pathwatcher.new(hs.configdir, reloadConfig)
configFileWatcher:start()

hs.alert.show('config reloaded')

return configFileWatcher
