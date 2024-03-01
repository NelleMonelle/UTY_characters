local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/smallbullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

function SmallBullet:onYellowShot(shot, damage)
    Assets.playSound("damage")
    self.physics = {}
    self.collidable = false
    self.color = {1,1,1}
    self.graphics.grow = 0.5
    self:fadeOutAndRemove(0.5)
    --self.physics.direction = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
    --self:explode()
    return "d", false
end

return SmallBullet