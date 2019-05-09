FROM alpine:latest

RUN apk --no-cache add \
  bash curl bind-tools netcat-openbsd fish jq coreutils ca-certificates nmap

ADD https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["tail", "-f", "/dev/null"]
