# Kubernetes Multi Containers

## Build

```sh
kubectl apply -f k8s
```

## Local Development

for `localhost:3000`

```sh
skaffold dev --port-forward
```

for minikube (cluster) ip

```sh
skaffold dev
```

### Docker Push Manually

```sh
 docker build -t rajjejosefsson/multi-client
 docker push rajjejosefsson/multi-client
```
