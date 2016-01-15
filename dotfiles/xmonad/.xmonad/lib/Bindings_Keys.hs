module Bindings_Keys where


-- System
import System.Exit (exitSuccess)        -- Exit the program
import System.IO                        -- Standard IO library
-- Core
import XMonad                           -- Main lib
import qualified Data.Map        as M   -- Mouse bindings
import qualified XMonad.StackSet as W   -- ManageHook rules
-- Actions
import XMonad.Actions.CycleWS           -- Cycle through the workspaces
import XMonad.Actions.GridSelect        -- Enable 2D grid
import XMonad.Actions.PhysicalScreens   -- Screens manipulation 
-- Data
import Data.Monoid                      -- Allow to create monoids
-- Hooks
import XMonad.Hooks.ManageHelpers       -- Enable FullFloat mode
import XMonad.Hooks.ManageDocks         -- Enable ToggleStruts

--import XMonad.Layout.MultiToggle
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ToggleHook
-- Personal Modules
import Appearance                       -- Load colors, dimensions, and fonts
import Elements                         -- Load miscellaneous elements as Grid, Workspaces, Terminal, etc.
import Hook_Log                         -- Load the LogHook


-- TODO Add ncmpcpp bindings
------------------------------------------------------------------------------------------------------------------------
-- Bindings: Keys
------------------------------------------------------------------------------------------------------------------------
myModMask = mod4Mask -- Use <Windows> key instead of <Alt> key for <Mod>

myKeys :: [(String, X())]
myKeys    =
    ----------------------------------------------------------------------------
    -- Programs; launching
    ----------------------------------------------------------------------------
    [ ("M-<Return>" , spawn myTerminal)                                 -- <Mod> + <Return>: launch a terminal
    , ("M-x"        , spawn myDmenu)                                    -- <Mod> + <x>: launch dmenu
    , ("M-S-x"      , spawn "gmrun")                                    -- <Mod> + <Shift> + <x>: launch gmrun
    ]
    ++

    ----------------------------------------------------------------------------
    -- Programs; using
    ----------------------------------------------------------------------------
    [ ("M-S-z"      , spawn "xscreensaver-command --lock")              -- <Mod> + <Shift> + <z>: lock screen
    , ("M-<F1>"     , spawn "amixer set Master toggle")                 -- <Mod> + <F1>; mute/unmute volume
    , ("M-S-<F1>"   , spawn "amixer set Master toggle")                 -- <Mod> + <Shift> + <F1>; mute/unmute volume
    , ("M-<F2>"     , spawn "amixer set Master 2-")                     -- <Mod> + <F2>: decrease volume
    , ("M-S-<F2>"   , spawn "amixer set Master 2+")                     -- <Mod> + <Shift> + <F2>: increase volume
    , ("M-b"        , spawn "xbacklight -dec 5")                        -- <Mod> + <b>: decrease to 5% from current value of brightness
    , ("M-S-b"      , spawn "xbacklight -inc 5")                        -- <Mod> + <Shift> + <b>: increase to 5% from current value of brightness
    , ("M-s"        , spawn "setxkbmap us")                             -- <Mod> + <s>: change the current keyboard layout to the US layout
    , ("M-S-s"      , spawn "setxkbmap fr")                             -- <Mod> + <Shift> + <s>: change the current keyboard layout to the FR layout
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
    --, ("M-<Backspace>"        , focusUrgent)                   -- TODO
    , ("M-S-m"      , windows W.swapMaster)                             -- <Mod> + <Shift> + <m>: swap the focused window and the master window
    , ("M-S-j"      , windows W.swapDown)                               -- <Mod> + <Shift> + <j>: swap the focused window with the next window
    , ("M-S-k"      , windows W.swapUp)                                 -- <Mod> + <Shift> + <k>: swap the focused window with the previous window
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; layouts
    ----------------------------------------------------------------------------
    [ ("M-<Space>"  , sendMessage NextLayout)                           -- <Mod> + <Space>: rotate through the available layout algorithms
    , ("M-S-<Space>", asks (XMonad.layoutHook . config) >>= setLayout)  -- <Mod> + <Shift> + <Space>: reset the layouts on the current workspace
    , ("M-h"        , sendMessage Shrink)                               -- <Mod> + <h>: shrink the master area
    , ("M-l"        , sendMessage Expand)                               -- <Mod> + <l>: expand the master area
--    , ("M-f"        , fullFloatFocused)                                 -- <Mod> + <f>: put the focused window in the FullFloatFocused mode
    , ("M-f", sendMessage (Toggle "Full"))
    , (("M-S-f"), do --
                    sendMessage (Toggle "Full")
                    sendMessage ToggleStruts)
   -- , ("M-S-m"      , sendMessage RestoreNextMinimizedWin)              -- <Mod> + <Shift> + <f>: restore the focused window in the current layout
--    , ("M-S-m"      , rectFloatFocused)              -- <Mod> + <Shift> + <f>: restore the focused window in the current layout
    , ("M-r"        , refresh)                                          -- <Mod> + <r>: resize viewed windows to the correct size
    , ("M->"        , sendMessage (IncMasterN 1))                       -- <Mod> + <>>: increment the number of windows in the master area
    , ("M-<"        , sendMessage (IncMasterN (-1)))                    -- <Mod> + <<>: decrement the number of windows in the master area
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; grid
    ----------------------------------------------------------------------------
    [ ("M-g"        , goToSelected $ myGridConfig myGridColorizer)      -- <Mod> + <g>: go to the selected application
    , ("M-S-g"      , bringSelected $ myGridConfig myGridColorizer)     -- <Mod> + <Shift> + <g>: bring the selected application
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; workspaces
    ----------------------------------------------------------------------------
    [ ("M-<Down>"   , toggleWS)                                         -- <Mod> + <Down>: toggle workspace
    , ("M-<Left>"   , moveTo Prev NonEmptyWS)                           -- <Mod> + <Left>: move to the previous non empty workspace
    , ("M-<Right>"  , moveTo Next NonEmptyWS)                           -- <Mod> + <Right>: move to the next non empty workspace
    , ("M-S-<Left>" , moveTo Prev EmptyWS)                              -- <Mod> + <Shift> + <Left>: move to the previous empty workspace
    , ("M-S-<Right>", moveTo Next EmptyWS)                              -- <Mod> + <Shift> + <Right>: move to the next empty workspace
    , ("M-1"        , windows $ W.greedyView "1")                       -- <Mod> + <1>: move to workspace 1
    , ("M-2"        , windows $ W.greedyView "2")                       -- <Mod> + <2>: move to workspace 2
    , ("M-3"        , windows $ W.greedyView "3")                       -- <Mod> + <3>: move to workspace 3
    , ("M-4>"       , windows $ W.greedyView "4")                       -- <Mod> + <4>: move to workspace 4
    , ("M-5>"       , windows $ W.greedyView "5")                       -- <Mod> + <5>: move to workspace 5
    , ("M-6>"       , windows $ W.greedyView "6")                       -- <Mod> + <6>: move to workspace 6
    , ("M-7>"       , windows $ W.greedyView "7")                       -- <Mod> + <7>: move to workspace 7
    , ("M-8>"       , windows $ W.greedyView "8")                       -- <Mod> + <8>: move to workspace 8
    , ("M-9>"       , windows $ W.greedyView "9")                       -- <Mod> + <9>: move to workspace 9
    , ("M-S-1"      , windows $ W.greedyView "1" . W.shift "1")         -- <Mod> + <Shift> + <1>: send current window to workspace 1 and move focus to sent window
    , ("M-S-2"      , windows $ W.greedyView "2" . W.shift "2")         -- <Mod> + <Shift> + <2>: send current window to workspace 2 and move focus to sent window
    , ("M-S-3"      , windows $ W.greedyView "3" . W.shift "3")         -- <Mod> + <Shift> + <3>: send current window to workspace 3 and move focus to sent window
    , ("M-S-4"      , windows $ W.greedyView "4" . W.shift "4")         -- <Mod> + <Shift> + <4>: send current window to workspace 4 and move focus to sent window
    , ("M-S-5"      , windows $ W.greedyView "5" . W.shift "5")         -- <Mod> + <Shift> + <5>: send current window to workspace 5 and move focus to sent window
    , ("M-S-6"      , windows $ W.greedyView "6" . W.shift "6")         -- <Mod> + <Shift> + <6>: send current window to workspace 6 and move focus to sent window
    , ("M-S-7"      , windows $ W.greedyView "7" . W.shift "7")         -- <Mod> + <Shift> + <7>: send current window to workspace 7 and move focus to sent window
    , ("M-S-8"      , windows $ W.greedyView "8" . W.shift "8")         -- <Mod> + <Shift> + <8>: send current window to workspace 8 and move focus to sent window
    , ("M-S-9"      , windows $ W.greedyView "9" . W.shift "9")         -- <Mod> + <Shift> + <9>: send current window to workspace 9 and move focus to sent window
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; screens
    ----------------------------------------------------------------------------
    [ ("M-C-<Left>" , prevScreen)                                       -- <Mod> + <Control> + <Left>: move to the previous screen
    , ("M-C-<Right>", nextScreen)                                       -- <Mod> + <Control> + <Right>: move to the next screen
    , ("C-1"        , viewScreen 0)                                     -- <Control> + <1>: move to physical screen 1
    , ("C-2"        , viewScreen 1)                                     -- <Control> + <2>: move to physical screen 2
    , ("C-3"        , viewScreen 2)                                     -- <Control> + <3>: move to physical screen 3
    , ("C-4"        , viewScreen 3)                                     -- <Control> + <4>: move to physical screen 4
    , ("C-5"        , viewScreen 4)                                     -- <Control> + <5>: move to physical screen 5
    , ("C-6"        , viewScreen 5)                                     -- <Control> + <6>: move to physical screen 6
    , ("C-7"        , viewScreen 6)                                     -- <Control> + <7>: move to physical screen 7
    , ("C-8"        , viewScreen 7)                                     -- <Control> + <8>: move to physical screen 8
    , ("C-9"        , viewScreen 8)                                     -- <Control> + <9>: move to physical screen 9
    , ("C-S-1"      , sendToScreen 0 >> viewScreen 0)                   -- <Control> + <Shift> + <1>: send current window to screen 1 and move focus to sent window
    , ("C-S-2"      , sendToScreen 1 >> viewScreen 1)                   -- <Control> + <Shift> + <2>: send current window to screen 2 and move focus to sent window
    , ("C-S-3"      , sendToScreen 2 >> viewScreen 2)                   -- <Control> + <Shift> + <3>: send current window to screen 3 and move focus to sent window
    , ("C-S-4"      , sendToScreen 3 >> viewScreen 3)                   -- <Control> + <Shift> + <4>: send current window to screen 4 and move focus to sent window
    , ("C-S-5"      , sendToScreen 4 >> viewScreen 4)                   -- <Control> + <Shift> + <5>: send current window to screen 5 and move focus to sent window
    , ("C-S-6"      , sendToScreen 5 >> viewScreen 5)                   -- <Control> + <Shift> + <6>: send current window to screen 6 and move focus to sent window
    , ("C-S-7"      , sendToScreen 6 >> viewScreen 6)                   -- <Control> + <Shift> + <7>: send current window to screen 7 and move focus to sent window
    , ("C-S-8"      , sendToScreen 7 >> viewScreen 7)                   -- <Control> + <Shift> + <8>: send current window to screen 8 and move focus to sent window
    , ("C-S-9"      , sendToScreen 8 >> viewScreen 8)                   -- <Control> + <Shift> + <9>: send current window to screen 9 and move focus to sent window
    ]
