#!/usr/bin/env bash
# Smart pane navigation for herdr, mirroring vim-tmux-navigator's behavior:
# if the focused pane's foreground process is (n)vim, forward the keystroke
# into it so its own mapping can decide whether to move within vim or hand
# off back to herdr at a layout edge; otherwise, move herdr's pane focus
# directly.
#
# `herdr pane process-info` returns JSON shaped like:
#   {"result":{"process_info":{"foreground_processes":[{"name":"nvim",...}]}}}
set -euo pipefail

direction="$1"
pane="$HERDR_ACTIVE_PANE_ID"

key_for() {
  case "$1" in
    left) echo "ctrl+h" ;;
    down) echo "ctrl+j" ;;
    up) echo "ctrl+k" ;;
    right) echo "ctrl+l" ;;
  esac
}

info="$("$HERDR_BIN_PATH" pane process-info --pane "$pane" 2>/dev/null || true)"

is_vim=0
if command -v jq >/dev/null 2>&1; then
  name="$(printf '%s' "$info" | jq -r '.result.process_info.foreground_processes[0].name // empty' 2>/dev/null)"
  [[ "$name" =~ ^g?(view|l?n?vim?x?)(diff)?$ ]] && is_vim=1
else
  printf '%s' "$info" | grep -qiE '"name":"g?(view|l?n?vim?x?)(diff)?"' && is_vim=1
fi

if [[ "$is_vim" == 1 ]]; then
  "$HERDR_BIN_PATH" pane send-keys "$pane" "$(key_for "$direction")"
else
  "$HERDR_BIN_PATH" pane focus --direction "$direction" --pane "$pane"
fi
