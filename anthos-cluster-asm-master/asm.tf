module "asm" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/asm"

  project_id       = "	bcm-pcidss-devops-jenkins"
  cluster_name     = "gke-anthos-sur"
  location         = module.gke.location
  cluster_endpoint = module.gke.endpoint
}
