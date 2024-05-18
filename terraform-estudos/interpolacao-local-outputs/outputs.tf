output "bucket_name" {
  
  value = aws_s3_bucket.oi_bucket
}

output "bucket_arn" {
  
  value = aws_s3_bucket.oi_bucket.arn

  description = "value"
}


output "bucket_domain_name" {
  
  value = aws_s3_bucket.oi_bucket.bucket_domain_name
}

output "ips_file_path" {
  

  value = "${aws_s3_bucket.oi_bucket}/${aws_s3_bucket.oi_bucket.key}"
}