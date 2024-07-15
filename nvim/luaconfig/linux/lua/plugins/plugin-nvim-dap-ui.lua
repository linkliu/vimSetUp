--nvim-dap调试UI
return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dapui.float_element("console", {width=100, height=50, enter=true, title="console float", context="hover"})
        dapui.float_element("repl", {width=100, height=50, enter=true, title="repl float", context="hover"})
        dapui.float_element("breakpoints", {width=100, height=50, enter=true, title="breakpoints float", context="hover"})
        dapui.float_element("watches", {width=100, height=50, enter=true, title="watches float", context="hover"})
        dapui.float_element("stacks", {width=100, height=50, enter=true, title="stacks float", context="hover"})
        dapui.float_element("scopes", {width=100, height=50, enter=true, title="scopes float", context="hover"})

    end

}
