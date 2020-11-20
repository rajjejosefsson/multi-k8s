# Kubernetes Multi Containers

## Build

```sh
kubectl apply -f k8s
```

## Local Development

for minikube (cluster) ip

```sh
skaffold dev
```

for `localhost:3000` (server not working)

```sh
skaffold dev --port-forward
```

### Docker Push Manually

```sh
 docker build -t rajjejosefsson/multi-client
 docker push rajjejosefsson/multi-client
```
