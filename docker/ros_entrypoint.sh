#!/bin/bash
set -e  # This was causing Docker to exit when auto-filling or running into error

. "/opt/ros/iron/setup.bash"
. "/usr/share/gazebo/setup.sh"


exec "$@"
