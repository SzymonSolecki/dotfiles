-- source of this config https://github.com/disrupted/dotfiles/blob/master/.config/nvim/lua/plugins/dap.lua

return {
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    opts = {
      icons = {
        expanded = "",
        collapsed = "",
        current_frame = "▸",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.4 },
            { id = "breakpoints", size = 0.1 },
            "stacks",
            "watches",
          },
          size = 45,
          position = "left",
        },
        {
          elements = {
            "repl",
            -- 'console',
          },
          size = 12,
          position = "bottom",
        },
      },
      controls = {
        enabled = true,
      },
      render = {
        max_type_length = nil,
        max_value_lines = nil,
      },
    },
    config = function(_, opts)
      local ns = vim.api.nvim_create_namespace("dap")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "dap-repl",
          "dapui_scopes",
          "dapui_breakpoints",
          "dapui_stacks",
          "dapui_watches",
        },
        callback = function()
          vim.opt_local.signcolumn = "no"
          vim.api.nvim_win_set_hl_ns(0, ns)
          vim.api.nvim_set_hl(ns, "EndOfBuffer", { fg = "bg", bg = "bg" })
        end,
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-repl",
        callback = function()
          require("dap.ext.autocompl").attach()
        end,
      })

      require("dapui").setup(opts)

      vim.api.nvim_set_hl(0, "DapUIScope", { bold = true })
      vim.api.nvim_set_hl(0, "DapUIDecoration", { link = "CursorLineNr" })
      vim.api.nvim_set_hl(0, "DapUIThread", { link = "GitSignsAdd" })
      vim.api.nvim_set_hl(0, "DapUIStoppedThread", { link = "Special" })
      vim.api.nvim_set_hl(0, "DapUILineNumber", { link = "Normal" })
      vim.api.nvim_set_hl(0, "DapUIType", { link = "Type" })
      vim.api.nvim_set_hl(0, "DapUISource", { link = "Keyword" })
      vim.api.nvim_set_hl(0, "DapUIWatchesEmpty", { link = "Comment" })
      vim.api.nvim_set_hl(0, "DapUIWatchesValue", { link = "GitSignsAdd" })
      vim.api.nvim_set_hl(0, "DapUIWatchesError", { link = "DiagnosticError" })
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
          -- require('dapui').open {}
          vim.opt.signcolumn = "yes:2"
        end,
        desc = "continue/start debugger",
      },
      {
        "<F6>",
        function()
          require("dap.breakpoints").clear()
          require("dap").disconnect()
          require("dap").close()
          require("dapui").close({})
          vim.opt.signcolumn = "yes:1"
        end,
        desc = "close debugger",
      },
      {
        "<F1>",
        function()
          require("dapui").toggle({})
        end,
        desc = "toggle sth?",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "step over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "step into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "step out",
      },
      {
        "<F9>",
        function()
          require("dap").step_back() -- previous
        end,
        desc = "step back",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "toggle breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input({ "Breakpoint condition: " }))
        end,
        desc = "set breakpoint conditions",
      },
      {
        "<leader>de",
        function()
          require("dap").set_exception_breakpoints()
        end,
      },
      {
        "<leader>dl",
        function()
          require("dap").list_breakpoints()
        end,
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
      },
      {
        "<leader>ds",
        function()
          require("dapui").float_element("scopes", { width = 80, height = 30, enter = true })
        end,
      },
      -- FIXME: <ESC> first
      -- {
      --     '<leader>ds',
      --     function()
      --         require('dap-python').debug_selection()
      --     end,
      --     mode = 'v',
      -- },
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
