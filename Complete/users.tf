#create the new team members
resource "aws_iam_user" "test_user" {
  count = length(var.users)
  name  = var.users[count.index]
}
#access key for programatic access
resource "aws_iam_access_key" "test-access-key" {
  count = length(var.users)
  user  = aws_iam_user.test_user[count.index].name
}
#create group
resource "aws_iam_group" "developers" {
  name = "developers"
}
#adding users to group
resource "aws_iam_group_membership" "dev-group" {
   count = length(var.users)

   name  = aws_iam_group.developers.name
   users = [aws_iam_user.test_user[count.index].name]
   group = aws_iam_group.developers.name
}
#create policy document
data "aws_iam_policy_document" "policy" {
    statement{
        actions = [ "s3:DeleteObjectTagging",
                "s3:DeleteStorageLensConfigurationTagging",
                "s3:ReplicateTags",
                "s3:PutStorageLensConfigurationTagging",
                "s3:PutObjectVersionTagging",
                "s3:CreateBucket",
                "s3:PutJobTagging",
                "s3:DeleteObjectVersionTagging",
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteJobTagging",
                "s3:PutBucketTagging",
                "s3:PutObjectTagging",
                "s3:DeleteObject"]
        resources = ["*"]
    }
}
#xreate the policy
resource "aws_iam_policy" "test-policy" {
    name = "test-policy"
    description = "a test policy"
    policy = data.aws_iam_policy_document.policy.json
  
}
#attach the policy
resource "aws_iam_group_policy_attachment" "test-policy" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.test-policy.arn
}