provider "aws" {
  region     = "ap-south-1"
  profile = "default"
}

resource "aws_instance" "os1" {
  ami           = "ami-0e306788ff2473ccb"
  instance_type = "t2.micro"

  tags = {
    Name = "my first TF OS"
  }
}

output "my_public_ip_is" {
value= aws_instance.os1.public_ip
}

output "my_az_is" {
value= aws_instance.os1.availability_zone
}

resource "aws_ebs_volume" "st1" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 5

  tags = {
    Name = "LW HD new"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.st1.id
  instance_id = aws_instance.os1.id
}