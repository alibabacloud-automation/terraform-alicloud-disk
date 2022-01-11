variable "region" {
  description = "(Deprecated from version 1.5.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

# Disk variables
variable "availability_zone" {
  description = "The available zone to launch ecs disks. Default from data source `alicloud_zones`."
  type        = string
  default     = ""
}

variable "name" {
  description = "Name used on all disks as prefix. Like TF_ECS_Disk-1, TF_ECS_Disk-2."
  type        = string
  default     = ""
}

variable "category" {
  description = "The data disk category used to launch one or more data disks."
  type        = string
  default     = "cloud_efficiency"
}

variable "size" {
  description = "The data disk size used to launch one or more data disks."
  type        = string
  default     = "40"
}

variable "tags" {
  description = "Used to mark specified ecs data disks. Name will be merged into tags automactially."
  type        = map(string)

  default = {
    created_by   = "Terraform"
    created_from = "module-terraform-alicloud-disk"
  }
}

variable "encrypted" {
  description = "Whether to encrypt the disks."
  type        = bool
  default     = false
}

variable "disk_count" {
  description = "Number of disks to launch."
  type        = number
  default     = 1
}

#Disk Attachment variables
variable "disk_ids" {
  description = "A list ECS disks ID."
  type        = list(string)
  default     = []
}

variable "instance_id" {
  description = "The ID of ECS instance."
  type        = string
  default     = ""
}

variable "attach_disk" {
  description = "Whether to attach disks to one instance."
  type        = bool
  default     = false
}