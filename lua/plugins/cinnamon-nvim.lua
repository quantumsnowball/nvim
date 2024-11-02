-- smooth scrolling
-- https://github.com/declancm/cinnamon.nvim
return {
    'declancm/cinnamon.nvim',
    event = 'VeryLazy',
    -- TODO: need to define keymaps to require("cinnamon").scroll("<keymaps>") to use animations
    opts = {
        delay = 5, -- The default delay (in ms) between each line when scrolling.
    },
}
