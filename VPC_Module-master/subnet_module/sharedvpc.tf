# A host project provides network resources to associated service projects.
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = var.service_project01
}
/*
resource "google_compute_shared_vpc_service_project" "service2" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = "anthos-migrations"
}
*/
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.subnetname
  ip_cidr_range = var.cidr_range
  region        = var.region
  project       = var.project_name
  network       = var.network_name
  secondary_ip_range = [
    {
      range_name    = var.secondary_pod_name
      ip_cidr_range = var.secondary_pod_cidr_range
    },
    {
      range_name    = var.secondary_service_name
      ip_cidr_range = var.secondary_service_cidr_range
    }
  ]
}
