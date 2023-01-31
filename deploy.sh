docker build -t xxmadmanxx/multi-client:latest -t xxmadmanxx/multi-client:$SHA ./client
docker build -t xxmadmanxx/multi-server:latest -t xxmadmanxx/multi-server:$SHA ./server
docker build -t xxmadmanxx/multi-worker:latest -t xxmadmanxx/multi-worker:$SHA ./worker
docker build -t xxmadmanxx/multi-randgen:latest -t xxmadmanxx/multi-randgen:$SHA ./randgen

docker push xxmadmanxx/multi-client:latest
docker push xxmadmanxx/multi-server:latest
docker push xxmadmanxx/multi-worker:latest
docker push xxmadmanxx/multi-randgen:latest
docker push xxmadmanxx/multi-client:$SHA
docker push xxmadmanxx/multi-server:$SHA
docker push xxmadmanxx/multi-worker:$SHA
docker push xxmadmanxx/multi-randgen:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=xxmadmanxx/multi-server:$SHA
kubectl set image deployments/client-deployment client=xxmadmanxx/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=xxmadmanxx/multi-worker:$SHA
kubectl set image deployments/randgen-deployment randgen=xxmadmanxx/multi-randgen:$SHA