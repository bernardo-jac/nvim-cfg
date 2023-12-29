return {
  "simrat39/rust-tools.nvim",
  dependencies = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Rust development configuration:
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

    require("rust-tools").setup {
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        capabilities = capabilities,
        on_attach = function(_, buf)
          local tools = require("rust-tools")
          vim.keymap.set("n", "<Leader>k", tools.hover_actions.hover_actions, { buffer = buf })
          vim.keymap.set("n", "<Leader>a", tools.code_action_group.code_action_group, { buffer = buf })
        end,
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
    }
  end
}
