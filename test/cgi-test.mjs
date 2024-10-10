// -*- coding: utf-8, tab-width: 2 -*-

import absDir from 'absdir';
import { execFile } from 'child_process';

import eq from 'equal-pmb';

const testDir = absDir(import.meta);

execFile(testDir + '/cgi-bin/querytoast.mjs', [], {
  cwd: '/',
  env: {
    ...process.env,
    REMOTE_ADDR: 'cool.unicode.test',
    QUERY_STRING: encodeURIComponent('❄❆☃❆❄'),
  },
}, function ended(err, stdout, stderr) {
  eq(stdout, 'Status: 204 No Content\r\n\r\n');
  eq(stderr, '');
  if (err) { throw err; }
});
