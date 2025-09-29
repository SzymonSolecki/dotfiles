return {
  {
    "saghen/blink.cmp",

    opts = {
      cmdline = {
        completion = {
          list = { selection = { preselect = false, auto_insert = false } },
        },
      },
      signature = { enabled = true },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
    },
  },
}
