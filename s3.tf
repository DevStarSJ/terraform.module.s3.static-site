resource "aws_s3_bucket" "default" {
  bucket = "${var.name}.${var.domain_name}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

