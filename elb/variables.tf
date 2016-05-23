# these will/ are expected to be set on in the local ENV of the calling job.

variable "az_one" {}
variable "az_two" {}
variable "environment" {}

# Set ports for various druid nodes:
variable "overlord_port" {
  default = "8090"
}

variable "coordinator_port" {
  default = "8081"
}

variable "historical_port" {
  default = "8083"
}

variable "broker_port" {
  default = "8082"
}

variable "middleManager_port" {
  default = "8091"
}

variable "tranquility_port" {
  default = "8200"
}

variable "security_group_id" {}
variable "subnet_one" {}
variable "subnet_two" {}
variable "vpc_id" {}

