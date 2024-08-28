# Example of a local Kubernetes resource provisioner configuration (e.g., local storage)

resource "local_file" "kube_config" {
  sensitive_content = <<EOF
apiVersion: v1
clusters:
- cluster:
    server: https://localhost:8443
    certificate-authority: /path/to/ca.crt
  name: minikube
contexts:
- context:
    cluster: minikube
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    token: <your-token>
EOF

  filename = "${path.module}/kubeconfig"
}
