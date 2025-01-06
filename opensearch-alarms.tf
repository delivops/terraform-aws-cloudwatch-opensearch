

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  count                     = var.high_cpu_enabled ? 1 : 0
  alarm_name                = "ES | High CPU Utilization (>${var.high_cpu_threshold}%) | ${domain_name}"
  alarm_description         = "High CPU in ${domain_name}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Average"
  threshold                 = var.high_cpu_threshold
  alarm_actions             = concat(var.high_cpu_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_cpu_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_cpu_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })

}


resource "aws_cloudwatch_metric_alarm" "high_memory" {
  count                     = var.high_memory_enabled ? 1 : 0
  alarm_name                = "ES | High Memory Utilization (>${var.high_memory_threshold}%) | ${domain_name}"
  alarm_description         = "High memory in ${var.domain_name}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  metric_name               = "JVMMemoryPressure"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Average"
  threshold                 = var.high_memory_threshold
  alarm_actions             = concat(var.high_memory_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_memory_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_memory_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })

}

resource "aws_cloudwatch_metric_alarm" "high_storage" {
  count                     = var.high_storage_enabled ? 1 : 0
  alarm_name                = "ES | High Storage Utilization (>${var.high_storage_threshold}%) | ${domain_name}"
  alarm_description         = "High storage in ${var.domain_name}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  metric_name               = "FreeStorageSpace"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Average"
  threshold                 = var.ebs_volume_size * 1073.74 * (100 - var.high_storage_threshold) / 100
  alarm_actions             = concat(var.high_storage_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_storage_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_storage_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })

}

resource "aws_cloudwatch_metric_alarm" "cluster_status_red" {

  count                     = var.cluster_status_red_enabled ? 1 : 0
  alarm_name                = "ES | Cluster Status Red | ${domain_name}"
  alarm_description         = "Cluster status red in ${var.domain_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = var.cluster_status_red_count
  metric_name               = "ClusterStatus.red"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = var.cluster_status_red_count
  alarm_actions             = concat(var.cluster_status_red_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.cluster_status_red_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.cluster_status_red_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "cluster_status_yellow" {

  count                     = var.cluster_status_yellow_enabled ? 1 : 0
  alarm_name                = "ES | Cluster Status Yellow | ${domain_name}"
  alarm_description         = "Cluster status yellow in ${var.domain_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = var.cluster_status_yellow_count
  metric_name               = "ClusterStatus.yellow"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = var.cluster_status_yellow_count
  alarm_actions             = concat(var.cluster_status_yellow_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.cluster_status_yellow_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.cluster_status_yellow_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "cluster_blocked" {

  count                     = var.cluster_blocked_enabled ? 1 : 0
  alarm_name                = "ES | Cluster Blocked | ${domain_name}"
  alarm_description         = "Cluster blocked in ${var.domain_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = var.cluster_blocked_count
  metric_name               = "ClusterBlocked"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = var.cluster_blocked_count
  alarm_actions             = concat(var.cluster_blocked_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.cluster_blocked_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.cluster_blocked_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "snapshot_failed" {

  count                     = var.snapshot_failed_enabled ? 1 : 0
  alarm_name                = "ES | Snapshot Failed | ${domain_name}"
  alarm_description         = "Snapshot failed in ${var.domain_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = var.snapshot_failed_count
  metric_name               = "SnapshotFailed"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = var.snapshot_failed_count
  alarm_actions             = concat(var.snapshot_failed_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.snapshot_failed_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.snapshot_failed_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "master_not_reachable" {

  count                     = var.master_not_reachable_enabled ? 1 : 0
  alarm_name                = "ES | Master Not Reachable | ${domain_name}"
  alarm_description         = "Master not reachable in ${var.domain_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = var.master_not_reachable_count
  metric_name               = "MasterNotDiscovered"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = var.master_not_reachable_count
  alarm_actions             = concat(var.master_not_reachable_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.master_not_reachable_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.master_not_reachable_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "write_rejected" {

  count                     = var.write_rejected_enabled ? 1 : 0
  alarm_name                = "ES | Write Rejected | ${domain_name}"
  alarm_description         = "Write rejected in ${var.domain_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = var.write_rejected_count
  metric_name               = "WriteThrottleEvents"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = var.write_rejected_count
  alarm_actions             = concat(var.write_rejected_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.write_rejected_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.write_rejected_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "search_rejected" {

  count                     = var.search_rejected_enabled ? 1 : 0
  alarm_name                = "ES | Search Rejected | ${domain_name}"
  alarm_description         = "Search rejected in ${var.domain_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  datapoints_to_alarm       = var.search_rejected_count
  metric_name               = "SearchThrottleEvents"
  namespace                 = "AWS/ES"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = var.search_rejected_count
  alarm_actions             = concat(var.search_rejected_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.search_rejected_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.search_rejected_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    DomainName = var.domain_name,
    ClientId   = var.client_id
  }
  tags = merge(var.tags, {
    "DomainName" = var.domain_name,
    "Terraform"  = "true"
  })
}

