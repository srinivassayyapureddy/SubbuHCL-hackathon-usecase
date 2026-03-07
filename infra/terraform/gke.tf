ource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  networking_mode = "VPC_NATIVE"
  remove_default_node_pool = true
  initial_node_count = 1

  ip_allocation_policy {
    use_ip_aliases = true
  }

  network    = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.vpc_subnet.id

  # Optional: Enable workload identity
  workload_identity_config {
    identity_namespace = "${var.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-nodepool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }
}
