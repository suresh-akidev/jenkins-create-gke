
# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = "bcm-pcidss-devops-jenkins"
  network_project_id         = "example-vpc-dev"
  name                       = "gke-anthos-sur"
  region                     = "us-central1"
  zones                      = ["us-central1-a", "us-central1-b", "us-central1-f"]
  network                    = "example-vpc-dev"
  subnetwork                 = "example-vpc-dev-us-central1"
  ip_range_pods              = "ip-range-pods-name"
  ip_range_services          = "ip-range-services-name"
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = true

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "e2-standard-4"
      node_locations     = "us-central1-b,us-central1-c"
      min_count          = 1
      max_count          = 3
      local_ssd_count    = 0
      disk_size_gb       = 50
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = "stanalone-jenkins-serviceaccou@bcm-pcidss-devops-jenkins.iam.gserviceaccount.com"
      preemptible        = false
      initial_node_count = 4
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
