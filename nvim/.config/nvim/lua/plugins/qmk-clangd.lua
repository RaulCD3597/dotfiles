-- QMK firmware: clangd needs --query-driver to trust the AVR/ARM
-- cross-compilers referenced in compile_commands.json (avr-gcc, arm-none-eabi-gcc),
-- otherwise it silently falls back to no system includes for those TUs.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--query-driver="
              .. table.concat({
                "/opt/homebrew/bin/avr-gcc*",
                "/opt/homebrew/bin/avr-g++*",
                "/opt/homebrew/bin/arm-none-eabi-gcc*",
                "/opt/homebrew/bin/arm-none-eabi-g++*",
              }, ","),
          },
        },
      },
    },
  },
}
