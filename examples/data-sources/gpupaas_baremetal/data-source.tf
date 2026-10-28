data "gpupaas_baremetal" "demo" {
  project   = "system-catalog"
  workspace = "team-a"
  name      = "demo-machine"
}

output "phase" {
  value = data.gpupaas_baremetal.demo.status.phase
}

output "private_ip" {
  value = data.gpupaas_baremetal.demo.status.private_ip
}
