--return {
--    "mfussenegger/nvim-dap",
--    dependencies = {
--        -- fancy UI for the debugger
--        {
--            "rcarriga/nvim-dap-ui",
--            keys = {
--                {
--                    "<leader>du",
--                    function()
--                        require("dapui").toggle({})
--                    end,
--                    desc = "Dap UI",
--                },
--                {
--                    "<leader>de",
--                    function()
--                        require("dapui").eval()
--                    end,
--                    desc = "Eval",
--                    mode = { "n", "v" },
--                },
--            },
--            opts = {},
--            config = function()
--                local dap = require("dap")
--                local dapui = require("dapui")
--
--                dapui.setup({
--                    icons = { expanded = "", collapsed = "", current_frame = "" },
--                    mappings = {
--                        -- Use a table to apply multiple mappings
--                        expand = { "<CR>" },
--                        open = "o",
--                        remove = "d",
--                        edit = "e",
--                        repl = "r",
--                        toggle = "t",
--                    },
--                    -- Use this to override mappings for specific elements
--                    element_mappings = {
--                        -- Example:
--                        -- stacks = {
--                        --   open = "<CR>",
--                        --   expand = "o",
--                        -- }
--                    },
--                    -- Expand lines larger than the window
--                    -- Requires >= 0.7
--                    expand_lines = vim.fn.has("nvim-0.7") == 1,
--                    -- Layouts define sections of the screen to place windows.
--                    -- The position can be "left", "right", "top" or "bottom".
--                    -- The size specifies the height/width depending on position. It can be an Int
--                    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
--                    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
--                    -- Elements are the elements shown in the layout (in order).
--                    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
--                    layouts = {
--                        {
--                            elements = {
--                                -- Elements can be strings or table with id and size keys.
--                                { id = "scopes", size = 0.25 },
--                                "breakpoints",
--                                "stacks",
--                                "watches",
--                            },
--                            size = 40, -- 40 columns
--                            position = "left",
--                        },
--                        {
--                            elements = {
--                                "repl",
--                                "console",
--                            },
--                            size = 0.25, -- 25% of total lines
--                            position = "bottom",
--                        },
--                    },
--                    controls = {
--                        -- Requires Neovim nightly (or 0.8 when released)
--                        enabled = true,
--                        -- Display controls in this element
--                        element = "repl",
--                        icons = {
--                            pause = "",
--                            play = "",
--                            step_into = "",
--                            step_over = "",
--                            step_out = "",
--                            step_back = "",
--                            run_last = "",
--                            terminate = "",
--                        },
--                    },
--                    floating = {
--                        max_height = nil, -- These can be integers or a float between 0 and 1.
--                        max_width = nil, -- Floats will be treated as percentage of your screen.
--                        border = "single", -- Border style. Can be "single", "double" or "rounded"
--                        mappings = {
--                            close = { "q", "<Esc>" },
--                        },
--                    },
--                    windows = { indent = 1 },
--                    render = {
--                        max_type_length = nil, -- Can be integer or nil.
--                        max_value_lines = 100, -- Can be integer or nil.
--                    },
--                })
--
--                dap.listeners.after.event_initialized["dapui_config"] = function()
--                    dapui.open()
--                end
--                dap.listeners.before.disconnect["dapui_config"] = function()
--                    dapui.close()
--                end
--                dap.listeners.before.event_terminated["dapui_config"] = function()
--                    dapui.close()
--                end
--                dap.listeners.before.event_exited["dapui_config"] = function()
--                    dapui.close()
--                end
--
--                local hl = "DiagnosticError"
--                vim.fn.sign_define("DapBreakpoint", { text = "", texthl = hl, linehl = "", numhl = "" })
--            end,
--        },
--        -- virtual text for the debugger
--        {
--            "theHamsta/nvim-dap-virtual-text",
--            opts = {},
--        },
--        -- telescope integration
--        {
--            "nvim-telescope/telescope-dap.nvim",
--        },
--        -- which key integration
--        {
--            "folke/which-key.nvim",
--            optional = true,
--            opts = {
--                defaults = {
--                    ["<leader>d"] = { name = "+debug" },
--                    ["<leader>da"] = { name = "+adapters" },
--                },
--            },
--        },
--        -- mason.nvim integration
--        {
--            "jay-babu/mason-nvim-dap.nvim",
--            dependencies = "mason.nvim",
--            cmd = { "DapInstall", "DapUninstall" },
--            opts = {
--                -- Makes a best effort to setup the various debuggers with
--                -- reasonable debug configurations
--                automatic_installation = true,
--
--                -- You can provide additional configuration to the handlers,
--                -- see mason-nvim-dap README for more information
--                handlers = {},
--
--                -- You'll need to check that you have the required things installed
--                -- online, please don't ask me how to install them :)
--                ensure_installed = {
--                    -- Update this to ensure that you have the debuggers for the langs you want
--                },
--            },
--        },
--    },
--    keys = {
--        {
--            "<leader>dB",
--            function()
--                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
--            end,
--            desc = "Breakpoint Condition",
--        },
--        {
--            "<leader>db",
--            function()
--                require("dap").toggle_breakpoint()
--            end,
--            desc = "Toggle Breakpoint",
--        },
--        {
--            "<leader>dc",
--            function()
--                require("dap").continue()
--            end,
--            desc = "Continue",
--        },
--        {
--            "<leader>dC",
--            function()
--                require("dap").run_to_cursor()
--            end,
--            desc = "Run to Cursor",
--        },
--        {
--            "<leader>dg",
--            function()
--                require("dap").goto_()
--            end,
--            desc = "Go to line (no execute)",
--        },
--        {
--            "<leader>di",
--            function()
--                require("dap").step_into()
--            end,
--            desc = "Step Into",
--        },
--        {
--            "<leader>dj",
--            function()
--                require("dap").down()
--            end,
--            desc = "Down",
--        },
--        {
--            "<leader>dk",
--            function()
--                require("dap").up()
--            end,
--            desc = "Up",
--        },
--        {
--            "<leader>dl",
--            function()
--                require("dap").run_last()
--            end,
--            desc = "Run Last",
--        },
--        {
--            "<leader>do",
--            function()
--                require("dap").step_out()
--            end,
--            desc = "Step Out",
--        },
--        {
--            "<leader>dO",
--            function()
--                require("dap").step_over()
--            end,
--            desc = "Step Over",
--        },
--        {
--            "<leader>dp",
--            function()
--                require("dap").pause()
--            end,
--            desc = "Pause",
--        },
--        {
--            "<leader>dr",
--            function()
--                require("dap").repl.toggle()
--            end,
--            desc = "Toggle REPL",
--        },
--        {
--            "<leader>ds",
--            function()
--                require("dap").session()
--            end,
--            desc = "Session",
--        },
--        {
--            "<leader>dt",
--            function()
--                require("dap").terminate()
--            end,
--            desc = "Terminate",
--        },
--        {
--            "<leader>dw",
--            function()
--                require("dap.ui.widgets").hover()
--            end,
--            desc = "Widgets",
--        },
--    },
--    config = function() end,
--}
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            require("dapui").setup()
            require("dap-go").setup()

            require("nvim-dap-virtual-text").setup({
                -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
                display_callback = function(variable)
                    local name = string.lower(variable.name)
                    local value = string.lower(variable.value)
                    if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
                        return "*****"
                    end

                    if #variable.value > 15 then
                        return " " .. string.sub(variable.value, 1, 15) .. "... "
                    end

                    return " " .. variable.value
                end,
            })

            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F9>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
