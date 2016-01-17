-- TODO: Change
-- Gap
------------------------------------------------------------------------------------------------------------------------
-- IMPORTS
------------------------------------------------------------------------------------------------------------------------
-- Core
import XMonad                           -- Main lib
-- Hooks
import XMonad.Hooks.DynamicLog          -- Use 'dynamicLogWithPP'
import XMonad.Hooks.ManageDocks         -- Manage dzen
import XMonad.Hooks.UrgencyHook         -- Window alert bells 
-- Util
import XMonad.Util.EZConfig             -- Append key/mouse bindings
import XMonad.Util.Run(spawnPipe)       -- Add 'spawnPipe' and 'hPutStrLn'
import XMonad.Util.SpawnOnce            -- Add 'spawnOnce'
-- Personal Modules
import Appearance                       -- Load colors, dimensions, and fonts
import Bindings_Keys                    -- Load bindings for keyboard
import Bindings_Mouse                   -- Load bindings for mouse
import Elements                         -- Load miscellaneous elements as Grid, Workspaces, Terminal, etc.
import Hook_Layout                      -- Load the LayoutHook
import Hook_Log                         -- Load the LogHook
import Hook_Manage                      -- Load the ManageHook
import Hook_Startup                     -- Load the StartupHook


import XMonad.Layout.Fullscreen

import XMonad.Layout.IndependentScreens

------------------------------------------------------------------------------------------------------------------------
-- MAIN
------------------------------------------------------------------------------------------------------------------------
main :: IO ()
main = do
    nScreens <- countScreens
    d <- spawnPipe myXmonadBarTopR

    myStatusBarTopL <- spawnPipe myXmonadBarTopL  -- Top Left status bar
    myStatusBarTopR <- spawnPipe myXmonadBarTopR  -- Top Right status bar
    myStatusBarBotL <- spawnPipe myXmonadBarBotL  -- Bottom Left status bar
    myStatusBarBotR <- spawnPipe myXmonadBarBotR  -- Bottom Right status bar

    xmonad $ withUrgencyHook dzenUrgencyHook { args = ["-bg", "#FF0000"] } $ defaultConfig 
        { -- General
          terminal           = myTerminal
        , workspaces         = myWorkspaces
          -- Appearance
        , borderWidth        = myBorderWidth
        , focusedBorderColor = myClrFocusedBorder
        , normalBorderColor  = myClrNormalBorder
          -- Bindings
        , modMask            = myModMask
        , mouseBindings      = myMouseBindings
          -- Hooks
--        , handleEventHook    = fullscreenEventHook
        , layoutHook         = myLayoutHook
        , logHook            = (dynamicLogWithPP $ myDzenPP myStatusBarTopL) >> myPointerUpdated
        , manageHook         = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , startupHook        = myStartupHook
        }
        `additionalKeysP`      myKeys 
