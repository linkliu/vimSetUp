--主题snokai
return {
    -- "sainnhe/sonokai",
    -- config = function ()
    --     local cmd = vim.cmd
    --     cmd.colorscheme("sonokai")
    -- end

    -- "rebelot/kanagawa.nvim",
    -- config = function()
    --     -- Default options:
    --     require('kanagawa').setup({
    --         compile = false, -- enable compiling the colorscheme
    --         undercurl = true, -- enable undercurls
    --         commentStyle = { italic = true },
    --         functionStyle = {},
    --         keywordStyle = { italic = true },
    --         statementStyle = { bold = true },
    --         typeStyle = {},
    --         transparent = false, -- do not set background color
    --         dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    --         terminalColors = true, -- define vim.g.terminal_color_{0,17}
    --         colors = {     -- add/modify theme and palette colors
    --             palette = {},
    --             theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    --         },
    --         overrides = function(colors) -- add/modify highlights
    --             return {}
    --         end,
    --         theme = "lotus", -- Load "wave" theme when 'background' option is not set
    --         background = { -- map the value of 'background' option to a theme
    --             dark = "wave", -- try "dragon" !
    --             light = "lotus"
    --         },
    --     })

    --     -- setup must be called before loading
    --     -- vim.cmd("colorscheme kanagawa-wave")
    --     -- vim.cmd("colorscheme kanagawa-dragon")
    --     -- vim.cmd("colorscheme kanagawa-lotus")
    -- end
    "EdenEast/nightfox.nvim",
    config = function()
        -- Default options
        require('nightfox').setup({
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = false,   -- Disable setting background
                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false,  -- Non focused panes set to alternative background
                module_default = true, -- Default enable value for modules
                colorblind = {
                    enable = false,    -- Enable colorblind support
                    simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                    severity = {
                        protan = 0,    -- Severity [0,1] for protan (red)
                        deutan = 0,    -- Severity [0,1] for deutan (green)
                        tritan = 0,    -- Severity [0,1] for tritan (blue)
                    },
                },
                styles = { -- Style to be applied to different syntax groups
                    comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "NONE",
                    keywords = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                    variables = "NONE",
                },
                inverse = { -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = { -- List of various plugins and additional options
                    -- ...
                },
            },
            palettes = {},
            specs = {},
            groups = {},
        })

        -- setup must be called before loading
        vim.cmd("colorscheme carbonfox")
    end
}
