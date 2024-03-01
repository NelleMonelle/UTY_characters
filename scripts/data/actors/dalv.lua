local actor, super = Class(Actor, "dalv")

function actor:init()
    super.init(self)

    self.name = "Dalv"

    self.width = 25
    self.height = 55

    self.hitbox = {0, 45, 26, 10}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/dalv"
    self.default = "walk"

    self.voice = "dalv"
    self.portrait_path = "face/dalv"
    self.portrait_offset = {-16, 4}

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["hoodoff"] = {"hoodoff", 0.2, false},
        ["falsh"] = {"flash", 1/15, false}
    }

    self.offsets = {
        ["walk/down"]  = {0, 0},
        ["walk/left"]  = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"]    = {0, 0},
        ["up_wind"]    = {0, 0},
        ["hoodoff"]    = {0, 0},
        ["flash"]    = {0, 0}
    }
end

return actor