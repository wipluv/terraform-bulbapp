terraform {
  backend "s3" {
    bucket = "terraform-wipluv"
    key    = "terraform/dev/ecs-ngnix"
    region = "us-east-1"
    profile = "wipluuu"
  }
}
