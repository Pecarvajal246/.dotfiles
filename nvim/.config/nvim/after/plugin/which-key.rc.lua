local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
  return
end

which_key.setup {
  plugins = {
    presets = {
      operators = true,
    },
  },
}
