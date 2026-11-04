menu_cards = {
    'j_glhf_chinesemaaans_dad',
}



G.C.OUTER_COLOR = G.C.COOL_BLACK
G.C.INNER_COLOR = HEX("FFFFFF")


function Card:resize(mod, force_save)
	if force_save or not self.origsize then self.origsize = {w = self.T.w, h = self.T.h} end
	self:hard_set_T(self.T.x, self.T.y, self.T.w * mod, self.T.h * mod)
	remove_all(self.children)
	self.children = {}
	self.children.shadow = Moveable(0, 0, 0, 0)
	self:set_sprites(self.config.center, self.base.id and self.config.card)
	if self.area then
		if (G.shop_jokers and self.area == G.shop_jokers) or (G.shop_booster and self.area == G.shop_booster) or (G.shop_vouchers and self.area == G.shop_vouchers) then
			create_shop_card_ui(self)
		end
	end
end


local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	G.SPLASH_BACK:define_draw_steps({{
		shader = "splash",
		send = {
			{name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
           	{name = 'vort_speed', val = G.C.vort_speed},
            {name = 'colour_1', ref_table = G.C, ref_value = 'OUTER_COLOR'},
            {name = 'colour_2', ref_table = G.C, ref_value = 'INNER_COLOR'},
            {name = 'mid_flash', ref_table = G.C, ref_value = 'mid_flash'},
		},
	}})

	    --random card 
    local chosen = math.random(1, #menu_cards)
    local newcard = create_card(G.P_CENTERS[menu_cards[chosen]], G.title_top, nil, nil, nil, nil, menu_cards[chosen], 'title_card')
    G.title_top:emplace(newcard)
    newcard:start_materialize()
    newcard:resize(1.25)
    newcard.no_ui = true
    newcard.ability.title_card = true

       -- Recenter the title
    G.title_top.T.w = G.title_top.T.w * 1.7675
    G.title_top.T.x = G.title_top.T.x - 0.8
    G.E_MANAGER:add_event(Event({trigger = "after", delay = 0, blockable = false, blocking = false, func = function()
        if change_context == "splash" then
            newcard.states.visible = true
            newcard:start_materialize({ G.C.MULT }, true, 2.5)
        else
            newcard.states.visible = true
            newcard:start_materialize({ G.C.CHIPS }, nil, 1.2)
        end
        --newcard:set_edition(menu_editions[math.random(1, #menu_editions)], false, false) 
    return true end}))
    

    G.menu_particles = Particles(1, 1, 0, 0, {
        timer = 0.095,
        scale = 0.25,
        initialize = true,
        lifespan = 6.0,
        speed = 2.0,
        padding = -1,
        attach = G.ROOM_ATTACH,
        colours = { HEX('FFFFFF'), G.C.COOL_BLACK },
        fill = true
    })
    G.menu_particles.fade_alpha = 0.7
	G.menu_particles:fade(0.7, 0)

	return ret
end