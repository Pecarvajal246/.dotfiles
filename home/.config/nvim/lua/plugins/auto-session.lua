return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/" },
		auto_create = false,
		show_auto_restore_notif = true,
		-- log_level = 'debug',
	},
}
