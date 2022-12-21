--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '<Esc>', {})


vim.g.mapleader=" "
-- Normal Mode remaps
-- Do other remaps on opts??
map('n','<leader>q',':q<CR>', {})
map('n','<leader>wq',':wq<CR>', {})
map('n','<leader>tt',':NvimTreeToggle<CR>', {})
map('n','<leader>sf',':Telescope find_files hidden=true<CR>', {})
map('n','<leader>sr',':Telescope oldfiles<CR>', {})
map('n','<leader><tab>',':tabnew<CR>', {})
map('n','<C-Up>',':tabNext<CR>', {})
map('n','<C-Down>',':tabprevious<CR>', {})
map('n','<C-Right>',':bnext<CR>', {})
map('n','<C-Left>',':bprevious<CR>', {})


-- Split logic

map('n','<leader>\\',':vsplit<CR>', {})
map('n','<leader>h',':split<CR>', {})


-- Visual mode --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
