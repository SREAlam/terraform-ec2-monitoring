# Variable for the AMI ID
variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-00a929b66ed6e0de6" # Optional: Set a default value
}

# Variable for the instance type
variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}

# Variable for tags
variable "instance_tags" {
  description = "Tags to assign to the instance"
  type        = map(string)
  default     = {
    Name = "Terraform"
  }
}