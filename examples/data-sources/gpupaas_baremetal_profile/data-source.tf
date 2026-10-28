data "gpupaas_baremetal_profile" "gpu" {
  project = "system-catalog"
  name    = "bmaas-l40s"
}

output "images" {
  value = data.gpupaas_baremetal_profile.gpu.images
}

output "datacenters" {
  value = data.gpupaas_baremetal_profile.gpu.datacenters
}

output "public_ip_policy" {
  value = data.gpupaas_baremetal_profile.gpu.assign_public_ip
}
