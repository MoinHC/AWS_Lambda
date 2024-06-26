## AWS Lambda Function to Get Current Time

![current_time Lambda Function Output](LambdaResult.png)

```bash
### GHA Workflow
├── Run Tests ──> Initialize Terraform ──> Refresh Terraform ──> Validate Terraform ──> Deploy Terraform
```

```bash
### Project Folder Structure`
AWS_Lambda/
├── LambdaResult.png
├── README.md
├── requirements.txt
├── src
│   └── code
│       └── current_time.py
├── terraform
│   ├── current_time.zip
│   ├── errored.tfstate
│   ├── lambda.tf
│   ├── lambda_function.zip
│   ├── main.tf
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
└── test
    ├── __init__.py
    └── current_time_test.py
```

