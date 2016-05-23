# Author  - John Knepper
# Date    - May 10, 2016
# File    - terraform/main-variables.tf
# This holds our variables for main.tf

variable "region" {}
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "environment" {}

variable "az_one" {}
variable "az_two" {}
variable "zone_id" {}

variable "security_group_id" {}
variable "subnet_one" {}
variable "subnet_two" {}
variable "vpc_id" {}

variable "date" {}

variable "coordinator_ami" {}
variable "coordinator_instance_type" {}

variable "overlord_ami" {}
variable "overlord_instance_type" {}

variable "historical_ami" {}
variable "historical_instance_type" {}

variable "broker_ami" {}
variable "broker_instance_type" {}

variable "middleManager_ami" {}
variable "middleManager_instance_type" {}

variable "tranquility_ami" {}
variable "tranquility_instance_type" {}

variable "zookeeper_dns_name" {}
variable "postgres_dns_name" {}
variable "tld" {}
variable "domain_name" {}

