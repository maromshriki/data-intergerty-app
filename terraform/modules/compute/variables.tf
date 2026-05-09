variable "vpc_id" {
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "db_endpoint" {
  description = "RDS endpoint"
  type        = string
}

variable "app_sg_id" {
  type = string
}

variable "alb_sg_id" {
    type = string
}

 variable "instance_profile_name" {
  type = string
}

variable "repository_url" {
  type = string
}
variable "s3_bucket_name" {
  type = string
}
