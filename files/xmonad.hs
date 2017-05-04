import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.ResizableTile  -- ResizableTall
import XMonad.Actions.WindowBringer (gotoMenu, bringMenu)
import XMonad.Layout.Magnifier (maximizeVertical, MagnifyMsg(Toggle))
import XMonad.Actions.GroupNavigation -- historyHook, nextMatch


main :: IO ()
main = do
  xmonad $ desktopConfig
    { terminal = "st -f 'Iosevka-11'"
    , focusedBorderColor = "#00FF00"
    , modMask = mod4Mask        -- use windows key
    , layoutHook = desktopLayoutModifiers $
                   maximizeVertical
                   (ResizableTall 1 (1.5/100) (3/5) []) ||| (noBorders Full)
    , logHook = historyHook
    , focusFollowsMouse = False
    } `additionalKeysP` [ ("M-i", sendMessage Toggle)
                        , ("M-g", gotoMenu) -- open dmenu and goto selected window
                        , ("M-b", bringMenu) -- open dmenu and bring selected window into current workspace
                        , ("M1-<Tab>", nextMatch History (return True)) -- open dmenu and bring selected window into current workspace
                        ]
