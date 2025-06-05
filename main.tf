resource "aws_s3_bucket" "portfolio_bucket" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_website_configuration" "portfolio_bucket_web_conf" {
  bucket = aws_s3_bucket.portfolio_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "portfolio_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.portfolio_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  depends_on = [aws_s3_bucket_public_access_block.portfolio_bucket_public_access_block]
  bucket     = aws_s3_bucket.portfolio_bucket.id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "PublicReadGetObject",
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : "s3:GetObject",
          "Resource" : "arn:aws:s3:::${aws_s3_bucket.portfolio_bucket.id}/*"
        }
      ]
    }
  )
}
