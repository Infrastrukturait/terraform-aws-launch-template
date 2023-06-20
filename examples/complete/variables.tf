variable "region" {
  type        = string
  description = "AWS Region."
}

variable "vpc_id" {
  type        = string
  description = "ID of VPC where create an security group."
}

variable "key_name" {
  type        = string
  description = "SSH key name for `ec2-user`."
}
