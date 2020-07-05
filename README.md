# Terraform Vault policies 

An example to manage Vault policies based on github organization team permissions

### Requirements
1. Terraform version v0.12+
1. Installed and unsealed Vault
1. Root token located at it's default path `~/.vault-token`  
    Root token is only required on the first terraform run
    any consecutive tasks can be performed later with an admin policy token
1. AWS S3 bucket credentials when using Terraform backend

### Enable Terraform backend
To enable Terraform backend to store `terraform.tfstate` to S3 bucket
```bash
cp backend.tf.example backend.tf
```
Update backend values

### Set environment
Create `.env` file from the example, update the values and source it
```bash
cp .env.example .env
vi .env
source .env 
``` 

Attention `.env` and `terraform.tfstate` are in `.gitinore` to ensure no private credentials are committed
It is advisable to keep `terraform.tfstate` in S3 bucket

### Run terraform
```bash
terraform init
terraform plan -out out.plan
terraform apply out.plan
```



  
