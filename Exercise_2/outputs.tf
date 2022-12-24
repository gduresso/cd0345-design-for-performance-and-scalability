# TODO: Define the output variable for the lambda function.
output "vpc_id" {
  description = "ID of project VPC"
  value       = aws_vpc.default.id
}

output "lambda_arn"{
    description = "ARN of Udacity Lambda Function through terraform"
    value = "${aws_lambda_function.lambda_fun_throuh_terraform.arn}"
}

#Outputs:
#lambda_arn = "arn:aws:lambda:us-east-1:584851961681:function:lambda_function"
#vpc_id = "vpc-082c560813f721b2f"