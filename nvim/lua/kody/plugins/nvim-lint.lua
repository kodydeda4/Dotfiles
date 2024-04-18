-- NOTE: This section was created by xcodebuild.nvim default config. 
-- I commented it out to put the nvim-lint config from the youtube guy lol.

-- return {
--   "mfussenegger/nvim-lint",
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     local lint = require("lint")
--
--     lint.linters_by_ft = {
--       -- swift = { "swiftlint" },
-- 			javascript = { "eslint_d" },
-- 			typescript = { "eslint_d" },
-- 			javascriptreact = { "eslint_d" },
-- 			typescriptreact = { "eslint_d" },
-- 			svelte = { "eslint_d" },
-- 			python = { "pylint" },
--     }
--
--     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--
--     vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
--       group = lint_augroup,
--       callback = function()
--         require("lint").try_lint()
--       end,
--     })
--
--     vim.keymap.set("n", "<leader>ml", function()
--       require("lint").try_lint()
--     end, { desc = "Lint file" })
--   end,
-- }
--
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
