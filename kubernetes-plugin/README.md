# Building and Testing kubernetes-plugin

## 1. Create a Kubernetes cluster

```bash
minikube start --listen-address=0.0.0.0 --apiserver-ips=10.66.40.144 --ports=8443:8443
```

### 2. Get provisioning code

```bash
git clone github.com:jenkinsci/kubernetes-plugin.git
```

### 3. Provision

```bash
cd kubernetes-plugin
kubectl create namespace kubernetes-plugin
kubectl config set-context jks --cluster=minikube --namespace=kubernetes-plugin --user=minikube
kubectl config use-context jks
kubectl create -f src/main/kubernetes/service-account.yml
```

**We don't need to create Jenkins StatefulSet here, because we will use an
external Jenkins instance created by docker-compose.**

Reference: [kubernetes-plugin](https://plugins.jenkins.io/kubernetes/)
