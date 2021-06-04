# Jenkins-in-Docker

Add a file `jks.env` like below, replace the values with yours.

```bash
JENKINS_ADMIN_ID=admin
JENKINS_ADMIN_PASSWORD=OVER_WRITE_ME
```

## Build Jenkins

```bash
docker compose build
```

## Run Jenkins

```bash
docker compose up -d
```

## Monitor Jenkins

```bash
docker compose logs -f
```

## Destory Jenkins

```bash
docker compose down
```

## kubernetes-plugin

Refer to [kubernetes-plugin](./kubernetes-plugin/README.md)

Ensure the token and cert of servive account `jenkins` are set correctly.

There are two options to change these two configurations.

1. Web UI.
   1. `Manage Jenkins` -> `Manage credentials` -> `jenkins-token-kubernetes`
-> `Update` -> `Secret(Change password)`.


1. `casc`. Update the `casc.yaml`
   a. and reload Jenkins.(**Recomended**)
