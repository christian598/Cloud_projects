# Define aws as the provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region 
}

# Create IAM
resource "aws_iam_group" "bio_group" {
  name = "bio-group"
}

resource "aws_iam_user" "bio_user" {
  name = var.user_name
}

resource "aws_iam_group_membership" "assign_group" {
  name = "bioinformatics_assign"
  users = [aws_iam_user.bio_user.name]
  group = aws_iam_group.bio_group.name
}

# Create an EC2 Key Pair for SSH access
resource "aws_key_pair" "bioinformatics_key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

# Launch EC2 instance and apply the user_data.sh configurations
resource "aws_instance" "bioinformatics_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.bioinformatics_key_pair.key_name
  user_data     = file("user_data.sh")

  tags = {
    Name = "BioinformaticsTestServer"
  }
}