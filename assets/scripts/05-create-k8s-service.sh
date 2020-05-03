#!/bin/bash

# include demo-magic
. ../tools/demo-magic.sh -n

# hide the evidence
clear

p 'View yaml file'
pe 'cat ../manifests/nginx-lb-dpl.yaml'
wait

p 'Create k8s deployment object'
pe 'kubectl create -f ../manifests/nginx-lb-dpl.yaml'
wait

p 'View yaml file'
pe 'cat ../manifests/nginx-lb-svc.yaml'
wait

p 'Create k8s service object'
pe 'kubectl create -f ../manifests/nginx-lb-svc.yaml'
wait

p 'View all k8s service object created'
pe 'kubectl get services nginx-lb-svc -o yaml'
wait

p 'View k8s service object detail'
pe 'kubectl describe services nginx-lb-svc'
wait

