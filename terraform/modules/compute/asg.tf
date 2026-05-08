resource "aws_autoscaling_group" "app_asg" {
  min_size            = 1
  max_size            = 2
  desired_capacity    = 1

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  health_check_type = "ELB"
}
