local jokerInfo = {
    key = "investement",
    pos = {x = 2, y = 0},
    atlas = "jokers",
    rarity = 1,
    cost = 6,
    unlocked = true,
    blueprint_compat = true,
    pools = { ["mods_additions"] = true},
    config = { extra = { dollars = 1, minimum = 20} },
	
	loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
                card.ability.extra.dollars,
                card.ability.extra.minimum, -- J'avais pensé a un truc du genre 's'autodétruit si $ < 20
            } 
        }
	end,

    calculate = function(self, card, context)

        if not G.GAME.Mod.coin_collection_adding_money and context.money_altered and to_number(context.amount) > 0 then
            G.GAME.Mod.coin_collection_adding_money = true
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.GAME.Mod.coin_collection_adding_money = false
                end
            }
        end

    end

}

return jokerInfo