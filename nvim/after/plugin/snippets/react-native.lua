local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local same = function(index)
  return f(function(args)
    return args[1]
  end, { index })
end

local function get_prop_names(args)
  local props = {}
  for j, propDefinition in ipairs(args[1]) do
    table.insert(props, propDefinition)
  end
  local propNames = {}
  for i, prop in ipairs(props) do
    local propName = vim.split(prop, ":")[1]
    local trimmedProp = string.gsub(propName, "%s+", "")
    table.insert(propNames, trimmedProp)
  end
  return table.concat(propNames, ", ")
end

ls.add_snippets("typescriptreact", {
  s("defcomp", fmt([[
  import { View } from 'react-native';

  export default function [] ({[]} : {
    []
  }) {
    return (
      <View>
        []
      </View>
    )
  }
  ]], {
    i(1, "name"), f(get_prop_names, { 2 }), i(2, "props"), i(3)
  }, {
    delimiters = "[]"
  })),

  s("comp", fmt([[
  function [] ({[]} : {
    []
  }) {
    return (
      <View>
        []
      </View>
    )
  }
  ]], {
    i(1, "name"), f(get_prop_names, { 2 }), i(2, "props"), i(3)
  }, {
    delimiters = "[]"
  }))
})
