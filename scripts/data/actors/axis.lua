local actor, super = Class(Actor, "axis")

function actor:init()
    super.init(self)

    self.name = "Axis"

    self.width = 35
    self.height = 45

    self.hitbox = {0, 25, 19, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/axis"
    self.default = "idle/down"

    self.voice = "axis"
    self.portrait_path = "face/axis"
    self.portrait_offset = {-26, -18}

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        -- Movement animations
        ["right"]                 = {"idle/right", 1/15, true},
        ["left"]                  = {"idle/left", 1/15, true},
        ["up"]                    = {"idle/up", 1/15, true},
        ["down"]                  = {"idle/down", 1/15, true},

        ["damaged_right"]         = {"idle_damaged/right", 1/15, true},
        ["damaged_left"]          = {"idle_damaged/left", 1/15, true},
        ["damaged_up"]            = {"idle_damaged/up", 1/15, true},
        ["damaged_down"]          = {"idle_damaged/down", 1/15, true},

        -- Cutscene animations
        ["ballthrow"]             = {"ballthrow", 1/20, true},
        ["bonk"]                  = {"bonk", 1/15, false},
        ["bonk_restore"]          = {"bonk_restore", 1/15, false},
        ["damaged_grab_lid"]      = {"damaged_grab_lid", 1/10, false},
        ["falls_up"]              = {"falls_up", 1/11, false},
        ["grab_lid"]              = {"grab_lid", 1/10, false},
        ["LOVE"]                  = {"LOVE", 1/10, true},
        ["shadowy_down"]          = {"shadowy_down", 1/15, true},

        -- Cutscene animations for
        -- Axis' acid manipulations
        ["acid_p1"]               = {"acid/p1", 1/15, true},
        ["acid_p2"]               = {"acid/p2", 1/10, false},
        ["acid_p3"]               = {"acid/p3", 1/10, true},
        ["acid_p4"]               = {"acid/p4", 1/10, true},
        ["acid_p5"]               = {"acid/p5", 1/10, false},

        -- Cutscene animations for
        -- Axis' aggressive mode
        ["redeyes_ball_loop"]     = {"redeyes/ball_loop", 1/15, false},
        ["redeyes_charge"]        = {"redeyes/charge", 1/12, false},
        ["redeyes_right"]         = {"redeyes/right", 1/15, false},
        ["redeyes_shot"]          = {"redeyes/shot", 1/10, false},
        ["redeyes_shot_end"]      = {"redeyes/shot_end", 1/10, false},
        ["redeyes_shot_slam"]     = {"redeyes/shot_slam", 1/10, false},

        -- Cutscene animations for
        -- Axis' ball manipulations
        ["ball_ball_loop"]         = {"ball/ball_loop", 1/15, true},
        ["ball_ballthrow"]         = {"ball/ballthrow_left", 1/15, false},
        ["ball_charge"]            = {"ball/charge", 1/15, false},
        ["ball_charge_again"]      = {"ball/charge_again", 1/15, false},
        ["ball_charge_yet_again"]  = {"ball/charge_yet_again", 1/15, false},
        ["ball_fall"]              = {"ball/fall", 1/15, false},
        ["ball_flip"]              = {"ball/flip", 1/12, false},
        ["ball_leave"]             = {"ball/leave", 1/15, false},
        ["ball_uncharge"]          = {"ball/uncharge", 1/15, false},
    }

    self.offsets = {
        -- Animations offsets
        ["idle/right"]            = {0, 0},
        ["idle/left"]             = {0, 0},
        ["idle/up"]               = {0, 0},
        ["idle/down"]             = {0, 0},

        ["idle_damaged/right"]    = {0, 0},
        ["idle_damaged/left"]     = {0, 0},
        ["idle_damaged/up"]       = {0, 0},
        ["idle_damaged/down"]     = {0, 0},

        ["ballthrow"]             = {0, 0},
        ["bonk"]                  = {0, 0},
        ["bonk_restore"]          = {0, 0},
        ["damaged_grab_lid"]      = {0, 0},
        ["falls_up"]              = {0, 0},
        ["grab_lid"]              = {0, 0},
        ["LOVE"]                  = {0, 0},
        ["shadowy_down"]          = {0, 0},

        ["acid/p1"]               = {0, 0},
        ["acid/p2"]               = {0, 0},
        ["acid/p3"]               = {0, 0},
        ["acid/p4"]               = {0, 0},
        ["acid/p5"]               = {0, 0},

        ["redeyes/ball_loop"]     = {0, 0},
        ["redeyes/charge"]        = {0, 0},
        ["redeyes/right"]         = {0, 0},
        ["redeyes/shot"]          = {0, 0},
        ["redeyes/shot_end"]      = {0, 0},
        ["redeyes/shot_slam"]     = {0, 0},

        ["ball/ball_loop"]         = {0, 0},
        ["ball/ballthrow_left"]    = {0, 0},
        ["ball/charge"]            = {0, 0},
        ["ball/charge_again"]      = {0, 0},
        ["ball/charge_yet_again"]  = {0, 0},
        ["ball/fall"]              = {0, 0},
        ["ball/flip"]              = {0, 0},
        ["ball/leave"]             = {0, 0},
        ["ball/uncharge"]          = {0, 0},

        -- Sprite offsets
        ["damaged_trash_down"]    = {0, 0},
        ["damaged_trash_left"]    = {0, 0},
        ["dead"]                  = {0, 0},
        ["dead_regular"]          = {0, 0},
        ["trash_down"]            = {0, 0},
        ["trash_left"]            = {0, 0},
        ["trash_right"]           = {0, 0},

        ["acid/p6"]               = {0, 0},

        ["redeyes/flyback"]       = {0, 0},
    }
end

return actor