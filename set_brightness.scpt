tell application "System Preferences"
    reveal anchor "displaysDisplayTab" of pane "com.apple.preference.displays"
end tell

tell application "System Events" to tell process "System Preferences"
    set value of value indicator 1 of slider 1 of group 1 of tab group 1 of window 1 to <brightness_level>
end tell
