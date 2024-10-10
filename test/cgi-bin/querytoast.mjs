#!/usr/bin/env -S nodemjs

import notify from '../../index.js';

(function cgiMain() {
  console.log('Status: 204 No Content\r\n\r');
  notify({
    from: process.env.REMOTE_ADDR,
    msg: decodeURIComponent(process.env.QUERY_STRING),
  });
}());
