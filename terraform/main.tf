provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

resource "aws_instance" "jenkins_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name

    tags = {
        Name = "jenkinsEC2"
    }
}
