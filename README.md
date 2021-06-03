# Jenkins-in-Docker

Add a file `jks.env` like below, replace the values with yours.

```bash
JENKINS_ADMIN_ID=admin
JENKINS_ADMIN_PASSWORD=OVER_WRITE_ME
```

## Build

```bash
docker compose build
```

## Run

```bash
docker compose up -d
```

## Monitor log

```bash
docker logs -f xxx
```
