# Author  - John Knepper
# Date    - May 10th, 2016
# File    - terraform/main.tf
# This declares / includes all modules to be used with TF

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
}

module "ELBs" {
  source = "./elb"
  az_one = "${var.az_one}"
  az_two = "${var.az_two}"
  subnet_one = "${var.subnet_one}"
  subnet_two = "${var.subnet_two}"
  environment = "${var.environment}"
  security_group_id = "${var.security_group_id}"
  vpc_id = "${var.vpc_id}"
}

module "launch_configs" {
  source = "./launch_configs"

  security_group_id = "${var.security_group_id}"
  
  coordinator_ami = "${var.coordinator_ami}"
  coordinator_instance_type = "${var.coordinator_instance_type}"

  overlord_ami = "${var.overlord_ami}"
  overlord_instance_type = "${var.overlord_instance_type}"

  broker_ami = "${var.broker_ami}"
  broker_instance_type = "${var.broker_instance_type}"

  historical_ami = "${var.historical_ami}"
  historical_instance_type = "${var.historical_instance_type}"

  middleManager_ami = "${var.middleManager_ami}"
  middleManager_instance_type = "${var.middleManager_instance_type}"

  tranquility_ami = "${var.tranquility_ami}"
  tranquility_instance_type = "${var.tranquility_instance_type}"

  date = "${var.date}"
  
  az_one = "${var.az_one}"
}

module "autoscaling" {
  source = "./autoscaling"
  subnet_one = "${var.subnet_one}"
  subnet_two = "${var.subnet_two}"

  # LC variables:
  coordinator_lc_name = "${module.launch_configs.coordinator_lc_name}"
  overlord_lc_name = "${module.launch_configs.overlord_lc_name}"
  broker_lc_name = "${module.launch_configs.broker_lc_name}"
  historical_lc_name = "${module.launch_configs.historical_lc_name}"
  middleManager_lc_name = "${module.launch_configs.middleManager_lc_name}"
  tranquility_lc_name = "${module.launch_configs.tranquility_lc_name}"

  # ELB variables:
  coordinator_elb_name = "${module.ELBs.coordinator_elb_name}"
  overlord_elb_name = "${module.ELBs.overlord_elb_name}"
  middleManager_elb_name = "${module.ELBs.middleManager_elb_name}"
  broker_elb_name = "${module.ELBs.broker_elb_name}"
  historical_elb_name = "${module.ELBs.historical_elb_name}"
  tranquility_elb_name = "${module.ELBs.tranquility_elb_name}"

  environment = "${var.environment}"

  zookeeper_dns_name = "${var.zookeeper_dns_name}"
  postgres_dns_name = "${var.postgres_dns_name}"

}

module "route53" {
  source = "./route53"
  zone_id = "${var.zone_id}"

  zookeeper_dns_name = "${var.zookeeper_dns_name}"
  postgres_dns_name = "${var.postgres_dns_name}"

  tld = "${var.tld}"
  domain_name = "${var.domain_name}"

}

