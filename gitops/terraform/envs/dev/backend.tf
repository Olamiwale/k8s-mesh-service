terraform {
    required_version = ">= 1.5"

    backend "s3" {
        bucket       = "ola-state-bucket"
        key          = "envs/dev/terraform.tfstate"
        region       = "us-east-1"
        encrypt      = true
        use_lockfile = true
    }

    require_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~>5.0"
        }
    }
}