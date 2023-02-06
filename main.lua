function love.load()

end

function love.update(dt)

end

function love.draw()
    love.graphics.setColor(1, 1, 0)
    love.graphics.rectangle("fill", 200, 400, 200, 100)
    
    
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", 300, 200, 100)
end
 