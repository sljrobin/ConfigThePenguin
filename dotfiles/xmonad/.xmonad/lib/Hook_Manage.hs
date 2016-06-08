-- xmonad: Personal module: Hook Manage
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Hook_Manage where

--------------------------------------------------------------------------------
-- * `XMonad.Hooks.ManageHelpers` -> Enables `FullFloat` mode
-- * `XMonad`                     -> Main library
--------------------------------------------------------------------------------
import XMonad
import XMonad.Hooks.ManageHelpers


--------------------------------------------------------------------------------
-- Hook Manage
--------------------------------------------------------------------------------
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "vlc"  --> doFullFloat
    ]
