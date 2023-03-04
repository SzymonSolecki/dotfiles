-- source of this config https://github.com/disrupted/dotfiles/blob/master/.config/nvim/lua/plugins/dap.lua

return {
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    config = function(_, opts)
      -- local ns = vim.api.nvim_create_namespace("dap")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-repl",
        callback = function()
          require("dap.ext.autocompl").attach()
        end,
      })

      require("dapui").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F5>",
        function()
          require("nvim-dap-virtual-text")
          require("dap").continue()
          -- require("dapui").open({})
        end,
        desc = "Continue/start debugger",
      },
      {
        "<F6>",
        function()
          -- require("dap.breakpoints").clear()
          require("dap").disconnect()
          require("dap").close()
          require("dapui").close({})
          vim.opt.signcolumn = "yes:1"
        end,
        desc = "Close debugger",
      },
      {
        "<F1>",
        function()
          require("dapui").toggle({})
        end,
        desc = "Toggle debug UI",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<F9>",
        function()
          require("dap").step_back() -- previous
        end,
        desc = "Step back",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input({ "Breakpoint condition: " }))
        end,
        desc = "Set breakpoint condition",
      },
      {
        "<leader>de",
        function()
          require("dap").set_exception_breakpoints()
        end,
        desc = "Set exception breakpoint",
      },
      {
        "<leader>dl",
        function()
          require("dap").list_breakpoints()
        end,
        desc = "List breakpoints",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Open REPL",
      },
      {
        "<leader>ds",
        function()
          require("dapui").float_element("scopes", { width = 80, height = 30, enter = true })
        end,
        desc = "Open floating scopes",
      },
    },
    config = function()
      local dap = require("dap")
      dap.defaults.fallback.exception_breakpoints = { "uncaught" } -- { 'raised', 'uncaught' }

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DiagnosticError",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = "",
        texthl = "DiagnosticError",
      })
      vim.fn.sign_define("DapLogPoint", {
        text = "•",
        texthl = "DiagnosticInfo",
      })
      vim.fn.sign_define("DapStopped", {
        text = "■",
        texthl = "Special",
      })

      -- Python
      require("dap-python")
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Default interpeter launch",
        program = "${file}",
      })
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
      })
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "FastAPI main:app",
        module = "uvicorn",
        args = {
          "main:app",
          "--use-colors",
        },
        console = "integratedTerminal",
      })
    end,
    dependencies = {
      {
        "mfussenegger/nvim-dap-python",
        lazy = true,
        opts = {
          include_configs = true,
        },
        config = function(_, opts)
          local py = require("dap-python")
          py.setup(os.getenv("VIRTUAL_ENV") .. "/bin/python", opts)
          py.test_runner = "pytest"
        end,
        keys = {
          {
            "<leader>dn",
            function()
              require("dap-python").test_method()
            end,
            desc = "test method",
          },
          {
            "<leader>df",
            function()
              require("dap-python").test_class()
            end,
            desc = "test class",
          },
        },
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
        opts = {
          enabled = true,
          enabled_commands = false,
          highlight_changed_variables = true,
          all_references = false,
          all_frames = false,
        },
      },
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          require("telescope").load_extension("dap")
        end,
      },
    },
  },
}
