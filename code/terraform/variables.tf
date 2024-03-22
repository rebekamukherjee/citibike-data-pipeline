variable "credentials" {
  description = "My Credentials"
  default     = "../keys/creds.json"
}

variable "project" {
  description = "Project"
  default     = "citi-bike-trip-data-pipeline"
}

variable "region" {
  description = "Region"
  default     = "us-west3"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "citibike_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "citibike_bucket_rebekam" # must be unique
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}