output "db_endpoint" {
  value = aws_db_instance.app_db.address
}

output "bucket_name" {
  value = aws_s3_bucket.app_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.app_bucket.arn
}