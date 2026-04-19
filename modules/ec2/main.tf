resource "aws_launch_template" "main" {
    name_prefix = "${var.env_name}-launch-template-"
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_pair_name

    network_interfaces {
        associate_public_ip_address = false
        security_groups = [var.security_group_id]
    }

    user_data = base64encode(<<-EOF
                #!/bin/bash
                apt-get update
                apt-get install -y apache2
                echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/html/index.html
                systemctl enable apache2
                systemctl start apache2
                EOF
    )

    tag_specifications {
        resource_type = "instance"
        tags = {
            Name = "${var.env_name}-ec2-instance"
        }
    }
}

resource "aws_autoscaling_group" "main" {
    count = length(var.private_subnet_ids)
    name_prefix = "${var.env_name}-asg-"
    max_size = 2
    min_size = 1
    desired_capacity = 1
    launch_template {
        id = aws_launch_template.main.id
        version = "$Latest"
    }
    vpc_zone_identifier = [var.private_subnet_ids[count.index]]
    target_group_arns = [aws_lb_target_group.main.arn]
}

resource "aws_lb_target_group" "main" {
    name_prefix = "tg-"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    health_check {
        path = "/"
        protocol = "HTTP"
        matcher = "200-399"
        interval = 30
        timeout = 5
        healthy_threshold = 2
        unhealthy_threshold = 2
    }
}

resource "aws_lb" "main" {
    name = "${var.env_name}-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.security_group_id]
    subnets = var.pub_subnet_ids
}

resource "aws_lb_listener" "main" {
    load_balancer_arn = aws_lb.main.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.main.arn
    }
}
