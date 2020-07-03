terraform {

  required_version  =  "0.11.14"
  
  backend "s3" {
  bucket = "terraform-state-aipril-class-aia"
  key = "jenkins/us-east-1/tools/virginia/jenkins.tfstate"
  region = "us-east-1"
  #dynamodb_table = "prod"

  }
}
