local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    self.text = "* The tutorial begins...?"

    if Game:getFlag("MUSIC") == 1 then
        self.music = "forlorn"
    elseif Game:getFlag("MUSIC") == 2 then
        self.music = "protocol"
    elseif Game:getFlag("MUSIC") == 3 then
        self.music = "showdown"
    elseif Game:getFlag("MUSIC") == 4 then
        self.music = "guns_blazing"
    elseif Game:getFlag("MUSIC") == 5 then
        self.music = "enemy_retreating"
    elseif Game:getFlag("MUSIC") == 6 then
        self.music = "apprehension"
    elseif Game:getFlag("MUSIC") == 7 then
        self.music = "trial_by_fury"
    elseif Game:getFlag("MUSIC") == 8 then
        self.music = "END_OF_THE_LINE_"
    elseif Game:getFlag("MUSIC") == 9 then
        self.music = "battle_yellow"
    elseif Game:getFlag("MUSIC") == 10 then
        self.music = "battle_yellow_snowdin"
    elseif Game:getFlag("MUSIC") == 11 then
        self.music = "battle_yellow_dunes"
    elseif Game:getFlag("MUSIC") == 12 then
        self.music = "battle_yellow_steamworks"
    elseif Game:getFlag("MUSIC") == 13 then
        self.music = "fever_pitch"
    elseif Game:getFlag("MUSIC") == 14 then
        self.music = "DANZA"
    elseif Game:getFlag("MUSIC") == 15 then
        self.music = "deal_em_out"
    elseif Game:getFlag("MUSIC") == 16 then
        self.music = "TENTH_LEVEL_LOCKDOWN"
    elseif Game:getFlag("MUSIC") == 17 then
        self.music = "some_point_of_no_return"
    elseif Game:getFlag("MUSIC") == 18 then
        self.music = "a_mothers_love"
    elseif Game:getFlag("MUSIC") == 19 then
        self.music = "BEST_FRIENDS_FOREVER"
    elseif Game:getFlag("MUSIC") == 20 then
        self.music = "AFTERLIFE"
    elseif Game:getFlag("MUSIC") == 21 then
        self.music = "remedy"
    elseif Game:getFlag("MUSIC") == 22 then
        self.music = "retribution"
    elseif Game:getFlag("MUSIC") == 23 then
        self.music = "fun_sized"
    elseif Game:getFlag("MUSIC") == 24 then
        self.music = "through_the_macro_lens"
    else
        self.music = "battle"
    end

    self.background = true

    self:addEnemy("dummy_UTY")
end

return Dummy