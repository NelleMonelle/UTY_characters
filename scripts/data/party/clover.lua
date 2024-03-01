local character, super = Class(PartyMember, "clover")

function character:init()
    super.init(self)

    self.name = "Clover"

    self:setActor("clover")

    self.level = 1
    self.title = "Human\nThe soul of\njustice."

    self.soul_priority = 2
    self.soul_color = {1, 1, 0}

    self.has_act = true
    self.has_spells = false

    self.has_xact = false
    self.xact_name = "Clov-Action"

    --self:addSpell("revolver_spin")

    self.health = 120

    self.stats = {
        health = 120,
        attack = 12,
        defense = 2,
        magic = 0
    }

    self.max_stats = {
        health = 160
    }

    self.weapon_icon = "ui/menu/equip/revolver"

    self:setWeapon("wild_revolver")
    self:setArmor(1, "nice_hat")
    self:setArmor(2, "golden_bandana")

    self.lw_weapon_default = "wild_revolver_light"
    self.lw_armor_default = "nice_hat_light"

    self.color = {1, 1, 0}
    self.dmg_color = {1, 1, 0.3}
    self.attack_bar_color = {1, 1, 153/255}
    self.attack_box_color = {1, 1, 0}
    self.xact_color = {1, 1, 0.5}

    self.menu_icon = "party/clover/head"
    --self.menu_icon = "party/clover/head_geno"
    self.head_icons = "party/clover/icon"
    self.name_sprite = "party/clover/name"

    self.attack_sprite = "effects/attack/shot"
    self.attack_sound = "shot"
    self.attack_pitch = 1

    self.battle_offset = {2, 1}
    self.head_icon_offset = nil
    self.menu_icon_offset = nil

    self.gameover_message = nil
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local frames = Assets.getFrames("misc/dog_sleep")
        local frame = math.floor(Kristal.getTime()) % #frames + 1
        love.graphics.print("Dog:", x, y)
        Draw.draw(frames[frame], x+120, y+5, 0, 2, 2)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        if Game.chapter >= 2 then
            Draw.draw(icon, x+110, y+6, 0, 2, 2)
        end
        return true
    end
end

return character