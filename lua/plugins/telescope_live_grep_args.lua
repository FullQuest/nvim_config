return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  config = function()
    require("telescope").load_extension("live_grep_args")
    -- reassign <leader>fg
    vim.keymap.set("n", "<leader>fG", function()
      require("telescope").extensions.live_grep_args.live_grep_args()
      
    end)
  end
}
