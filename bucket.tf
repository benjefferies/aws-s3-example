resource "aws_s3_bucket" "aws-s3-lambda-app" {
  bucket = "aws-s3-lambda-app"
  acl    = "private"

  tags = {
    Name        = "name"
    Environment = "aws-s3-lambda-app"
  }
}

resource "aws_s3_bucket_policy" "aws-s3-lambda-app" {
  bucket = "${aws_s3_bucket.aws-s3-lambda-app.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [{
      "Effect": "Deny",
      "NotPrincipal": {"AWS": [
          "arn:aws:iam::883121443222:user/aws-s3-lambda",
          "arn:aws:iam::883121443222:root"
      ]},
      "Action": "s3:*",
      "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.aws-s3-lambda-app.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.aws-s3-lambda-app.bucket}/*"
      ]
  }]
}
POLICY
}