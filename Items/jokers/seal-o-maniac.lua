local jokerInfo = {
    key = "seal_o_maniac",
    pos = {x = 4, y = 0},
    atlas = "jokers",
    rarity = 3,
    cost = 9,
    unlocked = true,
    blueprint_compat = true,
    pools = { ["mods_additions"] = true},
    config = { extra = {} },
	
	loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
            } 
        }
	end,

    calculate = function(self, card, context)

        if context.repetition and context.cardarea == G.play and context.other_card then
            if context.other_card.seal == "Red" then
                return {
                    message = 'Reactivate !',
                    repetitions = 1,
                    card = card,
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, func = function()
                        card:juice_up(.5, .5)
                    return true end }))	
                }
            end
        end

        if context.individual and context.cardarea == G.play and context.other_card.seal == "Gold" then
            ease_dollars(3)
            return {
                message = "Reactivate !",
            }
        
        end

        if context.end_of_round and context.cardarea == G.hand then
            if context.other_card.seal == "Blue" then
                if (#G.consumeables.cards < G.consumeables.config.card_limit) then
                    local cards = create_card("Planet", G.consumeables, nil, nil, nil, nil, nil, 'glhf_seal-o-maniac')
                    cards:add_to_deck()
                    cards:juice_up(0.3, 0.5)
                    play_sound('tarot1')
                    G.consumeables:emplace(cards)
                    delay(0.2)
                end
                return {
                    message = "Reactivate !",
                }
            end 

        end

        if context.discard then

            if context.other_card.seal == "Purple" then
                if (#G.consumeables.cards < G.consumeables.config.card_limit) then
                    local cards = create_card("Tarot", G.consumeables, nil, nil, nil, nil, nil, 'glhf_seal-o-maniac')
                    cards:add_to_deck()
                    cards:juice_up(0.3, 0.5)
                    play_sound('tarot1')
                    G.consumeables:emplace(cards)
                    delay(0.2)
                end
                return {
                    message = "Reactivate !",
                }
            end

        end

    end

}

return jokerInfo