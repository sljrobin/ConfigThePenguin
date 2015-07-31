------------------------------------------------------------------------------------------------------------------------
-- IMPORTS
------------------------------------------------------------------------------------------------------------------------
-- System
import System.Exit (exitSuccess)
import System.IO

-- Core
import XMonad                          -- Main lib
import qualified Data.Map        as M  -- Mouse bindings
import qualified XMonad.StackSet as W  -- ManageHook rules
-- Actions
import XMonad.Actions.CycleWS          -- Cycle through the workspaces
import XMonad.Actions.GridSelect       -- Enable 2D grid
-- Hooks
import XMonad.Hooks.DynamicLog         -- Statusbar
import XMonad.Hooks.ManageDocks        -- Manage dzen
import XMonad.Hooks.UrgencyHook        -- Window alert bells 
-- Layouts
import XMonad.Layout.NoBorders         -- Smart borders
import XMonad.Layout.ResizableTile     -- Allow to change a width/height of window
import XMonad.Layout.SimpleFloat       -- Layout: simple float
import XMonad.Layout.Spiral            -- Layout: spiral layout
-- Util
import XMonad.Util.EZConfig            -- Append key/mouse bindings
import XMonad.Util.Run(spawnPipe)      -- Add 'spawnPipe' and 'hPutStrLn'
import XMonad.Util.SpawnOnce           -- Add 'spawnOnce'


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: Appearance
------------------------------------------------------------------------------------------------------------------------
-- Borders
myBorderWidth        = 1            -- Border width
myNormalBorderColor  = "#CCCCCC"    -- Color; normal border
myFocusedBorderColor = "#8AB5E4"    -- Color; focused border

-- Status bar
myBarBackground      = "#111111"    -- Color; background
myBarForeground      = "#FFFFFF"    -- Color; foreground
 

------------------------------------------------------------------------------------------------------------------------
-- CONFIG: Bindings: Keys
------------------------------------------------------------------------------------------------------------------------
myModMask = mod4Mask -- Use <Windows> key instead of <Alt> key for <Mod>
myKeys    =
    ----------------------------------------------------------------------------
    -- Programs; launching
    ----------------------------------------------------------------------------
    [ ("M-<Return>" , spawn "urxvt")                                    -- <Mod> + <Return>: launch a terminal
    , ("M-r"        , spawn "dmenu")                                    -- <Mod> + <r>: launch dmenu
    , ("M-S-r"      , spawn "gmrun")                                    -- <Mod> + <Shift> + <r>: launch gmrun
    ]
    ++

    ----------------------------------------------------------------------------
    -- Programs; using
    ----------------------------------------------------------------------------
    [ ("M-S-z"      , spawn "xscreensaver-command -lock")               -- <Mod> + <Shift> + <z>: lock screen
    , ("M-S-<F10>"  , spawn "amixer set Master toggle")                 -- <Mod> + <Shift> + <F10>; mute volume
    , ("M-S-<F11>"  , spawn "amixer set Master 2-")                     -- <Mod> + <Shift> + <F11>: decrease volume
    , ("M-S-<F12>"  , spawn "amixer set Master 2+")                     -- <Mod> + <Shift> + <F12>: increase volume
    ]
    ++

    ----------------------------------------------------------------------------
    -- Programs; killing
    ----------------------------------------------------------------------------
    [ ("M-S-c"      , kill)                                             -- <Mod> + <Shift> + <c>: close the focused window
    , ("M-S-q"      , io exitSuccess)                                   -- <Mod> + <Shift> + <q>: close XMonad
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; focus
    ----------------------------------------------------------------------------
    [ ("M-<Tab>"    , windows W.focusDown)                              -- <Mod> + <Tab>: move focus to the next window
    , ("M-j"        , windows W.focusDown)                              -- <Mod> + <j>: move focus to the next window
    , ("M-S-<Tab>"  , windows W.focusUp)                                -- <Mod> + <Shift> + <Tab>: move focus to the previous window
    , ("M-k"        , windows W.focusUp)                                -- <Mod> + <k>: move focus to the previous window
    , ("M-m"        , windows W.focusMaster)                            -- <Mod> + <m>: move focus to the master window
    , ("M-t"        , withFocused $ windows . W.sink)                   -- <Mod> + <t>: push window back into tiling
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; layouts
    ----------------------------------------------------------------------------
    [ ("M-<Space>"  , sendMessage NextLayout)                           -- <Mod> + <Space>: rotate through the available layout algorithms
    , ("M-S-<Space>", asks (XMonad.layoutHook . config) >>= setLayout)  -- <Mod> + <Shift> + <Space>: reset the layouts on the current workspace
    , ("M-h"        , sendMessage Shrink)                               -- <Mod> + <h>: shrink the master area
    , ("M-l"        , sendMessage Expand)                               -- <Mod> + <l>: expand the master area
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; grid
    ----------------------------------------------------------------------------
    [ ("M-,"        , goToSelected $ myGSConfig myGridConfig)           -- <Mod> + <Left>: move to the previous workspace
    , ("M-S-,"      , bringSelected $ myGSConfig myGridConfig)          -- <Mod> + <Shift> + <,>: move to the next workspace
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; workspaces
    ----------------------------------------------------------------------------
    [ ("M-<Left>"   , prevWS)                                           -- <Mod> + <Left>: move to the previous workspace
    , ("M-<Right>"  , nextWS)                                           -- <Mod> + <Right>: move to the next workspace
    ]


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: Bindings: Mouse
------------------------------------------------------------------------------------------------------------------------
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [
    -- <Mod> + <MouseButton1>: enable floating mode and drag the window
      ((modMask, button1), (\w -> focus w >> mouseMoveWindow w
                                          >> windows W.shiftMaster  ))

    -- <Mod> + <MouseButton2>: raise the window to the top of the stack
    , ((modMask, button2), windows . (W.swapMaster .) . W.focusWindow)

    -- <Mod> + <MouseButton3>: enable floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w
                                          >> windows W.shiftMaster  ))
    ]


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: Grid
------------------------------------------------------------------------------------------------------------------------
-- Configuration
myGridConfig = colorRangeFromClassName
    (0x15,0x15,0x15)                       -- Lowest inactive background
    (0x15,0x15,0x15)                       -- Highest inactive background
    (0xC3,0x14,0x3B)                       -- Active background
    (0x54,0x54,0x54)                       -- Inactive foreground
    (0xEB,0xEB,0xEB)                       -- Active foreground

-- Colorizer
myGSConfig colorizer = (buildDefaultGSConfig myGridConfig)
    { gs_cellheight  = 65                  -- Cell height 
    , gs_cellwidth   = 120                 -- Cell width
    , gs_cellpadding = 10                  -- Cell padding
    }


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: Terminal
------------------------------------------------------------------------------------------------------------------------
myTerminal = "urxvtcd"


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: Workspaces
------------------------------------------------------------------------------------------------------------------------
--myWorkspaces :: [String]
--myWorkspaces = map show [1 .. 9 :: Int]

myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1 .. 9]

------------------------------------------------------------------------------------------------------------------------
-- CONFIG: LayoutHook
------------------------------------------------------------------------------------------------------------------------
myLayoutHook = avoidStruts $ smartBorders (tiled ||| Mirror tiled ||| Full ||| simpleFloat ||| spiral (4 / 2))
    where
        tiled   = ResizableTall 1 (2/100) (1/2) []  -- Default tiling algorithm partitions the sreen into two panes
        nmaster = 1                                 -- Default number of windows in the master pane
        ratio   = 1/2                               -- Default proportion of screen occuped by master pane
        delta   = 3/100                             -- Percent of screen to increment by when resizing panes


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: LogHook
------------------------------------------------------------------------------------------------------------------------
myLogHook h = dynamicLogWithPP $ myDzenPP { ppOutput = hPutStrLn h }
 
-- Conky
myConkyConfig = "~/.conkyrc"                      -- Conky configuration file path

-- DzenBar Left
myDzenLAlign  = "l"                               -- Dzen Left: text align
myDzenLClrBg  = myBarBackground                   -- Dzen Left: background color
myDzenLClrFg  = myBarForeground                   -- Dzen Left: foreground color
myDzenLFont   = "Droid Sans Mono:size=8:Regular"  -- Dzen Left: font
myDzenLHeight = "16"                              -- Dzen Left: height
myDzenLWidth  = "600"                             -- Dzen Left: width
myDzenLXpos   = "0"                               -- Dzen Left: X position
myDzenLYpos   = "0"                               -- Dzen Left: Y position

-- DzenBar Right
myDzenRAlign  = "r"                               -- Dzen Right: text align
myDzenRClrBg  = myBarBackground                   -- Dzen Right: background color
myDzenRClrFg  = myBarForeground                   -- Dzen Right: foreground color
myDzenRFont   = myDzenLFont                       -- Dzen Right: font
myDzenRHeight = myDzenLHeight                     -- Dzen Right: height
myDzenRWidth  = "200"                             -- Dzen Right: width
myDzenRXpos   = myDzenLWidth                      -- Dzen Right: X position
myDzenRYpos   = myDzenLYpos                       -- Dzen Right: Y position

-- DzenBar Left
myXmonadBarL = "dzen2"  ++                             -- Dzen Left
               " -x '"  ++ myDzenLXpos   ++ "'" ++     -- Dzen Left: X position
               " -y '"  ++ myDzenLYpos   ++ "'" ++     -- Dzen Left: Y position
               " -h '"  ++ myDzenLHeight ++ "'" ++     -- Dzen Left: height
               " -w '"  ++ myDzenLWidth  ++ "'" ++     -- Dzen Left: width
               " -ta '" ++ myDzenLAlign  ++ "'" ++     -- Dzen Left: text align
               " -fn '" ++ myDzenLFont   ++ "'" ++     -- Dzen Left: font
               " -fg '" ++ myDzenLClrFg  ++ "'" ++     -- Dzen Left: foreground color
               " -bg '" ++ myDzenLClrBg  ++ "'"        -- Dzen Left: background color

-- DzenBar Right
myXmonadBarR = "conky -c " ++ myConkyConfig ++ "|" ++  -- Load Conky configuration
               "dzen2"     ++                          -- Dzen Right
               " -x '"     ++ myDzenRXpos   ++ "'" ++  -- Dzen Right: X position
               " -y '"     ++ myDzenRYpos   ++ "'" ++  -- Dzen Right: Y position
               " -h '"     ++ myDzenRHeight ++ "'" ++  -- Dzen Right: height
               " -w '"     ++ myDzenRWidth  ++ "'" ++  -- Dzen Right: width
               " -ta '"    ++ myDzenRAlign  ++ "'" ++  -- Dzen Right: text align
               " -fn '"    ++ myDzenRFont   ++ "'" ++  -- Dzen Right: font
               " -fg '"    ++ myDzenRClrFg  ++ "'" ++  -- Dzen Right: foreground color
               " -bg '"    ++ myDzenRClrBg  ++ "'"     -- Dzen Right: background color
              

-- Dzen Pretty Printing 
myDzenPP  = dzenPP
    { ppCurrent         = dzenColor "#3399ff" "" . wrap " " " "  -- Current workspace
    , ppHidden          = dzenColor "#dddddd" "" . wrap " " " "  -- Other workspaces with windows
    , ppHiddenNoWindows = dzenColor "#777777" "" . wrap " " " "  -- Other workspaces with no windows
    , ppLayout          = dzenColor "#aaaaaa" "" . wrap " " " " -- Layout info
    , ppOrder           = \(ws:_:t:_) -> [ws,t]
    , ppSep             = " "  -- Spaces between objects
    , ppTitle           = dzenColor "#ffffff" "" . shorten 20 . dzenEscape -- Title
    , ppUrgent          = dzenColor "#ff0000" "" . wrap " " " "  -- Colors for notifications
    , ppWsSep           = "" -- Separator between workspaces
    }


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: ManageHook
------------------------------------------------------------------------------------------------------------------------
myManageHook = composeAll
    [
      className =? "Gimp" --> doFloat
    ]


------------------------------------------------------------------------------------------------------------------------
-- CONFIG: StartupHook
------------------------------------------------------------------------------------------------------------------------
myStartupHook = do
    spawnOnce "xsetroot -cursor_name left_ptr &" -- Cursor
    spawnOnce "xrandr -s 1680x1050 &"            -- Screen resolution


------------------------------------------------------------------------------------------------------------------------
-- MAIN
------------------------------------------------------------------------------------------------------------------------
main :: IO ()
main = do
    status <- spawnPipe myXmonadBarL    -- xmonad status on the left
    conky  <- spawnPipe myXmonadBarR     -- conky stats on the right
    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig 
        { -- General
          terminal           = myTerminal
        , workspaces         = myWorkspaces
          -- Appearance
        , borderWidth        = myBorderWidth
        , focusedBorderColor = myFocusedBorderColor
        , normalBorderColor  = myNormalBorderColor
          -- Bindings
        , modMask            = myModMask
        , mouseBindings      = myMouseBindings
          -- Hooks
        , layoutHook         = myLayoutHook
        , logHook            = myLogHook status
        , manageHook         = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , startupHook        = myStartupHook
        }
        `additionalKeysP`      myKeys 
