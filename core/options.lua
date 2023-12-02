local options = {

    shell = "/usr/bin/fish",
    termguicolors = true, -- Enables 24-bit RGB color in the TUI
    colorcolumn = "72,79",

    -- Mouse
    mouse = "a", -- Allow the mouse to be used in neovim
    mousefocus = true,

    -- Set utf8 as standard encoding and en_US as the standard language
    encoding = "utf-8",
    fileencoding = "utf-8",

    -- Use Unix as the standard file type
    ffs = "unix",

    -- Clipboard {
    clipboard = "unnamedplus", -- Use system clipboard
    fixeol = false,            -- Turn off appending new line in the end of a file
    -- }

    -- Folding
    foldmethod = "syntax",

    -- Window {
    splitbelow = true, -- Put new windows below current
    splitright = true, -- Put new vertical splits to right
    -- }

    -- Wild Menu {
    wildmenu = true,
    wildmode = "longest:full,full",
    -- }

    -- Display lines as one long line
    wrap = false,

    -- Buffers {
    autowrite = false, -- Autosave when navigating between buffers
    hidden = true,     -- required to keep multiple buffers and open multiple buffers
    -- }

    -- Set.to auto read when a file is changes from outside
    autoread = true,

    -- Set.how many lines of history vim has to remember
    history = 1000,

    -- Disable folding
    foldenable = false,

    -- Show line numbers {
    number = true,         -- Set numbered lines
    relativenumber = true, -- Set relative numbered lines
    -- }

    -- Enable cursorline {
    cursorline = true, -- Highlight the current line
    cursorcolumn = false,
    -- }

    -- For regular expressions turn magic on
    magic = true,

    -- Tabs {
    tabstop = 4,        -- 1 tab equal 4 spaces
    shiftwidth = 4,     -- Set amount of space characters, when we press "<" or ">"
    softtabstop = 4,    -- Number of spaces that a <Tab> counts
    smartindent = true, -- Turn on smart indentation. See in the docs for more info
    expandtab = true,   -- Use spaces by default
    smarttab = true,    -- When on, a <Tab> in front of a line inserts blanks according to "shiftwidth".
    -- }

    -- Keep lines below cursor when scrolling {
    scrolloff = 8,     -- minimal number of columns to scroll horizontally.
    sidescrolloff = 8, -- minimal number of screen columns
    -- }

    -- Don't use temp files {
    backup = false,   -- creates a backup file
    wb = false,
    swapfile = false, -- creates a swapfile
    -- }

    -- If a file is being edited by another program (or was written to file while
    -- editing with another program), it is not allowed to be edited
    writebackup = false,

    -- So that `` is visible in markdown files
    conceallevel = 0,

    -- Ignore case in search patterns
    ignorecase = true,

    -- Smart case
    smartcase = true,

    -- Pop-menu{
    pumheight = 8, -- pop up menu height
    pumblend = 0,  -- transparency of pop-up menu
    -- }

    -- We don't need to see things like -- INSERT -- anymore
    showmode = false,

    -- Time to wait for a mapped sequence to complete (in milliseconds)
    timeoutlen = 500,

    -- Always show the sign column, otherwise it would shift the text each time
    signcolumn = "yes",

    -- Make EndOfBuffer invisible
    fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " },
}

local global = {
}


for name, value in pairs(options) do
    vim.opt[name] = value
end

for name, value in pairs(global) do
    vim.g[name] = value
end
