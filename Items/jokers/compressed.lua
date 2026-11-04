local jokerInfo = {
    key = "compressed",
    pos = {x = 0, y = 0},
    atlas = "jokers",
    rarity = 1,
    cost = 6,
    unlocked = true,
    blueprint_compat = true,
    pools = { ["mods_additions"] = true},
    config = { extra = { xmult = 3} },
	
	loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
                card.ability.extra.xmult,  
            } 
        }
	end,

    calculate = function(self, card, context)
        if context.before then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.rarity == 1 then
                    G.GAME.Mod.communs = G.GAME.Mod.communs + 1
                end
            end
        end

        if context.joker_main then
            print(G.GAME.Mod.communs)
            if G.GAME.Mod.communs == #G.jokers.cards then
                G.GAME.Mod.communs = 0
                return {
                    xmult = card.ability.extra.xmult
                }
            else
                G.GAME.Mod.communs = 0
            end
        end
    end
}

return jokerInfo