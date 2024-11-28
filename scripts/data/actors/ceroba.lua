local actor, super = Class(Actor, "ceroba")

function actor:init()
    super.init(self)

    self.name = "Ceroba"

    self.width = 26
    self.height = 54

    self.hitbox = {6, 40, 20, 16}

    self.color = {1, 1, 0}

    self.path = "party/ceroba/light"
    self.default = "walk"

    self.voice = "ceroba"
    self.portrait_path = "face/ceroba"
    self.portrait_offset = {-24, -10}

    self.can_blush = false

    self.animations = {
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 1/8, false},
        ["battle/act_ready"]    = {"battle/actready", 1/15, false},
        ["battle/spell_ready"]  = {"battle/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/spare_ready"]  = {"battle/actready", 1/15, false},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/attack_end"]   = {"battle/attackend", 1/15, false, next="battle/idle"},
        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},
        ["battle/defend_end"]   = {"battle/defendend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {"battle/intro", 1/15, false},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        -- Cutscene animations
        ["lean_back"]      = {"lean_back", 1/8, false},
        ["show_mask"]      = {"show_mask", 1/8, false},

        -- Animations from Ceroba's flashbacks
        ["run_worried"]    = {"flashback/run_worried", 1/8, false},
        ["sit"]            = {"flashback/sit", 1/8, false},
        ["stand_up"]       = {"flashback/stand_up", 1/8, false},

        -- Animations from Steamworks with Ceroba
        ["deflect"]        = {"steamworks/deflect", 1/8, false},
        ["guard"]          = {"steamworks/guard", 1/8, false},
        ["unguard"]        = {"steamworks/unguard", 1/8, false},
        ["picture"]        = {"steamworks/picture", 1/8, false},
        ["punch"]          = {"steamworks/punch", 1/8, false},
        ["unpunch"]        = {"steamworks/unpunch", 1/8, false},
        ["staff"]          = {"steamworks/staff", 1/8, false},
    }

    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {1, 2},
        ["walk/right"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/up"] = {0, 2},

        ["run/down"] = {1, 2},
        ["run/right"] = {-7, -5},
        ["run/left"] = {-7, -5},
        ["run/up"] = {0, 2},

        -- Battle offsets
        ["battle/idle"] = {-6, -6},

        ["battle/attack"] = {-6, -12},
        ["battle/attackready"] = {-6, -12},
        ["battle/attackend"] = {-6, -6},
        ["battle/act"] = {6, -7},
        ["battle/actend"] = {-7, -7},
        ["battle/actready"] = {-7, -7},
        ["battle/spell"] = {-1, -13},
        ["battle/spellready"] = {-1, -13},
        ["battle/item"] = {-12, -6},
        ["battle/itemready"] = {-12, -6},
        ["battle/defend"] = {-6, -7},
        ["battle/defendend"] = {-6, -7},

        ["battle/defeat"] = {-6, -6},
        ["battle/hurt"] = {-6, -6},

        ["battle/intro"] = {-6, -6},
        ["battle/victory"] = {-6, -6},

        -- Cutscene animations offsets
        ["lean_back"] = {0, 0},
        ["show_mask"] = {0, 0},

        ["flashback/run_worried"] = {0, 0},
        ["flashback/sit"] = {0, 0},
        ["flashback/stand_up"] = {0, 0},

        ["steamworks/deflect"] = {0, 0},
        ["steamworks/guard"] = {0, 0},
        ["steamworks/unguard"] = {0, 0},
        ["steamworks/picture"] = {0, 0},
        ["steamworks/punch"] = {0, 0},
        ["steamworks/unpunch"] = {0, 0},
        ["steamworks/staff"] = {0, 0},

        -- Cutscene sprites offsets
        ["cool"] = {0, 0},
        ["cool_alt"] = {0, 0},
        ["fall"] = {0, 0},
        ["lean"] = {0, 0},

        ["flashback/worried"] = {0, 0},
    }
end

--[[function actor:onTalkStart(text, sprite)
    self:play(1/4)
end
function actor:onTalkEnd(text, sprite)
    self:play(1/4)
end]]

return actor