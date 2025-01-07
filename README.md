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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.cluster_blocked](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cluster_status_red](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cluster_status_yellow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.high_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.high_memory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.high_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.master_not_reachable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.search_rejected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.snapshot_failed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.write_rejected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_alarms_sns_arns"></a> [all\_alarms\_sns\_arns](#input\_all\_alarms\_sns\_arns) | List of ARNs for the SNS topics | `list(string)` | `[]` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id to use for the alarms | `string` | n/a | yes |
| <a name="input_cluster_blocked_count"></a> [cluster\_blocked\_count](#input\_cluster\_blocked\_count) | The number of cluster blocked before the alarm is triggered | `number` | `1` | no |
| <a name="input_cluster_blocked_enabled"></a> [cluster\_blocked\_enabled](#input\_cluster\_blocked\_enabled) | Enable cluster blocked alarm | `bool` | `true` | no |
| <a name="input_cluster_blocked_sns_arns"></a> [cluster\_blocked\_sns\_arns](#input\_cluster\_blocked\_sns\_arns) | List of ARNs for the SNS topics for cluster blocked | `list(string)` | `[]` | no |
| <a name="input_cluster_status_red_count"></a> [cluster\_status\_red\_count](#input\_cluster\_status\_red\_count) | The number of cluster status red before the alarm is triggered | `number` | `1` | no |
| <a name="input_cluster_status_red_enabled"></a> [cluster\_status\_red\_enabled](#input\_cluster\_status\_red\_enabled) | Enable cluster status red alarm | `bool` | `true` | no |
| <a name="input_cluster_status_red_sns_arns"></a> [cluster\_status\_red\_sns\_arns](#input\_cluster\_status\_red\_sns\_arns) | List of ARNs for the SNS topics for cluster status red | `list(string)` | `[]` | no |
| <a name="input_cluster_status_yellow_count"></a> [cluster\_status\_yellow\_count](#input\_cluster\_status\_yellow\_count) | The number of cluster status yellow before the alarm is triggered | `number` | `1` | no |
| <a name="input_cluster_status_yellow_enabled"></a> [cluster\_status\_yellow\_enabled](#input\_cluster\_status\_yellow\_enabled) | Enable cluster status yellow alarm | `bool` | `true` | no |
| <a name="input_cluster_status_yellow_sns_arns"></a> [cluster\_status\_yellow\_sns\_arns](#input\_cluster\_status\_yellow\_sns\_arns) | List of ARNs for the SNS topics for cluster status yellow | `list(string)` | `[]` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name of the OpenSearch cluster | `string` | n/a | yes |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | The size of the EBS volume in GB | `number` | n/a | yes |
| <a name="input_high_cpu_enabled"></a> [high\_cpu\_enabled](#input\_high\_cpu\_enabled) | Enable high CPU alarm | `bool` | `true` | no |
| <a name="input_high_cpu_sns_arns"></a> [high\_cpu\_sns\_arns](#input\_high\_cpu\_sns\_arns) | List of ARNs for the SNS topics | `list(string)` | `[]` | no |
| <a name="input_high_cpu_threshold"></a> [high\_cpu\_threshold](#input\_high\_cpu\_threshold) | The threshold for high CPU usage | `number` | `90` | no |
| <a name="input_high_memory_enabled"></a> [high\_memory\_enabled](#input\_high\_memory\_enabled) | Enable high memory alarm | `bool` | `true` | no |
| <a name="input_high_memory_sns_arns"></a> [high\_memory\_sns\_arns](#input\_high\_memory\_sns\_arns) | List of ARNs for the SNS topics | `list(string)` | `[]` | no |
| <a name="input_high_memory_threshold"></a> [high\_memory\_threshold](#input\_high\_memory\_threshold) | The threshold for high memory usage | `number` | `70` | no |
| <a name="input_high_storage_enabled"></a> [high\_storage\_enabled](#input\_high\_storage\_enabled) | Enable high storage alarm | `bool` | `true` | no |
| <a name="input_high_storage_sns_arns"></a> [high\_storage\_sns\_arns](#input\_high\_storage\_sns\_arns) | List of ARNs for the SNS topics | `list(string)` | `[]` | no |
| <a name="input_high_storage_threshold"></a> [high\_storage\_threshold](#input\_high\_storage\_threshold) | The threshold for high storage usage | `number` | `70` | no |
| <a name="input_master_not_reachable_count"></a> [master\_not\_reachable\_count](#input\_master\_not\_reachable\_count) | The number of master not reachable before the alarm is triggered | `number` | `1` | no |
| <a name="input_master_not_reachable_enabled"></a> [master\_not\_reachable\_enabled](#input\_master\_not\_reachable\_enabled) | Enable master not reachable alarm | `bool` | `true` | no |
| <a name="input_master_not_reachable_sns_arns"></a> [master\_not\_reachable\_sns\_arns](#input\_master\_not\_reachable\_sns\_arns) | List of ARNs for the SNS topics for master not reachable | `list(string)` | `[]` | no |
| <a name="input_search_rejected_count"></a> [search\_rejected\_count](#input\_search\_rejected\_count) | The number of search rejected before the alarm is triggered | `number` | `1` | no |
| <a name="input_search_rejected_enabled"></a> [search\_rejected\_enabled](#input\_search\_rejected\_enabled) | Enable search rejected alarm | `bool` | `true` | no |
| <a name="input_search_rejected_sns_arns"></a> [search\_rejected\_sns\_arns](#input\_search\_rejected\_sns\_arns) | List of ARNs for the SNS topics for search rejected | `list(string)` | `[]` | no |
| <a name="input_snapshot_failed_count"></a> [snapshot\_failed\_count](#input\_snapshot\_failed\_count) | The number of snapshot failed before the alarm is triggered | `number` | `1` | no |
| <a name="input_snapshot_failed_enabled"></a> [snapshot\_failed\_enabled](#input\_snapshot\_failed\_enabled) | Enable snapshot failed alarm | `bool` | `true` | no |
| <a name="input_snapshot_failed_sns_arns"></a> [snapshot\_failed\_sns\_arns](#input\_snapshot\_failed\_sns\_arns) | List of ARNs for the SNS topics for snapshot failed | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_write_rejected_count"></a> [write\_rejected\_count](#input\_write\_rejected\_count) | The number of write rejected before the alarm is triggered | `number` | `1` | no |
| <a name="input_write_rejected_enabled"></a> [write\_rejected\_enabled](#input\_write\_rejected\_enabled) | Enable write rejected alarm | `bool` | `true` | no |
| <a name="input_write_rejected_sns_arns"></a> [write\_rejected\_sns\_arns](#input\_write\_rejected\_sns\_arns) | List of ARNs for the SNS topics for write rejected | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->