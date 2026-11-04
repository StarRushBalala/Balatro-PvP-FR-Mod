local init_game_object_ref = Game.init_game_object

function Game.init_game_object(self)

    local ret = init_game_object_ref(self)

    -- referenced code from Ortalab to get the list of secret hands
    -- but also kinda not anymore (thanks N')
    local secrets = {}
    for k, v in pairs(SMODS.PokerHands) do
        if (type(v.visible) == 'function' and not v:visible()) or v.visible == false then table.insert(secrets, k) end
    end

    ret.Mod = {
        coin_collection_adding_money = false,
        has_used_consumables = false,
        communs = 0,
        noble_letter_rank = '7',
    } 

    return ret
end