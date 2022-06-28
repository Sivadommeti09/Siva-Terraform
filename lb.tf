resource "aws_lb" "external-elb" {
    name               = "External-LB"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.SivaSG.id]
    subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
  }
  
  resource "aws_lb_target_group" "external-elb" {
    name     = "ALB-TG"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.Siva_VPC.id
  }
  
  resource "aws_lb_target_group_attachment" "external-elb1" {
    target_group_arn = aws_lb_target_group.external-elb.arn
    target_id        = "aws_instance.Sivainstance.id"
    port             = 80
  
    depends_on = [
      aws_instance.Sivainstance,
    ]
  }
  
  resource "aws_lb_target_group_attachment" "external-elb2" {
    target_group_arn = aws_lb_target_group.external-elb.arn
    target_id        = "aws_instance.Sivainstance1.id"
    port             = 80
  
    depends_on = [
      aws_instance.Sivainstance,
    ]
  }
  
  resource "aws_lb_listener" "external-elb" {
    load_balancer_arn = aws_lb.external-elb.arn
    port              = "80"
    protocol          = "HTTP"
  
    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.external-elb.arn
    }
  }
  
