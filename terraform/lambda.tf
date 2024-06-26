data "aws_iam_role" "existing_role" {
  name = "moins-lambda-role"
}

resource "aws_iam_role" "moins-lambda-role" {
  count = length(data.aws_iam_role.existing_role.arn) == 0 ? 1 : 0
  name = "moins-lambda-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "archive_file" "current_time" {
  type        = "zip"
  source_file = "../src/current_time.py"
  output_path = "current_time.zip"
}

resource "aws_lambda_function" "moins-lambda-function" {
  filename      = "current_time.zip"  
  function_name = "moins-lambda-function"
  role          = length(data.aws_iam_role.existing_role.arn) > 0 ? data.aws_iam_role.existing_role.arn : aws_iam_role.moins-lambda-role[0].arn
  handler       = "current_time.current_time"
  runtime       = "python3.8"

  source_code_hash = filebase64sha256("../src/current_time.py")
}
