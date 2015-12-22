#!/bin/bash

/usr/local/bin/start-xvfb
export DISPLAY=:1.0
exec $*
