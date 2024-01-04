import XMonad

import XMonad.StackSet
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ myConfig

myConfig = def
    { terminal = "lxterminal"
    , modMask = mod1Mask
    , borderWidth = 2
    , normalBorderColor = "#222222"
    , focusedBorderColor = "#ff0000"
    , layoutHook = myLayout
    , manageHook = myManageHook
    }

myLayout = smartBorders $ Tall 1 (3/100) (1/2)

-- , title =?  "Application Finder" --> doCenterFloat
myManageHook = composeAll
    [ isDialog --> doCenterFloat
    , isFullscreen --> doFullFloat
    , title =?  "Application Finder" --> doRectFloat (RationalRect 0.2 0.2 0.6 0.6)
    ]
