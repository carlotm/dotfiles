import XMonad

import XMonad.StackSet
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Config.Xfce

main :: IO ()
main = xmonad xfceConfig
    { terminal = "xfce4-terminal"
    , modMask = mod1Mask
    , borderWidth = 2
    , normalBorderColor = "#222222"
    , focusedBorderColor = "#ff0000"
    , layoutHook = avoidStruts $ myLayout
    }

myLayout = smartBorders $ Tall 1 (3/100) (1/2)
