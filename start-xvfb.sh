#!/bin/bash

/sbin/start-stop-daemon --start --quiet --pidfile /tmp/xvfb_1.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :1 -ac -screen 0 1280x1024x16

exit 0
