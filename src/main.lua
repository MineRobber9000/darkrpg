_G.CONFIG = require("conf").properties
_G.graphics = require("graphics")
_G.log = require("log")
require("cindy").applyPatch()
function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest", 1)
	_G.scr = love.graphics.newCanvas(256,240)
	log("init","love.")
end

function _update()
	if love.keyboard.isDown("escape") then love.event.quit() end
end

function _draw()
	graphics.cls(1)
	graphics.rectfill(1,1,4,4,15)
end

t=0
function love.update(dt)
	t = t + dt
	while t > (1/CONFIG.framerate) do
		_update()
		t = t - dt
	end
end

function love.draw()
	_draw()
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(255,255,255)
	love.graphics.draw(scr,0,0,0,CONFIG.scalefactor,CONFIG.scalefactor)
end
