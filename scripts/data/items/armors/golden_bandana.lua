local item, super = Class(Item, "golden_bandana")

function item:init()
    super.init(self)

    self.name = "G. Bandana"

    self.type = "armor"
    self.icon = "ui/menu/icon/armor"

    self.effect = ""
    self.shop = "Defensive\ncharm"
    self.description = "The most stunning piece of fabric\nyou've ever seen.."

    self.price = 2000
    self.can_sell = true

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        defense = 6,
    }

    self.bonus_name = nil
    self.bonus_icon = nil

    self.can_equip = {}

    self.reactions = {
        susie = "Looks awesome!",
        ralsei = "Do I look cool?",
        noelle = "It's so shiny!",
        ceroba = "Thanks.",
        martlet = "Wow, I like it!",
    }
end

return item