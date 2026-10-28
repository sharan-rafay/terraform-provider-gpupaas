# See what the Kubernetes SKU allows first: versions, CNIs, SKUs, images, datacenters.
data "gpupaas_mks_cluster_profile" "k8s" {
  project = "system-catalog"
  name    = "mks-oneclick-1"
}

# The workspace (team-a) and the SSH key (cluster-key) must already exist; create them in the console.

# A one-node cluster. Leave out what the profile already decides (SKU, image, networking,
# blueprint): the provider fills them from the profile and Terraform shows what the platform
# picked as computed attributes.
resource "gpupaas_mks_cluster" "demo" {
  metadata = {
    name      = "demo-cluster"
    project   = "system-catalog"
    workspace = "team-a"
  }

  spec = {
    profile_name       = data.gpupaas_mks_cluster_profile.k8s.name
    kubernetes_version = "1.36" # the platform resolves the latest patch; change it to upgrade

    control_plane = {
      node_count = 1 # 1, or 3 / 5 / 7 for high availability
      ssh_key    = "cluster-key"
    }

    # Add, remove or resize pools by editing this list. Pools are identified by name.
    # worker_pools = [
    #   { name = "gpu-pool", node_count = 2, sku_name = "bmaas-test-1", sku_type = "BMAAS" },
    # ]

    tags = { team = "platform" }
  }

  timeouts = {
    create = "60m"
    delete = "30m"
  }
}

output "kubernetes_version" {
  description = "Exact version the cluster runs."
  value       = gpupaas_mks_cluster.demo.status.kubernetes_version
}

output "nodes" {
  value = gpupaas_mks_cluster.demo.status.nodes
}
