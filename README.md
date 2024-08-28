# DevOps Practical Project

## Overview

This project demonstrates a practical implementation of DevOps concepts using Kubernetes, Docker, and Helm. It involves deploying an application to a local Kubernetes cluster using Minikube and configuring MongoDB.

## Project Structure

- **`devops-practical-chart/`**: Helm chart for deploying the application.
- **`terraform/`**: (Optional) Terraform configurations if needed for local resources.
- **`docker/`**: Dockerfile for building the application image.
- **`scripts/`**: Scripts for setting up Kubernetes or other environments.
- **`ansible/`**: (Optional) Ansible playbooks for configuration management.
- **`docs/`**: Documentation including setup guides and screenshots.
- **`examples/`**: Example configuration files.
- **`config/`**: Application configuration files.

## Prerequisites

- **Minikube**: [Install Minikube](https://minikube.sigs.k8s.io/docs/start/)
- **kubectl**: [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- **Helm**: [Install Helm](https://helm.sh/docs/intro/install/)

## Setup

### 1. Install Minikube

1. **Download and Install Minikube**:
   - Download the Minikube installer for Windows from the [Minikube releases page](https://github.com/kubernetes/minikube/releases).
   - Run the installer and follow the setup instructions.

2. **Verify Minikube Installation**:
   ```bash
   minikube version

### 2. Install kubectl

1. **Download kubectl:**:
    ```bash
   curl -LO "https://dl.k8s.io/release/v1.21.0/bin/windows/amd64/kubectl.exe"

2. **Move kubectl to PATH:**:
   ```bash
   move kubectl.exe C:\Windows\System32\

3. **Verify kubectl Installation:**:

   ```bash
   kubectl version --client

### 3. Start Minikube

1. **Start Minikube:**:
    ```bash
   minikube start --driver=virtualbox

2. **Verify Minikube Status:**:
   ```bash
   minikube status

## Deploy MongoDB

### 1. Create MongoDB Deployment

Save the following as `mongodb-deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongodb
  template:
    metadata:
      labels:
        app: mongodb
    spec:
      containers:
        - name: mongodb
          image: mongo:latest
          ports:
            - containerPort: 27017
```
Save the following as `mongodb-service.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mongodb-service
spec:
  selector:
    app: mongodb
  ports:
    - protocol: TCP
      port: 27017
      targetPort: 27017
  type: ClusterIP

```
**Apply MongoDB Configuration:**:
```bash
kubectl apply -f mongodb-deployment.yaml
kubectl apply -f mongodb-service.yaml

```

## Bonus Points
### Create a playbook to install NTP and any Kubernetes dependencies:
This is a file in [Repository Name](ansible/install-ntp.yml) repository.

```bash
ansible-playbook -i inventory playbook.yml

```

## next 
