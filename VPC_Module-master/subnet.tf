module "vpc_shared_subnet" {
  source = "./subnet_module"
  host_project = "dbank-anthospoc"
  service_project01 = "anthos-migrations"
  subnetname = "tf-test-subnetwork"
  cidr_range = "10.155.0.0/16"
  region = "us-central1"
  project_name = "dbank-anthospoc"
  network_name = "dbank-private"
  secondary_pod_name = "ip-range-pods-name"
  secondary_pod_cidr_range = "10.168.0.0/22"
  secondary_service_name = "ip-range-services-name"
  secondary_service_cidr_range = "10.168.64.0/22"
}
