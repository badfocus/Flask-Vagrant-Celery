#!/bin/bash

NAME="flask"                                  # Name of the application
FLASKDIR=/vagrant/                         # Django project directory
NUM_WORKERS=3                                     # how many worker processes should Gunicorn spawn

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $FLASKDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec /usr/local/bin/gunicorn wsgi:app --workers $NUM_WORKERS --bind 0.0.0.0:8000
