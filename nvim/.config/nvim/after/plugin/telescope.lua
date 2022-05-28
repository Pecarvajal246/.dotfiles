local telescope_status_ok, telescope= pcall(require, "telescope")
if not telescope_status_ok then
  return
end
telescope.load_extension('neoclip')
telescope.load_extension "file_browser"
