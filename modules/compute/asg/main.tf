resource "aws_autoscaling_group" "asg" {

  launch_configuration = var.launch_configuration
  subnet_ids  = var.subnet_ids

  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity

  # load_balancers            = var.load_balancers
  # target_group_arns         = var.target_group_arns
  # placement_group           = var.placement_group
  # health_check_type         = var.health_check_type
  # health_check_grace_period = var.health_check_grace_period

  # force_delete          = var.force_delete
  # termination_policies  = var.termination_policies
  # suspended_processes   = var.suspended_processes
  # max_instance_lifetime = var.max_instance_lifetime

  lifecycle {
    create_before_destroy = true
  }
}
