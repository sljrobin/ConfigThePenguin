module Hook_Manage where

-- Core
import XMonad                           -- Main lib
-- Hooks
import XMonad.Hooks.ManageHelpers       -- Enable FullFloat mode

myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "vlc"  --> doFullFloat
    ]
