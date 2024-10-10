#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function cgi_test () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?
  [ "${PORT:-0}" -ge 1 ] || local PORT=8000
  python3 -m http.server --bind localhost --cgi "$PORT" &
  local SERVER_PID=$!
  sleep 0.5s
  local URL="http://localhost:$PORT/cgi-bin/querytoast.mjs?Hello%20CGI!"
  curl --silent -- "$URL"
  sleep 0.5s
  disown "$SERVER_PID"
  kill -HUP "$SERVER_PID"
  wait
}










[ "$1" == --lib ] && return 0; cgi_test "$@"; exit $?
