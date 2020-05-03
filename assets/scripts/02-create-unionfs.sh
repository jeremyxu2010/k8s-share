#!/bin/bash

# include demo-magic
. ../tools/demo-magic.sh -n

# hide the evidence
clear

p '# Create dirs'
pe 'mkdir -p ./tmp/lower1 && mkdir -p ./tmp/lower2 && mkdir -p ./tmp/upper && mkdir -p ./tmp/work && mkdir -p ./tmp/merged'
wait

p '# Create new file in dirs'
pe 'echo "abc" > ./tmp/lower1/abc.txt'
pe 'cat ./tmp/lower1/abc.txt'
wait
pe 'echo "def" > ./tmp/lower2/def.txt'
pe 'cat ./tmp/lower2/def.txt'
wait

p '# Create unionfs mount'
pe 'mount -t overlay overlay -olowerdir=./tmp/lower1:./tmp/lower2,upperdir=./tmp/upper,workdir=./tmp/work ./tmp/merged'
wait

p '# Check contents in merged dir'
pe 'ls ./tmp/merged/'
wait

p '# Create new file to merged dir'
pe 'echo "xyz" > ./tmp/merged/xyz.txt'
wait

p '# Check contents in upper dir'
pe 'ls ./tmp/upper/'
wait

p '# Umount merged dir'
pe 'umount ./tmp/merged/'
wait

