resource "aws_s3_bucket" "terraform_state_file" {
    bucket = "terraformstatefile17062024"
    tags = {
        Description = "Bucket to store the state file"
    }
}

data "aws_iam_group" "developers-data" {
 group_name = "developers"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "developers-policy" {
  bucket = aws_s3_bucket.terraform_state_file.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.terraform_state_file.arn}",
        "${aws_s3_bucket.terraform_state_file.arn}/*"
      ],
      "Principal": {
        "AWS": [
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/Lucy"
        ]
      }
    }
  ]
}
EOF
}
