local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local f = ls.function_node
local get_prop_names = require("diego.lua-functions").get_prop_names

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
