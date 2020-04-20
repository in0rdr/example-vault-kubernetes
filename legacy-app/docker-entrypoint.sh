#!/bin/bash

# this simulates the legacy app
# no changes required here, the app consume plain old Kubernetes secrets
# we assume the app checks for the existence of a default (or uses a default Kubernetes secret instead)
while true; do
echo "${key:-undefined}";
echo;
sleep 5;
done;