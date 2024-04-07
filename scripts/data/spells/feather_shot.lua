local spell, super = Class(Spell, "feather_shot")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Feather Shot"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Damage\nto ALL"
    -- Menu description
    self.description = "Deals moderate damage to all foes.\nDepends on Attack and Magic."

    -- TP cost
    self.cost = 60

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemies"

    -- Tags that apply to this spell
    self.tags = {"damage"}
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." used "..self:getCastName().."!"
end

function spell:getDamage(user, target, pressed)
    local damage = math.ceil((user.chara:getStat("attack") * 7) + (user.chara:getStat("magic") * 5) - (target.defense * 3))
    return damage
end

function spell:onCast(user, target)
    local sound_rnd = math.random(1, 3)
    if sound_rnd == 3 then
        Assets.playSound("feahter_atk3")
    elseif sound_rnd == 2 then
        Assets.playSound("feahter_atk2")
    else
        Assets.playSound("feahter_atk1")
    end

    Game.battle.timer:after(0.45, function()
        local each_obj_dist = 60
        for i = 0, 3-1 do
            local this_x = -each_obj_dist + each_obj_dist*i
            local j = Sprite(
            "effects/feathershot/feather_down",
            550 + this_x, -80 -- almost static position
            )
            j:setScale(2)
            j:setOrigin(0.5, 0.5)
            j:setLayer(BATTLE_LAYERS["above_battlers"]) -- generic layer
            Game.battle:addChild(j)
            Game.battle.timer:after(0.2, function()
                j.physics.speed_y = 100
            end)
        end
    end)

    Game.battle.timer:after(0.8, function()
        for i, enemy in ipairs(Game.battle.enemies) do
            if enemy then
                enemy:hurt((user.chara:getStat("attack") * 9) + Utils.round(math.random(10)), self.caster)
            end
        end
    end)

    Game.battle.timer:after(1, function()
        Game.battle:finishActionBy(user)
    end)

    return false
end

function spell:onLightCast(user, target)
    local sound_rnd = math.random(1, 3)
    if sound_rnd == 3 then
        Assets.playSound("feahter_atk3")
    elseif sound_rnd == 2 then
        Assets.playSound("feahter_atk2")
    else
        Assets.playSound("feahter_atk1")
    end

    Game.battle.timer:after(0.45, function()
        local each_obj_dist = 60
        for i = 0, 3-1 do
            local this_y = -each_obj_dist + each_obj_dist*i
            local j = Sprite(
            "effects/feathershot/feather",
            -80, 120 + this_y -- almost static position
            )
            j:setScale(2)
            j:setOrigin(0.5, 0.5)
            j:setLayer(BATTLE_LAYERS["above_battlers"]) -- generic layer
            Game.battle:addChild(j)
            Game.battle.timer:after(0.2, function()
                j.physics.speed_x = 100
            end)
        end
    end)

    Game.battle.timer:after(0.8, function()
        for i, enemy in ipairs(Game.battle.enemies) do
            if enemy then
                enemy:hurt((user.chara:getStat("attack") * 9) + Utils.round(math.random(10)), user)
            end
        end
    end)

    Game.battle.timer:after(1, function()
        Game.battle:finishActionBy(user)
    end)

    return false
end

return spell