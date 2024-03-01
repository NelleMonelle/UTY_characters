local SixShotBullet, super = Class(Object)

function SixShotBullet:init(controller)
    super.init(self)
    self.sixshot = controller
    self.active = false

    self.timer = 0
    self.target = 40
    self.rating = nil

    self.hit = false
    self.hit_effect = SixShotHitEffect(self)
    self:addChild(self.hit_effect)
end

function SixShotBullet:update()
    super.update(self)

    if self.active then
        self.timer = self.timer + DTMULT * (1.6 + (self.sixshot.round/3.5))

        if self.timer >= 30 and Input.down("confirm") then
            local score = self:score()
            self.active = false
            self.hit = true
            self.hit_effect:activate(self.timer, self.target, score)
            self.sixshot:hit(score)
        end

        if not self.hit and self.timer > self.target then
            self.active = false
            self.sixshot:miss()
        end
    end
end

function SixShotBullet:score()
    if self.timer > self.target-2 then
        self.sixshot.hits = self.sixshot.hits + 1
        self.rating = "crit"
        self.sixshot.multiplier = self.sixshot.multiplier + .2
        return 28
    elseif self.timer > self.target - 7 then
        self.sixshot.hits = self.sixshot.hits + 1
        self.rating = "good"
        return 20
    else
        self.rating = "bad"
        return 0
    end
end

function SixShotBullet:draw()
    super.draw(self)

    love.graphics.setLineWidth(2)
    self:drawTimingCircle()

    if self.rating then
        if self.rating == "crit" then
            Draw.setColor(1, 1, 0, self.circle_alpha)
        elseif self.rating == "good" then
            Draw.setColor(0, 1, 1, self.circle_alpha)
        else
            Draw.setColor(1, 0, 0, self.circle_alpha)
        end
    else
        Draw.setColor(COLORS.white)
    end
    love.graphics.circle("line", 0, 0, (self.target - (self.target - 10)) * 1.5)

    Draw.setColor(COLORS.dkgray)

    love.graphics.circle("line", 0, 0, (self.target - (self.target - 7)) * 1.5)

    love.graphics.circle("line", 0, 0, (self.target - (self.target - 2)) * 1.5)
end

function SixShotBullet:drawTimingCircle()
    if self.active and self.timer < self.target then
        Draw.setColor(COLORS.red)
        love.graphics.circle("line", 0, 0, (self.target - self.timer) * 1.5)
    end
end

return SixShotBullet