module Hook_Startup where

-- Util
import XMonad.Util.SpawnOnce            -- Add 'spawnOnce'

myStartupHook = do
    spawnOnce "xsetroot -cursor_name left_ptr &" -- Cursor
    spawnOnce "xrdb -merge ~/.Xresources &"      -- Merge xrdb
