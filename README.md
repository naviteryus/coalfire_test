# Coalfire_test
AWS Infrastructure test using Terraform for Coalfire.

# Terraform AWS Infrastructure Setup

This repository contains Terraform configurations for deploying AWS infrastructure. The setup includes a Virtual Private Cloud (VPC), subnets, EC2 instances, Auto Scaling Groups (ASG), Application Load Balancers (ALB), IAM roles, and S3 buckets.

![Architecture Diagram](/Diagram_2_Tier_Architecture.png)


## Project Structure

- `provider.tf`: Contains provider configuration for AWS. This specifies the AWS region.
- `network.tf`: Defines the VPC and subnets. It includes configurations for both public and private subnets across two availability zones.
- `ec2.tf`: Contains the configuration for EC2 instances including security groups that allow SSH access.
- `autoscaling.tf`: Defines the auto scaling settings, including the launch configuration and scaling policies.
- `iam.tf`: Includes IAM roles and policies necessary for the operation of services, particularly those that interact with S3 buckets.
- `s3.tf`: Includes S3 buckets used for storing images and logs, including lifecycle policies.
- `alb.tf`: Configures the Application Load Balancer, target groups, and listeners for distributing traffic to instances within the auto scaling group.

## Prerequisites

- AWS Account: You need to have an AWS account set up.
- Terraform Installed: Ensure you have Terraform v0.12 or later installed.

![Architecture Diagram](/EC2_Login_Screenshot.png)

## Reference Links:

Links:

https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
https://registry.terraform.io/providers/hashicorp/aws/latest
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway	
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
