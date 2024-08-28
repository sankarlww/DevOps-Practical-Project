# DevOps Practical Project

## Overview

This project demonstrates a complete DevOps pipeline, including Dockerizing an application, deploying it to Kubernetes, and configuring infrastructure using Terraform and Helm. The setup includes MongoDB, Kubernetes cluster setup, and application deployment.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Helm](https://helm.sh/docs/intro/install/)
- [Terraform](https://www.terraform.io/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Packer](https://www.packer.io/downloads)

## Setup Instructions

### 1. Set Up Minikube

1. **Install Minikube:**
   ```bash
   curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
   sudo install minikube-linux-amd64 /usr/local/bin/minikube
