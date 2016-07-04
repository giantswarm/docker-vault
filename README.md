# Docker Vault
This Docker Vault container is using [Alpine
Linux](https://hub.docker.com/_/alpine/) minimal image and [Hashicorp's
Vault](https://vaultproject.io/).

Configuration examples are stored under `config/` in the git working directory.

## Vault Server

### Dev mode

Start vault server in a **dev mode**:

```
docker run -d \
      -p 8200:8200 \
      --name vault \
      giantswarm/docker-vault:0.1.0 \
      server -dev
```

## Using Vault

To initialize Vault, on your workstation with `vault` installed, first we need
to export vault ip address. If you bootstrapped containers on your machine you
can use  `docker inspect -f '{{ .NetworkSettings.IPAddress }}' vault` command
to get the vault container internal ip address.

```
# The address must start with protocol specifier!
export VAULT_ADDR='http://a.b.c.d:8200'
```

And refer to [vault documentation](https://www.vaultproject.io/docs/index.html)
on how to initialize and unseal data store. In case if you are evaluating in
**dev mode** of vault server, the empty initialized and unsealed **inmem**
vault data store will be automatically created.

You can simply export the root token printed on vault server startup as `export
VAULT_TOKEN=PASTE_YOUR_TOKEN_HERE`.
