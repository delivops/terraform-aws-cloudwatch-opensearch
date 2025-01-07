provider "aws" {
  region = "eu-west-1"
}

resource "aws_sns_topic" "sns_topic" {
  name         = "sns"
  display_name = "sns"
}



module "opensearch-cloudwatch-alarms" {
  source = "../"

  domain_name     = "test"
  ebs_volume_size = 100
  client_id       = "xxxxx"
  depends_on      = [aws_sns_topic.sns_topic]

}
