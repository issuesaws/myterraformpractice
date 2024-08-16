resource "aws_security_group" "webapp_sg" {
  name        = "woody_sg"
  description = "This is webapp security group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "This is webapp security group for woody vpc to open 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "This is webapp security group for woody vpc to open 22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "This is webapp security group for woody vpc to open 80 port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "woody_sg_for_webapp"
  }
}