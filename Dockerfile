FROM vault:1.4.0

ENV VAULT_DEV_ROOT_TOKEN_ID=934f9eae-31ff-a8ef-e1ca-4bea9e07aa09

FROM vault:1.4.0 as setup-vault

# ENV VAULT_ADDR=http://vault:8200
ENV VAULT_ADDR = ${VAULT_ADDRS}

ENV CONFIG_DIR=${CONFIG_DIR}

# Set the working directory
WORKDIR /app

COPY ./config /config

CMD ["/bin/sh", "-c", "sleep 2; /config/vault-init.sh;"]
