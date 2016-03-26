module Hook_Startup where

-- Util
import XMonad.Hooks.SetWMName           -- Sets the WM name
import XMonad.Util.SpawnOnce            -- Add 'spawnOnce'

myStartupHook = do
    setWMName "LG3D"                             -- Detect `_NET_SUPPORTING_WM_CHECK` protocol
    spawnOnce "xsetroot -cursor_name left_ptr &" -- Cursor
    spawnOnce "xrdb -merge ~/.Xresources &"      -- Merge xrdb
