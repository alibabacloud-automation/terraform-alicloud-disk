variable "disk_count" {
  description = "Number of disks ID."
  type        = number
  default     = 1
}

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
  description = "Whether to attach disks to one instance"
  type        = bool
  default     = false
}