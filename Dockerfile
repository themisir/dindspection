FROM alpine AS deps
RUN apk add --update docker openrc sudo

FROM deps AS app
COPY entrypoint.sh .
CMD ["/bin/sh", "entrypoint.sh"]