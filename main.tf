terraform {
  backend "remote" {
    organization = "shibayu36"
    workspaces {
      name = "terraform-playground"
    }
  }
  required_version = "0.13.5"
}
provider "aws" {
  region  = "ap-northeast-1"
  version = "3.16.0"
}

resource "aws_vpc" "example" {
  cidr_block = "192.168.0.0/16"
}

# data "aws_iam_policy_document" "allow_describe_regions" {
#   statement {
#     effect    = "Allow"
#     actions   = ["ec2:DescribeRegions"] # リージョン一覧を取得する
#     resources = ["*"]
#   }
# }

# module "describe_regions_for_ec2" {
#   source     = "./iam_role"
#   name       = "describe-regions-for-ec2"
#   identifier = "ec2.amazonaws.com"
#   policy     = data.aws_iam_policy_document.allow_describe_regions.json
# }
