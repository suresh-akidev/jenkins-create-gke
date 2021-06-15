# Primary Cluster
module "primary-cluster" {
  name                    = "primary"
  project_id              = module.project-services.project_id
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"
  version                 = "13.0.0"
  regional                = false
  region                  = var.primary_region
  network                 = "default"
  subnetwork              = "default"
  ip_range_pods           = ""
  ip_range_services       = ""
  zones                   = var.primary_zones
  release_channel         = "REGULAR"
  cluster_resource_labels  = { "mesh_id" : "proj-${data.google_project.project.number}" }
  node_pools = [
    {
      name         = "default-node-pool"
      autoscaling  = false
      auto_upgrade = true

      node_count   = 3
      machine_type = "e2-standard-4"
    },
  ]

}
