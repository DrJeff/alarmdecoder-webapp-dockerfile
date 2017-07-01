#!/bin/bash
set -e

# Make sure the alarmdecoder user has access to the USB device. I've confirmed
# this does not change the permission bits outside of the docker container.
#remove the next line to use app without USB
#chmod o+rw /dev/ttyUSB*

# Run the app. See the note in the Dockerfile about the port 8000/5000 weirdness.
exec gunicorn -u alarmdecoder -g alarmdecoder -b 0.0.0.0:8000 wsgi:application
