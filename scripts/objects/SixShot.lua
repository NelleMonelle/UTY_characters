local SixShot, super = Class(Object)

function SixShot:init(x, y, battler, target)
    super.init(self, x, y)
    
    self.fader = Fader()
    self.fader.alpha = 0
    self.fader.layer = BATTLE_LAYERS["below_ui"]
    Game.battle:addChild(self.fader)

    self.battler = battler
    self.battler_layer = self.battler.layer
    self.battler.layer = self.fader.layer + 1

    self.target = target
    self.target_layer = self.target.layer
    self.target.layer = self.fader.layer + 1

    self:setOrigin(0.5)
    self.score = 0
    self.multiplier = 1
    self.round = 1
    self.hits = 0

    self.offset_x = 50
    self.offset_y = 55
    self.radius = 35

    self.bullets = {}
    self.reticles = {}

    self:setupAttack()

    self.state = "STOPPED" -- STOPPED, SPINNING, SPINDONE, FINISHED
    self.spin_timer = 0

    self.fade_rect = Rectangle(0, 0, 300, 300)
    self.fade_rect:setColor(COLORS.black)
    self.fade_rect.alpha = 0
    self:addChild(self.fade_rect)
end

function SixShot:setupAttack()
    self.battler:setActSprite("party/clover/dark/battle/attackready", -10, -12, 1/2)

    for i = 0, 5 do
        local bullet = SixShotBullet(self)
        bullet.x = self.radius * math.cos( ((((i+4) - self.round)) * 2*math.pi/6) + math.pi/2) + self.offset_x
        bullet.y = self.radius * math.sin( ((((i+4) - self.round)) * 2*math.pi/6) + math.pi/2) + self.offset_y
        table.insert(self.bullets, bullet)
        self:addChild(bullet)
    end

    for _,bullet in ipairs(self.bullets) do
        Game.battle.timer:tween(0.65, self, {y = 507}, "out-expo", function()
            Game.battle.timer:after(0.3, function()
                Assets.playSound("gunprep", 0.2)
                self.offset_y = 55
                self.bullets[self.round].active = true
            end)
        end)
    end
end

function SixShot:update()
    super.update(self)
    
    if self.state == "SPINNING" then
        self.spin_timer = self.spin_timer + DTMULT*1.7

        if self.spin_timer < 10 then
            local spin_timer = Utils.lerp(0, 6, self.spin_timer/60)
            for i, bullet in ipairs(self.bullets) do
                bullet.x = self.radius * math.cos( ((((i+3) - self.round) - spin_timer) * 2*math.pi/6) + math.pi/2) + self.offset_x
                bullet.y = self.radius * math.sin( ((((i+3) - self.round) - spin_timer) * 2*math.pi/6) + math.pi/2) + self.offset_y
            end
        else
            self.state = "SPINDONE"
        end
    elseif self.state == "SPINDONE" then
        if self.round <= 5 then
            Assets.playSound("load_ex", 0.9, 0.9)
            self.spin_timer = 0
            self.round = self.round + 1
            self.bullets[self.round].active = true
        else
            self:finish()
        end
        self.state = "STOPPED"
    elseif self.state == "FINISHED" then
        self.fade_rect.alpha = Utils.approach(self.fade_rect.alpha, 1, 0.08 * DTMULT)
    end

end

function SixShot:hit(score)
    if score > 0 then
        local reticle = Reticle(self, self.target)
        reticle:setPosition(self.target:getRelativePos(self.target.width/2, -self.target.height/2))
        reticle.layer = self.target.layer + 0.01
        table.insert(self.reticles, reticle)
        Game.battle:addChild(reticle)
    end

    self.score = self.score + score
    Game.battle.music:fade(1/self.round)
    self.fader:fadeOut(nil, {color = {0, 0, 0, self.round/6, speed = 0.3}})

    if self.round <= 5 then
        Game.battle.timer:after(1/3, function()
            Assets.playSound("cycle_ex", 1, 0.93)
            self.state = "SPINNING"
        end)
    else
        self:finish()
    end
end

function SixShot:miss()
    self:finish()
end

function SixShot:finish()
    Game.battle.music:fade(1, 1)
    self.fader:fadeIn(function()
        self.battler.layer = self.battler_layer
        self.target.layer = self.target_layer
    end)

    self.state = "FINISHED"

    Game.battle.timer:script(function(wait)
        if self.hits > 0 then
            Assets.playSound("gunshot")
            Assets.playSound("gunshot", 0.5)
            if self.score >= 140 then
                Assets.playSound("saber3")
            end

            local big_reticle = BigReticle(self.score)
            big_reticle:setPosition(self.target:getRelativePos(self.target.width/2, self.target.height/2))
            big_reticle.layer = self.target.layer + 0.01
            Game.battle:addChild(big_reticle)

            for _,reticle in ipairs(self.reticles) do
                reticle:flash()
                reticle.state = "HOMING"
            end
            wait(0.6)

            for _,reticle in ipairs(self.reticles) do
                reticle:flash()
            end
            big_reticle:remove()
            Assets.playSound("bell_bounce_short", 1, 1.1)
            Assets.playSound("bell_bounce_short", 1, 1.1)

            wait(0.1)

            local hit_count = 1
            Game.battle.timer:every(0.2, function()
                local dmg_sprite = Sprite(self.battler.chara:getAttackSprite() or "effects/attack/cut")
                if self.bullets[hit_count].rating == "crit" then
                    dmg_sprite:setOrigin(0.5, 0.5)
                    dmg_sprite:setScale(3)
                else
                    local variance = Utils.random(-0.2, 0.2)
                    dmg_sprite:setOrigin(0.5 + variance, 0.5 + variance)
                    dmg_sprite:setScale(2)
                end
                dmg_sprite:setPosition(self.target:getRelativePos(self.target.width/2, self.target.height/2))
                dmg_sprite.layer = self.target.layer + 0.01
                dmg_sprite:play(1/15, false, function(s) s:remove() end)
                self.target.parent:addChild(dmg_sprite)

                if self.score >= 140 then
                    Assets.playSound("criticalswing")
                    Assets.playSound("criticalswing")
                end

                Assets.playSound("revolver_shoot", 0.7, 0.8)
                self.battler:setAnimation("battle/attack")
                hit_count = hit_count + 1
            end, self.hits)
            wait(0.213*self.hits)

            local damage = (self.battler.chara:getStat("attack") * 2) * (self.score/16) * self.multiplier
            local sound = self.target:getDamageSound() or "damage"
            if sound and type(sound) == "string" then
                if self.score >= 140 then
                    Assets.playSound("scytheburst")
                    Assets.playSound("scytheburst")
                end

                Assets.playSound(sound)
                Assets.playSound(sound)
            end
            self.target:hurt(math.ceil(damage), self.battler)
        else
            Assets.playSound("error")
            self.battler:setAnimation("battle/hurt")
            self.target:hurt(0, self.battler)
        end

        for _,reticle in ipairs(self.reticles) do
            reticle:fadeOutAndRemove(0.5)
        end
        
        wait(1.5)

        Game.battle:finishActionBy(self.battler)
        self:remove()
    end)
end

return SixShot