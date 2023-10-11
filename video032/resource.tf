resource "aws_s3_bucket" "fazle-s3-bucket" {
  for_each = {
    lapp = "this-pot-bucket"
    dapp = "this-hot-bucket"
    tap  = "this-bot-bucket"
  }
  bucket = "${each.value}-${each.key}"
  #acl = "private"

  tags = {
    Name        = "fazle-bucket-${each.value}"
    #Environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "fazle-s3-acl" {
  for_each = aws_s3_bucket.fazle-s3-bucket
  bucket   = each.value.id
  depends_on = [ aws_s3_bucket_ownership_controls.fazle-s3-owner ]
  acl      = "private"
}

resource "aws_s3_bucket_ownership_controls" "fazle-s3-owner" {
  for_each = aws_s3_bucket.fazle-s3-bucket
  bucket   = each.value.id
  rule {
    object_ownership = "ObjectWriter"
  }
}