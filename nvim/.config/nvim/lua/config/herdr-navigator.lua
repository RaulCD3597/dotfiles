-- Seamless navigation between Neovim splits and herdr panes.
-- Mirrors vim-tmux-navigator: move within vim splits, and when already at
-- the edge of vim's window layout, hand focus to herdr (only when running
-- inside a herdr pane; a no-op edge-move otherwise, same as plain vim).
local M = {}

local wincmd_for = { h = "h", j = "j", k = "k", l = "l" }
local herdr_dir_for = { h = "left", j = "down", k = "up", l = "right" }

function M.navigate(key)
  local before = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd_for[key])

  if vim.env.HERDR_ENV == "1" and vim.api.nvim_get_current_win() == before then
    vim.fn.jobstart({ "herdr", "pane", "focus", "--direction", herdr_dir_for[key], "--current" }, { detach = true })
  end
end

function M.setup()
  local opts = { silent = true }
  for _, key in ipairs({ "h", "j", "k", "l" }) do
    vim.keymap.set("n", "<c-" .. key .. ">", function()
      M.navigate(key)
    end, opts)
    vim.keymap.set(
      "t",
      "<c-" .. key .. ">",
      string.format([[<C-\><C-n><Cmd>lua require("config.herdr-navigator").navigate(%q)<CR>]], key),
      opts
    )
  end
end

return M
