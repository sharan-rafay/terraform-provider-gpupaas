data "gpupaas_vm_profile" "small" {
  project = "system-catalog"
  name    = "vm-test"
}

output "images" {
  value = data.gpupaas_vm_profile.small.images
}

output "presets" {
  value = data.gpupaas_vm_profile.small.presets
}

output "public_ip_mode" {
  value = data.gpupaas_vm_profile.small.public_ip
}
