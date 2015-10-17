module Hook_Layout where

-- Core
import XMonad hiding ((|||))             -- Enable multiple layouts
-- Layouts
import XMonad.Layout.Gaps                -- Manually-sized gaps
import XMonad.Layout.Grid                -- Layout: Grid
import XMonad.Layout.LayoutCombinators   -- Combine multiple layouts into one composite layout
import XMonad.Layout.Minimize            -- Layout: minimize
import XMonad.Layout.ThreeColumns        -- Layout: ThreeColumns
import XMonad.Layout.NoBorders           -- Smart borders
import XMonad.Layout.ResizableTile       -- Allow to change a width/height of window
import XMonad.Layout.SimplestFloat         -- Layout: simplest float
import XMonad.Layout.Spiral              -- Layout: spiral layout
import XMonad.Layout.Tabbed              -- Layout: Tabbed
-- Personal Modules
import Appearance                        -- Load colors, dimensions, and fonts

myLayoutHook = gaps [(U, 20), (D, 20)] $ myLayouts                                                                                       -- Use Gaps (up and down) for all the layouts
    where
        myLayouts     = smartBorders (lay_grid ||| lay_tiled ||| lay_tabbed ||| lay_threecol ||| lay_spiral ||| lay_full ||| lay_float)  -- Use smartBorders for all the layouts
        -- Layouts
        lay_float     = simplestFloat                                                                                                    -- Layout: SimplestFloat
        lay_full      = Full                                                                                                             -- Layout: Full
        lay_grid      = Grid                                                                                                             -- Layout: Grid
        lay_spiral    = spiral (toRational (2/(1+sqrt(5)::Double)))                                                                      -- Layout: Spiral
        lay_tabbed    = minimize $ tabbed shrinkText myThemeLayoutTabbed                                                                 -- Layout: Tabbed
        lay_threecol  = ThreeColMid 1 (3/100) (1/2)                                                                                      -- Layout: Three Columns
        lay_tiled     = ResizableTall 1 (2/100) (1/2) []                                                                                 -- Layout: Tiled
