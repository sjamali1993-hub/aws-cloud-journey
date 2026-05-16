variable "region" {
  description = "Région AWS"
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR block du VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Nom du VPC"
  default     = "jamali"
}

variable "subnet_public_cidr" {
  description = "CIDR block du subnet public"
  default     = "10.0.1.0/24"
}

variable "subnet_private_cidr" {
  description = "CIDR block du subnet privé"
  default     = "10.0.2.0/24"
}