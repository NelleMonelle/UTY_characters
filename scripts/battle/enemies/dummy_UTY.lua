local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    self.name = "Dummy"
    self:setActor("dummy")

    self.max_health = 2000
    self.health = 2000
    self.attack = 5
    self.defense = 0
    self.money = 1000

    self.spare_points = 5

    self.waves = {
        "notsobasic"
    }

    self.dialogue = {
        "..."
    }

    self.check = "AT 5 DF 0\n* Cotton heart and button eye\n* Looks just like a fluffy guy."

    self.text = {
        "* The dummy gives you a soft\nsmile.",
        "* The power of fluffy boys is\nin the air.",
        "* Smells like cardboard.",
    }
    self.low_health_text = "* The dummy looks like it's\nabout to fall over."

    self:registerAct("Smile")
    self:registerAct("Compliment", "", {"martlet"})
    self:registerAct("Rev. Spin", "Bullet\nAttack", nil, 70)
    self:registerAct("M. Guard", "Raise\nShields", {"ceroba"}, 70)
end

function Dummy:onAct(battler, name)
    if name == "Smile" then
        self:addMercy(10)
        return "* You smile.[wait:5]\n* The dummy smiles back."
    elseif name == "Compliment" then
        self:addMercy(20)
        return "* You and Martlet complimented\nthe enemy."
    elseif name == "M. Guard" then
        Game.battle:powerAct("multi_guard", battler, "ceroba")
    elseif name == "Rev. Spin" then
        local attack = SixShot(SCREEN_WIDTH/2 - 50, 365 + 170, battler, self)
        attack.layer = BATTLE_LAYERS["above_ui"]
        Game.battle:addChild(attack)
        return false
    elseif name == "Standard" then 
        self:addMercy(5)
        if battler.chara.id == "ralsei" then
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        elseif battler.chara.id == "ceroba" then
            return "* Ceroba spins her staff."
        elseif battler.chara.id == "martlet" then
            return "* Martlet reads her book."
        else
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    return super.onAct(self, battler, name)
end

return Dummy