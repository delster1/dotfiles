return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",

  opts = {
    fast_wrap = {},
  },

  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    local Rule   = require("nvim-autopairs.rule")
    local cond   = require("nvim-autopairs.conds")

    npairs.setup(opts)

    -----------------------------------------------------
    -- Markdown Rules
    -----------------------------------------------------

    -- Inline math: $...$
    npairs.add_rule(
      Rule("$", "$", "markdown")
        :with_pair(cond.not_before_regex_check("%w"))
        :with_move(function(opts) return opts.prev_char:match("%$") ~= nil end)
        :with_cr(cond.none())
    )

    -- Display math: $$...$$
    npairs.add_rule(
      Rule("$$", "$$", "markdown")
        :with_pair(cond.not_before_regex_check("%$"))
    )


    -- Bold: **text**
    npairs.add_rule(
      Rule("**", "**", "markdown")
        :with_pair(cond.not_before_regex_check("%*"))
    )

    -- Italic: *text*
    npairs.add_rule(
      Rule("*", "*", "markdown")
        :with_pair(cond.not_before_regex_check("%*"))
    )

    -- Italic/underline: _text_
    npairs.add_rule(
      Rule("_", "_", "markdown")
        :with_pair(cond.not_before_regex_check("%_"))
    )


    -- Inline code: `code`
    npairs.add_rule(
      Rule("`", "`", "markdown")
        :with_pair(cond.not_before_regex_check("`"))
    )

    -- Code fences: ```...```
    npairs.add_rule(
      Rule("```", "```", "markdown")
        :with_pair(cond.not_before_regex_check("`"))
    )


    -----------------------------------------------------
    -- Links & Images
    -----------------------------------------------------

    -- Link markdown: [text](url)
    npairs.add_rule(
      Rule("[", "]", "markdown")
        :with_move(cond.none())
        :with_pair(cond.always())
        :with_cr(cond.none())
    )

    npairs.add_rule(
      Rule("(", ")", "markdown")
        :with_pair(cond.always())
    )

    -- Images: ![alt](src)
    npairs.add_rule(
      Rule("![", "]", "markdown")
        :with_pair(cond.always())
    )


    -----------------------------------------------------
    -- Debug
    -----------------------------------------------------
    -- print(vim.inspect(cond))
  end,
}

