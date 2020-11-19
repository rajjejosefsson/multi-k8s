# using docker from travis, and we already logged into docker in .travis.yml

# Adding two tags

# latest - this to to have to care abouut SHA when we first clone the repo
# 1. -t docker_id/multi-client:latest

# 2. use COMMIT_SHA as version\
# -t docker_id/multi-client:$GIT_SHA

# we get SHA with env in travis.yml

docker build -t rajjejosefsson/multi-client:latest -t rajjejosefsson/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rajjejosefsson/multi-server:latest -t rajjejosefsson/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rajjejosefsson/multi-worker:latest -t rajjejosefsson/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push rajjejosefsson/multi-client:latest
docker push rajjejosefsson/multi-server:latest
docker push rajjejosefsson/multi-worker:latest

docker push rajjejosefsson/multi-client:$SHA
docker push rajjejosefsson/multi-server:$SHA
docker push rajjejosefsson/multi-worker:$SHA

# kubectl already hooked up in .travisyml
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rajjejosefsson/multi-server:$SHA
kubectl set image deployments/client-deployment client=rajjejosefsson/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=rajjejosefsson/multi-worker:$SHA

# DONT FORGET TO UPDATE SEECRET IN GOOGLE CLOUD FOR POSTGRES