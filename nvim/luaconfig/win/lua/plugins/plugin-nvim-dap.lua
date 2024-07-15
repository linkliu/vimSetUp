--nvim-dap 调试插件
return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require('dap')
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = 'D:\\DevelopTools\\cpptools-win64\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
                options = {
                    detached = false
                }
            }
            dap.configurations.cpp = {
                {
                    name = "Launch File",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                    --customLaunchSetupCommands =
                    --{
                    --    text = "target-run",
                    --    description = "run target",
                    --    ignoreFailures = false
                    --},
                    --launchCompleteCommand = "exec-run",
                    --linux = {
                    --    MIMode = "gdb",
                    --    miDebuggerPath = "/usr/bin/gdb",
                    --},
                    --osx = {
                    --    MIMode = "lldb"
                    --},
                    --window = {
                    --    MIMode = "gdb",
                    --    miDebuggerPath = "C:\\MSYS264\\ucrt64\\bin\\gdb.exe"
                    --},
                    --setupCommands = {
                    --    {
                    --        text = '-enable-pretty-printing',
                    --        description = 'enable pretty printing',
                    --        ignoreFailures = false
                    --    },
                    --},
                },
                --{
                --    name = 'Attach to gdbserver :1234',
                --    type = 'cppdbg',
                --    request = 'launch',
                --    MIMode = 'gdb',
                --    miDebuggerServerAddress = 'localhost:1234',
                --    miDebuggerPath = '/usr/bin/gdb',
                --    cwd = '${workspaceFolder}',
                --    program = function()
                --        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                --    end,
                --    setupCommands = {
                --        {
                --            text = '-enable-pretty-printing',
                --            description = 'enable pretty printing',
                --            ignoreFailures = false
                --        },
                --    },
                --},
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
        end,
        keys = {
            -- add a keymap to browshttps://github.com/cmu-db/bustub.gite plhttps://github.com/cmu-db/bustub.gitugin files
            -- stylua: ignore
            {
                "<f5>",
                function() require("dap").continue() end,
                desc = "launch/continue gdb",
            },
            {
                "<f10>",
                function()
                    require("dap").step_over()
                end,
                desc = "单步调试",
            },
            {
                "<C-f10>",
                function()
                    require("dap").step_into()
                end,
                desc = "步入",
            },
            {
                "<C-f>",
                function()
                    require("dap").step_out()
                end,
                desc = "步出",
            },
            {
                "<C-f5>",
                function()
                    require("dap").terminate()
                end,
                desc = "终止程序"
            }
        },
    },
}
