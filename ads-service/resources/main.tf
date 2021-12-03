terraform {
  backend "gcs" {
    bucket  = "humanitec-demo-store"
    prefix  = "terraform/ads-service"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.2.0"
    }
  }
}

variable "GCP_PROJECT" { 
    default = "humanitec-demo-1"
}

variable "GCP_REGION" {
  default = "europe-west3"
}

variable "GCP_ZONE" {
  default = "europe-west3-b"
}

provider "google" {
  project     = var.GCP_PROJECT
  region      = var.GCP_REGION
  zone        = var.GCP_ZONE
}
