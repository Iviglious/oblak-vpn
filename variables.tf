
variable "region" {
  default = "us-east-1"
}

variable "zone" {
  default = "us-east-1a"
}

variable "profile" {
  default = "default"
}

variable "key_pair_name" {
  default = "default"
}

variable "ami-id" {
  default = "ami-00eb20669e0990cb4" # Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type
}

variable "instance-type" {
  default = "t2.micro"
}

