return {
  {
    "alexxGmZ/e-ink.nvim",
    priority = 1000,
    config = function()
      require("e-ink").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("e-ink")
      end,
    },
  },
}
