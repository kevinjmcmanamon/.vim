#!/bin/bash

repos="
one
two
"

for repo in $repos; do
  git clone "ssh://git/$repo"
done
