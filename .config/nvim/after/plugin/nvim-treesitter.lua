local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    vim.notify('Could not load nvim-treesitter configs')
    return
end

configs.setup {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'c_sharp' },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
