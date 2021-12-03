variable "GCP_SQL_INSTANCE" {
  default = "demo-postgres-instance"
}

variable "DB_NAME" {
  default = "ads-service-db"
}

variable "DB_USER" {
  sensitive   = true
}

variable "DB_PASSWORD" {
  sensitive   = true
}

resource "google_sql_database" "db" {
  instance = var.GCP_SQL_INSTANCE
  name     = var.DB_NAME
}

resource "google_sql_user" "users" {
  instance = var.GCP_SQL_INSTANCE
  name     = var.DB_USER
  password = var.DB_PASSWORD
}
