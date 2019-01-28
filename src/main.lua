_G.CONFIG = require("conf").properties
_G.graphics = require("graphics")
_G.log = require("log")
require("cindy").applyPatch()
function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest", 1)
	_G.scr = love.graphics.newCanvas(256,240)
	log("init","love.")
end

--BEGIN CODE HOOKS FOR GAME
x=1
y=1

function _update()
	if love.keyboard.isDown("escape") then love.event.quit() end
	if love.keyboard.isDown("left") and x>=0 then x=x-1 end
	if love.keyboard.isDown("right") and x<(256-4) then x=x+1 end
	if love.keyboard.isDown("up") and y>=0 then y=y-1 end
	if love.keyboard.isDown("down") and y<(240-4) then y=y+1 end
end

function _draw()
	graphics.cls(1)
	graphics.rectfill(x,y,4,4,15)
end
--END CODE HOOKS FOR GAME
__time__=0
function love.update(dt)
	__time__ = __time__ + dt
	while __time__ > (1/CONFIG.framerate) do
		_update()
		__time__ = __time__ - (1/CONFIG.framerate)
	end
end

function love.draw()
	_draw()
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(255,255,255)
	love.graphics.draw(scr,0,0,0,CONFIG.scalefactor,CONFIG.scalefactor)
end
