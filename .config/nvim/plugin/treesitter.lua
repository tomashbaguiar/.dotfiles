-- Bootstrapping TreeSitter
local ensure_treesitter = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/nvim-treesitter/start/nvim-treesitter'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1', 'https://github.com/nvim-treesitter/nvim-treesitter',
            install_path
        })
        vim.cmd [[ packadd nvim-treesitter ]]
        return true
    end
    return false
end

local treesitter_bootstrap = ensure_treesitter()
if treesitter_bootstrap then
    local ok, tst_config = pcall(require, 'nvim-treesitter.configs')
    if not ok then
        vim.notify('Could not load nvim-treesitter.configs')
        return
    end
    vim.cmd [[ :TSUpdate ]]
end
