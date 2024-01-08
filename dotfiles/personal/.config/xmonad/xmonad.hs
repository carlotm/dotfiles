import XMonad

import XMonad.StackSet
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks

main :: IO ()
main = xmonad xfceConfig
    { terminal = "xfce4-terminal"
    , modMask = mod1Mask
    , borderWidth = 2
    , normalBorderColor = "#222222"
    , focusedBorderColor = "#ff0000"
    , layoutHook = avoidStruts $ myLayout
    , manageHook = manageHook xfceConfig <+> myManageHook
    }

myLayout = smartBorders $ Tall 1 (3/100) (1/2)

myManageHook = composeAll
    [ className =? "Xfce4-notifyd" --> doIgnore
    , isDialog --> doCenterFloat
    , isFullscreen --> doFullFloat
    , title =?  "Application Finder" --> doRectFloat (RationalRect 0.2 0.2 0.6 0.6)
    , title =? "Xfce4-display-settings" --> doCenterFloat
    ]
