module Appearance where

-- Core
import XMonad                            -- Main lib
-- Layouts
import XMonad.Layout.Decoration          -- Enable the creation of decorated layouts
-- Util
import XMonad.Util.Font                  -- Use Xft fonts
import XMonad.Util.Types                 -- Use common types


----------------------------------------------------------------------------
-- Colors
----------------------------------------------------------------------------
-- Main palette
myClrBlue           = "#7CAFC2"    -- Blue
myClrDGrey          = "#585858"    -- Dark Grey
myClrLGrey          = "#ABABAB"    -- Light Grey
myClrRed            = "#AB4642"    -- Red
myClrWhite          = "#F8F8F8"    -- White

-- Borders
myBorderWidth      :: Dimension    -- Border width declaration
myBorderWidth       = 1            -- Border width
myClrNormalBorder   = myClrDGrey   -- Normal border
myClrFocusedBorder  = myClrLGrey   -- Focused border

-- Status bar
myClrBarBg          = "#121212"    -- Main background
myClrBarFg          = "#D8D8D8"    -- Main foreground
myClrBarPPCurrentBg = myClrBarBg   -- Current background
myClrBarPPCurrentFg = myClrBlue    -- Current foreground
myClrBarPPHiddenBg  = myClrBarBg   -- Hidden background
myClrBarPPHiddenFg  = myClrDGrey   -- Hidden foreground
myClrBarPPLayoutBg  = myClrBarBg   -- Layout background
myClrBarPPLayoutFg  = myClrBarFg   -- Layout foreground
myClrBarPPTitleBg   = myClrBarBg   -- Title background
myClrBarPPTitleFg   = myClrBarFg   -- Title foreground
myClrBarPPUrgentBg  = myClrRed     -- Urgent background
myClrBarPPUrgentFg  = myClrWhite   -- Urgent foreground

-- dmenu
myClrDmenuNBg       = myClrBarBg   -- Normal background
myClrDmenuNFg       = myClrBarFg   -- Normal foreground
myClrDmenuSBg       = myClrDGrey   -- Selected background
myClrDmenuSFg       = myClrWhite   -- Selected foreground


----------------------------------------------------------------------------
-- Dimensions
----------------------------------------------------------------------------
-- Height/Gap
--myLenovoX250XndGapD :: (Direction2D, Int)
--myLenovoX250XndGapD =  (D, 20)
myLenovoX250DimBarHgt      = "18"                    -- Lenovo X250: Height for status bar
myLenovoX250XndGap         = 18                      -- Lenovo X250: Gap for XMonad
myAsus1015DimBarHgt        = "16"                    -- Asus 1015: Height for status bar
myAsus1015XndGap           = 16                      -- Asus 1015: Gap for XMonad
myDimBarHgt                = myLenovoX250DimBarHgt   -- Height for status bar
myDimXndGap                = myLenovoX250XndGap      -- Gap for XMonad


-- Dzen width/position
myLenovoX250DzenTopLDimWdh = "1000"                  -- Lenovo X250: Dzen Top Left: width
myLenovoX250DzenTopRDimWdh = "920"                   -- Lenovo X250: Dzen Top Right: width
myLenovoX250DzenBotLDimWdh = "1000"                  -- Lenovo X250: Dzen Bottom Left: width
myLenovoX250DzenBotRDimWdh = "920"                   -- Lenovo X250: Dzen Bottom Right: width
myLenovoX250DzenBotLPosY   = "1080"                  -- Lenovo X250: Dzen Bottom Left: X position
myAsus1015DzenTopLDimWdh   = "600"                   -- Asus 1015: Dzen Top Left: width
myAsus1015DzenTopRDimWdh   = "624"                   -- Asus 1015: Dzen Top Right: width
myAsus1015DzenBotLDimWdh   = "600"                   -- Asus 1015: Dzen Bottom Left: width
myAsus1015DzenBotRDimWdh   = "624"                   -- Asus 1015: Dzen Bottom Right: width
myAsus1015DzenBotLPosY     = "600"                   -- Asus 1015: Dzen Bottom Left: X position


----------------------------------------------------------------------------
-- Fonts
----------------------------------------------------------------------------
myLenovoX250FntDmenu  = "DejaVu Sans Mono-12"                        -- Lenovo X250: Font for dmenu
myLenovoX250FntDzen   = "DejaVu Sans Mono:pixelsize=12:Book"         -- Lenovo X250: Font for status bar
myLenovoX250FntGrid   = "xft:DejaVu Sans Mono:pixelsize=12:Book"     -- Lenovo X250: Font for grid
myLenovoX250FntLayTab = "xft:DejaVu Sans Mono:pixelsize=12:Book"     -- Lenovo X250: Font for the Tabbed layout
myAsus1015FntDmenu    = "DejaVu Sans Mono-10"                        -- Asus 1015: Font for dmenu
myAsus1015FntDzen     = "DejaVu Sans Mono:pixelsize=10:Book"         -- Asus 1015: Font for status bar
myAsus1015FntGrid     = "xft:DejaVu Sans Mono:pixelsize=10:Book"     -- Asus 1015: Font for grid
myAsus1015FntLayTab   = "xft:DejaVu Sans Mono:pixelsize=10:Book"     -- Asus 1015: Font for the Tabbed layout
myFntDmenu            = myLenovoX250FntDmenu                         -- Font for dmenu
myFntDzen             = myLenovoX250FntDzen                          -- Font for status bar
myFntGrid             = myLenovoX250FntGrid                          -- Font for grid
myFntLayTab           = myLenovoX250FntLayTab                        -- Font for the Tabbed layout


----------------------------------------------------------------------------
-- Themes
----------------------------------------------------------------------------
-- Theme 'Tabbed' Layout
myThemeLayoutTabbed :: Theme
myThemeLayoutTabbed = defaultTheme
    -- Active tab
    { activeColor         = myClrLGrey  -- Color
    , activeBorderColor   = myClrWhite  -- Border
    , activeTextColor     = myClrWhite  -- Text
    -- Inactive tab
    , inactiveColor       = myClrDGrey  -- Color
    , inactiveBorderColor = myClrWhite  -- Border
    , inactiveTextColor   = myClrWhite  -- Text
    -- Urgent tab
    , urgentColor         = myClrDGrey  -- Color
    , urgentBorderColor   = myClrRed    -- Border
    , urgentTextColor     = myClrRed    -- Text
    -- Font
    , fontName            = myFntLayTab
    }
