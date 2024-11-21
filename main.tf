provider "google"{
    project ="cicdgcp-441611"
    region="us-centra1"
    zone="us-central1-a"
}
resource " google_container_cluster" "primary"{
name="gke-cluster"
location=var.region
initial_node_count = 3
node_config{
    machine_type="e2-medium"
}
}
resource " google_container_node_pool" "default"{
luster=google_container_luster.primary.name
location=var.region
initial_node_count = 3
node_config{
    machine_type="e2-medium"
}
}
output "kubeconfig"{
    value=google_container_cluster.primary.endpoint
}
