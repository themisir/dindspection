sudo dockerd --host tcp://0.0.0.0:2375 --tls=false &> /dev/null &

sleep 3 # wait for dockerd to come online
docker -H tcp://localhost:2375 run hello-world
docker -H tcp://localhost:2375 run --privileged ghcr.io/themisir/dindspection:main