variable "vpc_id" {}
variable "name" {}
variable "region" {}
variable "asg_min" {}
variable "asg_desired" {}
variable "asg_max" {}
variable "instance_type" {}
variable "key_name" {}

variable "controlled_access_cidr_ingress" {
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "cluster_name" {}
