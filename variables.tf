variable "project" {
  type        = string
  description = "Project name from Google Cloud."
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `cp` or `cloudposse`)."
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `dev`, `staging`, `prd`)."
}

variable "name" {
  type        = string
  description = "Application or solution name (e.g. `app`)."
}

variable "delimiter" {
  type        = string
  description = "Delimiter to be used between `name`, `namespace`, `stage`, `attributes`."
  default     = "-"
}

variable "region" {
  type        = string
  description = "Locate based on Google Cloud region to provisiong your Cloud Run (e.g. `us-east1`)."
  default     = "us-east1"
}
