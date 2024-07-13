local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local rep = require("luasnip.extras").rep
local same = function(index)
  return f(function(args)
    return args[1]
  end, { index })
end
local d = ls.dynamic_node

ls.add_snippets("lua", {
  s("example12", fmt([[
  type of function = {}
  ]], { c(1, { t("sync"), t("async") }) }))
})
