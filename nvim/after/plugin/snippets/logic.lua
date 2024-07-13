local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node
local rep = require("luasnip.extras").rep

local function rec_ls()
  return sn(
    nil,
    c(1, {
      -- Order is important, sn(...) first would cause infinite loop of expansion.
      t(""),
      sn(nil, {
        t " ( ",
        d(2, function (args)
          if args[1][1] == "\\neg " then
            return sn(
              nil,
              t ""
            )
          end
          local nodes = {
            t "\\phi ",
            t "\\psi ",
            t "\\chi ",
            d(1, function ()
              return rec_ls()
            end, {})
          }
          return sn(nil, c(1, nodes))
        end, {1}),
        c(1, { t "\\neg ", t "\\land ", t "\\lor ", t "\\rightarrow " }),
        c(3, {
        t "\\phi ",
        t "\\psi ",
        t "\\chi ",
        d(1, rec_ls, {})
      }),
        t " )" }),
    })
  )
end

ls.add_snippets("tex", {
  s("set", {
    c(1, {
      t("\\( "),
      t("\\[ "),
    }),
    t("\\left\\{ "),
    i(2, "a"),
    t(" \\in "),
    i(3, "A"),
    t(" \\vert \\: "),
    i(4, "condition"),
    t(" \\right\\} "),
    f(function(args)
      if args[1][1] == "\\( " then
        return "\\)"
      else
        return "\\]"
      end
    end, { 1 })
  }),

  s("form", {
    d(1, rec_ls, {})
  })
})
