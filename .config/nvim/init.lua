-- 1 . Check and install packer ASAP --
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- 2 . Install Plugins after setting up packer --

require("plugins")

-- If first_install == true then sync() 

if is_bootstrap then
    require('packer').sync()
end

-- 3. Set default options --
require("opts")

-- 4. Set keybindings

require("keys")
