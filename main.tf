terraform {
  required_version = ">= 0.12"
}

resource "aws_security_group" "ec2_module_sg" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    }
  ]
}

resource "aws_instance" "ec2_module_instance" {
  ami                    = var.ami_instance
  instance_type          = var.instance_type
  key_name               = "yuriy-pasichynskiy"
  vpc_security_group_ids = [aws_security_group.ec2_module_sg.id]
  tags = {
    Name        = "${var.environment}-test"
    Environment = var.environment
  }
}

