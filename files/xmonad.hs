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
    --{ terminal = "st -f 'Iosevka-11'"
    { terminal = "urxvt -fn 'xft:Iosevka:size=11' -bg '#181E26' -fg '#98BE65'"
    , focusedBorderColor = "#00FF00"
    , modMask = mod4Mask        -- use windows key
    , layoutHook = desktopLayoutModifiers $
                   maximizeVertical
                   (ResizableTall 1 (1.5/100) (3/5) []) ||| (noBorders Full)
    , logHook = historyHook
    } `additionalKeysP` [ ("M-i", sendMessage Toggle)
                        , ("M-g", gotoMenu) -- open dmenu and goto selected window
                        , ("M-b", bringMenu) -- open dmenu and bring selected window into current workspace
                        , ("M-<Tab>", nextMatch History (return True)) -- open dmenu and bring selected window into current workspace
                        ]
