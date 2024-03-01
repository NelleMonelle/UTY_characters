local item, super = Class(Item, "guide_book")

function item:init()
    super.init(self)

    self.name = "Guide Book"

    self.type = "weapon"
    self.icon = "ui/menu/icon/book"

    self.effect = ""
    self.shop = ""
    self.description = "A book for the members of the Royal Guard."

    self.price = 100
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 0,
    }

    self.can_equip = {
        martlet = true,
    }

    self.reactions = {
        susie = "The hell do I do with it!?",
        ralsei = "You want me to read this?",
        noelle = "\"Royal Guard Protocol\"?",
        ceroba = "Thanks, but I don't need this.",
        martlet = "I better not lose that, haha!",
    }
end

return item