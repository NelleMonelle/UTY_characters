local actor, super = Class(Actor, "starlo")

function actor:init()
    super.init(self)

    self.name = "Starlo"

    self.width = 25
    self.height = 58

    self.hitbox = {0, 45, 26, 10}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/starlo"
    self.default = "walk"

    self.voice = "starlo"
    self.portrait_path = "face/starlo"
    self.portrait_offset = {-24, -16}

    self.can_blush = false

    self.talk_sprites = {
        ["talk/down"] = 1/4,
        ["talk/left"] = 1/4,
        ["talk/right"] = 1/4,
        ["talk/up"] = 1/4,

        ["talk_goggles/down"] = 1/4,
        ["talk_goggles/left"] = 1/4,
        ["talk_goggles/right"] = 1/4,

        ["talk_sad/down"] = 1/4,
        ["talk_sad/left"] = 1/4,
        ["talk_sad/right"] = 1/4,

        ["hat/talk_hat"] = 1/4
    }

    self.animations = {
        ["pose"] = {"pose", 1/10, false},
        ["reveal"] = {"reveal", 1/10, false},
        ["up_wind"] = {"up_wind", 1/10, true},
        ["walk_menacing"] = {"walk_menacing", 1/10, true},
        ["whip"] = {"whip", 1/10, false},

        ["goggleless_shoot"] = {"dual/goggleless_shoot", 1/10, false},
        ["goggleless_shot"] = {"dual/goggleless_shot", 1/10, false},
        ["goggles_shoot"] = {"dual/goggles_shoot", 1/10, false},

        ["hat"] = {"hat/hat", 1/10, false},
    }

    self.offsets = {
        ["walk/down"]  = {0, 0},
        ["walk/left"]  = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"]    = {0, 0},
        ["up_wind"]    = {0, 0},
        ["whip"]       = {-39, -55}
    }
end

return actor