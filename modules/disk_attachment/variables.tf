variable "disk_count" {
  description = "Number of disks ID."
}

variable "disk_ids" {
  description = "A list ECS disks ID."
  type        = list(string)
}

variable "instance_id" {
  description = "The ID of ECS instance."
}

variable "attach_disk" {
  description = "Whether to attach disks to one instance"
  default     = false
}

