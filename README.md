# kong-tiktok-hmac

## This repo is used for developing a tiktok hmac signature validation plugin for Kong.

## Requirements:
1. Minikube needs to be installed [instructions](https://minikube.sigs.k8s.io/docs/start/)
2. Helm 3<= needs to be installed for minikube [instructions](https://helm.sh/docs/intro/install/)
3. Kong Helm repo added to helm [instructions](https://github.com/Kong/charts)

## Setup:
#### Once Minikube, Helm, and the Kong helm repo are installed you can deploy the chart:
```
kubectl create -f kong-config.yaml && helm install kong-local -f kong-values.yaml kong/kong
```
##### To create the kong-config configmap and install the helm chart the hmac plugin enabled.

##### The `hmac-auth-tiktok.yaml` file contains the actual plugin to be loaded as a config map.
##### The `update.sh` script can be used to update the configmap and restart kong.
