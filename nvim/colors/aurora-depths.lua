-- Aurora Depths colorscheme loader
-- This file allows :colorscheme aurora-depths to work
--
-- Configuration (set before loading colorscheme):
--   vim.g.aurora_depths_config = {
--     transparent = true,        -- Enable transparent background
--     transparent_float = false, -- Also make floating windows transparent
--     dim_inactive = false,      -- Dim inactive windows
--     terminal_colors = true,    -- Set terminal colors
--   }
--
-- Or use the setup function directly:
--   require('aurora-depths').setup({ transparent = true })

local config = vim.g.aurora_depths_config or {}
require("aurora-depths").setup(config)
