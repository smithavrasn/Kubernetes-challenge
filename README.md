## Deploying Kubernetes with Kind, GithubWorkflow and ArgoCD:

Cluster Configuration:

The **Kind** tool (Kubernetes IN Docker) is used to create the Kubernetes cluster. An Nginx server is set up in this configuration as a pod inside the Kind cluster. Depending on the configuration, Nginx can be exposed either internally or externally using Kubernetes manifests (Deployment and Service YAMLs), which are used to define the deployment. This enables local testing of real-world deployment processes, such as service exposure, container orchestration, and integration with Argo CD.

Contionus Integration:

Continuous Integration (CI) is implemented using **GitHub Actions**. Every time a change is pushed to the repository, a GitHub Actions workflow is initiated automatically. The following tasks are completed by this workflow:
Examines the most recent code; creates a Docker image from the source; and uploads the image to the GitHub Container Registry or Docker Hub.

Contionous Deployment:
Argo CD is the deployment tool in use. The Kubernetes manifests from the Git repository are used to set it up. Argo CD keeps an eye out for updates in this repository. Argo CD detects updates automatically and deploys the changes to the Kubernetes cluster to synchronize the desired state whenever a new Docker image is pushed or changes are committed to the manifests. This makes it possible for the Git repository to be the only source of truth for application deployment in a smooth GitOps workflow.


## Deploying s3 and EC2 resources using Terraform

This section shows how to implement EC2 instance with nginx preinstalled on it.This project builds AWS infrastructure through Terraform code. It starts by creating an S3 bucket to hold the remote state, sets the right access rules, and then spins up resources like EC2 instances.

Both an IAM user and an active AWS account are necessary. Before continuing, you need to create an access key (AWS_ACCESS_KEY_ID) and a secret key (AWS_SECRET_ACCESS_KEY) and export them to your environment.

Navigate to folder Terrform/s3. Run s3.tf first, by using below commands
terraform init,
terraform plan,
terraform apply,
That command creates the bucket named "terraform-state-file-17062024". An IAM group, and a policy that grants access are assocaited with the bucket. The bucket is a prerequisite for storing the Terraform-generated tfstate file.

After the bucket is up, navigate to folder Terrform/ec2. Run ec2.tf, by using below commands
terraform init,
terraform plan,
terraform apply,
It provisions the remaining components of the stack, including EC2 instances based on the Amazon AMI. An existing security group is retrieved using a data block, which is required to allow SSH access (incoming traffic from the outside world). SSH keys are also created in this step. The default VPC is used for provisioning.

If you ever need to clean up, run "terraform destroy" to remove all the resources you created.

Challenges faced:

Kubernetes:
Due to a lack of CPU and memory, all components initially crashed when using MicroK8s. Allocating two CPU cores and four gigabytes of memory fixed the problem and enabled the cluster to stabilize and function properly.
