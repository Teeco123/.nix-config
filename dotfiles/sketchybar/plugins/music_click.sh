#!/usr/bin/env osascript

tell application "Music"
    if loved of current track is true then
        set loved of current track to false
        do shell script "sketchybar -m --set music icon="
      else
        set loved of current track to true
        do shell script "sketchybar -m --set music icon="
    end if
end tell

delay 1

do shell script "sh $PLUGIN_DIR/music.sh"
