FROM alpine:latest
ENV VAULT_VERSION 0.6.0

# x509 expects certs to be in this file only.
RUN apk update && apk add openssl ca-certificates && rm -rf /var/cache/apk/*

# Download, unzip the given version of vault and set permissions
RUN wget -qO /tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
      unzip -d /bin /tmp/vault.zip && rm /tmp/vault.zip && chmod 755 /bin/vault

EXPOSE 8200
VOLUME "/config"

ENTRYPOINT ["/bin/vault"]
CMD ["-h"]
