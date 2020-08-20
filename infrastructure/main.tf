provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "posts-service" {
  ami           = "ami-04932daa2567651e7"
  instance_type = "t2.micro"
}
