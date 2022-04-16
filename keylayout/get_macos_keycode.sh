#!/usr/bin/env bash

export keycode_define='/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Headers/Events.h'

grep -o 'kVK_\w*\s*=\s*\w*' "$keycode_define" |
  # kVK_ANSI_A = 0x00
  tr -d '=' |
  # 0	0x00	kVK_ANSI_A
  awk '{printf "%d\t%s\t%s\n", $2, $2, $1}' |
  sort -n -o "$(dirname "$0")"/keycode.csv
