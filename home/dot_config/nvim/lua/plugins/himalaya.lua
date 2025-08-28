return {
  {
    "pimalaya/himalaya-vim",
    keys = {
      -- Mail group entry (for which-key)
      { "<Leader>m", desc = "Mail", group = "Mail" },

      -- Envelope listing
      { "<Leader>mf", "<Plug>(himalaya-folder-select)", desc = "Select folder" },
      { "<Leader>mp", "<Plug>(himalaya-folder-select-previous-page)", desc = "Prev page" },
      { "<Leader>mn", "<Plug>(himalaya-folder-select-next-page)", desc = "Next page" },
      { "<CR>", "<Plug>(himalaya-email-read)", desc = "Read under cursor" },

      -- Message actions
      { "<Leader>mw", "<Plug>(himalaya-email-write)", desc = "Write email" },
      { "<Leader>mr", "<Plug>(himalaya-email-reply)", desc = "Reply" },
      { "<Leader>mR", "<Plug>(himalaya-email-reply-all)", desc = "Reply all" },
      { "<Leader>mf", "<Plug>(himalaya-email-forward)", desc = "Forward" },
      { "<Leader>ma", "<Plug>(himalaya-email-download-attachments)", desc = "Download attachments" },
      { "<Leader>mC", "<Plug>(himalaya-email-copy)", desc = "Copy email" },
      { "<Leader>mM", "<Plug>(himalaya-email-move)", desc = "Move email" },
      { "<Leader>mD", "<Plug>(himalaya-email-delete)", desc = "Delete email" },
      { "<Leader>mFa", "<Plug>(himalaya-email-flag-add)", desc = "Flag add" },
      { "<Leader>mFr", "<Plug>(himalaya-email-flag-remove)", desc = "Flag remove" },
      { "<Leader>m/", "<Plug>(himalaya-set-list-envelopes-query)", desc = "Search emails" },

      -- Message writing
      { "<Leader>ma", "<Plug>(himalaya-email-add-attachment)", desc = "Add attachment" },

      -- Command shortcut
      { "<Leader>mo", ":Himalaya<CR>", desc = "Open Himalaya" },
      event = "VeryLazy",
    },
  },
}
