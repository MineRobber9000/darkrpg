local function log(s,prefix)
	if not CONFIG.debug then return end
--	for i=1,#CONFIG.ignore do if (prefix..debug.getinfo(2).name)==CONFIG.ignore[i] then return end end
	prefix = prefix and prefix or ""
	print(prefix..debug.getinfo(2).name..":: "..s)
end

return log
