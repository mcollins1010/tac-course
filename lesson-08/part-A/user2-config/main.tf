provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "user2-vpc" {
  cidr_block = "10.0.0.0/24"
}

module "webserver-user2" {
  source         = "../modules/webserver"
  ami            = "ami-0d77c9d87c7e619f9"
  vpc_id         = aws_vpc.my_vpc.id
  instance_type  = "t2.micro"
  webserver_name = "User2's"
  cidr_block     = aws_vpc.user2-vpc
}
