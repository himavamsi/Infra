output "network_id" {
  value = google_compute_network.vpc.self_link
}

output "subnet_id" {
  value = google_compute_subnetwork.subnet.self_link
}

output "proxy_subnet_id" {
  value = google_compute_subnetwork.proxy_subnet.self_link
}
