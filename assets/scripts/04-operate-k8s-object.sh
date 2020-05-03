#!/bin/bash

# include demo-magic
. ../tools/demo-magic.sh -n

# hide the evidence
clear

p 'View yaml file'
pe 'cat ../manifests/nginx-dpl.yaml'
wait

p 'Create k8s deployment object'
pe 'kubectl create -f ../manifests/nginx-dpl.yaml'
wait

p 'View all k8s deployment object created'
pe 'kubectl get deployments'
wait

p 'View k8s deployment object created'
pe 'kubectl get deployments nginx-dpl -o wide'
wait

p 'View k8s deployment object detail'
pe 'kubectl describe deployments nginx-dpl'
wait

p 'View k8s deployment object detail'
pe 'kubectl get deployments nginx-dpl -o yaml'
wait

p 'View pods created by the deployment'
pe 'watch kubectl get pods'
wait

p 'Modify deployment k8s object'
pe 'kubectl edit deployments nginx-dpl'
wait

p 'View pods created by deployment again'
pe 'watch kubectl get pods'
wait

p 'Delete deployment k8s object'
pe 'kubectl delete deployments nginx-dpl'
wait

p 'View pods created by deployment again'
pe 'watch kubectl get pods'
wait
