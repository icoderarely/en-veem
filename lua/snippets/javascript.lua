local ls = require 'luasnip'

-- Define a snippet for JavaScript
ls.add_snippets('javascript', {
  -- Snippet for `cl` that expands to `console.log();`
  ls.snippet('cl', {
    ls.text_node 'console.log(',
    ls.insert_node(1), -- Cursor position inside the parentheses
    ls.text_node ');',
  }),
})
