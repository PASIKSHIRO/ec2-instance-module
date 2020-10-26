variable "aws_access_key" {
  default = "aws_access_key"
}
variable "aws_secret_key" {
  default = "aws_secret_key"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "ec2-instance" {
  source        = "../../ec2-instance-module"
  instance_type = "t2.micro"
  amiowners     = "267941777155"
  ami_instance  = "ami-0474863011a7d1541"
  environment   = "staging"
}
