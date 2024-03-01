local item, super = Class(Item, "wild_revolver")

function item:init()
    super.init(self)

    self.name = "W. Revolver"

    self.type = "weapon"
    self.icon = "ui/menu/icon/gun"

    self.effect = ""
    self.shop = ""
    self.description = "A revolver from the Wild East.\nShoots six times before reloading."

    self.price = 200
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 4,
    }

    self.can_equip = {
        clover = true,
    }

    self.reactions = {
        susie = "I perfer axes.",
        ralsei = "...Where did you get that?",
        noelle = "I'm a terrible shooter...",
        ceroba = "Guns aren't my type.",
        martlet = "It looks better in your hands!",
    }

end

function item:convertToLightEquip(chara)
    return "wild_revolver_light"
end

return item