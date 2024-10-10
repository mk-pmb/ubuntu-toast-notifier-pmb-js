
<!--#echo json="package.json" key="name" underline="=" -->
ubuntu-toast-notifier-pmb
=========================
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
Desktop toast popups for Ubuntu, with fallback to xmessage.
<!--/#echo -->



API
---

This module exports one function:

### notify(opt)

If `opt` is a false-y, returns immediately.

If `opt` has no `msg` property, e.g. because it is a string,
wrap it in an object as its `msg` property.

If truthy, `opt` is expected to be an options object,
in which case it supports these optional keys:

* `msg`: The message you want to convey.
  If this is false-y, or after string conversion is empty, return immediately.
* `from`: A name or short description of the sender of the message.
  In a non-messaging context, this is usually the name of the application
  that wants to notify the desktop user about something.







Usage
-----

see [test/usage.mjs](test/usage.mjs).


<!--#toc stop="scan" -->



Known issues
------------

* Needs more/better tests and docs.




&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
ISC
<!--/#echo -->
