terraform {
  required_version = ">= 1.2.0"
}

module "network" {
  source = "../network"
}

resource "aws_launch_template" "launch" {
  name_prefix            = "Terraform-ec"
  image_id               = "ami-0577c11149d377ab7"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [module.network.security_group.id]
  user_data              = filebase64("${path.module}/script.sh")

  tags = var.tags
}

resource "aws_autoscaling_group" "autoscale" {
  desired_capacity    = 3
  max_size            = 3
  min_size            = 3
  vpc_zone_identifier = [module.network.subnet.id]

  launch_template {
    id      = aws_launch_template.launch.id
    version = "$Latest"
  }

  # These tags are meant to be like this in order to work ¯\_(ツ)_/¯
  tag {
    key                 = "Name"
    value               = "Terraform-autoscaling"
    propagate_at_launch = true
  }
  tag {
    key                 = "Owner"
    value               = "gavetisyan"
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = "2023_internship_yvn"
    propagate_at_launch = true
  }
}


resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_lb" "load_balancer" {
  name               = "test-lb-tf"
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id     = module.network.subnet.id
    allocation_id = aws_eip.lb.id
  }

  tags = var.tags
}

resource "aws_lb_target_group" "test" {
  name     = "terraform-target-group"
  port     = 80
  protocol = "TCP"
  vpc_id   = module.network.vpc.id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}

resource "aws_autoscaling_attachment" "attach_tg_asg" {
  autoscaling_group_name = aws_autoscaling_group.autoscale.id
  lb_target_group_arn    = aws_lb_target_group.test.arn
}

