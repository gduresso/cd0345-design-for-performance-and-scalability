terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}
/*resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "default" {
  vpc_id     = "${aws_vpc.default.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

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

# package the function for python deployment
data "archive_file" "app_deployment_file" {
	type		= "zip"
	source_file	= "lambda_function.py"
	output_path = "app.zip"
}


resource "aws_lambda_function" "lambda_fun_throuh_terraform" {
  filename = "app.zip"
  function_name = "lambda_function"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
}

resource "aws_cloudwatch_event_rule" "schedule_lambda" {
  name = "schedule_lambda"
  depends_on = [
    aws_lambda_function.lambda_fun_throuh_terraform
  ]
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "lambda_fun_throuh_terraform" {
  target_id = "lambda_fun_throuh_terraform" 
  rule = "${aws_cloudwatch_event_rule.schedule_lambda.name}"
  arn = "${aws_lambda_function.lambda_fun_throuh_terraform.arn}"
}

resource "aws_lambda_permission" "schedule_lambda" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda_fun_throuh_terraform.function_name}"
  principal = "events.amazonaws.com"
  source_arn = "${aws_cloudwatch_event_rule.schedule_lambda.arn}"
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],      
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_cloudwatch_log_group" "udacity_logs" {
  name              = aws_lambda_function.lambda_fun_throuh_terraform.function_name
  retention_in_days = 14
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}

*/