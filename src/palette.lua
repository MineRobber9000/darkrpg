local palette = {}
local palettes = {}

local function setColorPal(p)
	return function(i)
		c = p[i+1]
		love.graphics.setColor(c[1],c[2],c[3])
	end
end

local function setBGColorPal(p)
	return function(i)
		c = p[i+1]
		love.graphics.setBackgroundColor(c[1],c[2],c[3])
	end
end

local function getColorPal(c)
	return function(i,name_fields)
		i = i + 1
		name_fields = name_fields and name_fields or false
		if not name_fields then return c[i] end
		local col = c[i]
		col.r = col[1]
		col.g = col[2]
		col.b = col[3]
		return col
	end
end

function palette.register(name,colors)
	local pal = {}
	pal.name = name
	pal.colors = colors
	pal.setColor = setColorPal(colors)
	pal.setBackgroundColor = setBGColorPal(colors)
	pal.getColor = getColorPal(colors)
	palettes[name]=pal
	return pal
end

function palette.getPalette(name) return palettes[name] end

palette.register("GrayShades",{{0,0,0},{17,17,17},{34,34,34},{51,51,51},{68,68,68},{85,85,85},{102,102,102},{119,119,119},{136,136,136},{153,153,153},{170,170,170},{187,187,187},{204,204,204},{221,221,221},{238,238,238},{255,255,255}})
palette.register("CADE-15",{{56,40,44},{16,15,12},{53,22,92},{68,98,188},{76,186,255},{4,85,36},{28,153,36},{92,74,108},{124,142,141},{56,16,0},{142,2,50},{188,70,4},{250,125,97},{212,146,12},{255,215,80},{226,241,210}})

return palette
