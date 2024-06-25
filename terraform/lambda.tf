resource "aws_iam_role" "moins-lambda-role" {
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
  source_file = "current_time.py"
  output_path = "current_time.zip"
}

resource "aws_lambda_function" "moins-lambda-function" {
  filename      = "current_time.zip"  
  function_name = "moins-lambda-function"
  role          = aws_iam_role.moins-lambda-role.arn
  handler       = "current_time.current_time"
  runtime       = "python3.8"

  source_code_hash = filebase64sha256("${path.module}/current_time.py")
}
