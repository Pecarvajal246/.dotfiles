local copilot_ok, copilot = pcall(require, "copilot.lua")
if not copilot_ok then
  return
end

copilot.setup{
  plugin_manager_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim",
  -- plugin_manager_path = vim.fn.stdpath("data") .. "/plugged",
}
