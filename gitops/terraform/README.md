## Terraform documentation

To start using terraform, Terraform package is initialized in install using "terraform init" command. This will build all the terraform dependencies and the packages needed to run smooth infrastructure.

The environment is divided into 3 stages (development, production and staging)

stage1 = "backend.tf" is created, this is important because its guarantees Terraform and provider versions are consistent, avoiding “works on my machine” problems.

-Storing state in S3 allows collaboration.
-Security Encryption protects sensitive data (secrets) inside the state file.
-Locking prevents race conditions (concurrent safety) when multiple people run terraform at the same time.