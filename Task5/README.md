# Как проверить 

```bash
minikube start --network-plugin=cni --cni=calico

./0_startup.sh

kubectl run test-$RANDOM --rm -i -t --image=alpine --labels role=front-end -n network-policy-demo -- sh
/ # wget -qO- --timeout=2 http://back-end-api-app
/ # wget -qO- --timeout=2 http://admin-back-end-api-app

minikube stop
minikube delete
```