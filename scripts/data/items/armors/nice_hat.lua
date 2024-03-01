local item, super = Class(Item, "nice_hat")

function item:init()
    super.init(self)

    self.name = "Nice hat"

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = "Defensive\ncharm"
    self.description = "A nicely looking hat, given\nto you by Starlo."

    self.price = 30
    self.can_sell = true

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        defense = 3,
    }

    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {
        noelle = false,
        ceroba = false,
        martlet = false,
    }

    self.reactions = {
        susie = "Yeah, I'm a cowboy now!",
        ralsei = "Yee-haw!",
        noelle = "Sorry, my antlers won't fit...",
        ceroba = "Starlo gave you this, huh...?",
        martlet = "It looks better on you, Clover!",
    }
end

return item