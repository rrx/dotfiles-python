local hyper = require('hyper')
local am = require('app-management')
local wm = require('window-management')

-- more ideas here: https://github.com/jhkuperus/dotfiles

hs.application.enableSpotlightForNameSearches(true)
-- https://medium.com/macoclock/solve-shortcut-hell-in-macos-building-a-hyper-key-1cb8838bf521
hyper.install('F18')
hyper.bindKey('r', hs.reload)
hs.appfinder.appFromName("Alacritty")

---- Global Application Keyboard Shortcuts
hyper.bindKey('a', function()
    am.switchToAndFromApp("io.alacritty")
end)
hyper.bindKey('s', function()
    am.switchToAndFromApp("com.google.Chrome")
end)
hyper.bindKey('d', function()
    am.switchToAndFromApp("com.tinyspeck.slackmacgap")
end)
hyper.bindKey('f', function()
    am.switchToAndFromApp("org.keepassxc.keepassxc")
end)
hyper.bindKey('p', function()
    am.switchToAndFromApp("com.spotify.client")
end)

-- show the bundleid of the currently open window
hyper.bindKey('b', function()
    local bundleid = hs.window.focusedWindow():application():bundleID()
    hs.alert.show(bundleid)
    hs.pasteboard.setContents(bundleid)
end)

-- Window Management
hyper.bindKey("up", function() wm.windowMaximize(0) end)
hyper.bindKey("k", function() wm.windowMaximize(0) end)
hyper.bindKey("right", function() wm.moveWindowToPosition(wm.screenPositions.right) end)
hyper.bindKey("l", function() wm.moveWindowToPosition(wm.screenPositions.right) end)
hyper.bindKey("down", function() hs.window.focusedWindow():moveOneScreenEast() end)
hyper.bindShiftKey("down", function() hs.window.focusedWindow():moveOneScreenWest() end)
hyper.bindKey("left", function() wm.moveWindowToPosition(wm.screenPositions.left) end)
hyper.bindKey("h", function() wm.moveWindowToPosition(wm.screenPositions.left) end)
