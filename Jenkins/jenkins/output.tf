output "vm_name" {
  value = google_compute_instance.demo.hostname
}

output "vm_id" {
  value = google_compute_instance.demo.id
}

output "vm_ip" {
  value = google_compute_instance.demo.network_interface[0].network_ip
}
