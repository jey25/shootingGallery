function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 0

    gameFont = love.graphics.newFont(40)
end

function love.update(dt)

end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 50, 50)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        end
    end
end

function distanceBetween(x1 , y1 , x2 , y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end


-- 토네이도 스크립트 
local rs = game:GetService("RunService")

local model = script.Parent
local mMain = require(model.ModuleScript)
local bridge = model.Bridge

local distance = 80
local damage = .25

rs.Heartbeat:Connect(function()
	--mMain:TargetFolder(workspace.Folder, distance)
	--mMain:TargetFolder(workspace.Folder2, distance)
	--mMain:TargetChar(distance)
	--mMain:TargetPlayer(distance)
end)

bridge.TargetFolder.Event:Connect(function(part)
	-- todo
end)
bridge.TargetChar.Event:Connect(function(char)
	-- todo
end)

bridge.TargetPlayer.Event:Connect(function(char)
	-- todo
end)


--토네이도 모듈 스크립트 

local model = script.Parent
local core = model.Core

local mGrivity = require(script.Gravity)
local bridge = model.Bridge

local module = {}

function module:TargetFolder(folder, distance)
	for i, v in pairs(workspace:GetDescendants()) do
		if v:IsDescendantOf(folder) then
			if mGrivity:InPart(v, core, distance) then
				mGrivity:Pull(v, core)
				bridge.TargetFolder:Fire(v)	
			end
		end
	end
end

function module:TargetChar(distance)
	for i, v in pairs(workspace:GetDescendants()) do
		local char = v.Parent
		if char:FindFirstChild("Humanoid") then
			if mGrivity:InPart(v, core, distance) then
				mGrivity:Pull(v, core)
				bridge.TargetChar:Fire(char)				
			end
		end
	end
end

function module:TargetPlayer(distance)
	for i, v in pairs(workspace:GetDescendants()) do
		local char =  v.Parent
		if game.Players:GetPlayerFromCharacter(char) then
			if mGrivity:InPart(v, core, distance) then
				mGrivity:Pull(v, core)
				bridge.TargetPlayer:Fire(char)	
			end
		end
	end
end

return module


--StarterplayerScript > Localscript 로 캐릭터 컨트롤 On/off 조작

local players = game:GetService("Players")
local player = players.LocalPlayer
local module = require(player:WaitForChild("PlayerScripts").PlayerModule)
local control = module:GetControls()

--control:Disable() -- 컨트롤 권한 끄기
--control:Enable() -- 컨트롤 권한 켜기


--캐릭터 앵커
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

if not character.PrimaryPart then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait()
end

character.PrimaryPart.Anchored = true 