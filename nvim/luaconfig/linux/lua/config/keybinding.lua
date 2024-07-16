local set = vim.opt
local cmd = vim.cmd
local o = vim.o
local g = vim.g
local bo = vim.bo
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap

--nvim-dap------------------------------------------------------------------------------------------------------------
local dap = require("dap")
keymap.set('n', '<F5>', function() require('dap').continue() end)
keymap.set('n', '<F10>', function() require('dap').step_over() end)
keymap.set('n', '<F11>', function() require('dap').step_into() end)
keymap.set('n', '<F12>', function() require('dap').step_out() end)
keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
keymap.set('n', '<Leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<C-F5>", function() dap.terminate() end)
keymap.set("n", "<Leader>clb", function() dap.clear_breakpoints() end)



--Telescope----------------------------------------------------------------------------------------------------------
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

--todo-comments------------------------------------------------------------------------------------------------------
keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
-- You can also specify a list of valid jump keywords
keymap.set("n", "]t", function() require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } }) end, { desc = "Next error/warning todo comment" })

--align.vim-----------------------------------------------------------------------------------------------------------
local NS = { noremap = true, silent = true }
-- Aligns to 1 character
keymap.set(
    'x',
    'aa',
    function()
        require'align'.align_to_char({
            length = 1,
        })
    end,
    NS
)
-- Aligns to 2 characters with previews
keymap.set(
    'x',
    'ad',
    function()
        require'align'.align_to_char({
            preview = true,
            length = 2,
        })
    end,
    NS
)
-- Aligns to a string with previews
keymap.set(
    'x',
    'aw',
    function()
        require'align'.align_to_string({
            preview = true,
            regex = false,
        })
    end,
    NS
)
-- Aligns to a Vim regex with previews
keymap.set(
    'x',
    'ar',
    function()
        require'align'.align_to_string({
            preview = true,
            regex = true,
        })
    end,
    NS
)
-- Example gawip to align a paragraph to a string with previews
keymap.set(
    'n',
    'gaw',
    function()
        local a = require'align'
        a.operator(
            a.align_to_string,
            {
                regex = false,
                preview = true,
            }
        )
    end,
    NS
)
-- Example gaaip to align a paragraph to 1 character
keymap.set('n','gaa',
    function()
        local a = require'align'
        a.operator(a.align_to_char)
    end,
    NS
)