local plugins = {
    {
      "nvim-neotest/nvim-nio",
      event = "VeryLazy",
    },

    {
      "rcarriga/nvim-dap-ui",
      event = "VeryLazy",
      dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
      },
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local api = require("nvim-tree.api")
        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
            api.tree.close()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end

      end
    },

    {
      "jay-babu/mason-nvim-dap.nvim",
      event = "VeryLazy",
      dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
        require("core.utils").load_mappings("dap")
        local dap = require("dap")
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "codelldb",
        "lua-language-server"
      }
    }
  },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end,
        lazy = true,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}

return plugins
