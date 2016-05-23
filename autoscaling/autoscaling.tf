# Create ASGs for LCs

resource "aws_autoscaling_group" "coordinator" {
    name = "druid-coordinator-asg"
    launch_configuration = "${var.coordinator_lc_name}"

    load_balancers = ["${var.coordinator_elb_name}"]
  
    vpc_zone_identifier = ["${var.subnet_one}"]
    max_size = 0 
    min_size = 0 
    desired_capacity = 0 

    force_delete = true

    tag {
      key = "Name"
      value = "druid-coordinator-${var.environment}"
      propagate_at_launch = true
    }

    lifecycle {
      create_before_destroy = true
    }   
}


resource "aws_autoscaling_group" "overlord" {
    name = "druid-overlord-asg"
    launch_configuration = "${var.overlord_lc_name}"

    load_balancers = ["${var.overlord_elb_name}"]
  
    vpc_zone_identifier = ["${var.subnet_one}"]
    max_size = 0 
    min_size = 0 
    desired_capacity = 0 

    force_delete = true

    tag {
      key = "Name"
      value = "druid-overlord-${var.environment}"
      propagate_at_launch = true
    }

    lifecycle {
      create_before_destroy = true
    }   
}

resource "aws_autoscaling_group" "middleManager" {
    name = "druid-middleManager-asg"
    launch_configuration = "${var.middleManager_lc_name}"

    load_balancers = ["${var.middleManager_elb_name}"]
  
    vpc_zone_identifier = ["${var.subnet_one}"]
    max_size = 0 
    min_size = 0 
    desired_capacity = 0 

    force_delete = true

    tag {
      key = "Name"
      value = "druid-middleManager-${var.environment}"
      propagate_at_launch = true
    }

    lifecycle {
      create_before_destroy = true
    }   
}

resource "aws_autoscaling_group" "historical" {
    name = "druid-historical-asg"
    launch_configuration = "${var.historical_lc_name}"

    load_balancers = ["${var.historical_elb_name}"]
  
    vpc_zone_identifier = ["${var.subnet_one}"]
    max_size = 0 
    min_size = 0 
    desired_capacity = 0 

    force_delete = true

    tag {
      key = "Name"
      value = "druid-historical-${var.environment}"
      propagate_at_launch = true
    }

    lifecycle {
      create_before_destroy = true
    }   
}

resource "aws_autoscaling_group" "broker" {
    name = "druid-broker-asg"
    launch_configuration = "${var.broker_lc_name}"

    load_balancers = ["${var.broker_elb_name}"]
  
    vpc_zone_identifier = ["${var.subnet_one}"]
    max_size = 0 
    min_size = 0 
    desired_capacity = 0 

    force_delete = true

    tag {
      key = "Name"
      value = "druid-broker-${var.environment}"
      propagate_at_launch = true
    }

    lifecycle {
      create_before_destroy = true
    }   
}

resource "aws_autoscaling_group" "tranquility" {
    name = "druid-tranquility-asg"
    launch_configuration = "${var.tranquility_lc_name}"

    load_balancers = ["${var.tranquility_elb_name}"]
  
    vpc_zone_identifier = ["${var.subnet_one}"]
    max_size = 0 
    min_size = 0 
    desired_capacity = 0 

    force_delete = true

    tag {
      key = "Name"
      value = "druid-tranquility-${var.environment}"
      propagate_at_launch = true
    }

    lifecycle {
      create_before_destroy = true
    }   
}
