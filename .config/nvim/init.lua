vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.plugins")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 300

-- Auto-reload files changed externally (by Claude/opencode)
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Help cheat sheet
vim.keymap.set("n", "<leader>?", function()
  local lines = {
    " NVIM CHEAT SHEET",
    " ──────────────────────────────",
    "",
    " NAVIGATION",
    "   h/j/k/l     Move left/down/up/right",
    "   gg          Top of file",
    "   G           Bottom of file",
    "   Ctrl+d/u    Half page down/up",
    "   w/b         Next/prev word",
    "",
    " FILES",
    "   Space e      File explorer",
    "   Space ff     Find file",
    "   Space fg     Search text in files",
    "   Space fb     Open buffers",
    "",
    " LSP (on a function/variable)",
    "   gd           Go to definition",
    "   gr           Find references",
    "   K            Hover docs",
    "   Space rn     Rename",
    "   Space ca     Code action",
    "   Space fm     Format",
    "",
    " EDITING",
    "   i            Insert mode",
    "   Esc          Normal mode",
    "   dd           Delete line",
    "   yy           Copy line",
    "   p            Paste",
    "   u            Undo",
    "   Ctrl+r       Redo",
    "   gcc          Toggle comment",
    "",
    " WINDOWS & PANES",
    "   Ctrl+h/j/k/l  Move between splits/tmux",
    "   Space q       Quit",
    "   Space w       Save",
    "   Ctrl+s        Save",
    "",
    " GIT (diffview)",
    "   Space gd     Review changes",
    "   Space gc     Close diff view",
    "",
    " Press q to close",
  }
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  local width = 48
  local height = #lines
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  })
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf })
end, { desc = "Cheat sheet" })
