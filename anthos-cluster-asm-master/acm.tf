module "acm" {
source           = "terraform-google-modules/kubernetes-engine/google//modules/acm"

  project_id       = "bcm-pcidss-devops-jenkins"
  cluster_name     = "gke-anthos-sur"
  location         = module.gke.location
  cluster_endpoint = module.gke.endpoint

  sync_repo        = "git@github.com:GoogleCloudPlatform/csp-config-management.git"
  sync_branch      = "1.0.0"
  policy_dir       = "foo-corp"
}
