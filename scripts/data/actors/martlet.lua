local actor, super = Class(Actor, "martlet")

function actor:init()
    super.init(self)

    self.name = "Martlet"

    self.width = 27
    self.height = 49

    self.hitbox = {4, 32, 19, 14}

    self.color = {67/255, 124/255, 230/255}

    self.flip = nil

    self.path = "party/martlet/light"
    self.default = "walk"

    self.voice = "martlet"
    self.portrait_path = "face/martlet"
    self.portrait_offset = {-12, -12}

    self.can_blush = false

    self.talk_sprites = {
        ["talk/down"] = 1/4,
        ["talk/left"] = 1/4,
        ["talk/right"] = 1/4,
        ["talk/up"] = 1/4,

        ["talk_puddle/down"] = 1/4,
        ["talk_puddle/left"] = 1/4,
        ["talk_puddle/right"] = 1/4,
        ["talk_puddle/up"] = 1/4,

        ["talk_roof/down"] = 1/4,
        ["talk_roof/left"] = 1/4,
        ["talk_roof/right"] = 1/4,
        ["talk_roof/up"] = 1/4,

        ["book_talk"] = 1/4
    }

    self.animations = {
        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/spell", 1/10, false},
        ["battle/item"]         = {"battle/item", 1/12, false},
        ["battle/spare"]        = {"battle/act", 1/15, false},

        ["battle/attack_ready"] = {"battle/attackready", 1/15, false},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/spellready", 1/15, false},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/attack_end"]   = {"battle/attackend", 1/15, false, next="battle/idle"},
        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},
        ["battle/defend_end"]   = {"battle/defendend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {"battle/intro", 1/15, false},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        -- Cutscene animations
        ["book"]        = {"book", 1/15, false},
        ["fly_away"]    = {"fly_away", 1/15, false},
        ["stand_up"]    = {"stand_up", 1/15, false},
        ["wakeup"]      = {"wakeup", 1/15, false},
    }

    self.offsets = {
        -- Movement offsets
        ["walk/down"] = {0, -4},
        ["walk/right"] = {0, -7},
        ["walk/left"] = {0, -7},
        ["walk/up"] = {-2, -5},

        ["run/down"] = {0, -4},
        ["run/right"] = {-7, -9},
        ["run/left"] = {-7, -9},
        ["run/up"] = {-3, -5},

        -- Battle offsets
        ["battle/idle"] = {-2, 0},

        ["battle/attack"] = {-5, 0},
        ["battle/attackready"] = {-5, 0},
        ["battle/attackend"] = {-5, 0},
        ["battle/act"] = {3, 0},
        ["battle/actend"] = {3, 0},
        ["battle/actready"] = {3, 0},
        ["battle/spell"] = {-8, -3},
        ["battle/spellready"] = {-8, -3},
        ["battle/item"] = {-2, 0},
        ["battle/itemready"] = {-2, 0},
        ["battle/defend"] = {-2, 0},
        ["battle/defendend"] = {-2, 0},

        ["battle/defeat"] = {-2, 0},
        ["battle/hurt"] = {-2, 0},

        ["battle/intro"] = {-2, 0},
        ["battle/victory"] = {-2, 0},

        -- Cutscene offsets
        ["book"] = {0, 0},
        ["fly_away"] = {0, 0},
        ["stand_up"] = {0, 0},
        ["wakeup"] = {0, 0},
    }
end

return actor