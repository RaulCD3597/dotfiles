return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release instead of main branch
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/workspace/obsidian-vault",
      },
    },
    daily_notes = {
      folder = "daily_notes",
    },
    ui = {
      enable = true,
      update_debounce = 200,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f2cdcd" },
        ObsidianDone = { bold = true, fg = "#abe9b3" },
        ObsidianTag = { italic = true, fg = "#89dceb" },
        ObsidianHighlightText = { bg = "#756477" },
      },
    },
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian Note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian Notes" },
    { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Obsidian Today" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian Backlinks" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian App" },
  },
}
