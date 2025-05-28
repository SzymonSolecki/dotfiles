return {
  "saghen/blink.cmp",
  opts = {
    signature = { enabled = true },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
