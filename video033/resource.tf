resource "aws_s3_bucket" "fazle-aws-s3-bucket" {
  for_each = toset(["my-111-fazle-bucket", "my-112-fazle-bucket", "my-113-fazle-bucket"])
  bucket   = each.key
  tags = {
    Name = "Fazle-Bucket-${each.key}"
  }
}