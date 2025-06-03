resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.subnet_cidr[0]
  region        = var.region
}

resource "google_compute_subnetwork" "proxy_subnet" {
  name          = "proxy-${var.subnet_name}"
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.subnet_cidr[1]
  region        = var.region
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
}

resource "google_compute_firewall" "allow-firewall" {
  name    = "${each.key}-firewall"
  network = google_compute_network.vpc.self_link
  for_each = {
    "allow-ssh"     = 22
    "allow-http"    = 80
    "allow-https"   = 443
    "allow-jenkins" = 8080
  }
  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  priority      = 1000
  target_tags   = ["${each.key}"]
  allow {
    protocol = "tcp"
    ports    = ["${each.value}"]
  }
}
