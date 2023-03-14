# mentoring-terraform

# Requirements

- Terraform Binary installed on your machine
- An AWS keypair either exposed as env variable or available as a default profile with the aws-cli
- An AWS S3 bucket to store the TFSTATE ( update the name of the bucket in `main.tf` if you're not using my account )

# Download the provider

Clone this repository and CD into it

`git clone https://github.com/DoppleDankster/mentoring-terraform.git && cd mentoring-terraform`

Download the providers using the `terraform init` command

Expected output should roughly looks like this:

```
# doppledankster @ desktop in ~/Git/Private/mentoring-terraform on git:main x [10:33:43]
$ terraform init

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 3.27"...
- Finding latest version of hashicorp/tls...
- Installing hashicorp/tls v4.0.4...
- Installed hashicorp/tls v4.0.4 (signed by HashiCorp)
- Installing hashicorp/aws v3.76.1...
- Installed hashicorp/aws v3.76.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

# Plan / Apply / Destroy

You can now use the terraform plan/apply/destroy commands to setup your infrastructure (granted that your AWS keypair is valid and grants you the relevent rights)
