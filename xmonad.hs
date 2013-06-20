import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run (spawnPipe)
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig

myModMask = mod4Mask

main = do
    xmonad $ gnomeConfig {
        modMask = myModMask
      --fix chrome f11 fullscreen
      , handleEventHook = fullscreenEventHook
      , focusFollowsMouse = False
      , borderWidth = 1
      , normalBorderColor = "#444444"
      , focusedBorderColor = "#0033ff"
      --remove borders when there is only one window in the workspace
      , layoutHook = smartBorders (layoutHook gnomeConfig)
      , manageHook = myManageHook <+> manageHook gnomeConfig
    } `additionalKeys` myKeyBindings

myManageHook = composeAll
    [ isFullscreen --> doFullFloat
    , (className =? "Gnome-panel") --> doCenterFloat
    , (className =? "Gnome-power-statistics") --> doCenterFloat
    , (className =? "Gnome-contacts") --> doCenterFloat
    , (className =? "Empathy") --> doCenterFloat
    , (className =? "Xmessage") --> doCenterFloat
    , (className =? "Nm-connection-editor") --> doCenterFloat
    , (className =? "VirtualBox") --> doFloat
    , (className =? "Win.py") --> doFloat
    ]

myKeyBindings =
    [ ((myModMask, xK_c), kill)
    , ((myModMask, xK_p), spawn "synapse")
    , ((myModMask, xK_o), spawn "gnome-terminal")
    , ((myModMask, xK_i), spawn (chrome ++ myChromeProfile))
    , ((myModMask, xK_u), spawn (chrome ++ otherChromeProfile))
    , ((myModMask .|. shiftMask, xK_i), spawn gmail)
    ]

-- chrome multiple users and apps
myChromeProfile = " --profile-directory='Profile 1'"
otherChromeProfile = " --profile-directory='Default'"
chrome = "google-chrome"
gmail = chrome ++ " 'http://mail.google.com'" ++ myChromeProfile
{-gmail = chrome ++ " --app='http://mail.google.com'" ++ myChromeProfile-}

