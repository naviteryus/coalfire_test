variable "aws_region" {
    default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0fe630eb857a6ec83"
}

variable "volume_size" {
  default = 20
}