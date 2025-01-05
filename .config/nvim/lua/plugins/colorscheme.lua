return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = true, -- Whether to compile the colorscheme for faster loading
        theme = "wave",
        terminalColors = true,
        undercurl = true, -- Enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- Special highlight for the return keyword
        specialException = true,
        transparent = false, -- Disable setting background
        dimInactive = false,
        globalStatus = false,
        colors = {
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {},
          },
        },
        background = {
          dark = "wave",
          light = "lotus",
        },
        overrides = function() end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
