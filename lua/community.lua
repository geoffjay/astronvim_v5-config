-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },

  -- language packs
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.yaml" },

  -- ai
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.completion.supermaven-nvim" },

  -- editor
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },

  -- import/override with your plugins folder
}
