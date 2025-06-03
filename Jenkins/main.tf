terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.37.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-storage-devops-poc"
    prefix = "tfstate"
  }
}

provider "google" {
  project     = "gcp-knowledge-454214"
  region      = "us-west1"
  credentials = file("${path.module}/gcp-knowledge-454214-18b9191e2067.json")
}

module "vm_module" {
  source     = "./jenkins"
  subnet_id  = module.network_module.subnet_id
  network_id = module.network_module.network_id
}

module "network_module" {
  source = "./Network"
}
