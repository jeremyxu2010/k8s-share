#!/bin/bash

# include demo-magic
. ../tools/demo-magic.sh -n

# hide the evidence
clear

p '# Generate c_uid'
pe 'c_uid="ps_$(shuf -i 42002-42254 -n 1)"'
pe 'echo ${c_uid}'
wait

p '# Create cgroup'
pe 'cgcreate -g "memory:/${c_uid}"'
wait

p '# Set cgroup resource limit'
pe 'cgset -r memory.limit_in_bytes="512000000" "${c_uid}"'
wait

# CID=$(docker run -d python true)
# mkdir -p ../python-image-fs
# docker export $CID | tar -C ../python-image-fs -xf-
p '# Create container by cgroup'
pe 'cgexec -g "memory:${c_uid}" unshare --fork --mount --uts --ipc --pid --mount-proc chroot ../python-image-fs /bin/sh -c "/usr/bin/python3 -m http.server 8080"'
wait

# ps -ef|grep http.server
# nsenter -t ${pid} --mount --uts --ipc --pid -- /usr/bin/sh
