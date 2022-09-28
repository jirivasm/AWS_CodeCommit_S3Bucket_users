#terraform {
#This Backend has to be done after the s3 has been created
#This will be applyed after a Terraform init -reconfigure to save
#the state file on the bucket

#     backend "s3"{
#     #Cant use the Var.name since they have not yet been created
#     bucket  = "tfstate-s3-bucket-jirivasm"
#     #Path
#     key = "tfState/terraform.tfstate"
#     region = "us-east-1" 
#   } 
#} 
provider "aws" {
  region = var.region
}