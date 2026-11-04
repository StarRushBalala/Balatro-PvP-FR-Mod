local jokerInfo = {
    key = "chinesemaaans_dad",
    pos = {x = 3, y = 0},
    atlas = "jokers",
    rarity = 2,
    cost = 6,
    unlocked = true,
    blueprint_compat = true,
    pools = { ["mods_additions"] = true},
    config = { extra = {mult = 0, add_mult = 10, max_mult = 100} },
	
	loc_vars = function(self, info_queue, card)
		return { 
            vars = { 
                card.ability.extra.mult,
                card.ability.extra.add_mult,
                card.ability.extra.max_mult,
            } 
        }
	end,

    calculate = function(self, card, context)

        if context.joker_main and card.ability.extra.mult > 0 then 
            return {mult = card.ability.extra.mult}
        end

        if context.setting_blind and not (context.blueprint or context.retrigger) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.add_mult
        end

        if context.end_of_round and context.main_eval and not (context.blueprint or context.retrigger) then
            if card.ability.extra.mult >=  card.ability.extra.max_mult then
                card:start_dissolve({ G.C.MULT }, nil, 1.0)
                play_sound("glhf_explosion", 1.1, 0.5)
            end
        end

    end

}

return jokerInfo