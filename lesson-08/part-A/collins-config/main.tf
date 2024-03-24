provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

module "webserver" {
  source         = "../modules/webserver"
  ami            = "ami-0b8b44ec9a8f90422"
  vpc_id         = aws_vpc.my_vpc.id
  instance_type  = "t2.micro"
  webserver_name = "Collins'"
  cidr_block     = "10.0.0.0/16"
}