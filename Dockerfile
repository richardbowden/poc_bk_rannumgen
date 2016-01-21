FROM ubuntu:14.04

ENV PORT 9090

ADD randnum-svc-* /poc/randnum-svc
RUN chmod +x /poc/randnum-svc && apt-get update && \
apt-get install -y curl

EXPOSE ${PORT}

ADD docker-entrypoint.sh /docker-entrypoint.sh

CMD /docker-entrypoint.sh
