-- Configurations when using vscode-neovim.
-- Modified from https://github.com/LazyVim/LazyVim/raw/main/lua/lazyvim/plugins/extras/vscode.lua
if not vim.g.vscode then
  return {}
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    vim.opt.timeoutlen = 500 -- vscode has a slow response then nvim itself
    -- vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    -- vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
    -- vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
    -- map j/k to gj/gk, refer to https://github.com/vscode-neovim/vscode-neovim/blob/master/vim/vscode-motion.vim
    vim.keymap.set({ "n", "x" }, "j", "<cmd>call VSCodeNotify('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count1 })<cr>")
    vim.keymap.set({ "n", "x" }, "k", "<cmd>call VSCodeNotify('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count1 })<cr>")
    vim.keymap.set("n", "za",         "<cmd>call VSCodeNotify('editor.toggleFold')<cr>")
    vim.keymap.set("n", "zc",         "<cmd>call VSCodeNotify('editor.fold')<cr>")
    vim.keymap.set("n", "zC",         "<cmd>call VSCodeNotify('editor.foldRecursively')<cr>")
    vim.keymap.set("n", "zo",         "<cmd>call VSCodeNotify('editor.unfold')<cr>")
    vim.keymap.set("n", "zO",         "<cmd>call VSCodeNotify('editor.unfoldRecursively')<cr>")
    vim.keymap.set("n", "zM",         "<cmd>call VSCodeNotify('editor.foldAll')<cr>")
    vim.keymap.set("n", "zR",         "<cmd>call VSCodeNotify('editor.unfoldAll')<cr>")
    vim.keymap.set("n", "gr",         "<cmd>call VSCodeNotify('references-view.findReferences')<cr>")
    vim.keymap.set("n", "<Tab>",      "<cmd>call VSCodeNotify('editor.toggleFold')<cr>")
    vim.keymap.set("n", "<leader>bn", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>")
    vim.keymap.set("n", "<leader>bp", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>")
    vim.keymap.set("n", "<leader>bb", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>")
    vim.keymap.set("n", "<leader>bd", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>")
    vim.keymap.set("n", "<leader>bO", "<cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<cr>")
    vim.keymap.set("n", "<leader>ul", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>")
    vim.keymap.set("n", "<leader>ur", "<cmd>call VSCodeNotify('workbench.action.toggleAuxiliaryBar')<cr>")
    vim.keymap.set("n", "<leader>ua", "<cmd>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<cr>")
  end,
})

vim.api.nvim_exec([[
    " THEME CHANGER
    function! SetCursorLineNrColorInsert(mode)
        " Insert mode: blue
        if a:mode == "i"
            call VSCodeNotify('nvim-theme.insert')

        " Replace mode: red
        elseif a:mode == "r"
            call VSCodeNotify('nvim-theme.replace')
        endif
    endfunction

    augroup CursorLineNrColorSwap
        autocmd!
        autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
        autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
        autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
        autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
        autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
    augroup END
]], false)

return {}
