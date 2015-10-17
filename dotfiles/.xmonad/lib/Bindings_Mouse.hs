module Bindings_Mouse where

-- Core
import XMonad                           -- Main lib
import qualified Data.Map        as M   -- Mouse bindings
import qualified XMonad.StackSet as W   -- ManageHook rules


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
