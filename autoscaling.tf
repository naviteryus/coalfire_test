resource "aws_launch_configuration" "as_config" {
  name            = "ASG-Launch-Configuration"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  user_data       = <<-EOF
                  #!/bin/bash
                  yum install -y httpd
                  systemctl start httpd
                  systemctl enable httpd
                  EOF
  security_groups = [aws_security_group.web_sg.id]

  root_block_device {
    volume_size = var.volume_size
  }
}

resource "aws_autoscaling_group" "asg" {
  launch_configuration = aws_launch_configuration.as_config.name
  min_size             = 2
  max_size             = 6
  vpc_zone_identifier  = [aws_subnet.private1.id, aws_subnet.private2.id]
  target_group_arns    = [aws_lb_target_group.lb_tg.arn]

  lifecycle {
    create_before_destroy = true
  }
}
