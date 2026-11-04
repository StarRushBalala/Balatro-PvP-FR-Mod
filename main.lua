if not Unnamed_mod then 
    Unnamed_mod = {}
end

Unnamed_mod = {
    show_options_button = true,
}

Unnamed_mod = SMODS.current_mod
Unnamed_mod.enabled = copy_table(Unnamed_mod.config )


SMODS.current_mod.optional_features = {
    post_trigger = true,
    retrigger_joker = true,
    quantum_enhancements = true,
    --object_weights = true,
	cardareas = {
        discard = true,
        deck = true
    }
}


--Colors

G.C.COOL_BLACK = HEX("253342")
G.C.FORCETRIGGER = HEX('43A5BE')
G.C.OUTER_COLOR = SMODS.Gradients.glhf_OUTER
G.C.INNER_COLOR = SMODS.Gradients.glhf_INNER
G.C.mid_flash = 0
G.C.vort_time = 7
G.C.vort_speed = 0.4

SMODS.Gradient({
    key = "lightsuits",
    cycle = 3,
    colours = {
        HEX("ED3665"),      --hearts
        HEX("F26C41"),      --diamonds
        HEX('FF51ED'),      --stars
    },
})
SMODS.Gradient({
    key = "darksuits",
    cycle = 3,
    colours = {
        HEX("1C5D57"),      --clubs
        HEX("3E3998"),      --spades
        HEX('3A8D68'),      --moons
    },
})


SMODS.Atlas {
	key = "jokers",
	path = "jokers.png",
	px = 71,
	py = 95
}

--[[
SMODS.ConsumableType {
    key = "exmeple", 
    collection_rows = {3,5}, 
    primary_colour = HEX('ffc8dd'), 
    secondary_colour = HEX('ffc8dd'), 
    loc_txt = { 
        collection = "Purgatorios",
        label = "Purgatorio",
        name = "Purgatorio",
        undiscovered = {
            name = "?",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does" 
            }
        },
    },
}
]]

local files = {
    "Lib/menu.lua",
    "Lib/hooks.lua",
    "Lib/sounds_and_atlases.lua",

    "Lib/items.lua",
}

for _, file in ipairs(files) do
    assert(SMODS.load_file(file))()
end
