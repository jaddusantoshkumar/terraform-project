output "launch_template_id" {
    value = aws_launch_template.main.id
}

output "autoscaling_group_ids" {
    value = aws_autoscaling_group.main[*].id
}

output "load_balancer_arn" {
    value = aws_lb.main.arn
}

output "target_group_arn" {
    value = aws_lb_target_group.main.arn
}