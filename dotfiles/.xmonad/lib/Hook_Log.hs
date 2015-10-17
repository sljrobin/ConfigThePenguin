module Hook_Log where

-- System
import System.IO                        -- Standard IO library
-- Hooks
import XMonad.Hooks.DynamicLog          -- Statusbar
-- Personal Modules
import Appearance                       -- Load colors, dimensions, and fonts

----------------------------------------------------------------------------
-- Variables
----------------------------------------------------------------------------
-- Conky
myDzenPathConky  = "~/.xmonad/data/conky/"
myDzenTopRConky  = myDzenPathConky ++ "conky_DzenTopR"  -- Dzen Top Right: Conky configuration file path
myDzenBotLConky  = myDzenPathConky ++ "conky_DzenBotL"  -- Dzen Bottom Left: Conky configuration file path
myDzenBotRConky  = myDzenPathConky ++ "conky_DzenBotR"  -- Dzen Bottom Right: Conky configuration file path

-- Text align
myDzenTopLAlign  = "l"                                  -- Dzen Top Left: text align
myDzenTopRAlign  = "r"                                  -- Dzen Top Right: text align
myDzenBotLAlign  = myDzenTopLAlign                      -- Dzen Bottom Left: text align
myDzenBotRAlign  = myDzenTopRAlign                      -- Dzen Bottom Right: text align

-- Colors (Background/Foreground)
myDzenTopRClrBg  = myClrBarBg                           -- Dzen Top Right: background color
myDzenTopLClrBg  = myClrBarBg                           -- Dzen Top Left: background color
myDzenBotLClrBg  = myClrBarBg                           -- Dzen Bottom Left: background color
myDzenBotRClrBg  = myClrBarBg                           -- Dzen Bottom Right: background color
myDzenTopLClrFg  = myClrBarFg                           -- Dzen Top Left: foreground color
myDzenTopRClrFg  = myClrBarFg                           -- Dzen Top Right: foreground color
myDzenBotLClrFg  = myClrBarFg                           -- Dzen Bottom Left: foreground color
myDzenBotRClrFg  = myClrBarFg                           -- Dzen Bottom Right: foreground color

-- Dimensions (Height/Width)
myDzenTopLDimHgt = myDimBarHgt                          -- Dzen Top Left: height
myDzenTopRDimHgt = myDimBarHgt                          -- Dzen Top Right: height
myDzenBotLDimHgt = myDimBarHgt                          -- Dzen Bottom Left: height
myDzenBotRDimHgt = myDimBarHgt                          -- Dzen Bottom Right: height
myDzenTopLDimWdh = myLenovoX250DzenTopLDimWdh           -- Dzen Top Left: width
myDzenTopRDimWdh = myLenovoX250DzenTopRDimWdh           -- Dzen Top Right: width
myDzenBotLDimWdh = myLenovoX250DzenBotLDimWdh           -- Dzen Bottom Left: width
myDzenBotRDimWdh = myLenovoX250DzenBotRDimWdh           -- Dzen Bottom Right: width

-- Fonts
myDzenTopLFnt    = myFntDzen                            -- Dzen Top Left: font
myDzenTopRFnt    = myFntDzen                            -- Dzen Top Right: font
myDzenBotLFnt    = myFntDzen                            -- Dzen Bottom Left: font
myDzenBotRFnt    = myFntDzen                            -- Dzen Bottom Right: font

-- Positions
myDzenTopLPosX   = "0"                                  -- Dzen Top Left: X position
myDzenTopLPosY   = "0"                                  -- Dzen Top Left: Y position
myDzenTopRPosX   = myDzenTopLDimWdh                     -- Dzen Top Right: X position
myDzenTopRPosY   = myDzenTopLPosY                       -- Dzen Top Right: Y position
myDzenBotLPosX   = myDzenTopLPosX                       -- Dzen Bottom Left: X position
myDzenBotLPosY   = myLenovoX250DzenBotLPosY             -- Dzen Bottom Left: X position
myDzenBotRPosX   = myDzenBotLDimWdh                     -- Dzen Bottom Right: X position
myDzenBotRPosY   = myDzenBotLPosY                       -- Dzen Bottom Right: Y position

----------------------------------------------------------------------------
-- Bars
----------------------------------------------------------------------------
-- Status Bar Top Left
myXmonadBarTopL = "dzen2"     ++                             -- Dzen Top Left
                  " -x '"     ++ myDzenTopLPosX   ++ "'" ++  -- Dzen Top Left: X position
                  " -y '"     ++ myDzenTopLPosY   ++ "'" ++  -- Dzen Top Left: Y position
                  " -h '"     ++ myDzenTopLDimHgt ++ "'" ++  -- Dzen Top Left: height
                  " -w '"     ++ myDzenTopLDimWdh ++ "'" ++  -- Dzen Top Left: width
                  " -ta '"    ++ myDzenTopLAlign  ++ "'" ++  -- Dzen Top Left: text align
                  " -fn '"    ++ myDzenTopLFnt    ++ "'" ++  -- Dzen Top Left: font
                  " -fg '"    ++ myDzenTopLClrFg  ++ "'" ++  -- Dzen Top Left: foreground color
                  " -bg '"    ++ myDzenTopLClrBg  ++ "'"     -- Dzen Top Left: background color

-- Status Bar Top Right
myXmonadBarTopR = "conky -c " ++ myDzenTopRConky  ++ "|" ++  -- Load Conky configuration
                  "dzen2"     ++                             -- Dzen Top Right
                  " -x '"     ++ myDzenTopRPosX   ++ "'" ++  -- Dzen Top Right: X position
                  " -y '"     ++ myDzenTopRPosY   ++ "'" ++  -- Dzen Top Right: Y position
                  " -h '"     ++ myDzenTopRDimHgt ++ "'" ++  -- Dzen Top Right: height
                  " -w '"     ++ myDzenTopRDimWdh ++ "'" ++  -- Dzen Top Right: width
                  " -ta '"    ++ myDzenTopRAlign  ++ "'" ++  -- Dzen Top Right: text align
                  " -fn '"    ++ myDzenTopRFnt    ++ "'" ++  -- Dzen Top Right: font
                  " -fg '"    ++ myDzenTopRClrFg  ++ "'" ++  -- Dzen Top Right: foreground color
                  " -bg '"    ++ myDzenTopRClrBg  ++ "'"     -- Dzen Top Right: background color

-- Status Bar Bottom Left
myXmonadBarBotL = "conky -c " ++ myDzenBotLConky  ++ "|" ++  -- Load Conky configuration
                  "dzen2"     ++                             -- Dzen Bottom Left
                  " -x '"     ++ myDzenBotLPosX   ++ "'" ++  -- Dzen Bottom Left: X position
                  " -y '"     ++ myDzenBotLPosY   ++ "'" ++  -- Dzen Bottom Left: Y position
                  " -h '"     ++ myDzenBotLDimHgt ++ "'" ++  -- Dzen Bottom Left: height
                  " -w '"     ++ myDzenBotLDimWdh ++ "'" ++  -- Dzen Bottom Left: width
                  " -ta '"    ++ myDzenBotLAlign  ++ "'" ++  -- Dzen Bottom Left: text align
                  " -fn '"    ++ myDzenBotLFnt    ++ "'" ++  -- Dzen Bottom Left: font
                  " -fg '"    ++ myDzenBotLClrFg  ++ "'" ++  -- Dzen Bottom Left: foreground color
                  " -bg '"    ++ myDzenBotLClrBg  ++ "'"     -- Dzen Bottom Left: background color

-- Status Bar Bottom Right
myXmonadBarBotR = "conky -c " ++ myDzenBotRConky  ++ "|" ++  -- Load Conky configuration
                  "dzen2"     ++                             -- Dzen Bottom Right
                  " -x '"     ++ myDzenBotRPosX   ++ "'" ++  -- Dzen Bottom Right: X position
                  " -y '"     ++ myDzenBotRPosY   ++ "'" ++  -- Dzen Bottom Right: Y position
                  " -h '"     ++ myDzenBotRDimHgt ++ "'" ++  -- Dzen Bottom Right: height
                  " -w '"     ++ myDzenBotRDimWdh ++ "'" ++  -- Dzen Bottom Right: width
                  " -ta '"    ++ myDzenBotRAlign  ++ "'" ++  -- Dzen Bottom Right: text align
                  " -fn '"    ++ myDzenBotRFnt    ++ "'" ++  -- Dzen Bottom Right: font
                  " -fg '"    ++ myDzenBotRClrFg  ++ "'" ++  -- Dzen Bottom Right: foreground color
                  " -bg '"    ++ myDzenBotRClrBg  ++ "'"     -- Dzen Bottom Right: background color

----------------------------------------------------------------------------
-- Dzen Pretty Printing (only for 'myDzenTopL')
----------------------------------------------------------------------------
myDzenPP h = defaultPP --dzenPP
    { ppCurrent = dzenColor ("" ++ myClrBarPPCurrentFg ++ "") ("" ++ myClrBarPPCurrentBg ++ "") . pad                       -- Current workspace
    , ppHidden  = dzenColor ("" ++ myClrBarPPHiddenFg  ++ "") ("" ++ myClrBarPPHiddenBg  ++ "") . wrap " " " "              -- Other workspaces with windows
--    , ppLayout  = dzenColor ("" ++ myClrBarPPLayoutFg  ++ "") ("" ++ myClrBarPPLayoutBg  ++ "") . wrap " " " "              -- Layout info
    , ppLayout  =  dzenColor ("" ++ myClrBarPPLayoutFg  ++ "") ("" ++ myClrBarPPLayoutBg  ++ "") . pad
    , ppOrder   = \(ws:_:t:_) -> [ws,t]                                                                                     -- Workspaces order
    , ppOutput  = hPutStrLn h                                                                                               -- Output
    , ppSep     = ""                                                                                                        -- Spaces between objects
    , ppTitle   = dzenColor ("" ++ myClrBarPPTitleFg   ++ "") ("" ++ myClrBarPPTitleBg   ++ "") . shorten 120 . dzenEscape  -- Title
    , ppUrgent  = dzenColor ("" ++ myClrBarPPUrgentFg  ++ "") ("" ++ myClrBarPPUrgentBg  ++ "") . wrap " " " "              -- Colors for notifications
    , ppWsSep   = ""                                                                                                        -- Separator between workspaces
    }

----------------------------------------------------------------------------
-- dmenu
----------------------------------------------------------------------------
myDmenu="dmenu_run" ++
        " -nb '"    ++ myClrDmenuNBg ++ "'" ++  -- dmenu: normal background
        " -nf '"    ++ myClrDmenuNFg ++ "'" ++  -- dmenu: normal foreground
        " -sb '"    ++ myClrDmenuSBg ++ "'" ++  -- dmenu: selected background
        " -sf '"    ++ myClrDmenuSFg ++ "'" ++  -- dmenu: selected foreground
        " -fn '"    ++ myFntDmenu    ++ "'" ++  -- dmenu: font
        " -p  '>'"  ++                          -- dmenu: prompt
        " -i "                                  -- dmenu: no case sensitive

