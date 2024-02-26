provider "aws" {
  region     = "ap-south-1"  
}

resource "aws_instance" "first_instance" {
  ami                     = "ami-099b3d23e336c2e83"
  instance_type           = "t2.micro"
  tags = {
    Name = "instance_1"
  }
}
