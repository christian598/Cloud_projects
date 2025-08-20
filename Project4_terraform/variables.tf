# AWS region
variable "aws_region" {
  description = "Region"
  type        = string
  default     = "EU-WEST-1"
}

# IAM user name
variable "user_name" {
  description = "Christian"
  type        = string
  default     = "bio-user"
}

# EC2 instance AMI ID (ami-042b4708b1d05f512 AMI for unbuntu 24.04 FREE TIER)
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-042b4708b1d05f512"
}

# EC2 instance type
variable "instance_type" {
  description = "Type of EC2 instance (Micro == Free Tier)"
  type        = string
  default     = "t3.micro"
}

# EC2 key pair name
variable "key_pair_name" {
  description = "SSH key"
  type        = string
  default     = "bioinformatics-key"
}

# Path to SSH key on local machine
variable "public_key_path" {
  description = "File path for SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}