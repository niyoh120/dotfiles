local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({"folke/which-key.nvim", "folke/neodev.nvim", "tpope/vim-repeat", "ggandor/leap.nvim"})

require('leap').create_default_mappings()
require('leap').opts.special_keys.prev_target = '<b>'
require('leap').opts.special_keys.prev_group = '<bs>'
require('leap.user').set_repeat_keys('<cr>', '<bs>')

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<', '<<', {
    noremap = true
})
vim.api.nvim_set_keymap('n', '>', '>>', {
    noremap = true
})
vim.api.nvim_set_keymap('v', '<', '<gv', {
    noremap = true
})
vim.api.nvim_set_keymap('v', '>', '>gv', {
    noremap = true
})

if vim.g.vscode then
    -- VSCode extension
    local vscode = require('vscode-neovim')
    vim.api.nvim_set_keymap('n', '<leader>w',
        "<Cmd>lua require('vscode-neovim').action('workbench.action.files.save')<CR>", {
            noremap = True
        })
    vim.api.nvim_set_keymap('n', '<leader>x',
        "<Cmd>lua require('vscode-neovim').action('workbench.action.closeActiveEditor')<CR>", {
            noremap = True
        })
    vim.api.nvim_set_keymap('n', '<leader>r', "<Cmd>lua require('vscode-neovim').action('references-view.find')<CR>", {
        noremap = true
    })
    vim.api.nvim_set_keymap('n', '<leader>rd',
        "<Cmd>lua require('vscode-neovim').action('editor.action.revealDefinition')<CR>", {
            noremap = true
        })
    vim.api.nvim_set_keymap('n', '<leader>pd',
        "<Cmd>lua require('vscode-neovim').action('editor.action.peekDefinition')<CR>", {
            noremap = true
        })
    vim.api.nvim_set_keymap('n', '<leader>pi',
        "<Cmd>lua require('vscode-neovim').action('editor.action.peekImplementation')<CR>", {
            noremap = True
        })
    vim.api.nvim_set_keymap('n', '<leader>qr',
        "<Cmd>lua require('vscode-neovim').action('editor.action.referenceSearch.trigger')<CR>", {
            noremap = True
        })
    vim.api.nvim_set_keymap('n', '<leader>m', "<Cmd>lua require('vscode-neovim').action('bookmarks.toggle')<CR>", {
        noremap = True
    })
    vim.api.nvim_set_keymap('n', '<leader>b',
        "<Cmd>lua require('vscode-neovim').action('bookmarks.listFromAllFiles')<CR>", {
            noremap = True
        })
    vim.api.nvim_set_keymap('n', '<leader>h',
        "<Cmd>lua require('vscode-neovim').action('textmarker.toggleHighlight')<CR>", {
            noremap = True
        })
else
    -- ordinary Neovim
end

