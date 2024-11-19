variable "ec2_instance_type" {
  description = "Instance type for development"
  type        = string
  default     = "t2.nano"
}

variable "ec2_ami" {
  description = "ubuntu-ami-eu-central-1"
  type        = string
  default     = "ami-0084a47cc718c111a"
}

variable "aws_vpc_cidr_block" {
  description = "cidr-block Main-VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# variable "main_vpc_tag_name" {
#   description = "Tag-Name Main VPC"
#   type = string
#   default = "project-18-11-2024-vpc"
# }

variable "port_egress" {
  description = "Egress Port Configuration allow all"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "region" {
  description = "Region der Ressourcenerstellung"
  type        = string
  default     = "eu-central-1"

}

variable "public_subnet_cidr" {
  description = "cidr-block subnet"
  type        = string
  default     = "10.0.0.0/20"

}

variable "availability_zone" {
  description = "av_zone"
  type        = string
  default     = "eu-central-1a"

}

variable "aws_rt_cidr_block" {
  description = "cidr-block Main Routtable"
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  description = "The instancetype for the EC2-instance"
  type        = string
}

variable "ami_id" {
  description = "The AMI-ID for the EC2-instance"
  type        = string
}

variable "allow_ssh" {
  description = "Allow SSH to the instances"
  type        = bool
}


