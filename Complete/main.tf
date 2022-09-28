/* terraform { */
#This Backend has to be done after the s3 has been created
#This will be applyed after a Terraform init -reconfigure to save
#the state file on the bucket

/* backend "s3"{
    #Cant use the Var.name since they have not yet been created
    bucket  = "tfstate-s3-bucket-jirivasm"
    #Path
    key = "tfState/terraform.tfstate"
    region = "us-east-1" 
  } */
/* } */
# provider "aws" {
#   region = var.region
# }
#creating the AWS CodeCommit repo
# resource "aws_codecommit_repository" "my-repo" {
#   repository_name = var.repo_name
#   description     = "This is the Sample App Repository"
# }

# To migrate from github to AWS CodeCommit
# 1. Go To AIM and generate credentials for AWS codeCommit and save them
# 2. clone the code to a local folder on your pc
#     git clone --mirror https://github.com/jirivasm/sample-aws-lambda sample-aws-lambda
#                         Git Repo                                          New Folder
#    it is going to ask you for the credentials that you just created
# navigate to the code folder
# push the code using git and the https URL from codecommit withj --all at the end
#git push https://git-codecommit.us-east-1.amazonaws.com/v1/repos/my-repo --all
# 4. Make sure the code is there
#You can delete the cloned code from your pc

#Creating S3 bucket
# resource "aws_s3_bucket" "tfstateBucket" {
#   bucket = var.s3_bucket_name

# }
# #Creating the versioning for the S3 Bucket
# resource "aws_s3_bucket_versioning" "tfstateBucket_versioning" {
#   bucket = aws_s3_bucket.tfstateBucket.bucket
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
