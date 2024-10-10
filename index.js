/* -*- tab-width: 2 -*- */
'use strict';

const moduleDir = require('absdir')(module);
const { execFile } = require('child_process');

const optionalOptionNames = [
  'from',
];


const shellVarPrefix = 'TOAST_';


const EX = function toast(opt) {
  if (!opt) { return; }
  if (!opt.msg) { return EX({ msg: opt }); }
  const msg = String(opt.msg || '');
  if (!msg) { return; }
  const args = [shellVarPrefix + 'MSG=' + msg];
  optionalOptionNames.forEach(function checkOpt(k) {
    const v = String(opt[k] || '');
    if (!v) { return; }
    args.push(shellVarPrefix + k.toUpperCase() + '=' + v);
  });
  execFile(moduleDir + '/toast.sh', args, EX.spawnOpt);
};


EX.spawnOpt = {
  cwd: '/',
};


module.exports = EX;
