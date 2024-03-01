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
        ["idle/right"] = {"idle/right", 1/15, true},
        ["idle/left"]  = {"idle/left", 1/15, true},
        ["idle/up"]    = {"idle/up", 1/15, true},
        ["idle/down"]  = {"idle/down", 1/15, true},
    }

    self.offsets = {
        ["idle/right"] = {0, 0},
        ["idle/left"]  = {0, 0},
        ["idle/up"]    = {0, 0},
        ["idle/down"]  = {0, 0},
    }
end

return actor