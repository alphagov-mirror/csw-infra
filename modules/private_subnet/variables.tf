variable "vpc_id" {}
variable "prefix" {}

variable "subnet_zone" {
  description = "Availability zone for the subnet"
  default     = "eu-west-2a"
}

variable "subnet_cidr_block" {
  description = "CIDR for the whole VPC"
  default     = "10.1.0.0/16"
}
