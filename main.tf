# Configure the AWS Provider
provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAYQA3L4DEWG62SFAP"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "web-server-2"
  }
}

output "public_ip" {
  value       = aws_instance.web.public_ip
}
