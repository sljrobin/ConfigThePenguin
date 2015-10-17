module Elements where

-- Core
import XMonad                           -- Main lib
-- Actions
import XMonad.Actions.GridSelect        -- Enable 2D grid
-- Personal Modules
import Appearance                       -- Load colors, dimensions, and fonts

import XMonad.Layout.IndependentScreens

------------------------------------------------------------------------------------------------------------------------
-- Grid
------------------------------------------------------------------------------------------------------------------------
-- Colorizer
myGridColorizer :: Window -> Bool -> X (String, String)
myGridColorizer = colorRangeFromClassName
    (0x58,0x58,0x58)                          -- Lowest inactive background
    (0x58,0x58,0x58)                          -- Highest inactive background
    (0x7C,0xAF,0xC2)                          -- Active background
    (0xF8,0xF8,0xF8)                          -- Inactive foreground
    (0xF8,0xF8,0xF8)                          -- Active foreground

-- Configuration
myGridConfig :: t -> GSConfig Window
myGridConfig colorizer = (buildDefaultGSConfig myGridColorizer)
    { gs_cellheight  = 65                     -- Cell height 
    , gs_cellwidth   = 120                    -- Cell width
    , gs_cellpadding = 10                     -- Cell padding
    , gs_font        = myFntGrid              -- Font
    }


------------------------------------------------------------------------------------------------------------------------
-- Terminal
------------------------------------------------------------------------------------------------------------------------
myTerminal = "urxvtcd"


------------------------------------------------------------------------------------------------------------------------
-- Workspaces
------------------------------------------------------------------------------------------------------------------------
myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1 .. 9]
--myWorkspaces = withScreens 1 ["alpha", "beta"]
