FROM ubuntu:14.04

ADD https://github.com/richardbowden/poc_bk_rannumgen/releases/download/v0.0.1/poc_bk_rannumgen_linux_amd64 /poc/poc_bk_rannumgen_linux_amd64
RUN chmod +x /poc/poc_bk_rannumgen_linux_amd64
EXPOSE 9090 9090

ENTRYPOINT ["/poc/poc_bk_rannumgen_linux_amd64"]
