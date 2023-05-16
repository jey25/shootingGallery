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

