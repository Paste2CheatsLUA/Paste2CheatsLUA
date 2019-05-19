local oldtime = 0.0
local num = 0
local P2C = {}

-- 动态组名内容设置区， []内数字为组名滚动的顺序
P2C[0] = "AIMWARE.net "
P2C[1] = "IMWARE.net A"
P2C[2] = "MWARE.net AI"
P2C[3] = "WARE.net AIM"
P2C[4] = "ARE.net AIMW"
P2C[5] = "RE.net AIMWA"
P2C[6] = "E.net AIMWAR"
P2C[7] = ".net AIMWARE"
P2C[8] = "net AIMWARE."
P2C[9] = "et AIMWARE.n"
P2C[10] = "t AIMWARE.ne"
P2C[11] = "AIMWARE.net "
P2C[12] = "AIMWARE.net "
P2C[13] = "AIMWARE.net "
-- 如需添加新行，请将[]内数字向下增加1


-- 动态组名标题设置区
function drawtext()                                          -- 左上角加载LUA提示
	Render.Text(10,20,"AW ClanTag LUA For Paste2Cheats")
--  Render.Text(水平位置,垂直位置,"显示内容")                -- 示例
end


-- 动态组名速度设置区
function autoclan()
	if math.abs(Globals.curtime - oldtime) > 0.65 then       -- 将0.65改为组名滚动的时间
		Misc.SetClanTag(P2C[num % 13],"AIMWARE.net")         -- 将13改为上面组名滚动的次数，一般设置为最后一行的数字
		oldtime = Globals.curtime
		num = num + 1
	end
end


-- Hook设置区，一般不需要变动，增加新功能时需要在本区域内添加HOOK
Hook.AddHook(drawtext,"PaintTraverse_last")
Hook.AddHook(autoclan,"CreateMove_last")