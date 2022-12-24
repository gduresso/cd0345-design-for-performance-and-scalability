def lambda_handler(event, context):
    result = "Hello from lambda deployed by terraform!"
    return {
        'statusCode' : 200,
        'body': result
    }