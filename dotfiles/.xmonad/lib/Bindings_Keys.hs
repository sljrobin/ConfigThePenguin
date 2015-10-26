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
-- Data
import Data.Monoid                      -- Allow to create monoids
-- Hooks
import XMonad.Hooks.ManageHelpers       -- Enable FullFloat mode
-- Personal Modules
import Appearance                       -- Load colors, dimensions, and fonts
import Elements                         -- Load miscellaneous elements as Grid, Workspaces, Terminal, etc.
import Hook_Log                         -- Load the LogHook


-- Add ncmpcpp bindings
------------------------------------------------------------------------------------------------------------------------
-- Bindings: Keys
------------------------------------------------------------------------------------------------------------------------
myModMask = mod4Mask -- Use <Windows> key instead of <Alt> key for <Mod>

fullFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery doFullFloat f -- FullFloatFocused mode
--rectFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery (doRectFloat $ RationalRect 0.85 0.85 1 1) f
myKeys :: [(String, X())]
myKeys    =
    ----------------------------------------------------------------------------
    -- Programs; launching
    ----------------------------------------------------------------------------
    [ ("M-<Return>" , spawn "urxvt")                                    -- <Mod> + <Return>: launch a terminal
    , ("M-x"        , spawn myDmenu)                                    -- <Mod> + <x>: launch dmenu
    , ("M-S-x"      , spawn "gmrun")                                    -- <Mod> + <Shift> + <x>: launch gmrun
    ]
    ++

    ----------------------------------------------------------------------------
    -- Programs; using
    ----------------------------------------------------------------------------
    [ ("M-S-z"      , spawn "xscreensaver-command --lock")              -- <Mod> + <Shift> + <z>: lock screen
    , ("M-<F1>"     , spawn "amixer set Master toggle")                 -- <Mod> + <F1>; mute volume
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
--    , ("M-<Backspace>"        , focusUrgent)                   -- TODO
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; layouts
    ----------------------------------------------------------------------------
    [ ("M-<Space>"  , sendMessage NextLayout)                           -- <Mod> + <Space>: rotate through the available layout algorithms
    , ("M-S-<Space>", asks (XMonad.layoutHook . config) >>= setLayout)  -- <Mod> + <Shift> + <Space>: reset the layouts on the current workspace
    , ("M-h"        , sendMessage Shrink)                               -- <Mod> + <h>: shrink the master area
    , ("M-l"        , sendMessage Expand)                               -- <Mod> + <l>: expand the master area
    , ("M-f"        , fullFloatFocused)                                 -- <Mod> + <f>: put the focused window in the FullFloatFocused mode
--    , ("M-S-f", sendMessage (Toggle "Full"))
   -- , ("M-S-m"      , sendMessage RestoreNextMinimizedWin)              -- <Mod> + <Shift> + <f>: restore the focused window in the current layout
--    , ("M-S-m"      , rectFloatFocused)              -- <Mod> + <Shift> + <f>: restore the focused window in the current layout
    , ("M-n"        , refresh) 
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
    , ("M-<F1>"     , windows $ W.greedyView "1")                       -- <Mod> + <F1>: move to workspace 1
    , ("M-<F2>"     , windows $ W.greedyView "2")                       -- <Mod> + <F2>: move to workspace 2
    , ("M-<F3>"     , windows $ W.greedyView "3")                       -- <Mod> + <F3>: move to workspace 3
    , ("M-<F4>"     , windows $ W.greedyView "4")                       -- <Mod> + <F4>: move to workspace 4
    , ("M-<F5>"     , windows $ W.greedyView "5")                       -- <Mod> + <F5>: move to workspace 5
    , ("M-<F6>"     , windows $ W.greedyView "6")                       -- <Mod> + <F6>: move to workspace 6
    , ("M-<F7>"     , windows $ W.greedyView "7")                       -- <Mod> + <F7>: move to workspace 7
    , ("M-<F8>"     , windows $ W.greedyView "8")                       -- <Mod> + <F8>: move to workspace 8
    , ("M-<F9>"     , windows $ W.greedyView "9")                       -- <Mod> + <F9>: move to workspace 9
    , ("M-S-<F1>"   , windows $ W.shift "1")                            -- <Mod> + <Shift> + <F1>: send current window to workspace 1
    , ("M-S-<F2>"   , windows $ W.shift "2")                            -- <Mod> + <Shift> + <F2>: send current window to workspace 2
    , ("M-S-<F3>"   , windows $ W.shift "3")                            -- <Mod> + <Shift> + <F3>: send current window to workspace 3
    , ("M-S-<F4>"   , windows $ W.shift "4")                            -- <Mod> + <Shift> + <F4>: send current window to workspace 4
    , ("M-S-<F5>"   , windows $ W.shift "5")                            -- <Mod> + <Shift> + <F5>: send current window to workspace 5
    , ("M-S-<F6>"   , windows $ W.shift "6")                            -- <Mod> + <Shift> + <F6>: send current window to workspace 6
    , ("M-S-<F7>"   , windows $ W.shift "7")                            -- <Mod> + <Shift> + <F7>: send current window to workspace 7
    , ("M-S-<F8>"   , windows $ W.shift "8")                            -- <Mod> + <Shift> + <F8>: send current window to workspace 8
    , ("M-S-<F9>"   , windows $ W.shift "9")                            -- <Mod> + <Shift> + <F9>: send current window to workspace 9
    ]

