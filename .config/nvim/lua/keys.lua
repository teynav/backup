--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '<Esc>', {})



-- Normal Mode remaps
-- Do other remaps on opts??
map('n','<leader>q',':q<CR>', {})
map('n','<leader>wq',':wq<CR>', {})
map('n','<leader>tt',':NvimTreeToggle<CR>', {})
map('n','<leader>ff',':Telescope find_files hidden=true<CR>', {})
map('n','<leader>fr',':Telescope oldfiles<CR>', {})
map('n','<leader><tab>',':tabnew<CR>', {})
map('n','<tab>',':tabNext<CR>', {})
map('n','<S-tab>',':tabprevious<CR>', {})
map('n','<C-tab>',':bnext<CR>', {})
map('n','<A-tab>',':bprevious<CR>', {})


-- Split logic

map('n','<leader>\\',':vsplit<CR>', {})
map('n','<leader>h',':split<CR>', {})

