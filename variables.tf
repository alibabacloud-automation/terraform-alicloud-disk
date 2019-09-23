variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "availability_zone" {
  description = "The available zone to launch ecs disks. Default from data source `alicloud_zones`."
  default     = ""
}

# Disk variables
variable "name" {
  description = "Name used on all disks as prefix. Like TF_ECS_Disk-1, TF_ECS_Disk-2."
  default     = "TF_ECS_Disk"
}

variable "category" {
  description = "The data disk category used to launch one or more data disks."
  default     = "cloud_efficiency"
}

variable "size" {
  description = "The data disk size used to launch one or more data disks."
  default     = "40"
}

variable "tags" {
  description = "Used to mark specified ecs data disks."
  type        = map(string)

  default = {
    created_by   = "Terraform"
    created_from = "module-terraform-alicloud-disk"
  }
}

variable "disk_count" {
  description = "Number of disks to launch."
  default     = 1
}

variable "encrypted" {
  description = "Whether to encrypt the disks"
  default     = false
}

variable "instance_id" {
  description = "The ID of ECS instance."
  default     = ""
}

variable "attach_disk" {
  description = "Whether to attach disks to one instance"
  default     = false
}

