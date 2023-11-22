return function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,preview",
    },
    snippet = { -- configure how nvim-cmp interacts with snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(),            -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
      ["<C-b>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-f>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- snippets
      { name = "buffer" },  -- text within current buffer
      { name = "path" },    -- file system paths
    }),
    -- configure lspkind for vs-code like pictograms in completion menu
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        ellipsis_char = "...",
      }),
    },
  })
end

