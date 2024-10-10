// -*- coding: utf-8, tab-width: 2 -*-
/* eslint-disable object-property-newline */

import notify from '../index.js';

notify();
notify(42);
notify('Hello World!');
notify({ from: 'World', msg: 'Nice to meet you.' });

console.info('+OK usage test passed.');
