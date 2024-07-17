local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local f = ls.function_node
local get_prop_names = require("diego.lua-functions").get_prop_names

ls.add_snippets("typescript", {
  s("func", fmt([[
  function [] ({[]} : {
    []
  }) {
    return []
  }
  ]], {
    i(1, "name"), f(get_prop_names, { 2 }), i(2, "props"), i(3)
  }, {
    delimiters = "[]"
  }))
})
