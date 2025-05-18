provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

# Create a Security Group that allows SSH access
resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Allow SSH from anywhere"
  vpc_id      = var.vpc_id  # Ensure this variable is defined or hardcode your VPC ID

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Or restrict to your IP for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

#ec2 instance creation 
resource "aws_instance" "jenkins_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.ssh_access.id]

    tags = {
        Name = "jenkinsEC2"
    }
}
