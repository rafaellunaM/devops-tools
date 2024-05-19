resource "random_pet" "bucket" {
  length = 5
}

resource "aws_s3_bucket" "this" {
  
bucket = "${random_pet.bucket.id}-${var.env}"

tags = local.common_tags

}

resource "aws_s3_bucket" "this" {
  
  bucket = aws_s3_bucket.this.bucket
  
  # direicionar o arquivo gerado pela tamplate para o s3

}
