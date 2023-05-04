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
                return buf.filename:match("test_")
              end,
            },
            {
              name = "Docs",
              matcher = function(buf)
                return buf.filename:match("%.md") or buf.filename:match("%.txt")
              end,
            },
            {
              name = "Data",
              matcher = function(buf)
                return buf.filename:match("%.json") or buf.filename:match("%.csv")
              end,
            },
          },
        },
      },
    },
  },
}
