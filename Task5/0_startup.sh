kubectl create namespace network-policy-demo

kubectl run front-end-app --image=nginx --labels role=front-end --expose --port 80 -n network-policy-demo
kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port 80 -n network-policy-demo
kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port 80 -n network-policy-demo
kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port 80 -n network-policy-demo

kubectl apply -f non-admin-api-allow.yaml -n network-policy-demo