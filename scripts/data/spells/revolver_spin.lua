local spell, super = Class(Spell, "revolver_spin")

function spell:init()
    super.init(self)

    self.name = "Revolver Spin"
    --self.cast_name = "MULTI GUARD"

    self.effect = "Shoot\nBullets"
    self.description = "Clover uses his six-shooter."

    self.cost = 70

    self.target = "enemy"

    self.tags = {"Damage"}
end

function spell:onCast(user, target)
    local attack = SixShot(target.x, target.y, user, target)
    attack.layer = BATTLE_LAYERS["above_ui"]
    Game.battle:addChild(attack)
end

return spell