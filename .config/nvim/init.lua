vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>c", '"+yy')
vim.keymap.set("v", "<leader>c", '"+y')
--vim.keymap.set("n", "<leader>i", function()
    --    vim.cmd("normal! mzgg=G`z")
    --end)
    vim.keymap.set("n", "<leader>i", vim.lsp.buf.format)

    vim.pack.add({
        {src = "https://github.com/sainnhe/gruvbox-material"},
        {src = "https://github.com/nvim-treesitter/nvim-treesitter"},
        {src = "https://github.com/nvim-lua/plenary.nvim"},
        {src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2"},
        {src = "https://github.com/mason-org/mason.nvim"},
    })

    vim.cmd("colorscheme gruvbox-material")

    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    require'nvim-treesitter.configs'.setup {
        ensure_installed = {"c", "lua", "python", "rust", "markdown", "javascript", "typescript"},
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false,}
    }

    require("mason").setup()

    vim.lsp.enable({"lua_ls"})
