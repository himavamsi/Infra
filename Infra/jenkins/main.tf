locals {
  name       = "devops-demo"
  vm_name    = var.vm_name
  final_name = "${local.name}-${var.vm_name}"
}

data "google_compute_image" "images" {
  family  = "ubuntu-2204-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "demo" {
  name         = local.final_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = data.google_compute_image.images.id
    }
  }
  network_interface {
    subnetwork = var.subnet_id
    network    = var.network_id
    access_config {

    }

  }
  scheduling {
    preemptible        = true
    automatic_restart  = false
    provisioning_model = "SPOT"
  }
  metadata_startup_script = file("${path.module}/jenkins_install.sh")
  
  tags = ["allow-ssh","allow-http","allow-https","allow-jenkins"]
}
