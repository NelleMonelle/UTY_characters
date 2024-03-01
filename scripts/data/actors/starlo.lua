local actor, super = Class(Actor, "starlo")

function actor:init()
    super.init(self)

    self.name = "Starlo"

    self.width = 25
    self.height = 55

    self.hitbox = {0, 45, 26, 10}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "npcs/starlo"
    self.default = "walk"

    self.voice = "starlo"
    self.portrait_path = "face/starlo"
    self.portrait_offset = {-24, -16}

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"battle/idle", 0.25, true},
        ["up_wind"] = {"up_wind", 1/10, true},
        ["whip"] = {"whip", 1/10, false},
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