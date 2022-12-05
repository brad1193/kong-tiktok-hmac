#!/bin/bash

CONFIGMAP="hmac-auth-tiktok"

# Update configmap for plugin
if [ -z $(kubectl get configmap | grep ${CONFIGMAP} | awk '{ print $1 }') ]
then
  kubectl create -f  ./hmac-auth-tiktok.yaml
else 
  kubectl delete configmap ${CONFIGMAP}
  kubectl create -f ./hmac-auth-tiktok.yaml
fi

# Restart Kong pod
kubectl delete pod $(kubectl get pods --no-headers | awk '{ print $1 }')

#Restart port-forwarding
if [ -z $(ps -a | grep port-forward | grep -v grep) ]
then
  kubectl port-forward $(kubectl get pods --no-headers | awk '{ print $1 }') 8000:8000
else 
  kill $(ps -a | grep port-forward | grep -v grep | awk '{ print $1 }')
  kubectl port-forward $(kubectl get pods --no-headers | awk '{ print $1 }') 8000:8000
fi
