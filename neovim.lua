-- e-ink.nvim draws body text in #5E5E5E; Atlas Ink darkens it to the theme's text colour.
local text = "#313538"

local function ink_text()
  if vim.g.colors_name ~= "e-ink" or vim.o.background ~= "light" then
    return
  end
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  normal.fg = text
  vim.api.nvim_set_hl(0, "Normal", normal)
end

return {
  {
    "alexxGmZ/e-ink.nvim",
    priority = 1000,
    config = function()
      require("e-ink").setup()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("AtlasInkText", { clear = true }),
        callback = ink_text,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("e-ink")
        ink_text()
      end,
    },
  },
}
