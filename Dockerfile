FROM alpine AS deps
RUN apk add --update docker openrc sudo

FROM deps AS app
WORKDIR /hell
COPY Dockerfile .
CMD ["/bin/sh", "-c", "sudo dockerd --host tcp://0.0.0.0:2375 --tls=false & sleep 3 && sudo docker -H tcp://localhost:2375 build -t hell . && sudo  docker -H tcp://localhost:2375 run --privileged hell"]