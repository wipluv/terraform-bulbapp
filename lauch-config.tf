resource "aws_launch_configuration" "default" {
    name                        = "terraform-ecs-bulbapp"
    image_id                    = "ami-098616968d61e549e"
    instance_type               = "t2.large"
    iam_instance_profile        = "${aws_iam_instance_profile.default.id}"
    root_block_device {
      volume_type = "standard"
      volume_size = 30
      delete_on_termination = true
    }
    lifecycle {
      create_before_destroy = true
    }
    security_groups             = ["${aws_security_group.default.id}"]
    associate_public_ip_address = "true"
    key_name                    = "terraform-ecs-bulbapp"
    user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=ecs-bulbapp >> /etc/ecs/ecs.config
                                  EOF
}
