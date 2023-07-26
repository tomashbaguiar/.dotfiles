-- Bootstrapping LSP Config
local ensure_lsp = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/nvim-lspconfig/start/nvim-lspconfig'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1', 'https://github.com/neovim/nvim-lspconfig',
            install_path
        })
        vim.cmd [[ packadd nvim-lspconfig ]]
        return true
    end
    return false
end

local lsp_bootstrap = ensure_lsp()
if lsp_bootstrap then
    local ok, lspconfig = pcall(require, 'lspconfig')
    if not ok then
        vim.notify('Could not load lspconfig')
        return
    end
end
