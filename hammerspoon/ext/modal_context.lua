local obj = {}
obj.__index = obj

obj.mainModal = hs.hotkey.modal.new()

obj.modals = {}
obj.activeModals = {}

local hotkeyIndex = 2
obj.canvas = hs.canvas.new({
  x = 0,
  y = 0,
  w = 0,
  h = 0,
})
obj.canvas:level(hs.canvas.windowLevels.tornOffMenu)

-- cheatsheet background
obj.canvas[1] = {
  type = 'rectangle',
  action = 'fill',
  fillColor = {
    hex = '#000',
    alpha = 0.5,
  },
  roundedRectRadii = {
    xRadius = 10,
    yRadius = 10,
  },
}

function obj:showCheatsheet()
  local screen = hs.screen.mainScreen()
  local sf = screen:fullFrame()
  local width = sf.w / 2
  local height = sf.h / 2
  local padding = 24
  obj.canvas:frame({
    x = sf.x + (sf.w - width) / 2,
    y = sf.y + (sf.h - height) / 2,
    w = width + padding * 2,
    h = height + padding * 2,
  })

  -- print(hs.inspect(obj.activeModals))
  local textWidth = width / 3
  local textHeight = 24
  local index = 0
  for id, modal in pairs(obj.activeModals) do
    for _, hotkey in ipairs(obj.activeModals[id].keys) do
      local yBottom = textHeight * (index + 1)
      local x = textWidth * (yBottom // height)
      local y = (yBottom % height) - textHeight
      -- print(index, hotkey.msg, x, y)
      obj.canvas[hotkeyIndex + index] = {
        type = 'text',
        text = hotkey.msg,
        textSize = 20,
        textColor = {
          hex = '#FFFF00',
        },
        textAlignment = 'left',
        frame = {
          x = padding + x,
          y = padding + y,
          w = textWidth,
          h = textHeight,
        },
      }
      index = index + 1
    end
  end

  obj.canvas:show()
end

function obj:hideCheatsheet()
  obj.canvas:hide()
end

function obj:toggleCheatsheet()
  if obj.canvas:isShowing() then
    obj.canvas:hide()
  else
    obj:showCheatsheet()
  end
end

function obj:new(id)
  local modal = hs.hotkey.modal.new()
  obj.modals[id] = modal
  return modal
end

function obj:activate(idList)
  for _, id in ipairs(idList) do
    local modal = obj.modals[id]
    -- print(id, hs.inspect(modal))
    modal:enter()
    obj.activeModals[id] = modal
  end

  obj:showCheatsheet()
end

function obj:deactivate(idList)
  for _, id in ipairs(idList) do
    local modal = obj.modals[id]
    modal:exit()
    obj.activeModals[id] = nil
  end

  for i = hotkeyIndex, #obj.canvas do
    obj.canvas:removeElement()
  end
  obj:hideCheatsheet()
end

function obj:deactivateAll()
  local idList = {}
  for id, _ in ipairs(obj.activeModals) do
    idList[id] = id
  end
  obj:deactivate(idList)
end

return obj
