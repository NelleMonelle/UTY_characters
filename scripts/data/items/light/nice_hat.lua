local item, super = Class(LightEquipItem, "nice_hat_light")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Nice Hat"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "A nicely looking hat, given to you by Starlo."

    -- Light world check text
    self.check = "Armor 3 DF\n* Looking nice."

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 0,
        defense = 3
    }

    -- Default dark item conversion for this item
    self.dark_item = "nice_hat"
end

return item