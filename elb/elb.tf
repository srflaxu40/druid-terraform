# This creates the elastic load balancers for the following:
# overlord
# middleManager
# coordinator
# historical
# broker
# tranquility

# OVERLORD:
resource "aws_elb" "overlord" {
  name = "druid-overlord-elb-${var.environment}"

  security_groups = ["${var.security_group_id}"]
  subnets = ["${var.subnet_one}", "${var.subnet_two}"]

  listener {
    instance_port = "${var.overlord_port}"
    instance_protocol = "tcp"
    lb_port = "${var.overlord_port}"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    timeout = 5
    target = "TCP:${var.overlord_port}"
    interval = 6
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "druid-overlord-elb-${var.environment}"
  }
}
output "overlord_elb_name" {
  value = "${aws_elb.overlord.name}"
}

# MIDDLE-MANAGER:
resource "aws_elb" "middleManager" {
  name = "druid-middleManager-elb-${var.environment}"

  security_groups = ["${var.security_group_id}"]
  subnets = ["${var.subnet_one}", "${var.subnet_two}"]

  listener {
    instance_port = "${var.middleManager_port}"
    instance_protocol = "tcp"
    lb_port = "${var.middleManager_port}"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    timeout = 5
    target = "TCP:${var.middleManager_port}"
    interval = 6
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "druid-middleManager-elb-${var.environment}"
  }
}
output "middleManager_elb_name" {
  value = "${aws_elb.middleManager.name}"
}

# COORDINATOR:
resource "aws_elb" "coordinator" {
  name = "druid-coordinator-elb-${var.environment}"

  security_groups = ["${var.security_group_id}"]
  subnets = ["${var.subnet_one}", "${var.subnet_two}"]

  listener {
    instance_port = "${var.coordinator_port}"
    instance_protocol = "tcp"
    lb_port = "${var.coordinator_port}"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    timeout = 5
    target = "TCP:${var.coordinator_port}"
    interval = 6
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "druid-coordinator-elb-${var.environment}"
  }
}
output "coordinator_elb_name" {
  value = "${aws_elb.coordinator.name}"
}

# HISTORICAL:
resource "aws_elb" "historical" {
  name = "druid-historical-elb-${var.environment}"

  security_groups = ["${var.security_group_id}"]
  subnets = ["${var.subnet_one}", "${var.subnet_two}"]

  listener {
    instance_port = "${var.historical_port}"
    instance_protocol = "tcp"
    lb_port = "${var.historical_port}"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    timeout = 5
    target = "TCP:${var.historical_port}"
    interval = 6
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "druid-historical-elb-${var.environment}"
  }
}
output "historical_elb_name" {
  value = "${aws_elb.historical.name}"
}

# BROKER:
resource "aws_elb" "broker" {
  name = "druid-broker-elb-${var.environment}"

  security_groups = ["${var.security_group_id}"]
  subnets = ["${var.subnet_one}", "${var.subnet_two}"]

  listener {
    instance_port = "${var.broker_port}"
    instance_protocol = "tcp"
    lb_port = "${var.broker_port}"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    timeout = 5
    target = "TCP:${var.broker_port}"
    interval = 6
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "druid-broker-elb-${var.environment}"
  }
}
output "broker_elb_name" {
  value = "${aws_elb.broker.name}"
}

# TRANQUILITY:
resource "aws_elb" "tranquility" {
  name = "druid-tranquility-elb-${var.environment}"

  security_groups = ["${var.security_group_id}"]
  subnets = ["${var.subnet_one}", "${var.subnet_two}"]

  listener {
    instance_port = "${var.tranquility_port}"
    instance_protocol = "tcp"
    lb_port = "${var.tranquility_port}"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 10
    unhealthy_threshold = 2
    timeout = 5
    target = "TCP:${var.tranquility_port}"
    interval = 6
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "druid-tranquility-elb-${var.environment}"
  }
}
output "tranquility_elb_name" {
  value = "${aws_elb.tranquility.name}"
}

