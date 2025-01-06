variable "high_cpu_threshold" {
  description = "The threshold for high CPU usage"
  type        = number
  default     = 90

}
variable "high_cpu_enabled" {
  description = "Enable high CPU alarm"
  type        = bool
  default     = true

}
variable "high_cpu_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []

}
variable "cluster_status_red_enabled" {
  description = "Enable cluster status red alarm"
  type        = bool
  default     = true

}
variable "cluster_status_red_count" {
  description = "The number of cluster status red before the alarm is triggered"
  type        = number
  default     = 0

}
variable "cluster_status_red_sns_arns" {
  description = "List of ARNs for the SNS topics for cluster status red"
  type        = list(string)
  default     = []

}
variable "cluster_status_yellow_enabled" {
  description = "Enable cluster status yellow alarm"
  type        = bool
  default     = true

}
variable "cluster_status_yellow_count" {
  description = "The number of cluster status yellow before the alarm is triggered"
  type        = number
  default     = 0

}
variable "cluster_status_yellow_sns_arns" {
  description = "List of ARNs for the SNS topics for cluster status yellow"
  type        = list(string)
  default     = []

}
variable "domain_name" {
  description = "The Domain name of the cluster to monitor."
  type        = string
}

variable "all_alarms_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []

}
variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
variable "high_memory_enabled" {
  description = "Enable high memory alarm"
  type        = bool
  default     = true

}
variable "high_memory_threshold" {
  description = "The threshold for high memory usage"
  type        = number
  default     = 70

}
variable "high_memory_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []

}

variable "snapshot_failed_enabled" {
  description = "Enable snapshot failed alarm"
  type        = bool
  default     = true

}
variable "snapshot_failed_count" {
  description = "The number of snapshot failed before the alarm is triggered"
  type        = number
  default     = 0

}
variable "snapshot_failed_sns_arns" {
  description = "List of ARNs for the SNS topics for snapshot failed"
  type        = list(string)
  default     = []

}
variable "cluster_blocked_enabled" {
  description = "Enable cluster blocked alarm"
  type        = bool
  default     = true

}
variable "cluster_blocked_count" {
  description = "The number of cluster blocked before the alarm is triggered"
  type        = number
  default     = 0

}
variable "cluster_blocked_sns_arns" {
  description = "List of ARNs for the SNS topics for cluster blocked"
  type        = list(string)
  default     = []

}

variable "master_not_reachable_enabled" {
  description = "Enable master not reachable alarm"
  type        = bool
  default     = true

}
variable "master_not_reachable_count" {
  description = "The number of master not reachable before the alarm is triggered"
  type        = number
  default     = 0

}
variable "master_not_reachable_sns_arns" {
  description = "List of ARNs for the SNS topics for master not reachable"
  type        = list(string)
  default     = []

}
variable "write_rejected_enabled" {
  description = "Enable write rejected alarm"
  type        = bool
  default     = true

}
variable "write_rejected_count" {
  description = "The number of write rejected before the alarm is triggered"
  type        = number
  default     = 0

}
variable "write_rejected_sns_arns" {
  description = "List of ARNs for the SNS topics for write rejected"
  type        = list(string)
  default     = []

}
variable "search_rejected_enabled" {
  description = "Enable search rejected alarm"
  type        = bool
  default     = true

}
variable "search_rejected_count" {
  description = "The number of search rejected before the alarm is triggered"
  type        = number
  default     = 0

}
variable "search_rejected_sns_arns" {
  description = "List of ARNs for the SNS topics for search rejected"
  type        = list(string)
  default     = []

}
variable "client_id" {
  description = "The client id to use for the alarms"
  type        = string
}

variable "ebs_volume_size" {
  description = "The size of the EBS volume in GB"
  type        = number
}

variable "high_storage_enabled" {
  description = "Enable high storage alarm"
  type        = bool
  default     = true

}
variable "high_storage_threshold" {
  description = "The threshold for high storage usage"
  type        = number
  default     = 70

}

variable "high_storage_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []

}
