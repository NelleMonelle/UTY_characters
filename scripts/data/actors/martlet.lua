local actor, super = Class(Actor, "martlet")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Martlet"

    -- Width and height for this actor, used to determine its center
    self.width = 27
    self.height = 49

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {4, 32, 19, 14}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {67/255, 124/255, 230/255}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/martlet/light"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "martlet"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/martlet"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = {-12, -12}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- Table of sprite animations
    self.animations = {

        -- Movement animations
        ["slide"] = { "slide", 0, 0},
        ["up_noeyes"] = {"up_noeyes", 0, 0, 1.25},


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

        ["wakeup"]      = {"wakeup", 1/15, false},
        ["stand_up"]      = {"stand_up", 1/15, false},
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

        ["angry_intro"] = {0, 0},
        ["shocked"] = {0, -5},
        ["noeyes"] = {0, 0},


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

        ["wakeup"] = {0, 9},
        ["stand_up"] = {0, 9},
    }
end

return actor