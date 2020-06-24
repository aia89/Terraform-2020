terraform {
backend "s3" {
bucket = "terraform-state-aipril-class-aia"
key = "jenkins/us-east-1/tools/virginia/asg.tfstate"
region = "us-east-1"
  }
}
