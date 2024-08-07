--会话自动保存插件
return {
    {
        'rmagatti/auto-session',
        dependencies = {
            'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
        },
        config = function()
            require('auto-session').setup({
                auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
                bypass_session_save_file_types = nil, -- table: Bypass auto save when only buffer open is one of these file types
                close_unsupported_windows = true,     -- boolean: Close windows that aren't backed by normal file
                cwd_change_handling = {               -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
                    restore_upcoming_session = false, -- boolean: restore session for upcoming cwd on cwd change
                    pre_cwd_changed_hook = nil,       -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
                    post_cwd_changed_hook = nil,      -- function: This is called after auto_session code runs for the `DirChanged` autocmd
                },
                args_allow_single_directory = true,   -- boolean Follow normal sesion save/load logic if launched with a single directory as the only argument
                args_allow_files_auto_save = false,   -- boolean|function Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. While you can just set this to true, you probably want to set it to a function that decides when to save a session when launched with file args. See documentation for more detail
                auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
                auto_save_enabled = true,
                auto_restore_enabled = true,
                auto_session_create_enabled = function()
                    local cmd = 'git rev-parse --is-inside-work-tree'
                    return vim.fn.system(cmd) == 'true\n'
                end,
            })
        end,
    },
}
