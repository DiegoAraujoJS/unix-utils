local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local func = ls.function_node
local text = ls.text_node

local date = function() return { os.date('%d/%m/%Y') } end
local datetime = function() return { os.date('%d/%m/%Y %H:%M:%S') } end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "!date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
    snip({
      trig = "!datetime",
      namr = "Datetime",
      dscr = "Datetime in the form of YYYY-MM-DD HH:MM:SS",
    }, {
      func(datetime, {}),
    }),
    snip({
      trig = "!DOCTYPE",
      name = "HTML DOCTYPE",
      dscr = "Template for HTML DOCTYPE",
    }, {
      text({ "<!DOCTYPE html>", "<html lang=\"en\">", "<head>", "    <meta charset=\"UTF-8\">",
        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">", "    <title>Document</title>",
        "</head>", "<body>", "", "</body>", "</html>" })
    }),
    snip({
      trig = "!CSSRESET",
      name = "CSS Reset",
      dscr = "CSS Reset",
    }, {
      text({ "* {", "    margin: 0;", "    padding: 0;", "    box-sizing: border-box;", "}", "", "img {",
        "    display: block;", "    width: 100%;", "}" })
    }),
    snip({
      trig = "@import",
      name = "CSS Import Fonts",
      dscr = "CSS Import Fonts",
    }, {
      text({ "@import url(\"https://fonts.googleapis.com/css2?family=Roboto&display=swap\");" })
    }),
    snip({
      trig = "!DOCSTRING",
      name = "Python docstring",
      dscr = "Python docstring",
    }, {
      text({ "\"\"\"", "\"\"\"" })
    }),
  }
})
