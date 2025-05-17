# One Webserver Example

This Terraform configuration deploys a single web server in AWS. The web server runs a simple "Hello, World" application.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version 1.0.0 or newer)
- AWS account
- AWS CLI configured with appropriate credentials

## Architecture

This example creates:
- An EC2 instance running Amazon Linux 2
- A security group allowing HTTP traffic (port 80) from anywhere
- A user data script that installs and configures Apache

## Quick Start

Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure all the resources qualify for the AWS Free Tier, but we are not responsible for any charges you may incur.

Configure your AWS access keys as environment variables:

## Sample Output
![image](https://github.com/user-attachments/assets/b5ba085c-2fec-4ee4-98a0-d861839858e5)
