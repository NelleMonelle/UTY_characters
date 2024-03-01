local spell, super = Class(Spell, "paralyze")

function spell:init()
    super.init(self)

    self.name = "Paralysis"

    self.effect = "Ceroba's\nSpecial"
    self.description = "Deals massive damage to one enemy.\nDepends on Magic."

    self.cost = 65

    self.target = "enemy"

    self.tags = {"Damage"}
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." used "..self:getCastName().."!"
end

function spell:onCast(user, target)
	local damage = math.floor((((user.chara:getStat("magic") * 150) / 20) - 3 * (target.defense)) * 1.3)

	local function generateSlash(scale_x)
		local cutAnim = Sprite("effects/attack/diamond")
		cutAnim:setOrigin(0.5, 0.5)
		cutAnim:setScale(2.5 * scale_x, 2.5)
		cutAnim:setPosition(target:getRelativePos(target.width/2, target.height/2))
		cutAnim.layer = target.layer + 0.01
		Assets.playSound("trap")
		cutAnim:play(1/20, false, function(s) s:remove() end)
		user.parent:addChild(cutAnim)
	end

	Game.battle.timer:after(15/30, function()
		target:flash()
		target:hurt(damage, user)
	end)

	generateSlash(1)
end

return spell
