local modalContext = require 'ext.modal_context'

local modalName = 'puzzle'

local stepX = 48
local stepY = 35

-------------------- function ------------------------------

local savedWindowFrame = {}

local function saveWindowFrame(window, frame)
  local id = window:id()
  if savedWindowFrame[id] then
    return
  end

  savedWindowFrame[id] = frame.table
end

local function restoreWindowFrame(window)
  local id = window:id()
  local frame = savedWindowFrame[id]
  if not frame then
    return
  end

  savedWindowFrame[id] = nil
  window:setFrame(frame)
end

local function resize(dx, dy)
  local window = hs.window.focusedWindow()
  local f = window:frame()
  saveWindowFrame(window, f)

  f.w = f.w + dx
  f.h = f.h + dy
  window:setSize(f)
end

local function move(dx, dy)
  local window = hs.window.focusedWindow()
  local f = window:frame()
  saveWindowFrame(window, f)

  f.x = f.x + dx
  f.y = f.y + dy
  window:setTopLeft(f)
end

local function moveToGrid(gridXCount, gridYCount, gridX, gridY)
  local window = hs.window.focusedWindow()
  local f = window:frame()
  saveWindowFrame(window, f)

  local sf = window:screen():frame()
  local gridW = sf.w / gridXCount;
  local gridH = sf.h / gridYCount;
  window:setFrame({
    x = gridW * gridX,
    y = gridH * gridY,
    w = gridW,
    h = gridH,
  })
end

local function verticalExpand()
  local window = hs.window.focusedWindow()
  local f = window:frame()
  saveWindowFrame(window, f)

  local sf = window:screen():frame()
  f.y = 0
  f.h = sf.h
  window:setFrame(f)
end

-------------------- key binding ------------------------------

local delayDeactivateDuration = 2 -- second
local deactivateTimer = nil

local function stopTimer()
  if deactivateTimer and deactivateTimer:running() then
    deactivateTimer:stop()
  end
end

local function deactivate()
  modalContext:deactivate({modalName})

  if deactivateTimer and deactivateTimer:running() then
    deactivateTimer:stop()
  end
  deactivateTimer = nil
end

local function delayDeactivate()
  if not deactivateTimer then
    deactivateTimer = hs.timer.delayed.new(delayDeactivateDuration, function()
      deactivate()
    end)
  end

  deactivateTimer:start()
end

local modal = modalContext:new(modalName)

modal:bind('', 'escape', function()
  deactivate()
end)

local function moveLeft()
  move(-stepX, 0)
  delayDeactivate()
end
local function moveRight()
  move(stepX, 0)
  delayDeactivate()
end
local function moveUp()
  move(0, -stepY)
  delayDeactivate()
end
local function moveDown()
  move(0, stepY)
  delayDeactivate()
end

-- move
modal:bind('', 'h', 'move left', moveLeft, nil, moveLeft)
modal:bind('', 'l', 'move right', moveRight, nil, moveRight)
modal:bind('', 'j', 'move down', moveDown, nil, moveDown)
modal:bind('', 'k', 'move up', moveUp, nil, moveUp)
modal:bind('', 'a', 'move left', moveLeft, nil, moveLeft)
modal:bind('', 'd', 'move right', moveRight, nil, moveRight)
modal:bind('', 's', 'move down', moveDown, nil, moveDown)
modal:bind('', 'w', 'move up', moveUp, nil, moveUp)

-- restore
modal:bind('', 'tab', 'restore', function()
  local window = hs.window.focusedWindow()
  restoreWindowFrame(window)
  deactivate()
end)

local function resizeLeft()
  resize(-stepX, 0)
  delayDeactivate()
end
local function resizeRight()
  resize(stepX, 0)
  delayDeactivate()
end
local function resizeUp()
  resize(0, -stepY)
  delayDeactivate()
end
local function resizeDown()
  resize(0, stepY)
  delayDeactivate()
end

-- resize
modal:bind('shift', 'h', 'resize left', resizeLeft, nil, resizeLeft)
modal:bind('shift', 'l', 'resize right', resizeRight, nil, resizeRight)
modal:bind('shift', 'j', 'resize down', resizeDown, nil, resizeDown)
modal:bind('shift', 'k', 'resize up', resizeUp, nil, resizeUp)
modal:bind('shift', 'a', 'resize left', resizeLeft, nil, resizeLeft)
modal:bind('shift', 'd', 'resize right', resizeRight, nil, resizeRight)
modal:bind('shift', 's', 'resize down', resizeDown, nil, resizeDown)
modal:bind('shift', 'w', 'resize up', resizeUp, nil, resizeUp)

-- full screen
modal:bind('', 'f', 'full screen', function()
  moveToGrid(1, 1, 0, 0)
  deactivate()
end)
-- horizontal 1/2
modal:bind('', 'left', 'horizontal 1/2', function()
  moveToGrid(2, 1, 0, 0)
  deactivate()
end)
modal:bind('', 'right', 'horizontal 2/2', function()
  moveToGrid(2, 1, 1, 0)
  deactivate()
end)
-- vertical 1/2
modal:bind('', 'up', 'vertical 1/2', function()
  moveToGrid(1, 2, 0, 0)
  deactivate()
end)
modal:bind('', 'down', 'vertical 2/2', function()
  moveToGrid(1, 2, 0, 1)
  deactivate()
end)
-- horizontal 1/3
modal:bind('', '1', 'horizontal 1/3', function()
  moveToGrid(3, 1, 0, 0)
  deactivate()
end)
modal:bind('', '2', 'horizontal 2/3', function()
  moveToGrid(3, 1, 1, 0)
  deactivate()
end)
modal:bind('', '3', 'horizontal 3/3', function()
  moveToGrid(3, 1, 2, 0)
  deactivate()
end)
-- vertical 1/3
modal:bind('', '4', 'vertical 1/3', function()
  moveToGrid(1, 3, 0, 0)
  deactivate()
end)
modal:bind('', '5', 'vertical 2/3', function()
  moveToGrid(1, 3, 0, 1)
  deactivate()
end)
modal:bind('', '6', 'vertical 3/3', function()
  moveToGrid(1, 3, 0, 2)
  deactivate()
end)

-- expand vertically
modal:bind('', '=', 'expand vertically', function()
  verticalExpand()
  deactivate()
end)

modal:bind('', '-', 'show grid', hs.grid.toggleShow)

modal:bind('', '`', 'move to next screen', function()
  local window = hs.window.focusedWindow()
  window:moveToScreen(window:screen():next())
end)

modalContext.mainModal:bind({'cmd', 'alt', 'ctrl', 'shift'}, 'R', function()
  modalContext:deactivateAll()
  modalContext:activate({modalName})
end)
