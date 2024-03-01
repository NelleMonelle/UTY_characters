local character, super = Class(PartyMember, "martlet")

function character:init()
    super.init(self)

    self.name = "Martlet"

    self:setActor("martlet")

    self.level = 1
    self.title = "Royal Guard\nA little\nscatterbrained."
    
    self.soul_priority = 1
    self.soul_color = {1, 1, 1}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "M-Action"

    self:addSpell("snow_fatigue")
    self:addSpell("feather_shot")

    self.health = 140

    self.stats = {
        health = 140,
        attack = 10,
        defense = 2,
        magic = 7
    }

    self.max_stats = {
        health = 170,
    }

    self.weapon_icon = "ui/menu/equip/book"

    self:setWeapon("guide_book")
    --self:setArmor(1, "something")
    --self:setArmor(2, "something")

    self.lw_weapon_default = "light/lucky_pencil"
    self.lw_armor_default = "light/bandage"

    self.color = {67/255, 124/255, 230/255}
    self.dmg_color = {67/255, 124/255, 230/255}
    self.attack_bar_color = {67/255, 124/255, 230/255}
    self.attack_box_color = {67/255, 124/255, 230/255}
    self.xact_color = {67/255, 124/255, 230/255}

    self.menu_icon = "party/martlet/head"
    self.head_icons = "party/martlet/icon"
    self.name_sprite = "party/martlet/name"

    self.attack_sprite = "effects/attack/mash_martlet"
    self.attack_sound = "laz_c"
    self.attack_pitch = 0.9

    self.battle_offset = {0, 0}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = {
        "Oh no,[wait:5] are\nyou alright!?",
        "Please,[wait:5]\nget up!"
    }
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Flying", x, y)
        love.graphics.print("Yes", x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/smile")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Kindness", x, y, 0, 0.8, 1)
        love.graphics.print(100, x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        Draw.draw(icon, x+110, y+6, 0, 2, 2)
        return true
    end
end

return character