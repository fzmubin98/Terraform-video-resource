locals {
  bucket-name = "this-is-fazle-bucket-1"
}

resource "aws_s3_bucket" "fazle-bucket" {
  bucket = local.bucket-name
}