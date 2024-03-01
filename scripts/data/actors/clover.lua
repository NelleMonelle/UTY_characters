local actor, super = Class(Actor, "clover")

function actor:init()
    super.init(self)

    self.name = "Clover"

    self.width = 19
    self.height = 37

    self.hitbox = {0, 25, 19, 14}

    self.soul_offset = {10, 24}

    self.color = {0, 1, 1}

    self.path = "party/clover/dark"

    self.default = "walk"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.animations = {
        -- Movement animations
        ["slide"]               = {"slide", 4/30, true},

        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 0.2, true},

        ["battle/attack"]       = {"battle/attack", 1/10, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/act", 1/15, false},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 1/7, false},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/actready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/attack_end"]   = {"battle/attackend", 1/15, false, next="battle/idle"},
        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {"battle/intro", 1/15, false},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        -- Cutscene animations
        ["jump_fall"]           = {"fall", 1/5, true},
        ["jump_ball"]           = {"ball", 1/15, true},
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 7},
        ["walk/right"] = {0, 7},
        ["walk/up"] = {0, 7},
        ["walk/down"] = {0, 7},

        ["walk_geno/left"] = {0, 7},
        ["walk_geno/right"] = {0, 7},
        ["walk_geno/up"] = {0, 7},
        ["walk_geno/down"] = {0, 7},

        ["walk_goggles/left"] = {0, 7},
        ["walk_goggles/right"] = {0, 7},
        ["walk_goggles/up"] = {0, 7},
        ["walk_goggles/down"] = {0, 7},

        ["run/left"] = {0, 5},
        ["run/right"] = {0, 5},
        ["run/up"] = {0, 5},
        ["run/down"] = {0, 5},

        ["run_geno/left"] = {0, 5},
        ["run_geno/right"] = {0, 5},
        ["run_geno/up"] = {0, 5},
        ["run_geno/down"] = {0, 5},

        ["slide"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {0, 0},

        ["battle/attack"] = {0, 0},
        ["battle/attackready"] = {0, 0},
        ["battle/act"] = {0, 0},
        ["battle/actend"] = {0, 0},
        ["battle/actready"] = {0, 0},
        ["battle/item"] = {0, 0},
        ["battle/itemready"] = {0, 0},
        ["battle/defend"] = {0, 0},

        ["battle/defeat"] = {0, 0},
        ["battle/hurt"] = {0, 0},

        ["battle/intro"] = {0, 0},
        ["battle/victory"] = {0, 0},

        -- Cutscene offsets
        ["pose"] = {0, 0},
    }
end

return actor