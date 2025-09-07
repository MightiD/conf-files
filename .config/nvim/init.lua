vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.scrolloff = 10
vim.o.winborder = "rounded"
vim.o.splitbelow = true
vim.o.splitright = true

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>c", '"+yy')
vim.keymap.set("v", "<leader>c", '"+y')
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>n", ":nohlsearch<CR>")
vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", { noremap = true, expr = true })
vim.keymap.set("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", { noremap = true, expr = true })
vim.keymap.set("n", "<leader>tv", function()
    vim.cmd("vsplit | terminal")
    vim.cmd("startinsert")
end)

vim.keymap.set("n", "<leader>th", function()
    vim.cmd("split | terminal")
    vim.cmd("startinsert")
end)

local function formatCode()
    local result = vim.lsp.buf.format()
    if result == "[LSP] Format request failed, no matching language servers." then
        vim.cmd("normal! mzgg=G`z")
        print("no lsp found for this file")
    end
end

vim.keymap.set("n", "<leader>i", formatCode)

vim.pack.add({
    { src = "https://github.com/sainnhe/gruvbox-material" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon",           version = "harpoon2" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

require("nvim-autopairs").setup()

vim.cmd("colorscheme gruvbox-material")

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "python", "rust", "markdown", "javascript", "typescript" },
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false, }
}

require("mason").setup()

vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonrc" }, ".git" },
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
}

vim.lsp.enable({ "luals", "pywright", "rust_analyzer" })
