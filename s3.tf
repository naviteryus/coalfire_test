resource "random_pet" "bucket_suffix" {
  length    = 3
  separator = "-"
}

resource "aws_s3_bucket" "images" {
  bucket = "images-${random_pet.bucket_suffix.id}"

}


resource "aws_s3_bucket_lifecycle_configuration" "images_lifecycle" {
  bucket = aws_s3_bucket.images.id

  rule {
    id     = "archive"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "logs-${random_pet.bucket_suffix.id}"

}

resource "aws_s3_bucket_lifecycle_configuration" "logs_lifecycle" {
  bucket = aws_s3_bucket.logs.id

  rule {
    id     = "archive_active"
    status = "Enabled"
    filter {
      prefix = "Active/"
    }
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }

  rule {
    id     = "delete_inactive"
    status = "Enabled"
    filter {
      prefix = "Inactive/"
    }
    expiration {
      days = 90
    }
  }
}
