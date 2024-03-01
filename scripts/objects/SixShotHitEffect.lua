local SixShotHitEffect, super = Class(Object)

function SixShotHitEffect:init(controller)
    super.init(self)
    self.controller = controller
    self.active = false
    self.progress = 0
    self.target = 0
    self.circle_alpha = 1
end

function SixShotHitEffect:activate(timer, target, score)
    self.active = true
    self.progress = timer
    self.target = target

    local pitch = (0.08 * self.controller.sixshot.hits) + 1
    if self.controller.rating == "crit" then
        Assets.playSound("victor", 1, pitch)
    elseif self.controller.rating == "good" then
        Assets.playSound("hit", 1, pitch)
    else
        Assets.playSound("ui_cant_select")
    end
end

function SixShotHitEffect:draw()
    super.draw(self)

    if self.active then
        self.progress = self.progress - DTMULT * 4
        self.circle_alpha = self.circle_alpha - DT * 3.5
    end

    if self.active then
        if self.controller.rating == "crit" then
            Draw.setColor(1, 1, 0, self.circle_alpha)
        elseif self.controller.rating == "good" then
            Draw.setColor(0, 1, 1, self.circle_alpha)
        else
            Draw.setColor(1, 0, 0, self.circle_alpha)
        end
        love.graphics.setLineWidth(6)
        love.graphics.circle("line", 0, 0, (self.target - self.progress) * 2)
    end
end

return SixShotHitEffect