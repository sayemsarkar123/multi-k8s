docker build -t sayemsarkar123/multi-client:latest -t sayemsarkar123/multi-client:$GIT_SHA ./client
docker build -t sayemsarkar123/multi-server:latest -t sayemsarkar123/multi-server:$GIT_SHA ./server
docker build -t sayemsarkar123/multi-worker:latest -t sayemsarkar123/multi-worker:$GIT_SHA ./worker

docker push sayemsarkar123/multi-client:latest
docker push sayemsarkar123/multi-server:latest
docker push sayemsarkar123/multi-worker:latest

docker push sayemsarkar123/multi-client:$GIT_SHA
docker push sayemsarkar123/multi-server:$GIT_SHA
docker push sayemsarkar123/multi-worker:$GIT_SHA

kubectl apply -f k8s

kubectl set image deployment/client-deployment client=sayemsarkar123/multi-client:$GIT_SHA
kubectl set image deployment/server-deployment server=sayemsarkar123/multi-server:$GIT_SHA
kubectl set image deployment/worker-deployment worker=sayemsarkar123/multi-worker:$GIT_SHA