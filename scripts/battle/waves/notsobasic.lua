local NotSoBasic, super = Class(Wave)

function NotSoBasic:init()
    super:init(self)
    self.time = 10
end

function NotSoBasic:onStart()
    self.timer:every(1/2, function()

        local bullet = self:spawnBullet("smallbullet", SCREEN_WIDTH + 20, Utils.random(Game.battle.arena.top, Game.battle.arena.bottom), math.rad(180), 6)
        local bullet = self:spawnBullet("smallbullet", 0, Utils.random(Game.battle.arena.top, Game.battle.arena.bottom), math.rad(0), 6)

        --local bullet = self:spawnBullet("smallbullet", Utils.random(Game.battle.arena.left, Game.battle.arena.right), SCREEN_HEIGHT + 20, math.rad(270), 6)
        --local bullet = self:spawnBullet("smallbullet", Utils.random(Game.battle.arena.left, Game.battle.arena.right), 0, math.rad(90), 6)

        local bullet = self:spawnBullet("smallbullet", Utils.random(Game.battle.arena.left, Game.battle.arena.right), SCREEN_HEIGHT + 20, math.rad(270), 12)

        bullet.remove_offscreen = false
    end)
end

--[[function NotSoBasic:update()

    super.update(self)
end]]

return NotSoBasic