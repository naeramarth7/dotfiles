local obj={}
local spoonName = "BorderedActiveWindow"

local global_border = nil

function obj:redrawBorder()
    win = hs.window.focusedWindow()
    if win ~= nil then
        top_left = win:topLeft()
        size = win:size()
        if global_border ~= nil then
            global_border:delete()
        end
        global_border = hs.drawing.rectangle(hs.geometry.rect(top_left['x'], top_left['y'], size['w'], size['h']))
        global_border:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=0.8})
        global_border:setFill(false)
        global_border:setStrokeWidth(8)
        global_border:show()
    end
end

function obj:watch()
  allwindows = hs.window.filter.new(nil)
  allwindows:subscribe(hs.window.filter.windowCreated, function () obj.redrawBorder() end)
  allwindows:subscribe(hs.window.filter.windowFocused, function () obj.redrawBorder() end)
  allwindows:subscribe(hs.window.filter.windowMoved, function () obj.redrawBorder() end)
  allwindows:subscribe(hs.window.filter.windowUnfocused, function () obj.redrawBorder() end)
end

obj.redrawBorder()

return obj
