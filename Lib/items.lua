local itemsToLoad = {

    Joker = {
        'compressed',
        'investement',
        'purple-ficate',
        'chinesemaaans_dad',
        'seal-o-maniac',
    },
    Voucher = {

    },
    Tarot = {

    },
    Spectral = {

    },
    Planet = {

    },


    Seal = {

    },

    Back = {

    },
    Enhancement = {

    },
    Edition = {

    },
    Blind = {

    },
    Booster = {

    },
    Suit = {

    },
    Rank = {

    },
}

for item_type, items in pairs(itemsToLoad) do
    for _, item_key in ipairs(items) do
        local item_path = "Items/" .. string.lower(item_type) .. "s/" .. item_key .. ".lua"
        local item_init, item_error = SMODS.load_file(item_path)
        
        if item_error then
            sendDebugMessage("[dumb_yet_dumber] Error loading " .. item_type:lower() .. ": " .. item_key .. " - " .. item_error)
        else
            local item_data = item_init and item_init()
            if item_data then
                -- Register the item based on its type
                if item_type == "Joker" then
                    SMODS.Joker(item_data)
                end
                if item_type == "Tarot" or item_type == "Spectral" or item_type == "Planet" then
                    SMODS.Consumable(item_data)
                end
                if item_type == "Voucher" then
                    SMODS.Voucher(item_data)
                end
                if item_type == "Seal" then
                    SMODS.Seal(item_data)
                end
                if item_type == "Back" then
                    SMODS.Back(item_data)
                end
                if item_type == "Enhancement" then
                    SMODS.Enhancement(item_data)
                end
                if item_type == "Edition" then
                    SMODS.Edition(item_data)
                end
                if item_type == 'Blind' then
                    SMODS.Blind(item_data)
                end
                if item_type == 'Booster' then
                    SMODS.Booster(item_data)
                end
                if item_type == 'Rank' then
                    SMODS.Rank(item_data)
                end
                if item_type == 'Suit' then
                    SMODS.Suit(item_data)
                end
                sendDebugMessage("[Unnamed_mod] Loaded " .. item_type:lower() .. ": " .. item_key)
            end
        end
    end
end

return function()
    return itemsToLoad
end
