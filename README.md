![image info](logo.jpeg)

# terraform-aws-cloudwatch-opensearch

This Terraform module provisions alarms using aws cloudwatch for monitoring and notification opensearch. The module allows you to create alerts based on various performance metrics of your opensearch, helping you to proactively manage and respond to potential issues in your opensearch.

## Installation

To use this module, you need to have Terraform installed. You can find installation instructions on the Terraform website.

## Usage

The module will create cloudwatch alarms for your opensearch. You can use this module multiple times to create alarms with different configurations for various instances or metrics.

```python


################################################################################
# Cloudwatch Alarms for opensearch
################################################################################

provider "aws" {
  region = "eu-west-1"
}

resource "aws_sns_topic" "sns_topic" {
  name         = "sns"
  display_name = "sns"
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  confirmation_timeout_in_minutes = 1
  endpoint_auto_confirms          = false
  topic_arn                       = aws_sns_topic.sns_topic.arn
  protocol                        = "https"
  endpoint                        = "https://api.sns.com/v1/xxx"
  depends_on                      = [aws_sns_topic.sns_topic]
}

module "opensearch-cloudwatch-alarms" {
  source          = "delivops/cloudwatch-opensearch/aws"
  #version        = "0.0.11"

  domain_name     = var.domain_name
  ebs_volume_size = var.ebs_volume_size
  client_id       = var.client_id
  depends_on      = [aws_sns_topic.sns_topic]

}

```

## information

1. Client id: your account id in aws

2. EBS volume size: can be found in AWS console, under your cluster.

## License

MIT
