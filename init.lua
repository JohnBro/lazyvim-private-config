-- bootstrap lazy.nvim, LazyVim and your plugins

---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
  local separator = package.config:sub(1, 1) -- get '/' or '\'

  local args = {...}
  local joined_path = table.concat(args, separator)
  return joined_path
end

require("config.lazy")
