local M = {}

M.dap = {
    plugin = true,

    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add a breakpoint at line"
        },

        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger"
        },

        ["<leader>dt"] = {
            "<cmd> DapTerminate <CR>",
            "Terminate debugging session"
        },

        ["<leader>ds"] = {
            "<cmd> DapStepOver <CR>",
            "Step over next line of code"
        },

        ["<leader>di"] = {
            "<cmd> DapStepInto <CR>",
            "Step into next line of code"
        },

        ["<leader>do"] = {
            "<cmd> DapStepOut <CR>",
            "Step out of section of code"
        },

        -- Ovveride Ctrl-z to do nothing because it closes the app automatically  
        ["<C-z>"] = {
            function()
            end
        },

        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end
        },

        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end
        }
    }
}

return M
