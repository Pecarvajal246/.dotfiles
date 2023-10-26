local lsp_file_operations_status, lsp_file_operations = pcall(require, "lsp-file-operations")
if not lsp_file_operations_status then
  return
end

lsp_file_operations.setup()
