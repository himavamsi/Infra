variable "vpc_name" {
  default = "devops-demo-vpc"
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "subnet_name" {
  default = "devops-demo-subnet"
}

variable "region" {
  default = "us-west1"
}
