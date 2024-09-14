local action_set = require("telescope.actions.set")
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")

local flatten = vim.tbl_flatten

local M = {}

local function get_dirs(opts, fn)
  vim.fn.jobstart({ "fd", "--type", "d", "--color", "never" }, {
    stdout_buffered = true,
    on_stdout = function(_, _data)
      local data = vim.tbl_filter(function(str)
        return not str:match("^%.git")
      end, _data)

      if data then
        pickers
            .new(opts, {
              prompt_title = "Select a Directory",
              finder = finders.new_table({ results = data, entry_maker = make_entry.gen_from_file(opts) }),
              sorter = conf.file_sorter(opts),
              attach_mappings = function(prompt_bufnr)
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  vim.cmd("Ex " .. selection.path)
                end)
                return true
              end,
            })
            :find()
      else
        vim.notify("No directories found", vim.log.levels.ERROR)
      end
    end,
  })
end

M.find_directories = function(opts)
  opts = opts or {}
  get_dirs(opts)
end

return M
