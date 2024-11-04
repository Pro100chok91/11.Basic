#!/bin/bash

 REPOSITORY=$REPOSITORY
 ACCESS_TOKEN=$ACCESS_TOKEN

 cd /home/runner/actions-runner

 ./config.sh --url https://github.com/${REPOSITORY} --token ${ACCESS_TOKEN}

 ./run.sh & wait $!
