-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

myStartupHook = do
    spawn "xscreensaver -no-splash"
    spawn "compton -b"
    spawn "feh --bg-fill ~/Pictures/wallpaper/Sky.jpg"

myTerminal = "urxvt"

main = do
     xmonad  $ defaultConfig {
         startupHook = myStartupHook,
         terminal = myTerminal
     }
