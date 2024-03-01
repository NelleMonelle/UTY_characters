local spell, super = Class(Spell, "heal_wave")

function spell:init()
    super.init(self)

    self.name = "Heal Wave"
    self.cast_name = nil

    self.effect = "Heal All"
    self.description = "Heavenly light restores some HP to\nall party members. Depends on Magic."

    self.cost = 72

    self.target = "party"

    self.tags = {"heal"}
end

function spell:onCast(user, target)
    for _,battler in ipairs(target) do
        battler:heal(user.chara:getStat("magic") * 4)
    end
end

return spell