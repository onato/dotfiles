return function()
  local lspconfig = require("lspconfig")
  local util = require("lspconfig.util")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()
  local opts = { noremap = true, silent = true }
  local on_attach = function(_, bufnr)
    opts.buffer = bufnr


    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    opts.desc = "Show line diagnostics"
    nmap("<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Show documentation for what is under cursor"
    nmap("K", vim.lsp.buf.hover, opts)
    nmap("gi", vim.lsp.buf.implementation, { desc = "Implementation" })
    nmap("gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
    nmap("gd", vim.lsp.buf.definition, { desc = "Definition" })
    nmap("gr", vim.lsp.buf.references, { desc = "References" })
  end

  lspconfig["sourcekit"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
      "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
    },
    root_dir = function(filename, _)
      return util.root_pattern("buildServer.json")(filename)
          or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
          or util.find_git_ancestor(filename)
          or util.root_pattern("Package.swift")(filename)
    end,
  })
end
