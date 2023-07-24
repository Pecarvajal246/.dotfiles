local rainbow_delimeters_status_ok, rainbow_delimeters = pcall(require, "rainbow-delimeters")
if not rainbow_delimeters_status_ok then
  return
end

vim.g.rainbow_delimeters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
    },
    query = {
        [''] = 'rainbow-delimiters',
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
