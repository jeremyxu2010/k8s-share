#!/bin/bash

# include demo-magic
. ../tools/demo-magic.sh -n

# hide the evidence
clear

p '# Create a docker container'
pe 'docker run -d --name nginx-demo nginx:latest'
wait

p '# View docker container detail'
pe 'docker inspect nginx-demo'
wait

p '# Delete a docker container'
pe 'docker rm -f nginx-demo'
wait
