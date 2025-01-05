local function remove_element(t, value)
  for i, v in ipairs(t) do
    if v == value then
      table.remove(t, i)
      break
    end
  end
end

return {
  {
    "saghen/blink.cmp",
    enabled = true,
    dependencies = {
      {
        "giuxtaposition/blink-cmp-copilot",
      },
    },
    opts = function(_, opts)
      opts.keymap.preset = "super-tab"

      -- the 'blink-cmp-copilot' dependency has config provided by lazyvim, we want to
      -- disable the use of the 'copilot' source by default so that we can opt-in to
      -- using it with keystroke of our choice.
      remove_element(opts.sources.default, "copilot")

      -- map the F10 key to call 'show' with the copilot source
      -- NOTE: i've rebound caps-lock to F10, i'd tried F19 but that keystroke wasn't making it to nvim
      opts.keymap["<F10>"] = {
        function(cmp)
          cmp.show({ providers = { "copilot" } })
        end,
      }
    end,
  },
}
