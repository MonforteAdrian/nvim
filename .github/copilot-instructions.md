# Copilot instructions for this repository

Personal Neovim configuration managed by [lazy.nvim](https://github.com/folke/lazy.nvim).
Lives at `~/.config/nvim` and is loaded by Neovim directly — there is no build/test pipeline.

## Layout & load order

`init.lua` requires four modules in order: `core.lazy` → `core.keymaps` → `core.options` → `core.autocmds`.

- `lua/core/lazy.lua` — bootstraps lazy.nvim, sets `mapleader = " "` and `maplocalleader = "\\"`, then `require("lazy").setup({ spec = { { import = "plugins" } } })`. **Every file in `lua/plugins/` is auto-imported as a lazy.nvim plugin spec — each must `return` a spec table (or list of spec tables).** Do not require plugin files manually.
- `lua/core/{keymaps,options,autocmds}.lua` — global, plugin-agnostic settings only. Plugin-specific keymaps belong inside the plugin's spec (typically in an `LspAttach` autocmd or `keys =`/`config =` block).
- `lua/helpers/colorscheme.lua` — colorscheme selection helper.
- `after/ftplugin/{c,json,lua,rust}.lua` — per-filetype overrides; prefer adding new filetype tweaks here over autocmds.
- `colorschemes/draculanvim` — git submodule (`git@github.com:MonforteAdrian/draculanvim.git`). Run `git submodule update --init --recursive` after cloning.
- `lazy-lock.json` — committed lockfile; update with `:Lazy update` (do not hand-edit).

## Conventions

- **Formatting**: stylua (`stylua.toml`: 2-space indent, 120 col, Unix line endings). Format-on-save is wired through `conform.nvim` with `lsp_format = "fallback"`, so saving a buffer formats it. Don't mix indent widths in new files even if some legacy files (e.g. `core/lazy.lua`) use 4 spaces — match `stylua.toml`.
- **Keymaps**: always use `local map = vim.keymap.set` at the top of the file and pass a `{ desc = "..." }` for which-key discoverability. Mirror existing `<leader>` namespaces (`<leader>c*` code/LSP, `<leader>f*` find, `<leader>d*` diagnostics/dap, `<leader>g*` git, `<leader>r*` rust, `<leader>n*` notifications). `<leader>{h,j,k,l}` are reserved for window switching.
- **LSP**: managed by `mason.nvim` + `mason-lspconfig` (2.x). To add a server, append to `ensure_installed` in `lua/plugins/lsp.lua` — `mason-lspconfig` is configured with `automatic_enable = true`, so it's wired up automatically. Only call `vim.lsp.config('<server>', { ... })` for servers that need custom settings (see the `lua_ls` block as the template). Buffer-local LSP keymaps go in the `LspAttach` autocmd in the same file.
- **DAP adapters / formatters**: registered via `mason-nvim-dap`'s `ensure_installed` in `lua/plugins/lsp.lua` (e.g. `codelldb`, `stylua`, `shfmt`).
- **Lua dev**: `lazydev.nvim` (`lua/plugins/lazydev.lua`) provides Neovim/plugin API completions when editing Lua files — no manual `workspace.library` wiring on `lua_ls` needed. `.luarc.json` disables third-party workspace checks.
- **Diagnostics**: configured once via `vim.diagnostic.config({ ... })` in `lua/plugins/lsp.lua` (signs use the `signs.text` table — don't call `sign_define` for diagnostics).
- **Plugin file naming**: one topical file per concern (`git.lua`, `dap.lua`, `rust.lua`, `ai.lua`, `snacks.lua`, …). `misc.lua` is the catch-all for small standalone plugins.
- **Lazy-loading with directory args**: `oil.lua` uses `lazy = vim.fn.argc(-1) == 0 or vim.fn.isdirectory(vim.fn.argv(0)) == 0` so `nvim <dir>` still triggers oil at startup. Mirror this pattern for any plugin that should activate when nvim opens a directory.

## Working in this repo

- There are no tests, no CI, and no build step. "Verifying" a change means launching Neovim and checking `:Lazy`, `:Mason`, `:checkhealth`, and `:messages`.
- After editing a plugin spec, reload with `:Lazy reload <name>` or restart Neovim; `change_detection.notify` is disabled so lazy.nvim won't prompt.
- When adding a plugin, place its spec in the most relevant `lua/plugins/*.lua` file (or create a new one) — never edit `init.lua` or `core/lazy.lua` for plugin wiring.
