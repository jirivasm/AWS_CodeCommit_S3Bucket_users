provider "aws"{
    region = var.region
}
#creating the AWS CodeCommit repo
resource "aws_codecommit_repository" "my-repo" {
  repository_name = var.repo_name
  description     = "This is the Sample App Repository"
}

# To migrate from github to AWS CodeCommit
# 1. Go To AIM and generate credentials for AWS codeCommit and save them
# 2. clone the code to a local folder on your pc
#     git clone --mirror https://github.com/jirivasm/sample-aws-lambda sample-aws-lambda
#                         Git Repo                                          New Folder
# it is going to ask you for the credentials that you just created
# 3. Make sure the code is there
#You can delete the cloned code from your pc
