resource "aws_s3_bucket" "oi_bucket" {

    # interpolando 
    bucket =  "${random_pet.bucket.id}-${var.environment}"

    tags = local.common_tags

}


# ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "this" {
  
  bucket = aws_s3_bucket.oi_bucket.bucket
  # Nome do objeto quando ele estiver no bucket.
  key = "config/${local.ip_filepath}"
  source = local.ip_filepath
  # identifica quando o arquivo foi alterado
  etag = filemd5(local.ip_filepath)
}