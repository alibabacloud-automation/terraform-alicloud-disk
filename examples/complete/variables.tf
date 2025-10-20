# Disk variables
variable "name" {
  description = "Name used on all disks as prefix. Like TF-ECS-Disk-1, TF-ECS-Disk-2."
  type        = string
  default     = "TF_ECS_Disk-1"
}

variable "category" {
  description = "The data disk category used to launch one or more data disks."
  type        = string
  default     = "cloud_essd"
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