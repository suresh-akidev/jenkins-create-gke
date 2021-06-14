module "hub" {
source           = "terraform-google-modules/kubernetes-engine/google//modules/hub"

  project_id       = "	bcm-pcidss-devops-jenkins"
  cluster_name     = "gke-anthos-sur"
  location         = module.gke.location
  cluster_endpoint = module.gke.endpoint
}
