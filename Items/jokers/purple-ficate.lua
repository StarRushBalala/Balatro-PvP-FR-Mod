local jokerInfo = {
    key = "noble_letter",
    pos = {x = 1, y = 0},
    atlas = "jokers",
    rarity = 1,
    cost = 5,
    unlocked = true,
    blueprint_compat = true,
    pools = { ["mods_additions"] = true},
    config = { extra = {} },
	
	loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
                G.GAME.Mod.noble_letter_rank
            } 
        }
	end,

    calculate = function(self, card, context)

        if context.setting_blind then

            if to_number(G.GAME.dollars) <= 0 then

                G.GAME.Mod.has_used_consumables = false
                local rank_suffix = G.GAME.Mod.noble_letter_rank
                local new_card = create_playing_card({
                front = G.P_CARDS["S_"..rank_suffix],
                }, G.discard, true, false, nil, true)
                new_card:set_seal("Purple", true)
                                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                                
                G.E_MANAGER:add_event(Event({
                func = function() 
                    G.hand:emplace(new_card)
                    new_card:start_materialize()
                    return true
                    end
                }))

                return {message = rank_suffix.." Created !"}
            end
        end

        if context.ante_change and context.ante_end and not (context.blueprint or context.retrigger) then
            if G.GAME.Mod.noble_letter_rank == '7' then
                G.GAME.Mod.noble_letter_rank = '8'
            elseif G.GAME.Mod.noble_letter_rank == '8' then
                G.GAME.Mod.noble_letter_rank = '9'
            elseif G.GAME.Mod.noble_letter_rank == '9' then
                G.GAME.Mod.noble_letter_rank = '10'
            elseif G.GAME.Mod.noble_letter_rank == '10' then
                G.GAME.Mod.noble_letter_rank = 'J'
            elseif G.GAME.Mod.noble_letter_rank == 'J' then
                G.GAME.Mod.noble_letter_rank = 'Q'
            elseif G.GAME.Mod.noble_letter_rank == 'Q' then
                G.GAME.Mod.noble_letter_rank = 'K'
            elseif G.GAME.Mod.noble_letter_rank == 'K' then
                G.GAME.Mod.noble_letter_rank = 'A'
            else
                G.GAME.Mod.noble_letter_rank = 'A'
            end
            return {message = "Upagraded !"}
        end
    end

}

return jokerInfo