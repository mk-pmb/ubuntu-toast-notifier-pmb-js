#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function toast () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  exec </dev/null
  local "$@"
  [ -n "$TOAST_FROM" ] || local TOAST_FROM='(unknown sender)'
  [ -n "$TOAST_MSG" ] || local TOAST_MSG='(no message)'
  [ -n "$TOAST_DURATION_SEC" ] || local TOAST_DURATION_SEC=10
  local BEST_PROG="$(which \
    notify-send \
    gxmessage \
    xmessage \
    |& grep -m 1 -Pe '^/')"
  local PROG_ARGS=()
  case "$BEST_PROG" in
    */gxmessage )
      PROG_ARGS+=(
        -buttons GTK_STOCK_CLOSE:0
        -default GTK_STOCK_CLOSE
        );;
    */notify-send )
      PROG_ARGS+=(
        --expire-time=$(( TOAST_DURATION_SEC * 1000 ))
        "$TOAST_FROM"
        --category=im.received
        "$TOAST_MSG"
        );;
  esac
  case "$BEST_PROG" in
    *xmessage )
      PROG_ARGS+=(
        -title "Notification from $TOAST_FROM"
        -center
        -timeout "$TOAST_DURATION_SEC"
        -file -
        )
      < <( # Using a subshell rather than <<<"…" to avoid traces in $TMPDIR.
        echo "From $TOAST_FROM:"
        echo "$TOAST_MSG"
        echo
        ) "$BEST_PROG" "${PROG_ARGS[@]}" >/dev/null &
      ;;
    * ) "$BEST_PROG" "${PROG_ARGS[@]}" >/dev/null & ;;
  esac
  disown $!
}










toast "$@"; exit $?
