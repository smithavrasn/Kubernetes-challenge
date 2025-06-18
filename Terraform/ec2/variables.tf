variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_owner" {
  description = "AMI owner ID or alias (e.g., 'amazon')"
  type        = string
  default     = "182399719631"
}