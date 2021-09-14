provider "aws" {
  region = "us-east-2"
} 

resource "aws_vpc" "aws_demo_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "aws_demo_vpc"
    "Created Date" = timestamp()
    "Estimated Expiry" = timeadd(timestamp(),"72h")
  }
}
  
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.aws_demo_vpc.id

  tags = {
    Name = "allow_ssh"
    "Created Date" = timestamp()
    "Estimated Expiry" = timeadd(timestamp(),"72h")
  }

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #cidr_blocks      = ["10.0.0.0/30"]
    ipv6_cidr_blocks = ["2001:db8::/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["2001:db8::/32"]
  }
}

resource "aws_security_group" "allow_eightk" {
  name        = "allow_eightk"
  description = "Allow port 8000 inbound traffic"
  vpc_id      = aws_vpc.aws_demo_vpc.id

  tags = {
    Name = "allow_eightk"
    "Created Date" = timestamp()
    "Estimated Expiry" = timeadd(timestamp(),"72h")
  }

  ingress {
    description      = "EightK from VPC"
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #cidr_blocks      = ["10.0.0.0/30"]
    ipv6_cidr_blocks = ["2001:db8::/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["2001:db8::/32"]
  }
}
