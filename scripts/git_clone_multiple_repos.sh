#!/bin/bash

# Will clone all repos listed

# May have to add private ssh key to allow repos to be cloned without entering a password every time:

# ssh-agent bash
# ssh-add ~/.ssh/id_rsa

repos="
one
two
"

for repo in $repos; do
  git clone "ssh://git/$repo"
done
