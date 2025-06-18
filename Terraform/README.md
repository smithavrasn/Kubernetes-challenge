This guide shows how to implement EC2 instance with nginx preinstalled on it.

This project builds AWS infrastructure through Terraform code. It starts by creating an S3 bucket to hold the remote state, sets the right access rules, and then spins up resources like EC2 instances.

The environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY must be set before proceeding.

1. Navigate to folder Terrform/s3. Run s3.tf first, by using below commands
   terraform init
   terraform plan
   terraform apply
   That command creates the bucket named "terraform-state-file-17062024". An IAM group, and a policy that grants access are assocaited with the bucket

3. After the bucket is up, navigate to folder Terrform/ec2. Run ec2.tf, by using below commands
   terraform init
   terraform plan
   terraform apply
   It provision the rest of the stack, including EC2 instances that use the Amazon Linux 2 AMI. SSH access and security group resources are included to allow login via a specific SSH port. The default VPC is used for provisioning.

4. If you ever need to clean up, run terraform destroy to remove all the resources you created.