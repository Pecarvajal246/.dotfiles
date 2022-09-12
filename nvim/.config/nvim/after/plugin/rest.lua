local rest_status_ok, rest = pcall(require, "rest-nvim")
if not rest_status_ok then
  return
end

rest.setup{}
