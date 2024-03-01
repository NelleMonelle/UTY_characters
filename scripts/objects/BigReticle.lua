local BigReticle, super = Class(Sprite)

function BigReticle:init(score)
    super.init(self, "effects/attack/sam_aim")

    self.score = score
    self.color_fx = ColorMaskFX()
    self:addFX(self.color_fx)
    self:setScale(1)
    self:setOrigin(0.5)

    self.white = true
    self.timer = 0
end

function BigReticle:update()
    super.update(self)

    self.timer = self.timer + DTMULT
    if self.timer >= 2 then
        if self.white then
            self.color_fx.color = {0, 0, 0}
            self.white = false
        else
            if self.score >= 140 then
                self.color_fx.color = {1, 1, 130/255}
            else
                self.color_fx.color = {1, 1, 1}
            end
            self.white = true
        end
        self.timer = 0
    end

    self.scale_x = Utils.approach(self.scale_x, 2 + Utils.round(self.score/60), 1.5*DTMULT)
    self.scale_y = Utils.approach(self.scale_y, 2 + Utils.round(self.score/60), 1.5*DTMULT)
end

return BigReticle