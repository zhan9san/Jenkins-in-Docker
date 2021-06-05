# Building and Testing kubernetes-plugin

## 1. Create a Kubernetes cluster

We choose [Minikube](https://minikube.sigs.k8s.io/docs/) here for development
environment. You could run a kubernetes cluster in EKS, GKE or any other one.

Replace the `--listen-address` to your IP(The ip of your laptop).

```bash
minikube start --driver=docker --listen-address=0.0.0.0 --apiserver-ips=192.168.1.2 --ports=8443:8443
```

*Note: It requires `Minikube` version >= [1.19.0-beta.0](https://github.com/kubernetes/minikube/blob/master/CHANGELOG.md#version-1190-beta0---2021-04-05)*

### 2. Get provisioning code

```bash
git clone github.com:jenkinsci/kubernetes-plugin.git
```

### 3. Provision

Create `kubernetes-plugin` namepsace and context to work with, and create a
service account to integrat with Jenkins.

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
