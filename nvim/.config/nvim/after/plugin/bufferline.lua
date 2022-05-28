local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
  return
end
bufferline.setup{
  options = {
    -- separator_style = "padded_slant",
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return "" .. icon .. count
    end
}}
