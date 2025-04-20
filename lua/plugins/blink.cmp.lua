-- completion engine
-- https://github.com/Saghen/blink.cmp
return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        -- vscode like snippets
        'rafamadriz/friendly-snippets',
        -- add color to cmp menu
        -- https://github.com/xzbdmw/colorful-menu.nvim
        'xzbdmw/colorful-menu.nvim',
        -- dictionary source (depends on WordNet)
        -- https://github.com/Kaiser-Yang/blink-cmp-dictionary
        {
            'Kaiser-Yang/blink-cmp-dictionary',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'none',
            ['<C-n>'] = { 'show_and_insert', 'select_next', 'fallback' },
            ['<C-p>'] = { 'show_and_insert', 'select_prev', 'fallback' },
            ['<Tab>'] = { 'snippet_forward', 'select_and_accept', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'normal',
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            list = {
                selection = {
                    -- pre select, but only insert text when accepted
                    preselect = true,
                    auto_insert = false,
                },
            },
            menu = {
                border = 'rounded',
                draw = {
                    columns = {
                        { 'label' },
                        { 'kind_icon' },
                        { 'kind' },
                        { 'source_name' },
                    },
                    components = {
                        label = {
                            text = function(ctx) return require('colorful-menu').blink_components_text(ctx) end,
                            highlight = function(ctx) return require('colorful-menu').blink_components_highlight(ctx) end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                window = {
                    border = 'rounded',
                },
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = {
                'lsp',
                'snippets',
                'buffer',
                'path',
                'dictionary',
            },
            providers = {
                -- community reference
                -- https://github.com/linkarzu/dotfiles-latest/blob/c1a04c9324fdb2669255889defc6302efefe4d9d/neovim/neobean/lua/plugins/blink-cmp.lua#L160
                dictionary = {
                    module = 'blink-cmp-dictionary',
                    name = 'English',
                    min_keyword_length = 3,
                    max_items = 6,
                    score_offset = -5,
                    opts = {
                        -- word list download src: https://github.com/dwyl/english-words
                        -- word definition: wn, download src: yay -S wordnet-common
                        dictionary_files = {
                            -- put downloaded dictionary in .dictionary
                            vim.fn.expand('~/.config/nvim/.dictionary/words_alpha.txt'),
                        },
                    },
                },
            },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = {
            implementation = 'prefer_rust_with_warning',
        },
    },
    opts_extend = { 'sources.default' },
}
