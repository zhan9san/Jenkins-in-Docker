# Jenkins-in-Docker

Add a file `jks.env` like below, replace the values with yours.

```bash
JENKINS_ADMIN_ID=admin
JENKINS_ADMIN_PASSWORD=OVER_WRITE_ME
JENKINS_DOMAIN=OVER_WRITE_ME
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

### How to get token and cert

TBD

There are two options to change these two configurations.

1. Web UI.
   1. `Manage Jenkins` -> `Manage credentials` -> `jenkins-token-kubernetes` -> `Update` -> `Secret(Change password)`.
   2. `Manage Jenkins` -> `Manage Nodes and Clouds` -> `Configure Clouds`
   -> `Kubernetes Cloud details` -> `Kubernetes server certificate key`

2. `casc`. Update the `casc.yaml`(**Recomended**)
   1. `credentials` -> `system` -> `domainCredentials` -> `credentials`
   -> `string` -> `secret`
   2. `jenkins` -> `clouds` -> `kubernetes` -> `serverCertificate`
   3. Reload configuration

## Reference  

[Getting started with Jenkins Config as Code](https://verifa.io/insights/getting-started-with-jenkins-config-as-code/)

[Creating a Job DSL seed job with JCasC](https://gerg.dev/2020/06/creating-a-job-dsl-seed-job-with-jcasc/)
