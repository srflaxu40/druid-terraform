# Note - uwe populate the latest AMIs from the S3 bucket
# coordinator
# overlord
# middleManager
# historical
# broker
# tranquility

resource "aws_launch_configuration" "druid_coordinator_launch_config" {
    name = "druid-coordinator-lc"
    image_id = "${var.coordinator_ami}"
    instance_type = "${var.coordinator_instance_type}"

    security_groups = ["${var.security_group_id}"]

    lifecycle {
      create_before_destroy = true
    }
}
output "coordinator_lc_name" {
    value = "${aws_launch_configuration.druid_coordinator_launch_config.name}"
}

resource "aws_launch_configuration" "druid_overlord_launch_config" {
    name = "druid-overlord-lc"
    image_id = "${var.overlord_ami}"
    instance_type = "${var.overlord_instance_type}"

    security_groups = ["${var.security_group_id}"]

    lifecycle {
      create_before_destroy = true
    }
}
output "overlord_lc_name" {
    value = "${aws_launch_configuration.druid_overlord_launch_config.name}"
}

resource "aws_launch_configuration" "druid_broker_launch_config" {
    name = "druid-broker-lc"
    image_id = "${var.broker_ami}"
    instance_type = "${var.broker_instance_type}"

    security_groups = ["${var.security_group_id}"]

    lifecycle {
      create_before_destroy = true
    }
}
output "broker_lc_name" {
    value = "${aws_launch_configuration.druid_broker_launch_config.name}"
}

resource "aws_launch_configuration" "druid_middleManager_launch_config" {
    name = "druid-middleManager-lc"
    image_id = "${var.middleManager_ami}"
    instance_type = "${var.middleManager_instance_type}"

    security_groups = ["${var.security_group_id}"]

    lifecycle {
      create_before_destroy = true
    }
}
output "middleManager_lc_name" {
    value = "${aws_launch_configuration.druid_middleManager_launch_config.name}"
}

resource "aws_launch_configuration" "druid_historical_launch_config" {
    name = "druid-historical-lc"
    image_id = "${var.historical_ami}"
    instance_type = "${var.historical_instance_type}"

    security_groups = ["${var.security_group_id}"]

    lifecycle {
      create_before_destroy = true
    }
}
output "historical_lc_name" {
    value = "${aws_launch_configuration.druid_historical_launch_config.name}"
}

resource "aws_launch_configuration" "druid_tranquility_launch_config" {
    name = "druid-tranquility-lc"
    image_id = "${var.tranquility_ami}"
    instance_type = "${var.tranquility_instance_type}"

    security_groups = ["${var.security_group_id}"]

    lifecycle {
      create_before_destroy = true
    }
}
output "tranquility_lc_name" {
    value = "${aws_launch_configuration.druid_tranquility_launch_config.name}"
}

