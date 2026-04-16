return {
  -- Diff viewer: review changes made by Claude Code / opencode
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Review all changes" },
      { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close diff view" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
}
