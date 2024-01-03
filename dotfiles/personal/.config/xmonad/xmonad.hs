import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ myConfig

myConfig = def
    { terminal    = "alacritty"
    , modMask     = mod1Mask
    , borderWidth = 2
    , normalBorderColor = "#222222"
    , focusedBorderColor = "#ff0000"
    , layoutHook  = myLayout
    }

myLayout = Tall 1 (3/100) (1/2)
