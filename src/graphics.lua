local api = {} -- graphics drawing functions
local drawState = {color=15,pal=require("palette").getPalette("CADE-15")}

local function setPalette(palname)
	drawState.pal = require("palette").getPalette(palname)
end

local function callGraphic(...)
	local args = {...}
	local name = table.remove(args,1)
	love.graphics.setCanvas(scr)
	drawState.pal.setColor(drawState.color)
	love.graphics[name](unpack(args))
	love.graphics.setCanvas()
end

local function rectfill(x,y,w,h,c)
	drawState.color = c or drawState.color
	return callGraphic("rectangle","fill",x,y,w,h)
end

local function rect(x,y,w,h,c)
	drawState.color = c or drawState.color
	return callGraphic("rectangle","line",x,y,w,h)
end

local function cls(c)
	rectfill(0,0,256,244,c)
end

api.rectfill = rectfill
api.rect = rect
api.cls = cls
api.setPalette = setPalette

return api
