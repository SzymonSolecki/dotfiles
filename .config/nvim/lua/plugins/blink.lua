return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        snippets = {
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= "trigger_character"
          end,
        },
      },
    },
    signature = { enabled = true },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
