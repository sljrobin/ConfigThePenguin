import System.IO
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

------------------------------------------------------------------------------------------------------------------------
-- Terminal
------------------------------------------------------------------------------------------------------------------------
myTerminal = "urxvt"                       -- rxvt-unicode as terminal emulator


------------------------------------------------------------------------------------------------------------------------
-- Workspaces
------------------------------------------------------------------------------------------------------------------------
myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1 .. 9 :: Int]


------------------------------------------------------------------------------------------------------------------------
-- ManageHook
------------------------------------------------------------------------------------------------------------------------
myManageHook = composeAll
    [
      className =? "Gimp" --> doFloat
    ]


------------------------------------------------------------------------------------------------------------------------
-- Layout
------------------------------------------------------------------------------------------------------------------------
myLayout = avoidStruts $ smartBorders (tiled ||| Mirror tiled ||| Full ||| spiral (4 / 2))
    where
        tiled   = Tall nmaster delta ratio -- default tiling algorithm partitions the screen into two panes
        nmaster = 1                        -- default number of windows in the master pane
        ratio   = 1/2                      -- default proportion of screen occuped by master pane
        delta   = 3/100                    -- percent of screen to increment by when resizing panes


------------------------------------------------------------------------------------------------------------------------
-- Appearance
------------------------------------------------------------------------------------------------------------------------
-- xmobar
xmobarTitleColor            = "#FFB6B0"    -- color; xmobar title
xmobarCurrentWorkspaceColor = "#CEFFAC"    -- color, xmobar current workspace

-- Borders
myBorderWidth               = 1            -- border width
myNormalBorderColor         = "#CCCCCC"    -- color; normal border
myFocusedBorderColor        = "#8AB5E4"    -- color; focused border


------------------------------------------------------------------------------------------------------------------------
-- Key Bindings
------------------------------------------------------------------------------------------------------------------------
myModMask = mod4Mask -- Use <Windows> key instead of <Alt> key for <Mod>
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    ----------------------------------------------------------------------------
    -- Programs; launching
    ----------------------------------------------------------------------------
    [
    -- <Mod> + <Shift> + <Return>: launch a terminal
      ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf      )

    -- <Mod> + <p>: launch dmenu
    , ((modMask              , xK_p     ), spawn "dmenu"                     )

    -- <Mod> + <Shift> + <p>: launch gmrun
    , ((modMask .|. shiftMask, xK_p     ), spawn "gmrun"                     )

    -- <Mod> + <Shift> + <z>: lock screen
    , ((modMask .|. shiftMask, xK_z     ), spawn "xscreensaver-command -lock")
    ]
    ++

    ----------------------------------------------------------------------------
    -- Programs; killing
    ----------------------------------------------------------------------------
    [
    -- <Mod> + <Shift> + <c>: close the focused window
      ((modMask .|. shiftMask, xK_c     ), kill                              )
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; focus
    ----------------------------------------------------------------------------
    [
    -- <Mod> + <Tab>: move focus to the next window
      ((modMask,               xK_Tab   ), windows W.focusDown               )

    -- <Mod> + <j>: move focus to the next window
    , ((modMask,               xK_j     ), windows W.focusDown               )

    -- <Mod> + <Shift> + <Tab>: move focus to the previous window
    , ((modMask .|. shiftMask, xK_Tab   ), windows W.focusUp                 )

    -- <Mod> + <k>: move focus to the previous window
    , ((modMask,               xK_k     ), windows W.focusUp                 )

    -- <Mod> + <m>: move focus to the master window
    , ((modMask,               xK_m     ), windows W.focusMaster             )

    -- <Mod> + <t>: push window back into tiling
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink    )
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; layouts
    ----------------------------------------------------------------------------
    [
    -- <Mod> + <Space>: rotate through the available layout algorithms
      ((modMask,               xK_space ), sendMessage NextLayout            )

    -- <Mod> + <Shift> + <Space>: reset the layouts on the current workspace
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    ]
    ++

    ----------------------------------------------------------------------------
    -- GUI; workspaces
    ----------------------------------------------------------------------------
    [
--      ((m .|. modMask,         k        ), windows $ f i)
    -- <Mod> + <1..9>: switch to workspace <N>
--    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]

    -- <Mod> + <Shift> + <1..9>: move client to workspace <N>
--    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
      ((modMask, xK_Left), prevWS)
    , ((modMask, xK_Right), nextWS)
    ]


------------------------------------------------------------------------------------------------------------------------
-- Mouse Bindings
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
-- Main
------------------------------------------------------------------------------------------------------------------------
main = do
    -- xmobar
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"                  -- load xmobar configuration

    -- xmonad
    xmonad $ defaults {
        logHook = dynamicLogWithPP xmobarPP {
              ppOutput  = hPutStrLn xmproc                             -- transmit data via a pipe to xmobar
            , ppTitle   = xmobarColor xmobarTitleColor "" . shorten 50 -- set the width of the title area at 50 chars
            , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""   -- enable color for the current workspace
            , ppLayout  = const ""                                     -- disable the layout info on the status bar
        }
        , manageHook = manageDocks <+> myManageHook
    }


------------------------------------------------------------------------------------------------------------------------
-- Configuration
------------------------------------------------------------------------------------------------------------------------
defaults = defaultConfig {
    -- General
    terminal           = myTerminal,
    workspaces         = myWorkspaces,

    -- Appearance
    borderWidth        = myBorderWidth,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- Key Bindings
    modMask            = myModMask,
    keys               = myKeys,

    -- Mouse Bindings
    mouseBindings      = myMouseBindings,

    -- Hooks / Layouts
    layoutHook         = myLayout,
    manageHook         = myManageHook
}









