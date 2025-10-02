-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
        -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
        -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- selection
        [",a"] = { "<esc>ggVG<CR>", desc = "Select everything" },
        ["<leader>sa"] = { "<esc>ggVG<CR>", desc = "Select everything" },

        -- split line
        ["<leader>sl"] = { '<esc>:.,1s/\\(\\"[A-Za-z0-9_-]*\\"[,]*\\)\\s*/\\r\\t\\1/g<CR>', desc = "Split line" },
      },
      v = {
        -- visual selection
        [",s"] = { "!sort<CR>", desc = "Sort lines" },
        ["<leader>ss"] = { "!sort<CR>", desc = "Sort lines" },
      },
      i = {
        -- ["<C-h>"] = {
        --   "copilot#Dismiss()",
        --   desc = "Dismiss Copilot suggestion",
        --   noremap = true,
        --   expr = true,
        --   silent = true,
        --   replace_keycodes = false,
        -- },
        -- ["<C-j>"] = {
        --   "copilot#Next()",
        --   desc = "Next Copilot suggestion",
        --   noremap = true,
        --   expr = true,
        --   silent = true,
        --   replace_keycodes = false,
        -- },
        -- ["<C-k>"] = {
        --   "copilot#Previous()",
        --   desc = "Previos Copilot suggestion",
        --   noremap = true,
        --   expr = true,
        --   silent = true,
        --   replace_keycodes = false,
        -- },
        -- ["<C-l>"] = {
        --   "copilot#Accept('<CR>')",
        --   desc = "Accept Copilot suggestion",
        --   noremap = true,
        --   expr = true,
        --   silent = true,
        --   replace_keycodes = false,
        -- },
        -- ["<C-y>"] = {
        --   "<cmd>LinearIssues<cr><esc>",
        --   desc = "Open Linear issues",
        --   noremap = true,
        --   expr = false,
        --   silent = true,
        --   replace_keycodes = false,
        -- },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
