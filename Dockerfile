# Use the official Vault image as the base image
FROM vault:1.4.0

# Set environment variables for the vault container
ENV VAULT_DEV_ROOT_TOKEN_ID=934f9eae-31ff-a8ef-e1ca-4bea9e07aa09

# Expose the default Vault port
EXPOSE 8200

# Create a Dockerfile for the setup-vault container
FROM vault:1.4.0 as setup-vault

# Set environment variables for the setup-vault container
ENV VAULT_ADDR=http://vault:8200
ENV CONFIG_DIR=/config

# Set the working directory
WORKDIR /app

# Copy the contents of the local 'config' directory to the container's '/config' directory
COPY ./config /config

# Run the setup-vault container entrypoint
CMD ["/bin/sh", "-c", "sleep 2; /config/vault-init.sh;"]

