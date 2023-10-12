resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename = "${path.module}/lambda_function.zip"
  # "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = "arn:aws:iam::492517115476:role/iam_for_lambda"
  # aws_iam_role.iam_for_lambda.id
  handler = "index.test"
  # vpc_config {

  #   subnet_ids         = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
  #   security_group_ids = ["sg-0b8dc184143d41208"]
  # }

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  # source_code_hash = filebase64sha256("lambda_function.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
