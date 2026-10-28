data "gpupaas_vm" "demo" {
  project   = "system-catalog"
  workspace = "team-a"
  name      = "demo-vm"
}

output "phase" {
  value = data.gpupaas_vm.demo.status.phase
}

output "private_ip" {
  value = data.gpupaas_vm.demo.status.private_ip
}
