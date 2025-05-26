return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "padded_slant",
        always_show_bufferline = true,
        groups = {
          items = {
            {
              name = "Tests",
              icon = "",
              matcher = function(buf) -- Mandatory
                return buf.name:match("test_")
              end,
            },
            {
              name = "Docs",
              matcher = function(buf)
                return buf.name:match("%.md") or buf.name:match("%.txt")
              end,
            },
            {
              name = "Data",
              matcher = function(buf)
                return buf.name:match("%.json") or buf.name:match("%.csv")
              end,
            },
          },
        },
      },
    },
  },
}
