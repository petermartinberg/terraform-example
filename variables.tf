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
