return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "different-requires" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
            completion = {
              callSnippet = "Replace",
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      })

      lspconfig.rust_analyzer.setup({})

      lspconfig.gopls.setup({
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
        settings = {
          formatting = {
            gofumpt = true,
          },
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })

      lspconfig.tailwindcss.setup({
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              },
            },
          },
        },
      })

      lspconfig.emmet_ls.setup({
        filetypes = { "html", "typescriptreact", "javascriptreact", "css" },
      })

      lspconfig.tailwindcss.setup({
        settings = {
          includeLanguages = {
            templ = "html",
          },
        },
      })

      lspconfig.templ.setup({})
      lspconfig.nil_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
    end,
  },
}
