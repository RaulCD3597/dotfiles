return {
  "quarto-dev/quarto-nvim",
  ft = { "quarto", "markdown" },
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local quarto = require("quarto")
    quarto.setup({
      lspFeatures = {
        languages = { "r", "python", "rust" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
        ft_runners = { python = "molten" },
      },
    })
    quarto.activate()
  end,
  keys = {
    {
      "<leader>rc",
      function()
        require("quarto.runner").run_cell()
      end,
      desc = "run cell",
      silent = true,
    },
    {
      "<leader>rA",
      function()
        require("quarto.runner").run_all()
      end,
      desc = "run all cells",
      silent = true,
    },
  },
}
