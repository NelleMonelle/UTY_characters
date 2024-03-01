local Reticle, super = Class(Sprite)

function Reticle:init(controller, target)
    super.init(self, "effects/attack/sam_aim")

    self.controller = controller
    self.target = target

    self:setScale(2)
    self:setOrigin(0.5)
    self.timer = 0
    self:flash()

    self.state = "FLOATING" -- FLOATING, HOMING
    self.radius = 90
    self.radius_timer = 0
    self.alpha = 0.9

    self.time_timer = 1
end

function Reticle:update()
    super.update(self)

    if self.state == "FLOATING" then
        self.timer = self.timer + DT

        self:setPosition(self.target:getRelativePos(self.target.width/2, self.target.height/2))
        self.x = self.x + self.radius * math.cos(self.timer * 2*math.pi/6)
        self.y = self.y + self.radius * math.sin(self.timer * 2*math.pi/6)
    elseif self.state == "HOMING" then
        self.timer = self.timer + DT * self.time_timer
        self.time_timer = self.time_timer + DTMULT
        self.radius_timer = self.radius_timer + DTMULT/17

        self.scale_x = Utils.approach(self.scale_x, Utils.round(2 + self.controller.score/60), 0.2*DTMULT)
        self.scale_y = Utils.approach(self.scale_y, Utils.round(2 + self.controller.score/60), 0.2*DTMULT)
        
        self.rotation = self.rotation + math.rad(20) * DTMULT

        self.radius = Utils.ease(90, 0, self.radius_timer, "inExpo")

        self:setPosition(self.target:getRelativePos(self.target.width/2, self.target.height/2))
        self.x = self.x + self.radius * math.cos(self.timer * 2*math.pi/6)
        self.y = self.y + self.radius * math.sin(self.timer * 2*math.pi/6)

        if self.rotation >= math.rad(270) then
            self.rotation = math.rad(270)
        end
    end
end

return Reticle