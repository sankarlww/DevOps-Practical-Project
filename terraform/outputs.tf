output "kubeconfig_path" {
  value = local_file.kube_config.filename
}
