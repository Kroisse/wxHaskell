{--------------------------------------------------------------------------------
  The 'hello world' demo from the wxWindows site.
--------------------------------------------------------------------------------}
module Main where

import Graphics.UI.WXH

main
  = run helloWorld

helloWorld
  = do -- create file menu: we use standard Id's but could also use any other identifier, like 1 or 27.
       fm <- menuCreate "" 0
       menuAppend fm wxID_ABOUT "&About.." "About wxHaskell" False {- not checkable -}
       menuAppendSeparator fm
       menuAppend fm wxID_EXIT "&Quit\tCtrl-Q"    "Quit the demo"  False

       -- create menu bar
       m  <- menuBarCreate 0
       menuBarAppend m fm "&File"

       -- create top frame
       f  <- frameCreateTopFrame "Hello world"
       windowSetBackgroundColour f white
       windowSetClientSize f (sz 300 250)

       -- set status bar with 1 field
       frameCreateStatusBar f 1 0
       frameSetStatusText f "Welcome to wxHaskell" 0

       -- connect menu
       frameSetMenuBar f m
       windowOnMenuCommand f wxID_ABOUT (onAbout f)
       windowOnMenuCommand f wxID_EXIT  (onQuit f)

       -- show it
       windowShow f
       windowRaise f
       return ()
  where
    onAbout f
      = do messageDialog f "About 'Hello World'" "This is a wxHaskell sample" (wxOK + wxICON_INFORMATION)
           return ()

    onQuit f
      = do windowClose f True {- force close -}
           return ()